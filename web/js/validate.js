function onSubmitRegistration(e) {

    document.getElementById("invalidInputServer").innerHTML = "";
    document.getElementById("validInputServer").innerHTML = "";

    var username = document.forms["registerForm"]["username"].value;
    var password = document.forms["registerForm"]["password"].value;
    var email = document.forms["registerForm"]["email"].value;

    if (username.trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Username is empty !";
        e.preventDefault();
        return false;
    }
    if (password.trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Password is empty!";
        e.preventDefault();
        return false;
    }
    if (email.trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Email is empty!";
        e.preventDefault();
        return false;
    }

    document.getElementById("invalidInput").innerHTML = "";
    return true;
}

function onSubmitQuiz(e) {
    document.getElementById("validInputServer").innerHTML = "";
    document.getElementById("invalidInputServer").innerHTML = "";

    var question = document.getElementById("question").value;
    var option1 = document.getElementById("option1").value;
    var option2 = document.getElementById("option2").value;
    var option3 = document.getElementById("option3").value;
    var option4 = document.getElementById("option4").value;
    var answer1 = document.getElementById("answer1");
    var answer2 = document.getElementById("answer2");
    var answer3 = document.getElementById("answer3");
    var answer4 = document.getElementById("answer4");

    if (question.toString().trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Question is empty!";

        e.preventDefault();
        return false;
    }
    if (option1.toString().trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Option 1 is empty!";
        e.preventDefault();
        return false;
    }
    if (option2.toString().trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Option 2 is empty!";
        e.preventDefault();
        return false;
    }
    if (option3.toString().trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Option 3 is empty!";
        e.preventDefault();
        return false;
    }
    if (option4.toString().trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Option 4 is empty!";
        e.preventDefault();
        return false;
    }
    if (answer1.checked === false && answer2.checked === false && answer3.checked === false && answer4.checked === false) {
        document.getElementById("invalidInput").innerHTML = "You haven't chosen correct answer for this question!";
        e.preventDefault();
        return false;
    }
    document.getElementById("invalidInput").innerHTML = "";
    document.getElementById("validInput").innerHTML = "Add new question successfully";
    return true;
}

function onSubmitLogin(e) {
    document.getElementById("invalidInputServer").innerHTML = "";

    var username = document.forms["loginForm"]["username"].value;
    var password = document.forms["loginForm"]["password"].value;

    if (username.trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Username is empty !";
        e.preventDefault();
        return false;
    }
    if (password.trim() === "") {
        document.getElementById("invalidInput").innerHTML = "Password is empty!";
        e.preventDefault();
        return false;
    }

    document.getElementById("invalidInput").innerHTML = "";
    return true;
}
function myDropDown() {
                changeSizeContainer = !changeSizeContainer;
                var btnMenu = document.getElementsByClassName("nav-link");
                if (btnMenu[1].classList[1] !== "show") {
                    btnMenu[1].style.display = "block";
                    btnMenu[1].classList.add("show");
                } else {
                    btnMenu[1].style.display = "none";
                    btnMenu[1].classList.remove("show");
                }
                
            }