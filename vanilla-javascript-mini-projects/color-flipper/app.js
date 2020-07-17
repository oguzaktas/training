const colors = ["green", "red", "rgba(255, 99, 71, 0.5)", "#f74c28", "blue", "white", "gray"];
const btn = document.getElementById('btn');
const color = document.querySelector(".color");

btn.addEventListener('click', function(){
    const randomNumber = Math.floor(Math.random() * colors.length);
    // get random number between 0-3
    console.log(randomNumber);
    document.body.style.backgroundColor = colors[randomNumber];
    color.textContent = colors[randomNumber];
});