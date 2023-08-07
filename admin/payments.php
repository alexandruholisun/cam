<style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
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
<?
include("_header-admin.php")
?>
<table width="720" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333" class="form_definitions"><p><br>
        <span class="big_title">How payments are made</span>.<br>
        Payments are made once a month beginning with the 24th day of each month until the end of the month and they include any money earned from video sessions started before the 22th of each month hour: 23:59:59. If for any reason(payment details not completed) a model can not be paid, the money will gather up for the next pay period. Once a payment is made a mail is sent to the reciever.</p>
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><a href="payments.php">Payout</a> | <a href="paymentop.php">View Payouts </a></div></td>
        </tr>
      </table>
	  <br>
	  <?
	
	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400
	//$secondsAll=time();
		
	include('../dbase.php');
	$count=0;
	$result = mysql_query("SELECT * FROM chatmodels WHERE status!='pending' AND status!='rejected'");
	while($row = mysql_fetch_array($result)) 
	{
	$count++;
	$model=$row[user];
	$minimum=$row[minimum];
	$ammount=0;
	$epercentage=0;
	$tempMinutesPv=0;
	$tempMoneyEarned=0;
	$tempMoneySent=0;
			$month=date("n");
			$year=date("Y");
			$endDate=mktime (0,0,0,22,$month,$year);	
			$result3 = mysql_query("SELECT * FROM videosessions WHERE model='$model' AND paid!='1' AND date<'$endDate'");
			while($row3 = mysql_fetch_array($result3)) 
				{
				$ammount= $row3[ammount];
				$epercentage=$row3[epercentage];
				$duration=$row3[duration];
				$cpm=$row3[cpm];
				$ammount=(($duration/60)*$cpm)*$epercentage/10000 ;
				$tempMoneyEarned+=$ammount;
				if ($row3[paid]=="1"){ $tempMoneySent+=$ammount;}				
				}
				
			$total=$tempMoneyEarned-$tempMoneySent;
			
			if ($total>$minimum){
			$result2 = mysql_query("SELECT id,email, user, pInfo, country, pMethod, name FROM chatmodels WHERE user='$model'");
			while($row2 = mysql_fetch_array($result2)) 
				{	
				echo'<table class="form_definitions" width="700" bgcolor="#333333" border="0" align="center" cellpadding="2" cellspacing="1">
					<tr>
					<td bgcolor="333333" >'.$count.') <a href=modelviewdetails.php?id='.$row2[id].'>'.$row2[name].'</a> ( '.$row2[email].' )</td>
					<td bgcolor="333333"><b>Ammount: $'.$total .'</b></td>
					</tr> 
					<tr>
					<td bgcolor="333333"><p><b>Method:</b> '.$row2[pMethod].'<br><b>Payout Information: </b>'.$row2[pInfo].'</p></td>
					<td valign="middle" bgcolor="333333">
					<form name="form1" method="post" action="markpaymentassent.php">
					<input type="submit" name="Submit" value="Mark As Payout Sent"> 
					<input name="id" type="hidden" id="id" value="'.$row2[id].'">
					<input name="ammount" type="hidden" id="ammount" value="'.$total.'">
					<input name="method" type="hidden" id="method" value="'.$row2[pMethod].'">
					<input name="info" type="hidden" id="info" value="'.$row2[pInfo].'">			
					<input name="email" type="hidden" id="email" value="'.$row2[email].'">
					<input name="username" type="hidden" id="username" value="'.$row2[user].'">
					</form>
					</td>
					</tr></table><br><br>';	
				}
			}
			
			
	}
	echo "<br><br>";

$result = mysql_query("SELECT * FROM chatoperators");
while($row = mysql_fetch_array($result)) {
	$tempEPercentage=$row['epercentage'];
	$username=$row['user'];
	$minimum=$row['minimum'];
	$total=0;
	$result2 = mysql_query("SELECT duration,cpm FROM videosessions WHERE sop='$username' AND soppaid='0'");
	while($row2 = mysql_fetch_array($result2)) 
		{
		$duration=$row2['duration'];
		$cpm=$row2['cpm'];
		$ammount=(($duration/60)*$cpm)*$tempEPercentage/10000 ;
		$total+=$ammount;
		}
	if($total>=$minimum){
	echo'<table class="form_definitions" width="700" bgcolor="#333333" border="0" align="center" cellpadding="2" cellspacing="1">
		<tr>
		<td bgcolor="333333" >'.$count.') <a href=sopviewdetails.php?id='.$row[id].'>'.$row[name].'</a> ( '.$row[email].' )</td>
		<td bgcolor="333333"><b>Ammount: $'.$total .'</b></td>
		</tr> 
		<tr>
		<td bgcolor="333333"><p><b>Method:</b> '.$row[pMethod].'<br><b>Payout Information: </b>'.$row[pInfo].'</p></td>
		<td valign="middle" bgcolor="333333">
		<form name="form1" method="post" action="markpaymentassent2.php">
		<input type="submit" name="Submit" value="Mark As Payout Sent"> 
		<input name="id" type="hidden" id="id" value="'.$row[id].'">
		<input name="ammount" type="hidden" id="ammount" value="'.$total.'">
		<input name="method" type="hidden" id="method" value="'.$row[pMethod].'">
		<input name="info" type="hidden" id="info" value="'.$row[pInfo].'">			
		<input name="email" type="hidden" id="email" value="'.$row[email].'">
		<input name="username" type="hidden" id="username" value="'.$username.'">
		</form></td></tr></table><br><br>';	
	
	}
	
}

?>	
<br>
</td>
</tr>
</table>
<?
include("_footer-admin.php")
?>
