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
<?
  include ("../dbase.php");
include ("../settings.php");
$tempMinutesPv=0;
$tempSecondsPv=0;
$sitemoney=0;
$tempMoneyEarned=0;
$tempMoneySent=0;
$tempMoneyEarned30=0;
$ammount=0;
$result = mysql_query("SELECT * FROM videosessions ");
while($row = mysql_fetch_array($result)) 
	{
	$member=$row['member'];
	$epercentage=$row['epercentage'];
	$duration=$row['duration'];
	$cpm=$row['cpm'];
	$tempSecondsPv+=$row['duration'];
	$ammount=(($duration/60)*$cpm)*$epercentage/10000 ;
	$ammount2=(($duration/60)*$cpm)*(100-$epercentage)/10000 ;
	$tempMoneyEarned+=$ammount;
	$sitemoney+=$ammount2;
	
	if(time()-604800<$row['date']){
	$tempMoneyEarned30+=$ammount;
	$sitemoney30+=$ammount2;
	}
	if ($row['paid']=="1"){ 
	$tempMoneySent+=$ammount;}
	}
mysql_free_result($result);
?>
<table width="720" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333" class="small_title"><p class="message"><strong>Model funds earned total: $<? echo $tempMoneyEarned;?><br>
        Site funds earned from models total: $<? echo $sitemoney; ?> <br>
        Unpaid model funds total: $<? echo $tempMoneyEarned-$tempMoneySent ?> (payout will not change site funds earned from models total)<br>
    Site funds earned from models total (last 7 days): $<? echo $sitemoney30; ?></strong></p></td>
  </tr>
</table>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#333333">
	<br>
	<table width="700"  bgcolor="#000000" border="0" align="center" cellpadding="1" cellspacing="1">
	<?php
	
	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400
	//$secondsAll=time();
		
	include('../dbase.php');

	
		$result2 = mysql_query("SELECT * FROM chatmodels WHERE status!='pending' AND status!='rejected'");
		while($row2 = mysql_fetch_array($result2)) 
			{
			$result3=mysql_query("SELECT name FROM countries WHERE id='$row2[country]' LIMIT 1");
			while($row3 = mysql_fetch_array($result3)) 
				{
				$tempCountry=$row3[name];
				}
			
			$tempCity=$row2[city];	
			
			if ($color=="#333333"){
			$color="#333333";
			}else{ $color="#333333";}
			echo'<tr bgcolor="'.$color.'" class="form_definitions"><td align="middle"><b>'.$row2[user].'</b></td><td>'.$row2[name].' from '.$tempCity.', '.$tempCountry.'</td><td>'.$row2[email].'</td><td align="middle"><a href="modelviewdetails.php?id='.$row2[id].'">View Details</a></td></tr>';	
			}

	?>
	
      </table>
<br>	</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
