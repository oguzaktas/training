let userScore = 0;
let computerScore = 0;
const userScore_span = document.getElementById("user-score");
const computerScore_span = document.getElementById("computer-score");
const scoreboard_div = document.querySelector(".scoreboard");
const result_div = document.querySelector(".result > p");
const rock_div = document.getElementById("rock");
const paper_div = document.getElementById("paper");
const scissors_div = document.getElementById("scissors");

function getComputerChoice() {
    const choices = ["rock", "paper", "scissors"];
    const randomNumber = Math.floor(Math.random() * 3);
    return choices[randomNumber];
}

function convertToWord(word) {
    if (word === "rock") {
        return "Rock";
    } else if (word === "paper") {
        return "Paper";
    } else {
        return "Scissors";
    }
}

function win(userChoice, computerChoice) {
    userScore++;
    userScore_span.innerHTML = userScore;
    computerScore_span.innerHTML = computerScore;
    result_div.innerHTML = `${convertToWord(userChoice)} beats ${convertToWord(computerChoice)}. You win!`;
}

function lose(userChoice, computerChoice) {
    computerScore++;
    computerScore_span.innerHTML = computerScore;
    userScore_span.innerHTML = userScore;
    result_div.innerHTML = `${convertToWord(userChoice)} loses to ${convertToWord(computerChoice)}. You lost.`;
}

function draw(userChoice, computerChoice) {
    result_div.innerHTML = `${convertToWord(userChoice)} equals ${convertToWord(computerChoice)}. It's a draw.`;
}

function game(userChoice) {
    const computerChoice = getComputerChoice();
    const result = userChoice + computerChoice;
    if (result === "rockscissors" || result === "paperrock" || result === "scissorspaper") {
        win(userChoice, computerChoice);
    } else if (result === "rockpaper" || result === "paperscissors" || result === "scissorsrock") {
        lose(userChoice, computerChoice);
    } else {
        draw(userChoice, computerChoice);
    }
}

function main() {
    rock_div.addEventListener("click", function() {
        game("rock");
    })
    
    paper_div.addEventListener("click", function() {
        game("paper");
    })
    
    scissors_div.addEventListener("click", function() {
        game("scissors");
    })
}

main();