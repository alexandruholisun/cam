<?

if($_POST[accountUser]!="")

{

	include("dbase.php");

include("settings.php");

	if ($_POST[accountType]=="member")

	{

	$database="chatusers";

	} else if ($_POST[accountType]=="model")

	{

	$database="chatmodels";



	} else if ($_POST[accountType]=="studioOp")

	{

	$database="chatoperators";

	}

	

	

	$userExists=false;

	$result = mysql_query("SELECT user,email,id FROM $database WHERE status!='pending' && status!='rejected'");

	while($row = mysql_fetch_array($result))

	{

		$tempUser=$row["user"];

		$tempEmail=$row["email"];

		$tempId=$row["id"];

		

		if ($_POST[accountUser]==$tempUser){

			$userExists=true;

			function makeRandomPassword() { 

        	  $salt = "abchefghjkmnpqrstuvwxyz0123456789"; 

	          srand((double)microtime()*1000000); 

	          $i = 0; 

	          while ($i <= 7) { 

	                $num = rand() % 33; 

	                $tmp = substr($salt, $num, 1); 

	                $pass = $pass . $tmp; 

	                $i++; 

    	      } 

        	 return $pass; 

    	}

		$random_password = makeRandomPassword(); 

    	$db_password = md5($random_password); 



		mysql_query("UPDATE $database SET password='$db_password' WHERE id = '$tempId' LIMIT 1");

		

$subject = "New password for $siteurl account"; 	   		

$charset = "Content-type: text/plain; charset=iso-8859-1\r\n";

$message = "

Your password has been reset. 

     

New Password: $random_password 

	 	

$siteurl/login.php 



For your security we keep the passwords encripted. 

That is why we can not recover your lost password.



This is an automated response, please do not reply!"; 

	

@mail($tempEmail, $subject, $message,

"MIME-Version: 1.0\r\n".

$charset.

"From:$registrationemail\r\n".

"Reply-To:$registrationemail\r\n".

"X-Mailer:PHP/" . phpversion() );

		

header("Location: login.php?from=recoverpass");

exit();

		

		}

	

	}

	$errorMsg="Username does not exists";

	

	

} else

{

	$errorMsg="Please complete the username field";

}



?>



<?
include("_main.header.php");
?><style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
}
body {
	background-color: #000000;
}
-->
</style>

<table width="720" height="200" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td align="center" valign="middle"><form action="lostpassword.php" method="post" enctype="application/x-www-form-urlencoded" name="form1">

      <p>&nbsp;</p>

      <table width="720" border="0" align="center" bgcolor="#333333">

        <tr>

          <td colspan="3"><p align="left">

              <span class="error"><?php if ( isset($errorMsg) && $errorMsg!=""){ echo $errorMsg; } ?></span>

              <br>

              <br>

</p></td>

        </tr>

        <tr>

          <td align="right" valign="top" class="form_definitions"><div align="right">Username:</div></td>

          <td align="left" valign="top"><p>

              <input name="accountUser" type="text" id="accountUser" size="24" maxlength="24">

          </p></td>

          <td align="left" valign="top" class="form_informations"><div align="left"></div></td>

        </tr>

        <tr>

          <td width="210" align="right" valign="top" class="form_definitions"><div align="right">Account  type :</div></td>

          <td width="212" align="left" valign="top"><p>

            <select name="accountType" id="select">

              <option value="member">Member</option>

              <option value="model">Model</option>

            </select>

          </p></td>

          <td width="284" align="left" valign="top" class="form_informations"><div align="left"></div></td>

        </tr>

        <tr>

          <td align="right" valign="top" class="form_definitions">&nbsp;</td>

          <td colspan="2" align="left" valign="top" class="form_definitions">The new password will be sent to your email.</td>

          </tr>

        <tr>

          <td align="right" valign="top" class="form_definitions"><div align="right"></div></td>

          <td align="center" valign="top"><INPUT TYPE="image" SRC="images/reset_password.png" HEIGHT="30" WIDTH="173" BORDER="0" ALT="Login"></td>

          <td align="left" valign="top" class="form_informations"><div align="left"></div></td>

        </tr>

        <tr>

          <td colspan="3" align="right" valign="top" class="form_definitions"><div align="right"></div>            
          <div align="left">The system will generate a new password for you. After you login again you can change it from the &quot;My Profile&quot; link in your account control panel. </div></td>
<?
include("_main.footer.php");
?>
          </tr>

      </table>

    </form></td>

  </tr>

</table>

<br>



