const btnStart = document.querySelector("#start-btn");

const recognition = new webkitSpeechRecognition();
recognition.continuous = true ;
recognition.lang = "en-US";
recognition.interimResults = false;
recognition.maxAlternatives = 1;

const synth = window.speechSynthesis;

btnStart.addEventListener("click", () => {
    recognition.start();
});

let utter = new SpeechSynthesisUtterance("Hi, how are you?");
utter.onend = () => {
    recognition.start();
};

recognition.onresult = (e) => {
    console.log(e.results[e.results.length - 1][0].transcript.trim());
    const transcript = e.results[e.results.length - 1][0].transcript.trim(); // trim() to remove any starting or ending white spaces
    if (transcript === "hello") {
        recognition.stop();
        // console.log("How are you?");
        utter.text = "Hi, how are you?";
        synth.cancel();
        synth.speak(utter);
    } else if (transcript === "goodbye") {
        recognition.stop();
        utter.text = "Hope to see you soon!";
        synth.cancel();
        synth.speak(utter);
    } else if (transcript === "thank you") {
        recognition.stop();
        utter.text = "Thank you too";
        synth.cancel();
        synth.speak(utter);
    }
};