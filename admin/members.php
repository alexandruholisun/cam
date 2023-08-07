<?
$money=0;
include ("../dbase.php");
include ("../settings.php");
$result=mysql_query("Select money from chatusers");
while($row = mysql_fetch_array($result)) 
		{
		$money+=$row['money'];
		}
?><style type="text/css">
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
    <td bgcolor="#333333" class="small_title"><p class="message"><strong>Member accont funds toatal : $<?echo $money/100; ?></strong></p></td>
  </tr>
</table>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333">
	<br>
	<table width="700"  bgcolor="#000000" border="0" align="center" cellpadding="1" cellspacing="1">
	<?php
	
	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400
	//$secondsAll=time();
		
	include('../dbase.php');
	
	
	$result = mysql_query("SELECT * FROM chatusers");
	while($row = mysql_fetch_array($result)) 
	{	
		$result3=mysql_query("SELECT name FROM countries WHERE id='$row[country]' LIMIT 1");
			while($row3 = mysql_fetch_array($result3)) {
			$tempCountry=$row3[name];
			}
		if ($color=="#333333"){
			$color="#333333";
			}else{ $color="#333333";}
			
		echo'<tr bgcolor="'.$color.'" class="form_definitions"><td align="center"><b>'.$row[user].'</b></td><td>'.$row[name].' from '.$tempCountry.'</td><td>'.$row[email].'</td><td align="center"><a href="memberviewdetails.php?id='.$row[id].'">View Details</a></td></tr>';	

	}
	?>

	
      </table>
<br>	</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
