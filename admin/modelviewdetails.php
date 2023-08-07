<?
if(isset($_POST['epc']) && isset($_POST['cpm'])){
include('../dbase.php');
include('../settings.php');
mysql_query("UPDATE chatmodels SET cpm='$_POST[cpm]',epercentage='$_POST[epc]' WHERE id = '$_POST[id]' LIMIT 1");

}
?>
<?
include("_header-admin.php")
?>
<?
	
	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400
	//$secondsAll=time();
		
	include('../dbase.php');
	
	
	$result = mysql_query("SELECT * FROM chatmodels WHERE id='$_GET[id]' LIMIT 1");
		while($row = mysql_fetch_array($result)) 
		{
		$tempUser=$row["user"];
		$tempPass1=$row["password"];
		$tempPass2=$row["password"];
		$tempEmail=$row["email"];
		$status=$row['status'];
		$tL1=$row["language1"];
		$tL2=$row["language2"];
		$tL3=$row["language3"];
		$tL4=$row["language4"];
		
		$tBirthD=$row["birthDate"];
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
		
		$cpm=$row["cpm"];
		$epc=$row["epercentage"];
		$tCategory=$row["category"];
		$rowdate=$row["dateRegistered"];
		$date=date("d F Y,H:i",$rowdate);
		
		$tempName = $row["name"];
		
		$result3=mysql_query("SELECT name FROM countries WHERE id='$row[country]' LIMIT 1");
			while($row3 = mysql_fetch_array($result3)) {
			$tempCountry=$row3[name];
			}
		
		$tempState=$row["state"];
		$tempZip = $row["zip"];
		$tempCity=$row["city"];
		$tempAdress = $row["adress"];
		$tempPMethod=$row["pMethod"];
		$tempPInfo=$row["pInfo"];
		$tOwner=$row['owner'];
		$tempIdmonth=$row['idmonth'];
		$tempIdyear=$row['idyear'];
		$tempIdtype=$row['idtype'];
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
		$tempFax=$row[fax];	
		

		}
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
<table width="720" height="98" align="center" bgcolor="#333333" class="form_definitions">
  <tr>
    <td width="96" height="96" align="center" valign="middle"><img height="105" width="140" src="../models/<? echo $tempUser."/thumbnail.jpg" ?>"></td>
    <td width="312" valign="bottom"><strong class="big_title">Account information for:  <? echo $tempName; ?><br>
      <span class="a_small_title">Status: <? echo $status;?></span>      <br>
    </strong>    </td>
    <td width="296"><div align="right">
      <table width="300" height="96"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <form name="form1" method="post" action="deleteaccount.php">
            <td width="292" height="30">
              <div align="center">
                <input type="submit" name="Submit2" value="Delete Account">
                <input name="id" type="hidden" id="id5" value="<? echo $_GET['id']; ?>">
                <input name="type" type="hidden" id="type4" value="model">
                <input name="username" type="hidden" id="type5" value="<? echo $tempUser; ?>">
                <input name="date" type="hidden" id="username" value="<? echo $date; ?>">
              </div></td>
          </form>
        </tr>
        <tr>
<? if($status!='blocked'){ 
	echo ' <form name="form2" method="post" action="blockaccount.php">';
} else {
	echo ' <form name="form2" method="post" action="activateaccount.php">';
}
?> 
			 
                <td height="30">
                  <div align="center">
                    <input type="submit" name="Submit22" value="<? if($status!='blocked'){echo 'Block Account';} else {echo 'Activate Account';}?> ">
                    <input name="id" type="hidden" id="id35" value="<? echo $_GET['id']; ?>">
                    <input name="type" type="hidden" id="type" value="model">
                    <input name="username" type="hidden" id="username" value="<? echo $tempUser; ?>">
                    <input name="date" type="hidden" id="date23" value="<? echo $date; ?>">
            </div></td>
          </form>
        </tr>
        <tr>
          <form name="form3" method="post" action="sendemail.php">
            <td height="33">
              <div align="center">
                <input type="submit" name="Submit222" value="Send Email">
                <input name="id" type="hidden" id="id45" value="<? echo $_GET['id']; ?>">
                <input name="type" type="hidden" id="type2" value="model">
                <input name="username" type="hidden" id="username4" value="<? echo $tempUser; ?>">
                <input name="email" type="hidden" id="date4" value="<? echo $tempEmail; ?>">
              </div></td>
          </form>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
<table width="720"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">
  <tr>
    <td width="360" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#333333">
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions"><strong>User Name</strong></td>
          <td width="249" align="left" valign="top" class="form_definitions"><strong><? echo $tempUser; ?></strong></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Email</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempEmail; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">&nbsp;</td>
          <td align="left" valign="top" class="form_definitions">&nbsp;</td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Language1</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tL1; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Language2</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tL2; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">&nbsp;</td>
          <td align="left" valign="top" class="form_definitions">&nbsp;</td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Eye Color</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tEyeC; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Weight</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tWeight." ".$tWeightM; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Height</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tHeight." ".$tHeightM; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Race</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tEthnic; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Hair Color</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tHcolor; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Hair Length</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tHlength; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Location</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tBfrom; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Message</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tMessage; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Position</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tPosition; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Fantasies</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tFantasies; ?></td>
        </tr>
        <tr>
          <td align="left" valign="top" class="form_definitions">Hobbies</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tHobbies; ?></td>
        </tr>
    </table></td>
    <td width="360" valign="top" bgcolor="#333333"><table width="100%"  border="0" cellpadding="0" cellspacing="2" bgcolor="#333333">
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">Full Name:</td>
          <td width="231" align="left" valign="top" class="form_definitions"><? echo $tempName; ?></td>
        </tr>
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">Country:</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempCountry; ?></td>
        </tr>
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">State:</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempState; ?></td>
        </tr>
        <tr>
          <td width="100" height="21" align="left" valign="top" class="form_definitions">City:</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempCity; ?></td>
        </tr>
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">Adress:</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempAdress; ?></td>
        </tr>
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">Zip Code:</td>
          <td align="left" valign="top" class="form_definitions"><? echo $tempZip; ?></td>
        </tr>
        <tr class="form_definitions">
          <td width="100" align="left">Phone#:</td>
          <td><? echo $tempPhone; ?></td>
        </tr>
        <tr class="form_definitions">
          <td width="100" align="left">Birth Place:</td>
          <td><? echo $tempBirth; ?></td>
        </tr>
        <tr class="form_definitions">
          <td width="100" align="left">SSN#:</td>
          <td><? echo $tempSs; ?></td>
        </tr>
        <tr>
          <td width="100" align="left" valign="top" class="form_definitions">Birth date : </td>
          <td align="left" valign="top" class="form_definitions">
            <? 
	  echo date("d F Y",$tBirthD)."<br>"; 
	  echo date('Y',time()-$tBirthD)-1970;echo " years.";
	  ?>          </td>
        </tr>
        <tr>
          <td align="left" class="form_definitions">Account type :</td>
          <td align="left" class="form_definitions">
            <?
	  if ($tOwner!="none"){
		echo "Studio: ".$row2[owner];
		}else {
		echo "Private person";
		}
		?>          </td>
        </tr>
        <tr>
          <td width="100" align="left" class="form_definitions">Date registered: </td>
          <td align="left" class="form_definitions">
            <? echo $date;?>          </td>
        </tr>
    </table></td>
  </tr>
</table>
<form name="form1" method="post" action="">
  <table width="720"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#333333" class="form_definitions">
    <tr>
      <td bgcolor="#333333"><p> Earning percentage.<br>
              <input name="epc" type="text" id="epc" value="<? echo $epc;?>" size="2" maxlength="2">
          %<br>
          <br />
          Cost Per minute<br>
          <input name="cpm" type="text" id="cpm4" value="<? echo $cpm;?>" size="3" maxlength="3">
           ($<? echo $cpm/100 ?>  per minute) Note: Funds in 1 on 1 chat update every 30 seconds.<br>
           <br />
          <input type="submit" name="Submit" value="   Save   ">
          <input name="id" type="hidden" id="id4" value="<? echo $_GET['id']; ?>">
      </p></td>
    </tr>
  </table>
</form>
<?
$tempMinutesPv=0;
$tempSecondsPv=0;
$sitemoney=0;
$tempMoneyEarned=0;
$tempMoneySent=0;
$tempMoneyEarned30=0;
$ammount=0;
$result = mysql_query("SELECT * FROM videosessions WHERE model='$tempUser'");
while($row = mysql_fetch_array($result)) 
	{
	$member=$row['member'];
	$epercentage=$row['epercentage'];
	$duration=$row['duration'];
	$cpm=$row['cpm'];
	$tempSecondsPv+=$row['duration'];
	$ammount=(($duration/60)*$cpm)*$epercentage/10000 ;
	$sitemoney+=(($duration/60)*$cpm)*(100-$epercentage)/10000 ;
	$tempMoneyEarned+=$ammount;
	
	if(time()-604800<$row['date']){
	$tempMoneyEarned30+=$ammount;
	}
	if ($row['paid']=="1"){ 
	$tempMoneySent+=$ammount;}
	}
mysql_free_result($result);
?>
<table width="720" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333" class="small_title"><p class="message"><span class="message">Funds earned total: $<? echo $tempMoneyEarned;?></span><br>
      Site funds earned from model total: $<? echo $sitemoney; ?><br>
        Funds not yet paid: $<? echo $tempMoneyEarned-$tempMoneySent ?><br>
    Funds earned by model in last 7 days: $<? echo $tempMoneyEarned30; ?></p>      </td>
  </tr>
</table>
<table width="720" align="center" bgcolor="#333333" class="form_definitions">
  <tr>
    <td><strong class="a_small_title">Copy of photo: (<? echo $tempIdtype; ?>)<br>
      Number: <? echo $tempIdnumber; ?> <br>
    Released: <? echo $tempIdmonth."".$tempIdyear; ?></strong></td>
  </tr>
  <tr>
    <td><img src="../models/<? echo $tempUser."/".$_GET[id].".jpg";  ?>"></td>
  </tr>
</table>
<table width="720" align="center" bgcolor="#333333" class="form_definitions">
  <tr>
    <td><strong class="a_small_title">Recorded photo of model </strong></td>
  </tr>
  <tr>
    <td><img src="../models/<? echo $tempUser."/representative.jpg";  ?>"></td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>

