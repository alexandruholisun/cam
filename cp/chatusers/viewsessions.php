<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatusers" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

$result=mysql_query("SELECT user from chatusers WHERE id='$_COOKIE[id]' LIMIT 1");

	while($row = mysql_fetch_array($result)) 

	{	$username=$row[user];	}

}

?>



<?

$msgError="";

include("../../dbase.php");

$id=$_COOKIE["id"];

$member=$username;



if (isset($_POST[paymentSum])){

mysql_query("UPDATE chatmodelsstatus SET minimum='$_POST[paymentSum]' WHERE id = '$id' LIMIT 1");

$msgError="Value has been changed";

}

?>

<?
include("_members.header.php");
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
.style5 {font-size: 14px; font-weight: bold; }
-->
</style>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr valign="top">

   <td height="113" class="form_definitions">      <br>

     <table width="700" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

        <tr align="left">

          <td width="113"><span class="style5">Model</span></td>

          <td width="162"><span class="style5">Date</span></td>

          <td width="124"><span class="style5"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duration</span></td>

          <td width="124"><span class="style5"> &nbsp;&nbsp;&nbsp;&nbsp; Cpm</span></td>

          <td width="82"><span class="style5"> &nbsp; &nbsp;Paid </span></td>

          <td width="95"><span class="style5">&nbsp; Type</span></td>
        </tr>
      </table>    
      ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ <?

	

	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400

	//$secondsAll=time();

		

	include('../../dbase.php');

	$count=0;

	$result = mysql_query("SELECT * FROM videosessions WHERE member='$member' ORDER BY date DESC");

	while($row = mysql_fetch_array($result)) 

	{

	$count++;

		

	$ammount= $row[ammount];

	$model=$row[model];

	$epercentage=$row[epercentage];

	$duration=$row[duration];

	$cpm=$row[cpm];

	$type=$row['type'];

	

	if (($duration/60)<round($duration/60))

	{

	$tempMinutesPv=round($duration/60)-1;

	} else {

	$tempMinutesPv=$duration/60;

	}

	$tempSecondsPv=$duration % 60;

	

	$ammount=(($duration/60)*$cpm)/100 ;

	

		echo'<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr align="left">

          <td width="98">'.$model.'</td>

          <td width="170">'.date("d M Y, G:i:s", $row[date]) .'</td>

          <td width="100">'.$tempMinutesPv.":".$tempSecondsPv.'</td>

          <td width="100">'.$cpm/100 .'</td>

          <td width="70">'.$ammount.'</td>

		   <td width="70">'.$type.'</td>

        </tr>

      </table>';

	 }

	?></td>

  </tr>

</table>
<?
include("_members.footer.php");
?>