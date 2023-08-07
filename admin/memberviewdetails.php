<style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
}
body {
	background-color: #000000;
}
-->
</style>
<?
include("_header-admin.php")
?>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333"><br>
	<?
	
	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400
	//$secondsAll=time();
		
	include('../dbase.php');
	
	
	$result = mysql_query("SELECT * FROM chatusers WHERE id='$_GET[id]' LIMIT 1");
		while($row = mysql_fetch_array($result)) 
		{
		$tempId=$row["id"];
		$tempUser=$row["user"];
		$tempEmail=$row["email"];
		$tBirthD=$row["birthDate"];
		$tempPhone=$row['phone'];
		$tempName = $row["name"];
		$status=$row['status'];
		$result3=mysql_query("SELECT name FROM countries WHERE id='$row[country]' LIMIT 1");
			while($row3 = mysql_fetch_array($result3)) {
			$tempCountry=$row3[name];
			}
		
		$tempState=$row["state"];
		$tempZip = $row["zip"];
		$tempCity=$row["city"];
		$tempAdress = $row["adress"];
		$tempDReg=$row["dateRegistered"];
		$tempMoney=$row[money]/100;
		
		$rowdate=$row["dateRegistered"];
		$date=date("d F Y, H:i",$rawdate);
		}
	?>
    <table width="600" height="102" align="center" class="form_definitions">
      <tr>
        <td width="288" valign="bottom"><strong class="big_title">Account Holder  <? echo $tempName ?><br>
            <span class="a_small_title">Status:<? echo $status;?></span>        </strong></td>
        <td width="300" valign="bottom"><table width="300" height="96"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <form name="form1" method="post" action="deleteaccount.php">
                <td height="30">
                  <input type="submit" name="Submit22" value="Delete Account">
                  <input name="id" type="hidden" id="id5" value="<? echo $_GET['id']; ?>">
                  <input name="type" type="hidden" id="type4" value="member">
                  <input name="username" type="hidden" id="type5" value="<? echo $tempUser; ?>">
                  <input name="date" type="hidden" id="datds" value="<? echo $date; ?>">
</td>
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
                  <input type="submit" name="Submit22" value="<? if($status!='blocked'){echo 'Block Account ';} else {echo 'Activate Account';}?> ">
                  <input name="id" type="hidden" id="id35" value="<? echo $_GET['id']; ?>">
                  <input name="type" type="hidden" id="type" value="member">
                  <input name="username" type="hidden" id="username" value="<? echo $tempUser; ?>">
                  <input name="date" type="hidden" id="daste" value="<? echo urlencode($date); ?>">
</td>
              </form>
            </tr>
            <tr>
              <form name="form3" method="post" action="sendemail.php">
                <td height="33">
                  <input type="submit" name="Submit222" value="Email account holder">
                  <input name="id" type="hidden" id="id45" value="<? echo $_GET['id']; ?>">
                  <input name="type" type="hidden" id="type" value="member">
                  <input name="username" type="hidden" id="username4" value="<? echo $tempUser; ?>">
                  <input name="email" type="hidden" id="date4" value="<? echo $tempEmail; ?>"></td>
              </form>
            </tr>
        </table></td>
      </tr>
    </table>
	<table width="600" align="center" class="form_definitions">
	<tr>
	  <td width="161" align="right">User Name:</td>
	<td width="250"><? echo $tempUser; ?></td>
	<td width="173">&nbsp;</td>
	</tr>
	<tr>
	  <td align="right">Email:</td>
	<td><? echo $tempEmail; ?></td>
	<td >&nbsp;</td>
	</tr>
	<tr>
	  <td align="right">&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  </tr>  
	<tr>
	  <td align="right">Full Name: </td>
	<td><? echo $tempName; ?></td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	  <td align="right">Country:</td>
	<td><? echo $tempCountry; ?></td>
	<td>&nbsp;</td>
	</tr>  
	<tr>
	  <td align="right">State:</td>
	<td><? echo $tempState; ?></td>
	<td>&nbsp;</td>
	</tr>  
	<tr>
	  <td align="right">City:</td>
	<td><? echo $tempCity; ?></td>
	<td>&nbsp;</td>
	</tr>  
	<tr>
	  <td align="right">Adress:</td>
	<td><? echo $tempAdress; ?></td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	  <td align="right">Zip Code:</td>
	  <td><? echo $tempZip; ?></td>
	  <td>&nbsp;</td>
	  </tr>
	<tr>
	  <td align="right">Phone#:</td>
	  <td><? echo $tempPhone; ?></td>
	<td>&nbsp;</td>
	</tr>
	<tr>
      <td align="right">Date Registered: </td>
      <td><? echo date("d F Y",$tempDReg); ?></td>
      <td>&nbsp;</td>
	  </tr>  
	</table>  
	<br>
	<table width="600" align="center" class="form_definitions">
      <tr>
        <td width="162" align="right"><strong>Available funds :</strong></td>
        <td width="426"><p><strong><? echo $tempMoney; ?> USD </strong></p>
          </td>
      </tr>
	  <form name="form1" method="post" action="">
	    </form>
    </table>	
	<p>&nbsp;</p>
	<form name="form2" method="post" action="depositmoney.php">
	  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="form_definitions">
          <td width="290" align="right"><input name="usd" type="text" id="usd" value="0" size="6" maxlength="6">
          $ and
            <input name="cents" type="text" id="cents" value="0" size="2" maxlength="2">
    cents</td>
          <td width="310">
            <input type="submit" name="Submit" value="Add funds to this account">
            <input name="username" type="hidden" id="username" value="<? echo $tempUser;?>">
            <input name="email" type="hidden" id="email" value="<? echo $tempEmail;?>">
            <input name="id" type="hidden" id="email3" value="<? echo $tempId;?>"></td>
          </tr>
      </table>
	  </form>	
	  <form name="form2" method="post" action="removemoney.php">
        <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr class="form_definitions">
            <td width="290" align="right"><input name="usd" type="text" id="usd" value="0" size="6" maxlength="6">
        $ and 
          <input name="cents" type="text" id="cents" value="0" size="2" maxlength="2">
        cents</td>
            <td width="310">
              <input type="submit" name="Submit2" value="Remove funds from this account">
              <input name="username" type="hidden" id="username" value="<? echo $tempUser;?>">
              <input name="email" type="hidden" id="email" value="<? echo $tempEmail;?>">
            <input name="id" type="hidden" id="id" value="<? echo $tempId;?>"></td>
          </tr>
        </table>
        <p>&nbsp;</p>
	  </form>	</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
