<?php

session_start();

header("Pragma: public");

header("Expires: 0");

header("Cache-Control: private");



//exit();

if($_FILES['ImageFile']['tmp_name']!="" && isset($_POST[L1])){

		

		include('../dbase.php');

		include('../settings.php');

		$errorMsg=="";

		//birth date unix

		$day=$_POST[day];

		if ($day<10){$day="0".$day;}

		$currentSeconds=strtotime($day." ".$_POST[month]." ".$_POST[year]);



		//we copy the thumbail image

		$urlThumbnail="../models/".$_SESSION['username']."/thumbnail.jpg";

		if (!copy($_FILES['ImageFile']['tmp_name'],$urlThumbnail))

		{

		$errorMsg='Thumbnail image file could not be copied, please try again.';

		}

		

		//we insert the values in the database

		if(mysql_query("INSERT INTO `chatmodels` ( id , user , password , email , language1 , language2 , language3 , language4 , birthDate , braSize , birthSign , weight , weightMeasure , height , heightMeasure , eyeColor , ethnicity , message , position , fantasies , hobby , hairColor , hairLength , pubicHair , tImage , cpm ,epercentage, minimum , category , name , country , state , city , zip , adress , actImage , pMethod , pInfo , dateRegistered , owner , lastLogIn , phone ,fax, idtype , idmonth , idyear , idnumber , birthplace , ssnumber , msn , yahoo , icq , broadcastplace,emailtype,status,lastupdate ) 

		VALUES ('$_SESSION[userid]',

		'$_SESSION[username]',

		'$_SESSION[password_encrypted]',

		'$_SESSION[email]','$_POST[L1]',

		'$_POST[L2]', '$_POST[L3]', 

		'$_POST[L4]',

		'$currentseconds',

		'$_POST[BraSize]',

		'$_POST[BirthSign]',

		'$_POST[Weight]',

		'$_POST[weightMeasure]',

		'$_POST[Height]',

		'$_POST[heightMeasure]',

		'$_POST[eyeColor]',

		'$_POST[Ethnic]',

		'$_POST[Message]',

		'$_POST[Position]',

		'$_POST[Fantasies]',

		'$_POST[Hobbies]',

		'$_POST[hairColor]',

		'$_POST[hairLength]',

		'$_POST[pubicHair]',

		'Thumbnail Image',

		'295',

		'50',

		'$_POST[PMini]',

		'$_POST[Category]',

		'$_SESSION[name]',

		'$_SESSION[country]',

		'$_SESSION[state]',

		'$_SESSION[city]',

		'$_SESSION[zipcode]',

		'$_SESSION[adress]',

		'IdentityImage',

		'$_POST[PMethod]',

		'$_POST[PInfo]',

		'$_SESSION[dateregistered]',

		'none',

		'$_SESSION[dateregistered]',

		'$_SESSION[phone]',

		'$_POST[fax]',

		'$_SESSION[idtype]',

		'$_SESSION[idmonth]',

		'$_SESSION[idyear]',

		'$_SESSION[idnumber]',

		'$_SESSION[birthplace]',

		'$_SESSION[ss]',

		'$_POST[msn]',

		'$_POST[yahoo]',

		'$_POST[icq]',

		'$_POST[location]',

		'$_SESSION[emailtype]',

		'pending',

		'00000000000000'

		)"))

		{

		

$dt=date('m/d/Y H:i:s', $_SESSION['dateregistered']);		

$subject="New model registration ($_SESSION[username])";

$charset="Content-type: text/plain; charset=iso-8859-1\r\n";

$message="$_SESSION[username] has just registered at $siteurl

To view the models details use the link below:

$siteurl/admin/subscriptionviewdetails.php?id=$_SESSION[userid]

Date and time registered: $dt ";



		mail($registrationemail, $subject, $message,

     	"MIME-Version: 1.0\r\n".

    	 $charset.

     	"From:'$registrationemail'\r\n".

		"Reply-To:'$registrationemail'\r\n".

    	"X-Mailer:PHP/". phpversion());

		} else {

		$errorMsg="Could not complete registration, please try again.";

		}

		if ($errorMsg==""){

		header ("Location: modelregistered.php");

		}else{

		echo $errorMsg;

		}



}

else if (isset($_POST[L1]))

{

$errorMsg="You have not uploaded a profile picture";

}

?>
<style type="text/css">
<!--
body {
	background-color: #000000;
}
body,td,th {
	color: #FFFFFF;
}
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style2 {font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: 16px; }
-->
</style>

<form action="model2.php" method="post" enctype="multipart/form-data" name="form1" target="_self">
<?
include("_reg.header.php");
?>
  <table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

    <tr>

      <td height="52"><p><span class="small_title"><br>
          </span><span class="small_title"><span class="error">
          <?php if ( isset($errorMsg) && $errorMsg!=""){ echo $errorMsg; } ?>

          <br>

          <br>

                          </span>

                    </span></p>

      </td>

    </tr>

  </table>

  <table width="720" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#333333">

    <tr>

      <td height="16" colspan="3" align="center" valign="middle"><div align="left">
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          
          <tr>
            
            <td class="form_header_title"><span class="style1">Step 4: Profile Information </span></td>
            </tr>
        </table>
      </div></td>
    </tr>

    <tr>

      <td colspan="3"><span class="form_definitions">This information will be visible to all users (members and guests) visiting the site.</span></td>
    </tr>

    <tr>

      <td width="160" align="right" class="form_definitions">Language 1</td>

      <td width="250" align="left" class="form_definitions"><select name="L1" id="L1">

	      <option value="English"  <? if (isset($_POST[L1]) && $_POST[L1]=="English"){echo "selected";}  else if (!isset($_POST[L1])){ echo "selected"; }?>>English</option>

          <option value="Dutch" <? if (isset($_POST[L1]) && $_POST[L1]=="Dutch"){echo "selected";}?>>Dutch</option>

          <option value="French" <? if (isset($_POST[L1]) && $_POST[L1]=="French"){echo "selected";}?>>French</option>

          <option value="German" <? if (isset($_POST[L1]) && $_POST[L1]=="German"){echo "selected";}?>>German</option>

		  <option value="Italian" <? if (isset($_POST[L1]) && $_POST[L1]=="Italian"){echo "selected";}?>>Italian</option>

		  <option value="Japanese" <? if (isset($_POST[L1]) && $_POST[L1]=="Japanese"){echo "selected";}?>>Japanese</option>

		  <option value="Korean" <? if (isset($_POST[L1]) && $_POST[L1]=="Korean"){echo "selected";}?>>Korean</option>

		  <option value="Portuguese" <? if (isset($_POST[L1]) && $_POST[L1]=="Portuguese"){echo "selected";}?>>Portuguese</option>

	      <option value="Spanish" <? if (isset($_POST[L1]) && $_POST[L1]=="Spanish"){echo "selected";}?>>Spanish</option>	       

	    </select></td>

      <td width="286" align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right"><span class="form_definitions">Language 2</span></td>

      <td align="left"><select name="L2" id="select">

          <option value="None"  <? if (isset($_POST[L2]) && $_POST[L2]=="None"){echo "selected";}  else if (!isset($_POST[L2])){ echo "selected"; }?>>None</option>

          <option value="Dutch"  <? if (isset($_POST[L2]) && $_POST[L2]=="Dutch"){echo "selected";}?>>Dutch</option>

          <option value="English" <? if (isset($_POST[L2]) && $_POST[L2]=="English"){echo "selected";}?>>English</option>

          <option value="French" <? if (isset($_POST[L2]) && $_POST[L2]=="French"){echo "selected";}?>>French</option>

          <option value="German" <? if (isset($_POST[L2]) && $_POST[L2]=="German"){echo "selected";}?>>German</option>

          <option value="Italian" <? if (isset($_POST[L2]) && $_POST[L2]=="Italian"){echo "selected";}?>>Italian</option>

          <option value="Japanese" <? if (isset($_POST[L2]) && $_POST[L2]=="Japanese"){echo "selected";}?>>Japanese</option>

          <option value="Korean" <? if (isset($_POST[L2]) && $_POST[L2]=="Korean"){echo "selected";}?>>Korean</option>

          <option value="Portuguese" <? if (isset($_POST[L2]) && $_POST[L2]=="Portuguese"){echo "selected";}?>>Portuguese</option>

          <option value="Spanish" <? if (isset($_POST[L2]) && $_POST[L2]=="Spanish"){echo "selected";}?>>Spanish</option>

      </select></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Date of Birth</td>

      <td align="left"><select name="day" id="day">

          <?

		  for($i=01; $i<=31; $i++)

		  {

		  echo "<option value='$i'";

		  if ($_POST[day]==$i){ echo "selected";}

		  echo">$i</option>";

		  }

		  ?>

      </select>

        <select name="month" id="month">

          <option value="January" <? if ($_POST[month]=="January"){ echo "selected";} else if (!isset($_POST[month])){ echo "selceted";}?>>January</option>

          <option value="February" <? if ($_POST[month]=="February"){ echo "selected";}?>>February</option>

          <option value="March" <? if ($_POST[month]=="March"){ echo "selected";}?>>March</option>

		  <option value="April" <? if ($_POST[month]=="April"){ echo "selected";}?>>April</option>

          <option value="May" <? if ($_POST[month]=="May"){ echo "selected";}?>>May</option>  

          <option value="June" <? if ($_POST[month]=="June"){ echo "selected";}?>>June</option>

          <option value="July" <? if ($_POST[month]=="July"){ echo "selected";}?>>July</option>

          <option value="August" <? if ($_POST[month]=="August"){ echo "selected";}?>>August</option>

          <option value="September" <? if ($_POST[month]=="September"){ echo "selected";}?>>September</option>

          <option value="October" <? if ($_POST[month]=="October"){ echo "selected";}?>>October</option>

          <option value="November" <? if ($_POST[month]=="November"){ echo "selected";}?>>November</option>

          <option value="December" <? if ($_POST[month]=="December"){ echo "selected";}?>>December</option>
        </select>

        <select name="year" id="year">

          <?

		  for($i=1950; $i<=date(Y)-18; $i++)

		  {

		  echo "<option value='$i'";

		   if ($_POST[year]==$i){ echo "selected";}

		  echo ">$i</option>";

		  }

		  

		  ?>
        </select>	  </td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Weight</td>

      <td align="left"><input name="Weight" type="text" id="Weight" size="4" value="<? if (isset($_POST[Weight])){ echo $_POST[Weight]; }  ?>" maxlength="4">

        <select name="weightMeasure" id="select2">

          <option value="pd" <? if (isset($_POST[weightMeasure]) && $_POST[weightMeasure]=="pd"){echo "selected";} else if (!isset($_POST[weightMeasure])){ echo "selected"; }?>>Pounds</option>

          <option value="kg" <? if (isset($_POST[weightMeasure]) && $_POST[weightMeasure]=="kg"){echo "selected";}?>>Kg</option>
        </select>      </td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Height</td>

      <td align="left"><input name="Height" type="text" id="Height" value="<? if (isset($_POST[Height])){ echo $_POST[Height]; }  ?>" size="4" maxlength="4">        </td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Eye Color </td>

      <td align="left"><input name="eyeColor" type="text" id="eyeColor" size="24" value="<? if (isset($_POST[eyeColor])){ echo $_POST[eyeColor]; }  ?>" maxlength="24"></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Race</td>

      <td align="left"><input name="Ethnic" type="text" id="Ethnic" size="24" value="<? if (isset($_POST[Ethnic])){ echo $_POST[Ethnic]; }  ?>" maxlength="24"></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Hair Color </td>

      <td align="left"><input name="hairColor" type="text" id="hairColor" size="24" value="<? if (isset($_POST[hairColor])){ echo $_POST[hairColor]; }  ?>" maxlength="24"></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Hair Length </td>

      <td align="left"><input name="hairLength" type="text" id="hairLength" size="24" value="<? if (isset($_POST[hairLength])){ echo $_POST[hairLength]; }  ?>" maxlength="24"></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Location  </td>

      <td align="left"><input name="location" type="text" id="location" size="24" value="<? if (isset($_POST[location])){ echo $_POST[location]; } else { echo 'My Bedroom';}  ?>" maxlength="24"></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td height="12" align="right" class="form_definitions">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Favorite Position</td>

      <td align="left"><textarea name="Position" cols="24" rows="5" id="Position"><? if (isset($_POST[Position])){ echo $_POST[Position]; }  ?></textarea></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td height="12" align="right" class="form_definitions">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Secret Fantasies</td>

      <td align="left"><textarea name="Fantasies" cols="24" rows="5" id="Fantasies"><? if (isset($_POST[Fantasies])){ echo $_POST[Fantasies]; }?></textarea></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td height="12" align="right" class="form_definitions">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>

      <td height="12" align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions">Hobbies</td>

      <td align="left"><textarea name="Hobbies" cols="24" rows="5" id="Hobbies"><? if (isset($_POST[Hobbies])){ echo $_POST[Hobbies]; }?></textarea></td>

      <td align="left">&nbsp;</td>
    </tr>

    <tr>

      <td align="right" class="form_definitions"><? if(isset($_FILES['ImageFile']['name'])){

		  echo "<font color=#ffdd54>Your Profile Picture*</font>";

	 	 } else{ echo"Your Profile Picture*";}

	  	  ?></td>

      <td align="left"><input name="ImageFile" type="file" value="asdf" id="ImageFile"></td>

      <td align="left"><span class="form_informations">This is the picture users will see when they browse for models. </span></td>
    </tr>
  </table>

  <table width="720" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#333333">

    <tr>

      <td height="16" colspan="3" class="form_definitions"><div align="left">
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          
          <tr>
            
            <td>&nbsp;</td>
        </tr>
        </table>
      </div></td>

    </tr>

    <tr>

      <td colspan="3" class="form_definitions"><div align="center">Please enter your Payout information . Your earned funds will be sent to you on the 24th of every month.</div></td>

    </tr>

    <tr>

      <td width="160" align="right" class="form_definitions">Minimum Payment </td>

      <td width="349" align="left"><select name="PMini" id="PMini">

          <option value="100"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="100"){echo "selected";}?>>100</option>

          <option value="250"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="250"){echo "selected";}?>>250</option>

          <option value="500"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="500"){echo "selected";} else if (!isset($_POST[PMini])){ echo "selected"; }?>>500</option>

          <option value="1000"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="1000"){echo "selected";}?>>1000</option>

     	 <option value="2500"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="2500"){echo "selected";}?>>2500</option>

  		 <option value="5000"  <? if (isset($_POST[PMini]) && $_POST[PMini]=="5000"){echo "selected";}?>>5000</option>

   

	  </select></td>

      <td width="187">&nbsp;</td>

    </tr>

    <tr>

      <td align="right" class="form_definitions">Payment Method</td>

      <td align="left"><select name="PMethod" id="PMethod">

          <option value="pp"  <? if (isset($_POST[PMethod]) && $_POST[PMethod]=="pp"){echo "selected";} else if (!isset($_POST[PMethod])){ echo "selected"; }?>>Paypal</option>

          <option value="wu"  <? if (isset($_POST[PMethod]) && $_POST[PMethod]=="wu"){echo "selected";}?>>Western Union</option>

          <option value="ck"  <? if (isset($_POST[PMethod]) && $_POST[PMethod]=="ck"){echo "selected";}?>>Check</option>

          <option value="gc"  <? if ($tempPMethod=="gc"){echo "selected";}?> >Google Checkout</option>

      </select></td>

      <td>&nbsp;</td>

    </tr>

    <tr>

      <td align="right" class="form_definitions">Payment Information</td>

      <td align="left"><textarea name="PInfo" cols="24" rows="5" id="PInfo"><? if (isset($_POST[PInfo])){ echo $_POST[PInfo]; } ?></textarea></td>

      <td>&nbsp;</td>

    </tr>

    <tr>

      <td height="16" colspan="3">&nbsp;</td>
    </tr>

    <tr>

      <td colspan="3" class="form_definitions"><div align="center">You will be contacted by email once your application has been reviewed by an admin. </div></td>

    </tr>

    <tr>

      <td colspan="3" class="form_definitions">&nbsp;</td>

    </tr>

    <tr>

      <td>&nbsp;</td>

      <td><div align="center">
        <input type="submit" name="Submit" value=" Finish Registration ">
      </div></td>

      <td><p>&nbsp;</p>
      <p>&nbsp;</p></td>
<?
include("_reg.footer.php");
?>
    </tr>

  </table>

</form>




