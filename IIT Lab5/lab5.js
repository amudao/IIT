/* Lab 5 JavaScript File 
   Place variables and functions in this file */


function validateForm() {
    var retunVal = true;

    var name = document.forms['myForm']["fname"].value;
    if (name.length == "") {
        alert("First Name Should Not Be Empty")
        retunVal = false
    }

    var lastname = document.forms['myForm']["lname"].value;
    if (lastname.length == "") {
        alert("Last Name Should Not Be Empty")
        retunVal = false
    }


    var title = document.forms['myForm']["ftitle"].value;
    if (title.length == "") {
        alert("Title Should Not Be Empty")
        retunVal = false
    }

    var org = document.forms['myForm']["forg"].value;
    if (org.length == "") {
        alert("Organization Field Should Not Be Empty")
        retunVal = false
    }

    var nickname = document.forms['myForm']["nname"].value;
    if (nickname.length == "") {
        alert("Nick Name Should Not Be Empty")
        retunVal = false
    }

    var feedback = document.forms['myForm']["feedback"].value;
    if (feedback.length == "") {
        alert("Comments Should Not Be Empty")
        retunVal = false
    }
    return retunVal;
}

function success() {
    if (validateForm() == true) {
        alert("Your Form Has Been Submitted Successfully!");
    }
}

function information() {
    var x = document.forms['myForm']["fname"].value;
    var y = document.forms['myForm']["lname"].value;
    var z = document.forms['myForm']["nname"].value;

    alert(x + " " + y + " is " + z);

    return true;
}