<?php

session_start();

//error_reporting(E_ALL);

//header("Cache-control: private");


if($_POST['Submit']){
	$allempty = false;
	foreach ($_POST as $p) {
		if (empty($p)) $allempty = true;
	}
	if (!$allempty){
    include_once "../dbase.php";
	include_once "../settings.php";
	
	$errorMsg = "";
	$username = $_POST['UserName'];
	if (!get_magic_quotes_gpc()){
		$username = addslashes($username);
	}
	
	$result = mysql_query("SELECT user FROM chatusers WHERE user='$username'") or die(mysql_error());

	if (mysql_num_rows($result)==1) $errorMsg="Username exists, please choose another one!";
	if(md5($_POST['Password1'])!=md5($_POST['Password2'])) $errorMsg="Passwords do not match";
	if(strlen($_POST['Password1'])< 6) $errorMsg="Passwords must be at least 6 characters long";
	//if (preg_match("/^[a-z0-9]+?\.
	if ($errorMsg == ""){
		$dateRegistered=time();
		$currentTime=date("YmdHis");
		$userId=md5("$currentTime".$_SERVER['REMOTE_ADDR']);
		$db_pass=md5($_POST['Password1']);
		
		$_SESSION['UID']=$userId;
		$_SESSION['email']=$_POST['Email'];
		$_SESSION['password']=$_POST['Password1'];
		$_SESSION['emailtype']=$_POST['emailtype'];
		
		$subject = "Your account activation at $siteurl"; 
	
		if ($_POST['emailtype']=="text"){
			$message = "Thank you for registering at $siteurl. \n
			
			In order to activate your newly created account copy and paste the link below in your browser:
			
			 $siteurl/actm.php?UID=$userId 
			 
			 Once you activate your membership you will recieve a mail with your login information.\n\n
			
			Thanks!
			The Webmaster
			
			This is an automated response, please do not reply!";
		}
		else if($_POST['emailtype']=="html"){
			$message = "Thank you for registering at $siteurl
			 
			In order to activate your newly created account copy and paste the link below in your browser:
			<br><br>
			<a href='$siteurl/actm.php?UID=$userId'>$siteurl/actm.php?UID=$userId</a><br><br>
			Once you activate your membership you will recieve a mail with your login information.<br><br>
			Thanks! <br>
			The Webmaster <br>
			This is an automated response, please do not reply!<br>";
		}
		
		mail($_POST['Email'], $subject, $message);
		
		mysql_query("INSERT INTO chatusers ( id , user , password , email , name , country , state , city, phone, zip , adress , dateRegistered,lastLogIn, emailnotify ,smsnotify,status,emailtype ) VALUES ('$userId','$username', '{$_POST['Password1']}', '{$_POST['Email']}', '{$_POST['Name']}', '{$_POST['Country']}', '{$_POST['State']}','{$_POST['City']}','{$_POST['phone']}', '{$_POST['ZipCode']}', '{$_POST['Adress']}', '$dateRegistered', '$currentTime','0','0','pending','{$_POST['emailtype']}')") or die(mysql_error());
		header("Location: userregistered.php");
	}}
}
?>
<style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
body {
	background-color: #000000;
}
a:link {
	color: #99CC00;
	text-decoration: none;
}
a:visited {
	color: #99CC00;
	text-decoration: none;
}
a:hover {
	color: #99FF00;
	text-decoration: none;
}
a:active {
	color: #99CC00;
	text-decoration: none;
}
-->
</style>
<form method="post" name="form1">
<?
include("_reg.header.php");
?>

  <table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">
    <tr>
      <td height="52"><p><span class="big_title"><br />
        Member registration form</span><span class="small_title"><br />
          <span class="error">
          <?php if ( isset($errorMsg) && $errorMsg!=""){ echo $errorMsg; } ?>
      </span> </span></p></td>
    </tr>
  </table>
  <table width="720" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#333333">

    <tr>

      <td class="" height="16" colspan="3"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>

          <td class="form_header_title">Step 1: User Information </td>
        </tr>

      </table></td>
    </tr>

    <tr align="left">

      <td colspan="3" class="form_definitions">Login information. </td>

    <tr>

      <td width="124" align="right" class="form_definitions">

	  <? if(isset($_POST['UserName']) && $_POST['UserName']==""){

		  echo "<font color=#ffdd54>Username*</font>";

	 	 } else{

	 	 echo"Username";

	  }?>	  </td>

      <td><input name="UserName"  value="<? if (isset($_POST['UserName'])){ echo $_POST['UserName']; }  ?>" type="text" id="UserName" size="24" maxlength="24"></td>

      <td width="148" class="form_informations">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['Password1']) && $_POST['Password1']==""){

		  echo "<font color=#ffdd54>Password*</font>";

	 	 } else{

	 	 echo"Password*";

	  }?>	  </td>

      <td><input name="Password1" type="password" id="Password1" size="24" maxlength="24"></td>

      <td class="form_informations">Password must be at  least  6 characters. </td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['Password2']) && $_POST['Password2']==""){

		  echo "<font color=#ffdd54>Re-type the Password*</font>";

	 	 } else{

	 	 echo"Re-type the Password*";

	  }?>	  </td>

      <td><input name="Password2" type="password" id="Password2" size="24" maxlength="24"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['Email']) && $_POST['Email']==""){

		  echo "<font color=#ffdd54>E-mail*</font>";

	 	 } else{ echo"E-mail*";} 

	  ?>	  </td>

      <td><input name="Email" value="<? if (isset($_POST['Email'])){ echo $_POST['Email']; }  ?>" type="text" id="Email" size="24" maxlength="48"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right">&nbsp;</td>

      <td>&nbsp;</td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td class="" colspan="3"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>

          <td class="form_header_title">Step 2: Personal information</td>
        </tr>

      </table></td>
    </tr>

    <tr align="left">

      <td colspan="3" class="form_definitions">Your personal information will never be seen by anyone other than the system admin.</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions"><? if(isset($_POST['Name']) && $_POST['Name']==""){

		  echo "<font color=#ffdd54>Full Name*</font>";

	 	 } else{ echo"Full Name*";}

	  	  ?>	  </td>

      <td><input name="Name" value="<? if (isset($_POST['Name'])){ echo $_POST['Name']; }  ?>" type="text" id="Name" size="24" maxlength="24"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Country*</td>

      <td width="424">

	  <select name="Country" id="Country">

          <?

		  include ("../dbase.php");

include ("../settings.php");

		$result = mysql_query('SELECT * FROM countries ORDER BY id');

    	while($row = mysql_fetch_array($result)) {

		echo"<option value='$row[id]'";

		if (isset($_POST['Country']) && $_POST['Country']==$row['id']){

		echo "selected";

		}

		

		echo ">$row[name]</option>";

		}

		  mysql_free_result($result);

		  

		  ?>
      </select>	  </td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions"><? if(isset($_POST['State']) && $_POST['State']==""){

		  echo "<font color=#ffdd54>State*</font>";

	 	 } else{ echo"State*";}

	  	  ?>	  </td>

      <td><input name="State" value="<? if (isset($_POST['State'])){ echo $_POST['State']; } ?>" type="text" id="State" size="24" maxlength="24"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['City']) && $_POST['City']==""){

		  echo "<font color=#ffdd54>City*</font>";

	 	 } else{ echo"City*";}

	  	  ?>	  </td>

      <td><input name="City" value="<? if (isset($_POST['City'])){ echo $_POST['City']; } ?>" type="text" id="City" size="24" maxlength="24"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

        <? if(isset($_POST['ZipCode']) && $_POST['ZipCode']==""){

		  echo "<font color=#ffdd54>Zip Code*</font>";

	 	 } else{ echo"Zip Code*";}

	  	  ?>      </td>

      <td><input name="ZipCode" value="<? if (isset($_POST['ZipCode'])){ echo $_POST['ZipCode']; }  ?>" type="text" id="ZipCode" size="24" maxlength="24"></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['phone']) && $_POST['phone']==""){

		  echo "<font color=#ffdd54>Phone Number*</font>";

	 	 } else{ echo"Phone Number*";}

	  	  ?>	  </td>

      <td><input name="phone" value="<? if (isset($_POST['phone'])){ echo $_POST['phone']; }  ?>" type="text" id="phone" size="24" maxlength="24"></td>

      <td class="form_informations">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">

	  <? if(isset($_POST['Adress']) && $_POST['Adress']==""){

		  echo "<font color=#ffdd54>Street Adress*</font>";

	 	 } else{ echo"Street Adress*";}

	  	  ?>	  </td>

      <td><textarea name="Adress" cols="24" rows="5" id="Adress"><? if (isset($_POST['Adress'])){echo "$_POST[Adress]"; } ?></textarea></td>

      <td>&nbsp;</td>
    </tr>

    <tr>

      <td align="right">&nbsp;</td>

      <td>&nbsp;</td>

      <td>&nbsp;</td>
    </tr>

    <tr align="left">

      <td class="" colspan="3"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>

          <td><span class="form_header_title">Step 3: Agree to the Terms of Service </span></td>
        </tr>

      </table></td>
    </tr>

    <tr>

      <td colspan="3" align="right"><div align="left"><span class="form_definitions">By checking the box below you agree to our Terms of Service  </span></div></td>
    </tr>

    <tr>

      <td colspan="3" class="form_definitions"><div align="center">
        <? if($_POST['checkbox']!="checkbox"){ echo "<font color=#ffdd54>You must agree with the terms:</font><br>";

}?>
        <br />
      <input name="checkbox" type="checkbox" value="checkbox" <? if( isset($_POST['checkbox']) && $_POST[checkbox]=="checkbox"){echo "checked";}?>>
        
        I Agree with the <a href="memberterms.php" target="_blank" class="left">Terms of Service</a><br>
        
  <br>
        
        Send registration emails as:: 
  <input name="emailtype" type="radio" value="text" checked>
        
        Plain text 
        
  <input name="emailtype" type="radio" value="html">
        
        Html
</div></td>
	</tr>

    <tr>

      <td align="right">&nbsp;</td>

      <td><div align="center">
        <p>
          <br />
          <input type="submit" name="Submit" value=" I Agree with the Terms of Service">
        </p>
        <p>&nbsp;  </p>
      </div></td>

      <td>&nbsp;</td>
	  <?
include("_reg.footer.php");
?>
    </tr>
  </table>

</form>


