<!DOCTYPE html>
<html>
  <head>
    <title>Forms with PHP - ITWS</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
    <script type="text/javascript" src="resources/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="resources/iit.js"></script>   
    <link href="resources/iit.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
    <div id="bodyBlock">

      <h1>Intro to ITWS - Forms with PHP</h1>
            
<?php 
  /* some very basic form processing */
  
  // variables to hold our form values:
  $firstNames = '';  
  $lastName = '';
  $dob = '';
  // hold any error messages
  $errors = ''; 
  
  // have we posted?
  $havePost = isset($_POST["save"]);
  
  if ($havePost) {
    // Get the input and clean it.
    // First, let's get the input one param at a time.
    // Could also output escape with htmlentities()
    $firstNames = htmlspecialchars(trim($_POST["firstNames"]));  
    $lastName = htmlspecialchars(trim($_POST["lastName"]));
    $dob = htmlspecialchars(trim($_POST["dob"]));
    
    // special handling for the date of birth
    $dobTime = strtotime($dob); // parse the date of birth into a Unix timestamp (seconds since Jan 1, 1970)
    $dateFormat = 'Y-m-d'; // the date format we expect, yyyy-mm-dd
    // Now convert the $dobTime into a date using the specfied format.
    // Does the outcome match the input the user supplied?  
    // The right side will evaluate true or false, and this will be assigned to $dobOk
    $dobOk = (date($dateFormat, $dobTime) == $dob);  
    
    // Let's do some basic validation
    $focusId = ''; // trap the first field that needs updating, better would be to save errors in an array
    
    if ($firstNames == '') {
      $errors .= '<li>First name may not be blank</li>';
      if ($focusId == '') $focusId = '#firstNames';
    }
    if ($lastName == '') {
      $errors .= '<li>Last name may not be blank</li>';
      if ($focusId == '') $focusId = '#lastName';
    }
    if ($dob == '') {
      $errors .= '<li>Date of birth may not be blank</li>';
      if ($focusId == '') $focusId = '#dob';
    }
    if (!$dobOk) {
      $errors .= '<li>Enter a valid date in yyyy-mm-dd format</li>';
      if ($focusId == '') $focusId = '#dob';
    }
  
    if ($errors != '') { ?>
      <div id="messages">
        <h4>Please correct the following errors:</h4>
        <ul>
          <?php echo $errors; ?>
        </ul>
        <script type="text/javascript">
          $(document).ready(function() {
            $("<?php echo $focusId ?>").focus();
          });
        </script>
      </div>
    <?php } else { ?>
      <div id="messages">
        <h4>Actor submitted</h4>
      </div>
    <?php } 
  }
?>

<?php 
  // to include client-side validation to the form below, 
  // add the following parameter:
  // onsubmit="return validate(this);"
?>
<form id="addForm" name="addForm" action="index.php" method="post">
  <fieldset> 
    <legend>Add Actor</legend>
    <div class="formData">
                    
      <label class="field" for="firstNames">First Name(s):</label>
      <div class="value"><input type="text" size="60" value="<?php echo $firstNames; ?>" name="firstNames" id="firstNames"/></div>
      
      <label class="field" for="lastName">Last Name:</label>
      <div class="value"><input type="text" size="60" value="<?php echo $lastName; ?>" name="lastName" id="lastName"/></div>
      
      <label class="field" for="dob">Date of Birth:</label>
      <div class="value"><input type="text" size="10" maxlength="10" value="<?php echo $dob; ?>" name="dob" id="dob"/> <em>yyyy-mm-dd</em></div>
      
      <input type="submit" value="save" id="save" name="save"/>
    </div>
  </fieldset>
</form>

<?php if($havePost && $errors == '') { ?>
  <h3>Actor:</h3>
  <table>
    <tr>
      <th>Name:</th>
      <td>
        <?php echo $firstNames; ?>
        <?php echo $lastName; ?>
      </td>
    </tr>
    <tr>
      <th>Date of Birth:</th>
      <td>
        <?php
          // to see how to format dates, view 
          // http://us.php.net/manual/en/function.date.php
          echo date('F j, Y', $dobTime); 
        ?>
      </td>
    </tr>
  </table>
  
  <h3>All Parameters:</h3>
  <?php
    // loop over all the raw request parameters
    echo '<table>';
    foreach($_POST AS $key => $value) {
      echo '<tr><td>' . htmlspecialchars($key) . '</td><td>' . htmlspecialchars($value) . '</td></tr>';
    }
    echo '</table>';
  }
?>
      
    </div>
  </body>
</html>
