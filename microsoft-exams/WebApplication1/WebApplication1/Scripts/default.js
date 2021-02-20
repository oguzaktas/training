var greeting = 'Hello world';

function areaOfPizzaSlice(diameter, slicesPerPizza) {
    return areaOfPizza(diameter) / slicesPerPizza;
    function areaOfPizza(diameter) {
        var radius = diameter / 2;
        return 3.141592 * radius * radius;
    }
}

var pizzaParts = new Array();
pizzaParts[0] = 'pepperoni';
pizzaParts[1] = 'onion';
pizzaParts[2] = 'bacon';
document.write(pizzaParts.indexOf('bacon') + "<br>");
var parts = pizzaParts.join();
document.write(parts + "<br>");
var newLength = pizzaParts.push("newitem");
document.write(newLength + "<br>");
var firstItem = pizzaParts.shift();
document.write(firstItem + "<br>")
document.write(pizzaParts.join() + "<br>");
pizzaParts.push("newitem2");
document.write(pizzaParts.slice(1, 3) + "<br>")
pizzaParts.sort();
document.write("Original array: " + pizzaParts.join() + "<br>");
document.write("Sorted array: " + pizzaParts.join() + "<br>");
slice = pizzaParts.slice(1, 2, "spam");
document.write(slice + "<br>");
document.write("Array: " + pizzaParts.join() + "<br>");
document.write(pizzaParts.toString() + "<br>");
document.write(pizzaParts.unshift("firstItemUnShift") + "<br>");
document.write(pizzaParts.values + "<br>");

// Preventing the default operation
var hyperlink = document.getElementById('InkSave');
hyperlink.addEventListener('click', saveData, false);
function saveData(e) {
    // save the data
    e.preventDefault();
}

// Window events
window.addEventListener('load', winEvent, false);
function winEvent (e) {
    alert('Window load');
}

// Form events -> blur, change, contextmenu, focus, formchange, forminput, input, invalid, select, submit
var lastName = document.getElementById('txtLastName');
lastName.addEventListener('focus', gotFocus, false);
function gotFocus (e) {
    alert('last name has focus');
}

// Keyboard events -> keydown, keypress, keyup
lastName.addEventListener('keypress', keyGotPressed, false);
function keyGotPressed(e) {
    var charCode = e.which;
    var charStr = String.fromCharCode(charCode);
    alert(charStr);
}

// Mouse events -> click, dblclick, drag, dragend, dragenter, dragleave, dragover, dragstart, drop, mousedown, mousemove, mouseout, mouseover, mouseup, mousewheel, scroll
lastName.addEventListener('click', gotClicked, false);
function gotClicked(e) {
    alert('got clicked');
}

// Media events -> applied with mostly <audio>, <embed>, <img>, <object>, <video>
var video = document.getElementById('video');
video.addEventListener('play', playing, false);
function playing(e) {
    alert('playing');
}

// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function () {
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

var x = 'It\'s alright.';

/* Events are based on the publisher or subscriber patterns.
Subscribe -> addEventListener() method, stopPropagation() -> cancel event propagation
Unsubscribe from an event -> removeEventListener()
getElementsByTagName -> retrieves a NodeList of elements based on the element's tag name
getElementsByClass -> retrieves based on the CSS class name
*/

/* CSS - Chapter 4
 * CSS roots SGML (Standardized Generalized Markup Language) 1980s
 * to separate structure from presentation so you can provide different style sheets for printing, browsing or other scenarios.
 * CSS3 recommendation status 4 modules -> media queries, namespaces, selectors level 3, color
 * Embedded style is located within the <head> element. <style>...</style>
 * Creating an external style sheet in <head> element -> <link rel="stylesheet" type="text/css" href="Content/default.css" />
 * link element media attribute types -> all, braille, embossed, handheld, print, screen, speech, tty, tv
 */

document.write("<br><br>");