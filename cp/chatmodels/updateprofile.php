<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatmodels" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

$result=mysql_query("SELECT user from $_COOKIE[usertype] WHERE id='$_COOKIE[id]' LIMIT 1");



	while($row = mysql_fetch_array($result)) 

	{	$username=$row[user];	}

}

?>

<?

if(!isset($_COOKIE["id"])){



header("Location: ../../login.php");



} else if($_POST[Email]!=""  && $_POST[Name] !="" && $_POST[Country] !="" && $_POST[State] !="" && $_POST[City] !=""&& $_POST[ZipCode] !="" && $_POST[Adress] !="")

{	



	include("../../dbase.php");

	$id=$_COOKIE["id"];

	$tempUser=$username;

	

	$tempPass1=$_POST[Password1];

	$tempPass2=$_POST[Password2];

	$tempEmail=$_POST[Email];

		

	$tL1=$_POST[L1];

	$tL2=$_POST[L2];

	$tL3=$_POST[L3];

	$tL4=$_POST[L4];



	$tDay=$_POST[day];

	$tMonth=$_POST[month];

	$tYear=$_POST[year];

	

	$tBraS=$_POST[BraSize];

	$tBirthS=$_POST[BirthSign];

		

	$tEthnic=$_POST[Ethnic];

	$tEyeC=$_POST[eyeColor];

	$tHeight=$_POST[Height];

	$tWeight=$_POST[Weight];

	$tHeightM=$_POST[heightMeasure];

	$tWeightM=$_POST[weightMeasure];

			

	$tMessage=$_POST[Message];

	$tFantasies=$_POST[Fantasies];

	$tPosition=$_POST[Position];

	

	$tCategory=$_POST[Category];

	$tCPM=$_POST[CPM];



	$tempName = $_POST[Name];

	$tempCountry = $_POST[Country];

	$tempState= $_POST[State];

	$tempCity=$_POST[City];

	$tempZip = $_POST[ZipCode];

	$tempAdress = $_POST[Adress];

	$tempPMethod=$_POST[PMethod];

	$tempPInfo=$_POST[PInfo];

	

		$tempIdmonth=$_POST[idmonth];

		$tempIdyear=$_POST[idyear];

		$tempIdtype=$_POST[idtype];

		$tempIdnumber=$_POST[idnumber];

		$tempSs=$_POST[ssnumber];

		$tempPhone=$_POST[phone];

		$tempBirth=$_POST[birthplace];

		$tempYahoo=$_POST[yahoo];	

		$tempMsn=$_POST[msn];	

		$tempIcq=$_POST[icq];	

		

		$tHcolor=$_POST[hairColor];

		$tHlength=$_POST[hairLength];

		$tPhair=$_POST[pubicHair];	

		$tBfrom=$_POST[broadcastplace];

		$tHobbies=$_POST[hobby];

		$tFax=$_POST[fax];

	

	

	

	$day=$_POST[day];

	if ($day<10){

	$day="0".$day;

	}



	$currentSeconds=strtotime($day." ".$_POST[month]." ".$_POST[year]);

	mysql_query("UPDATE chatmodels SET hobby='$tHobbies', broadcastplace='$tBfrom', pubicHair='$tPhair', hairLength='$tHlength', hairColor='$tHcolor', fax='$tFax', icq='$tempIcq', msn='$tempMsn', yahoo='$tempYahoo', birthplace='$tempBirth', phone='$tempPhone',ssnumber='$tempSs', idnumber='$tempIdnumber', idmonth='$tempIdmonth',idyear='$tempIdyear',idtype='$tempIdtype', email='$tempEmail', language1='$tL1', language2='$tL2', language3='$tL3', language4='$tL4',birthDate='$currentSeconds', braSize='$tBraS', birthSign='$tBirthS', weight='$tWeight', height='$tHeight', weightMeasure='$tWeightM', heightMeasure='$tHeightM', eyeColor='$tEyeC', ethnicity='$tEthnic', message='$tMessage', position='$tPosition', fantasies='$tFantasies', category='$tCategory', name='$tempName', country='$tempCountry', state='$tempState', city='$tempCity', zip='$tempZip', adress='$tempAdress', pMethod='$tempPMethod', pInfo='$tempPInfo' WHERE id = '$id' LIMIT 1");

	

	if ($_POST[Password1]!=""){	

	$db_pass=md5($_POST[Password1]);

	mysql_query("UPDATE chatmodels SET password='$db_pass' WHERE id = '$id' LIMIT 1");

	}

	

	mysql_query("UPDATE chatmodelsstatus SET category='$tCategory' WHERE id = '$id' LIMIT 1");

	$errorMsg="Modifications have been completed";





}

else if (!isset($_POST[Password1]))//if we need to laod the variables from the database

{



	if (isset($_FILES['ImageFile']['tmp_name']))

	{

		$urlThumbnail="../../models/".$username."/thumbnail.jpg";

		//we copy the thumbail image

		if (copy ($_FILES['ImageFile']['tmp_name'],$urlThumbnail))

		{		$errorMsg="File Copied";		} 		else		{		$errorMsg="File not Copied";		}

	}



	

	include("../../dbase.php");

	$id=$_COOKIE["id"];

	$result = mysql_query("SELECT * FROM chatmodels WHERE id='".$id."'");

	while($row = mysql_fetch_array($result)) 

	{

	$tempUser=$row["user"];

	$tempPass1=$row["password"];

	$tempPass2=$row["password"];

	$tempEmail=$row["email"];

	$tL1=$row["language1"];

	$tL2=$row["language2"];

	$tL3=$row["language3"];

	$tL4=$row["language4"];

	

	$tDay=date("d",$row["birthDate"] );

	$tMonth=date("F",$row["birthDate"] );

	$tYear=date("Y",$row["birthDate"] );

	

	$tBraS=$row["braSize"];

	$tBirthS=$row["birthSign"];

	$tMessage=$row["message"];

	$tFantasies=$row["fantasies"];

	$tPosition=$row["position"];

	$tEthnic=$row["ethnicity"];

	$tEyeC=$row["eyeColor"];

	$tHeight=$row["height"];

	$tWeight=$row["weight"];

	$tHeightM=$row["heightMeasure"];

	$tWeightM=$row["weightMeasure"];

	$tCPM=$row["cpm"];

	$tCategory=$row["category"];

	$tempName = $row["name"];

	$tempCountry = $row["country"];

	$tempState=$row["state"];

	$tempZip = $row["zip"];

	$tempCity=$row["city"];

	$tempAdress = $row["adress"];

	$tempPMethod=$row["pMethod"];

	$tempPInfo=$row["pInfo"];

	$tempIdmonth=$row[idmonth];

	$tempIdyear=$row[idyear];

	$tempIdtype=$row[idtype];

	$tempIdnumber=$row[idnumber];

	$tempSs=$row[ssnumber];

	$tempPhone=$row[phone];

	$tempBirth=$row[birthplace];

	$tempYahoo=$row[yahoo];	

	$tempMsn=$row[msn];	

	$tempIcq=$row[icq];	

	$tHcolor=$row[hairColor];

	$tHlength=$row[hairLength];

	$tPhair=$row[pubicHair];	

	$tBfrom=$row[broadcastplace];

	$tHobbies=$row[hobby];

	$tFax=$row[fax];

	}

	mysql_free_result($result);

}else

{

$id=$_COOKIE["id"];

	$tempUser=$username;

	$tempPass1=$_POST[Password1];

	$tempPass2=$_POST[Password2];

	$tempEmail=$_POST[Email];

	

	$tL1=$_POST[L1];

	$tL2=$_POST[L2];

	$tL3=$_POST[L3];

	$tL4=$_POST[L4];

	

	$tDay=$_POST[day];

	$tMonth=$_POST[month];

	$tYear=$_POST[year];	

	

	$tBraS=$_POST[BraSize];

	$tBirthS=$_POST[BirthSign];

		

	$tEthnic=$_POST[Ethnic];

	$tEyeC=$_POST[eyeColor];

	$tHeight=$_POST[Height];

	$tWeight=$_POST[Weight];

	$tHeightM=$_POST[heightMeasure];

	$tWeightM=$_POST[weightMeasure];

		

	$tMessage=$_POST[Message];

	$tFantasies=$_POST[Fantasies];

	$tPosition=$_POST[Position];

	

	$tCategory=$_POST[Category];

	$tCPM=$_POST[CPM];



	

	$tempName = $_POST[Name];

	$tempCountry = $_POST[Country];

	$tempState= $_POST[State];

	$tempCity=$_POST[City];

	$tempZip = $_POST[ZipCode];

	$tempAdress = $_POST[Adress];

	$tempPMethod=$_POST[PMethod];

	$tempPInfo=$_POST[PInfo];

	

		$tempIdmonth=$_POST[idmonth];

		$tempIdyear=$_POST[idyear];

		$tempIdtype=$_POST[idtype];

		$tempIdnumber=$_POST[idnumber];

		$tempSs=$_POST[ssnumber];

		$tempPhone=$_POST[phone];

		$tempBirth=$_POST[birthplace];

		$tempYahoo=$_POST[yahoo];	

		$tempMsn=$_POST[msn];	

		$tempIcq=$_POST[icq];	

		

		$tHcolor=$_POST[hairColor];

		$tHlength=$_POST[hairLength];

		$tPhair=$_POST[pubicHair];	

		$tBfrom=$_POST[broadcastplace];

		$tHobbies=$_POST[hobby];

		$tFax=$_POST[fax];



$errorMsg="Please complete the boxes withy the right specifications.";



} 

?>

<?
include("_models.header.php");
?><style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
body {
	background-color: #000000;
}
a:link {
	color: #99CC00;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #99CC00;
}
a:hover {
	text-decoration: none;
	color: #99FF00;
}
a:active {
	text-decoration: none;
	color: #99CC00;
}
-->
</style>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr valign="top">

    <td height="113"><span class="error"><?php if ( isset($errorMsg) && $errorMsg!=""){ echo $errorMsg; } ?></span>       

      <form action="updateprofile.php" method="post" enctype="multipart/form-data" name="form2">

        <table width="720" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#333333">

          <tr class="barbg">

            <td colspan="3">&nbsp;</td>
          </tr>

          <tr>

            <td width="1" align="right" class="form_definitions">&nbsp;</td>

            <td width="147"><img src="../../models/<? echo $username; ?>/thumbnail.jpg" width="140" height="105"></td>

            <td width="548"><p>
              <input name="ImageFile" type="file" id="ImageFile">
            </p>
              <p>
                <INPUT TYPE="image" SRC="../../images/update_picture.png" HEIGHT="30" WIDTH="173" BORDER="0" ALT="">
                <br />
                <br>
                
            <span class="form_informations style1">This picture is displayed to members in the online models area. For best quality this picture should be (140x105). </span></p></td>

          </tr>

        </table>

      </form>

      <form name="form1" method="post" action="updateprofile.php">

        <table width="720" border="0" align="center" cellpadding="4" cellspacing="0">

          <tr align="left" class="barbg">

            <td colspan="3"><span class="form_header_title">User Information </span></td>
          </tr>

          <tr>

            <td width="160" class="form_definitions">&nbsp;</td>

            <td width="250">&nbsp;</td>

            <td width="286"><span class="style1"></span></td>

          </tr>

          <tr>

            <td align="right" class="form_definitions"> User name: </td>

            <td class="small_title"><? echo $tempUser;?></td>

            <td><span class="style1"></span></td>

          </tr>

          <tr>

            <td align="right" class="form_definitions">New	Password:

			</td>

            <td><input name="Password1" type="password" id="Password1" size="24" maxlength="24"></td>

            <td class="form_informations style1">Leave this blank unless your changing your password </td>

          </tr>

          <tr>

            <td align="right" class="form_definitions"><? if($tempEmail==""){ echo "<font color=#ffdd54>Email*</font>";

	 	 	} else{ echo"Email*"; }?>	

			</td>

            <td><input name="Email" type="text" id="Email" value="<? echo $tempEmail;?>" size="24" maxlength="24"></td>

            <td><span class="style1"></span></td>

          </tr>

        </table>

        <br>

        <div align="center">

          <table width="720" border="0" cellspacing="0" cellpadding="4">

            <tr align="left" class="barbg">

              <td colspan="3"><span class="form_header_title">Profile Information </span></td>
            </tr>

            <tr>

              <td width="160">&nbsp;</td>

              <td width="250">&nbsp;</td>

              <td width="286"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Language 1:</td>

              <td align="left" valign="top" class="form_definitions"><select name="L1" id="select">

			    <option value="Dutch"  <? if ($tL1=="Dutch"){echo "selected";}?> >Dutch</option>

                <option value="English" <? if ($tL1=="English"){echo "selected";}?> >English</option>

                <option value="French" <? if ($tL1=="French"){echo "selected";}?> >French</option>

				<option value="German" <? if ($tL1=="German"){echo "selected";}?> >German</option>

				<option value="Italian" <? if ($tL1=="Italian"){echo "selected";}?> >Italian</option>

				<option value="Japanese" <? if ($tL1=="Japanese"){echo "selected";}?> >Japanese</option>

				<option value="Korean" <? if ($tL1=="Korean"){echo "selected";}?> >Korean</option>

				<option value="Portuguese" <? if ($tL1=="Portuguese"){echo "selected";}?> >Portuguese</option>

				<option value="Spanish" <? if ($tL1=="Portuguese"){echo "selected";}?> >Spanish</option>



              </select></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions"> Language 2: </td>

              <td align="left" valign="top"><select name="L2" id="L2">

                  <option value="none"  <? if ($tL2=="none"){echo "selected";}?> >None</option>

                  <option value="Dutch"  <? if ($tL2=="Dutch"){echo "selected";}?> >Dutch</option>

                  <option value="English" <? if ($tL2=="English"){echo "selected";}?> >English</option>

                  <option value="French" <? if ($tL2=="French"){echo "selected";}?> >French</option>

                  <option value="German" <? if ($tL2=="German"){echo "selected";}?> >German</option>

                  <option value="Italian" <? if ($tL2=="Italian"){echo "selected";}?> >Italian</option>

                  <option value="Japanese" <? if ($tL2=="Japanese"){echo "selected";}?> >Japanese</option>

                  <option value="Korean" <? if ($tL2=="Korean"){echo "selected";}?> >Korean</option>

                  <option value="Portuguese" <? if ($tL2=="Portuguese"){echo "selected";}?> >Portuguese</option>

                  <option value="Spanish" <? if ($tL2=="Portuguese"){echo "selected";}?> >Spanish</option>

              </select></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions"> Birth Date:* </td>

              <td align="left" valign="top">

                <select name="day" id="day">

                  <?

		  for($i=01; $i<=31; $i++)

		  {

		  echo "<option value='$i'";

		  if ($tDay==$i){ echo "selected";}

		  echo">$i</option>";

		  }

		  ?>
                </select>

                <select name="month" id="month">

                  <option value="January" <? if ($tMonth=="January"){ echo "selected";}?>>January</option>

                  <option value="February" <? if ($tMonth=="February"){ echo "selected";}?>>February</option>

                  <option value="March" <? if ($tMonth=="March"){ echo "selected";}?>>March</option>

                  <option value="April" <? if ($tMonth=="April"){ echo "selected";}?>>April</option>

                  <option value="May" <? if ($tMonth=="May"){ echo "selected";}?>>May</option>

                  <option value="June" <? if ($tMonth=="June"){ echo "selected";}?>>June</option>

                  <option value="July" <? if ($tMonth=="July"){ echo "selected";}?>>July</option>

                  <option value="August" <? if ($tMonth=="August"){ echo "selected";}?>>August</option>

                  <option value="September" <? if ($tMonth=="September"){ echo "selected";}?>>September</option>

                  <option value="October" <? if ($tMonth=="October"){ echo "selected";}?>>October</option>

                  <option value="November" <? if ($tMonth=="November"){ echo "selected";}?>>November</option>

                  <option value="December" <? if ($tMonth=="December"){ echo "selected";}?>>December</option>
                </select>

                <select name="year" id="year">

                  <?

		  for($i=1971; $i<=date(Y)-17; $i++)

		  {

		  echo "<option value='$i'";

		   if ($tYear==$i){ echo "selected";}

		  echo ">$i</option>";

		  }

		  

		  ?>
              </select></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Weight:</td>

              <td align="left" valign="top"><input name="Weight" type="text" id="Weight" size="4" value="<? echo $tWeight;  ?>" maxlength="24">

                <select name="weightMeasure" id="weightMeasure">

                  <option value="kg" <? if ($tWeightM=="kg"){echo "selected";}?> >Kg</option>

                  <option value="pd" <? if ($tWeightM=="pd"){echo "selected";}?> >Pounds</option>
                </select></td>

              <td align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Height:</td>

              <td align="left" valign="top"><input name="Height" type="text" id="Height" value="<? echo $tHeight;  ?>" size="4" maxlength="4"></td>

              <td align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Eye Color: </td>

              <td align="left" valign="top"><input name="eyeColor" type="text" id="eyeColor" size="24" value="<? echo $tEyeC;  ?>" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Race:</td>

              <td align="left" valign="top"><input name="Ethnic" type="text" id="Ethnic" size="24" value="<? echo $tEthnic;  ?>" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">Hair Color </td>

              <td align="left"><input name="hairColor" type="text" id="hairColor" size="24" value="<? if (isset($tHcolor)){ echo $tHcolor; }  ?>" maxlength="24"></td>

              <td align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">Hair Length </td>

              <td align="left"><input name="hairLength" type="text" id="hairLength" size="24" value="<? if (isset($tHlength)){ echo $tHlength; }  ?>" maxlength="24"></td>

              <td align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">Location </td>

              <td align="left"><input name="broadcastplace" type="text" id="broadcastplace" size="24" value="<? if (isset($tBfrom)){ echo $tBfrom; }  ?>" maxlength="24"></td>

              <td align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Message For visitors: </td>

              <td align="left" valign="top"><textarea name="Message" cols="24" rows="5" id="Message"><? echo $tMessage;?></textarea></td>

              <td align="left" valign="top" class="form_informations style1">Short message for members. </td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">&nbsp;</td>

              <td align="left" valign="top">&nbsp;</td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Favorite Position:</td>

              <td align="left" valign="top"><textarea name="Position" cols="24" rows="5" id="Position"><? echo $tPosition;?></textarea></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">&nbsp;</td>

              <td align="left" valign="top">&nbsp;</td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Fantasies:</td>

              <td align="left" valign="top"><textarea name="Fantasies" cols="24" rows="5" id="Fantasies"><? echo $tFantasies;?></textarea></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td height="12" align="right" class="form_definitions">&nbsp;</td>

              <td height="12" align="left">&nbsp;</td>

              <td height="12" align="left"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">Hobbies</td>

              <td align="left"><textarea name="hobby" cols="24" rows="5" id="hobby"><? if (isset($tHobbies)){ echo $tHobbies; }?></textarea></td>

              <td align="left"><span class="style1"></span></td>
            </tr>
          </table>

          <br>

          <table width="720" border="0" cellspacing="0" cellpadding="4">

            <tr align="left" class="barbg">

              <td colspan="3"><span class="form_header_title">Personal Information</span></td>
            </tr>

            <tr>

              <td colspan="3">&nbsp;</td>
            </tr>

            <tr>

              <td width="160" align="right" valign="top" class="form_definitions"><? if($tempName==""){ echo "<font color=#ffdd54>Full Name: *</font>";

	 	 	} else{ echo"Full Name: *"; }?>              </td>

              <td width="250" align="left" valign="top"><input name="Name" type="text" id="Name" value="<? echo $tempName;?>" size="24" maxlength="24"></td>

              <td width="286"><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">Country: *</td>

              <td align="left" valign="top">

			  <select name="Country" id="Country">

          <?

		  include ("../../dbase.php");

include ("../../settings.php");

		$result = mysql_query('SELECT * FROM countries ORDER BY name');

    	while($row = mysql_fetch_array($result)) {

		echo"<option value='$row[id]'";

		if ($tempCountry==$row[id]){

		echo "selected";

		}

		

		echo ">$row[name]</option>";

		}

		  

		  

		  ?>
        </select>

			  

&nbsp;</td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions"><? if($tempState==""){ echo "<font color=#ffdd54>State: *</font>";

	 	 	} else{ echo"State: *"; }?>              </td>

              <td align="left" valign="top"><input name="State" type="text" id="State" value="<? echo $tempState;?>" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions">

                <? if($tempCity==""){ echo "<font color=#ffdd54>City: *</font>";

	 	 	} else{ echo"City: *"; }?>              </td>

              <td align="left" valign="top"><input name="City" type="text" id="City" value="<? echo $tempCity;?>" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions"><? if($tempZip==""){ echo "<font color=#ffdd54>Zip Code: *</font>";

	 	 	} else{ echo"Zip Code: *"; }?>              </td>

              <td align="left" valign="top"><input name="ZipCode" type="text" id="ZipCode" value="<? echo $tempZip;?>" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">

                <? if(isset($tempPhone) && $tempPhone==""){

		  echo "<font color=#ffdd54>Phone*</font>";

	 	 } else{ echo"Phone*";}

	  	  ?>              </td>

              <td align="left"><input name="phone" value="<? if (isset($tempPhone)){ echo $tempPhone; }  ?>" type="text" id="phone" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" valign="top" class="form_definitions"><? if($tempAdress==""){ echo "<font color=#ffdd54>Adress: *</font>";

	 	 	} else{ echo"Adress: *"; }?>              </td>

              <td align="left" valign="top"><textarea name="Adress" cols="24" rows="5" id="Adress"><? echo $tempAdress;?></textarea></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions"> ID Type </td>

              <td align="left"><select name="idtype" id="select4">

                  <option value="IDcard" selected <? if ($tempIdtype=="IDcard"){ echo "selected";} else if (!$tempIdtype){ echo "selceted";}?>>ID card</option>

                  <option value="Passport" <? if ($tempIdtype=="Passport"){ echo "selected";}?>>Passport</option>

                  <option value="Driverslicense" <? if ($tempIdtype=="Driverslicense"){ echo "selected";}?>>Drivers license</option>

                </select>              </td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions"> ID Issue Date </td>

              <td align="left"><select name="idmonth" id="select4">

                  <option value="January" <? if ($tempIdmonth=="January"){ echo "selected";} else if (!isset($tempIdmonth)){ echo "selceted";}?>>January</option>

                  <option value="February" <? if ($tempIdmonth=="February"){ echo "selected";}?>>February</option>

                  <option value="March" <? if ($tempIdmonth=="March"){ echo "selected";}?>>March</option>

                  <option value="April" <? if ($tempIdmonth=="April"){ echo "selected";}?>>April</option>

                  <option value="May" <? if ($tempIdmonth=="May"){ echo "selected";}?>>May</option>

                  <option value="June" <? if ($tempIdmonth=="June"){ echo "selected";}?>>June</option>

                  <option value="July" <? if ($tempIdmonth=="July"){ echo "selected";}?>>July</option>

                  <option value="August" <? if ($tempIdmonth=="August"){ echo "selected";}?>>August</option>

                  <option value="September" <? if ($tempIdmonth=="September"){ echo "selected";}?>>September</option>

                  <option value="October" <? if ($tempIdmonth=="October"){ echo "selected";}?>>October</option>

                  <option value="November" <? if ($tempIdmonth=="November"){ echo "selected";}?>>November</option>

                  <option value="December" <? if ($tempIdmonth=="December"){ echo "selected";}?>>December</option>

                </select>

                  <select name="idyear" id="select5">

                    <?

		  for($i=1980; $i<=date(Y)-17; $i++)

		  {

		  echo "<option value='$i'";

		   if ($tempIdyear==$i){ echo "selected";}

		  echo ">$i</option>";

		  }

		  

		  ?>
                </select></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">

                <? if(isset($tempIdnumber) && $tempIdnumber==""){

		  echo "<font color=#ffdd54>ID Number:*</font>";

	 	 } else{ echo"ID Number:*";}

	  	  ?>              </td>

              <td align="left"><input name="idnumber" value="<? if (isset($tempIdnumber)){ echo $tempIdnumber; }  ?>" type="text" id="idnumber" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">

                <? if(isset($tempBirth) && $tempBirth==""){

		  echo "<font color=#ffdd54>Place of birth*</font>";

	 	 } else{ echo"Place of birth*";}

	  	  ?>              </td>

              <td align="left"><input name="birthplace" value="<? if (isset($tempBirth)){ echo $tempBirth; }  ?>" type="text" id="birthplace" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">

                <? if(isset($tempSs) && $tempSs==""){

		  echo "<font color=#ffdd54>Social Security number*</font>";

	 	 } else{ echo"Social Security Number*";}

	  	  ?>              </td>

              <td align="left"><input name="ssnumber" value="<? if (isset($tempSs)){ echo $tempSs; }  ?>" type="text" id="ssnumber" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>

            <tr>

              <td align="right" class="form_definitions">

Fax              </td>

              <td align="left"><input name="fax" value="<? if (isset($tFax)){ echo $tFax; }  ?>" type="text" id="fax" size="24" maxlength="24"></td>

              <td><span class="style1"></span></td>
            </tr>
          </table>

          <br>

          <table width="720" border="0" cellspacing="0" cellpadding="4">

            <tr align="left" class="barbg">

              <td colspan="3"><span class="form_header_title">Payout Information</span></td>
            </tr>

            <tr>

              <td width="160">&nbsp;</td>

              <td width="250">&nbsp;</td>

              <td width="286"><span class="style1"></span></td>

            </tr>

            <tr>

              <td align="left" valign="top" class="form_definitions">Payout Method:</td>

              <td align="left" valign="top"><select name="PMethod" id="PMethod">

                  <option value="pp"  <? if ($tempPMethod=="pp"){echo "selected";}?> >Paypal</option>

                  <option value="wu"  <? if ($tempPMethod=="wu"){echo "selected";}?> >Western Union</option>

                  <option value="ck"  <? if ($tempPMethod=="ck"){echo "selected";}?> >Check</option>

                  <option value="gc"  <? if ($tempPMethod=="gc"){echo "selected";}?> >Google Checkout</option>

              </select></td>

              <td><span class="style1"></span></td>

            </tr>

            <tr>

              <td align="left" valign="top" class="form_definitions">Payment Information:</td>

              <td align="left" valign="top"><textarea name="PInfo" cols="24" rows="5" id="PInfo"><? echo $tempPInfo;?></textarea></td>

              <td><span class="style1"></span></td>

            </tr>

            <tr>

              <td height="24">&nbsp;</td>

              <td align="left" valign="top"><INPUT TYPE="image" SRC="../../images/save_changes.png" HEIGHT="30" WIDTH="173" BORDER="0" ALT=""></td>

              <td><span class="style1"></span></td>

            </tr>

          </table>

        </div>

      </form></td>
<?
include("_models.footer.php");
?>
  </tr>

</table>

