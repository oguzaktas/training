using System;
using System.Windows.Forms;

/**
 * @author Oguz Aktas
 */

namespace Calculator
{
    public partial class Calculator : Form
    {
        public Calculator()
        {
            InitializeComponent();
        }

        double number1 = 0;
        double number2 = 0;
        int oprClickCount = 0;
        bool isOprClick = false;
        bool isEqualClick = false;
        string opr;

        private void Calculator_Load(object sender, EventArgs e)
        {
            foreach (Control c in Controls)
            {
                if (c is Button)
                {
                    if (c.Text != "Reset")
                    {
                        c.Click += new EventHandler(btn_click);
                    }
                }
            }
        }

        public void btn_click(object sender, EventArgs e) // Button click event
        {
            Button button = (Button)sender;

            if (!isOperator(button)) // if the button is a number
            {
                if (isOprClick)
                {
                    number1 = double.Parse(textBox1.Text);
                    textBox1.Text = "";
                }
                if (!textBox1.Text.Contains(".")) // if the textbox not contain "."
                {
                    if (textBox1.Text.Equals("0") && !button.Text.Equals(".")) // Delete first "0" value if the number is not decimal
                    {
                        textBox1.Text = button.Text; // Set button text to the textbox
                        isOprClick = false;
                    }
                    else
                    {
                        textBox1.Text += button.Text;
                        isOprClick = false;
                    }
                }
                else if (!button.Text.Equals("."))
                {
                    textBox1.Text += button.Text;
                    isOprClick = false;
                }
            }
            else // if the button is an operator (+, -, *, /, =)
            {
                if (oprClickCount == 0) // if it's the first time clicked on an operator
                {
                    oprClickCount++;
                    number1 = double.Parse(textBox1.Text);
                    opr = button.Text;
                    isOprClick = true;
                }
                else
                {
                    if (!button.Text.Equals("=")) // if the operation is not "="
                    {
                        if (!isEqualClick)
                        {
                            number2 = double.Parse(textBox1.Text);
                            textBox1.Text = Convert.ToString(calculate(opr, number1, number2));
                            number2 = double.Parse(textBox1.Text);
                            opr = button.Text;
                            isOprClick = true;
                            isEqualClick = false;
                        }
                        else
                        {
                            isEqualClick = false;
                            opr = button.Text;
                        }
                    }
                    else
                    {
                        number2 = double.Parse(textBox1.Text);
                        textBox1.Text = Convert.ToString(calculate(opr, number1, number2));
                        number1 = double.Parse(textBox1.Text);
                        isOprClick = true;
                        isEqualClick = true;
                    }
                }
            }
        }

        public bool isOperator(Button button) // Check if the clicked button is a number or an operator
        {
            string text = button.Text;
            if (text.Equals("=") || text.Equals("+") || text.Equals("-") || text.Equals("X") || text.Equals("/"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public double calculate(string opr, double number1, double number2) // Calculate
        {
            double result = 0;
            switch (opr)
            {
                case "+":
                    result = number1 + number2;
                    break;
                case "-":
                    result = number1 - number2;
                    break;
                case "X":
                    result = number1 * number2;
                    break;
                case "/":
                    if (number2 != 0)
                    {
                        result = number1 / number2;
                    }
                    break;
                default:
                    break;
            }
            return result;
        }

        private void buttonReset_Click(object sender, EventArgs e)
        {
            number1 = 0;
            number2 = 0;
            opr = "";
            isOprClick = false;
            isEqualClick = false;
            oprClickCount = 0;
            textBox1.Text = "0";
        }
    }
}
