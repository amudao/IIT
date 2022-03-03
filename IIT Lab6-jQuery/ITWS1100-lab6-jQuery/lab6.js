/* eslint-disable no-undef */
/* Lab 6 JavaScript File  */

// this is the block that allows code to execute only after the DOM
// is fully loaded:
$(document).ready(function() {

   // example event handler:
   $('#labButton').click(function() {
      alert('You\'ve clicked the lab button');
   });

   // Problem 1: When the user clicks on the <h1>,
   //change the 'your name' to your own name (ie Joe Smith) 
   //change the text to be your name in small caps
   //change the color to be something other than blue or black
   // (note that there is already a class defined for the area where your name should go)
 
   $("h1").click(function() {
      $(".myName").text("Oluwapamilerin Amuda");
      $(".myName").css("color","orange");
      $(".myName").css("font-variant", "small-caps");
      
   });



   // Problem 2: Make the "lorem ipsum" paragraphs 
   //   vanish over a 4/10 sec duration when a user clicks "Hide text"; 
   //   make it appear within a 2 second duration when a user clicks "Show text":

   $("#hideText").click(function() {
      setTimeout(function() {
          $("p:not(:first)").fadeOut(0); 
      },600);
});
$("#showText").click(function() {
      setTimeout(function() {
          $("p:not(:first)").fadeIn(0);
      },1000);
});


   // Problem 3: When a normal list item is clicked, make it turn red using addClass.
   //            When a red list item is clicked change it back
   // (Note that there already is a css style named ".red" in lab6.css.)
   $("li").click(function(){
      if ($(this).hasClass('red')){
          $(this).removeClass("red");
      }
      else{
          $(this).addClass("red");  
      }
      
   });




   // Problem 4: lookup jquery toggle() and use this code on the "Toggle Text"
   // link to show/hide the text:
   $("#toggleText").click(function(){
      $("p:not(:first)").toggle();
      });
      





   /* When you are done:
     Add this to your github repos,
     Post this lab to your iit website,
     link it from your projects page,
     and a link to your project page and repo in the readme file.
     Zip up your iit folder and submit to LMS
 */
});
