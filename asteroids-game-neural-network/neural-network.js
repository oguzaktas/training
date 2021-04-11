"use strict";

const LOG_ON = true; // whether or not to show error logging
const LOG_FREQ = 20000; // how often to show error logs (in iterations)

class NeuralNetwork {
    constructor(numInputs, numHidden, numOutputs) {
        this._numInputs = numInputs;
        this._numHidden = numHidden;
        this._numOutputs = numOutputs;
        this._inputs = [];
        this._hidden = [];
        this._bias0 = new Matrix(1, this._numHidden);
        this._bias1 = new Matrix(1, this._numOutputs);
        this._weights0 = new Matrix(this._numInputs, this._numHidden);
        this._weights1 = new Matrix(this._numHidden, this._numOutputs);

        // error logging
        this._logCount = LOG_FREQ;

        // randomize the initial weights
        this._bias0.randomWeights();
        this._bias1.randomWeights();
        this._weights0.randomWeights();
        this._weights1.randomWeights();
    }

    get inputs() {
        return this._inputs;
    }

    set inputs(inputs) {
        this._inputs = inputs;
    }

    get hidden() {
        return this._hidden;
    }

    set hidden(hidden) {
        this._hidden = hidden;
    }

    get bias0() {
        return this._bias0;
    }

    set bias0(bias0) {
        this._bias0 = bias0;
    }

    get bias1() {
        return this._bias1;
    }

    set bias1(bias1) {
        this._bias1 = bias1;
    }

    get weights0() {
        return this._weights0;
    }

    set weights0(weights) {
        this._weights0 = weights;
    }

    get weights1() {
        return this._weights1;
    }

    set weights1(weights) {
        this._weights1 = weights;
    }

    get logCount() {
        return this._logCount;
    }

    set logCount(logCount) {
        this._logCount = logCount;
    }

    feedForward(inputArray) {
        // convert input array to a matrix
        this.inputs = Matrix.convertFromArray(inputArray);

        // find the hidden values and apply the activation function
        this.hidden = Matrix.dot(this.inputs, this.weights0);
        this.hidden = Matrix.add(this.hidden, this.bias0); // applying bias
        this.hidden = Matrix.map(this.hidden, x => sigmoid(x));

        // find the output values and apply the activation function
        let outputs = Matrix.dot(this.hidden, this.weights1);
        outputs = Matrix.add(outputs, this.bias1); // applying bias
        outputs = Matrix.map(outputs, x => sigmoid(x));

        return outputs;
    }

    // train using input and target arrays (one-dimensional)
    train(inputArray, targetArray) {
        // feed the input data through the network
        let outputs = this.feedForward(inputArray);

        // calculate the output errors (target - output)
        let targets = Matrix.convertFromArray(targetArray);
        let outputErrors = Matrix.subtract(targets, outputs);

        // error logging
        if (LOG_ON) {
            if (this.logCount == LOG_FREQ) {
                console.log("Error = " + outputErrors.data[0][0]);
            }
            this.logCount--;
            if (this.logCount == 0) {
                this.logCount = LOG_FREQ;
            }
        }

        // calculate the deltas (errors * derivative of the output [derivative of the sigmoid function])
        let outputDerivatives = Matrix.map(outputs, x => sigmoid(x, true));
        let outputDeltas = Matrix.multiply(outputErrors, outputDerivatives);

        // calculate hidden layer errors (deltas dot transpose of weights1)
        let weights1Transpose = Matrix.transpose(this.weights1);
        let hiddenErrors = Matrix.dot(outputDeltas, weights1Transpose);

        // calculate the hidden deltas (errors * derivative of hidden)
        let hiddenDerivatives = Matrix.map(this.hidden, x => sigmoid(x, true));
        let hiddenDeltas = Matrix.multiply(hiddenErrors, hiddenDerivatives);

        // update the weights (add transpose of layers dot deltas)
        let hiddenTranspose = Matrix.transpose(this.hidden);
        this.weights1 = Matrix.add(this.weights1, Matrix.dot(hiddenTranspose, outputDeltas));
        let inputsTranspose = Matrix.transpose(this.inputs);
        this.weights0 = Matrix.add(this.weights0, Matrix.dot(inputsTranspose, hiddenDeltas));

        // update bias
        this.bias1 = Matrix.add(this.bias1, outputDeltas);
        this.bias0 = Matrix.add(this.bias0, hiddenDeltas);
    }
}

// sigmoid function
function sigmoid(x, derivative = false) {
    if (derivative) {
        return x * (1 - x); // where x = sigmoid(x)
    }
    return 1 / (1 + Math.exp(-x));
}

// train using input and target arrays (one-dimensional)

// matrix functions
class Matrix {
    constructor(rows, cols, data = []) {
        this._rows = rows;
        this._cols = cols;
        this._data = data;

        // initialize with zeroes if no data provided
        if (data == null || data.length == 0) {
            this._data = [];
            for (let i = 0; i < this._rows; i++) {
                this._data[i] = [];
                for (let j = 0; j < this._cols; j++) {
                    this._data[i][j] = 0;
                }
            }
        } else {
            // check data integrity
            if (data.length != rows || data[0].length != cols) {
                throw new Error("Incorrect data dimensions!");
            }
        }
    }

    get rows() {
        return this._rows;
    }

    get cols() {
        return this._cols;
    }

    get data() {
        return this._data;
    }

    // add two matrices
    static add(matrix0, matrix1) {
        Matrix.checkDimensions(matrix0, matrix1);
        let m = new Matrix(matrix0.rows, matrix0.cols);
        for (let i = 0; i < m.rows; i++) {
            for (let j = 0; j < m.cols; j++) {
                m.data[i][j] = matrix0.data[i][j] + matrix1.data[i][j];
            }
        }
        return m;
    }

    // subtract two matrices
    static subtract(matrix0, matrix1) {
        Matrix.checkDimensions(matrix0, matrix1);
        let m = new Matrix(matrix0.rows, matrix0.cols);
        for (let i = 0; i < m.rows; i++) {
            for (let j = 0; j < m.cols; j++) {
                m.data[i][j] = matrix0.data[i][j] - matrix1.data[i][j];
            }
        }
        return m;
    }

    // multiply two matrices (not the dot product)
    static multiply(matrix0, matrix1) {
        Matrix.checkDimensions(matrix0, matrix1);
        let m = new Matrix(matrix0.rows, matrix0.cols);
        for (let i = 0; i < m.rows; i++) {
            for (let j = 0; j < m.cols; j++) {
                m.data[i][j] = matrix0.data[i][j] * matrix1.data[i][j];
            }
        }
        return m;
    }

    // dot product of two matrices
    static dot(matrix0, matrix1) {
        if (matrix0.cols != matrix1.rows) {
            throw new Error("Matrices are not dot compatible!");
        }
        let m = new Matrix(matrix0.rows, matrix1.cols);
        for (let i = 0; i < m.rows; i++) {
            for (let j = 0; j < m.cols; j++) {
                let sum = 0;
                for (let k = 0; k < matrix0.cols; k++) {
                    sum += matrix0.data[i][k] * matrix1.data[k][j];
                }
                m.data[i][j] = sum;
            }
        }
        return m;
    }

    // convert array to one-rowed matrix
    static convertFromArray(arr) {
        return new Matrix(1, arr.length, [arr]);
    }

    // apply a function to each cell of the given matrix
    static map(matrix0, mFunction) {
        let m = new Matrix(matrix0.rows, matrix0.cols);
        for (let i = 0; i < m.rows; i++) {
            for (let j = 0; j < m.cols; j++) {
                m.data[i][j] = mFunction(matrix0.data[i][j]);
            }
        }
        return m;
    }

    // find the transpose of the given matrix
    static transpose(matrix0) {
        let m = new Matrix(matrix0.cols, matrix0.rows);
        for (let i = 0; i < matrix0.rows; i++) {
            for (let j = 0; j < matrix0.cols; j++) {
                m.data[j][i] = matrix0.data[i][j];
            }
        }
        return m;
    }

    // check matrices have the same dimensions
    static checkDimensions(matrix0, matrix1) {
        if (matrix0.rows != matrix1.rows || matrix0.cols != matrix1.cols) {
            throw new Error("Matrices are of different dimensions!");
        }
    }

    // apply random weights between -1 and 1
    randomWeights() {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                this.data[i][j] = Math.random() * 2 - 1;
            }
        }
    }
}