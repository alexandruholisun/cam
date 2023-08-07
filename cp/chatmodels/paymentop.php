<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatmodels" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

$result=mysql_query("SELECT user from $_COOKIE[usertype] WHERE id='$_COOKIE[id]' LIMIT 1");



	while($row = mysql_fetch_array($result)) 

	{	$username=$row['user'];	}

}

mysql_free_result($result);



$msgError="";

include("../../dbase.php");

$id=$_COOKIE["id"];

$model=$username;



if (isset($_POST['paymentSum'])){

mysql_query("UPDATE chatmodels SET minimum='$_POST[paymentSum]' WHERE id = '$id' LIMIT 1");

$msgError="Change Successful";

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


<table width="720" border="0" align="center" bgcolor="#333333">

  <tr valign="top">

  

  <?

	$tempMinutesPv=0;

	$tempSecondsPv=0;

	$tempMoneyEarned=0;

	$tempMoneySent=0;

	$ammount=0;

 	$result = mysql_query("SELECT * FROM videosessions WHERE model='$model'");

	while($row = mysql_fetch_array($result)) 

		{

		$member=$row['member'];

		$epercentage=$row['epercentage'];

		$duration=$row['duration'];

		$cpm=$row['cpm'];

		$tempSecondsPv+=$row['duration'];



		$ammount=(($duration/60)*$cpm)*$epercentage/10000 ;

		$tempMoneyEarned+=$ammount;

		if ($row['paid']=="1"){ $tempMoneySent+=$ammount;}

		}

	mysql_free_result($result);

		

	

	//minimum payment & epercentage

	$result = mysql_query("SELECT minimum,epercentage,cpm FROM chatmodels WHERE id='".$id."' LIMIT 1");

	while($row = mysql_fetch_array($result)) 

	{ 

	$tempMinimum=$row["minimum"];

	$tempCPM=$row['cpm'];

	$tempEPercentage=$row['epercentage'];

	}

	mysql_free_result($result);

  

  ?>

    <td height="113" class="form_definitions">      <br>      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">

      <tr>

        <td class="left"><a href="paymentop.php" class="left">View Payments</a> | <a href="showslist.php" class="left">View Shows List </a></td>

      </tr>

    </table>

      <br>

      <table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0">

        <tr>

          <td colspan="2" align="left" valign="top"><p class="error"><strong>

            <?

			if (isset($msgError) && $msgError!="")

			{

			echo $msgError;

			}

			?>

            </p>

            <p class="form_definitions">

            <strong>You are currently earning <? echo $tempEPercentage;?>% of all funds generated from your private shows.<br>

            You are currently charging $<? echo $tempCPM/100;?>

  per minute (If you need this changed contact the system admin)</strong></p>
            <p class="form_definitions"><strong><br />
            </strong></p></td>

        </tr>

        <tr>

          <td width="50%" height="120" align="left" valign="top">Your earnings: $<? echo $tempMoneyEarned; ?><br>

Payouts so far: $<? echo $tempMoneySent; ?><br>

<b> Current account balance: $<? echo ($tempMoneyEarned-$tempMoneySent) ;?></b></td>

          <td width="50%" height="120" align="left" valign="top">    <p>&nbsp;</p>

          </td>

        </tr>

        <tr>

          <td colspan="2" align="left" valign="top"><form name="form1" method="post" action="paymentop.php">

            <p>Minimum payout:

                <select name="paymentSum" id="paymentSum">
                  
                  <option value="100"  <? if ($tempMinimum=="100"){echo "selected";}?>>100</option>
                  
                  <option value="250"  <? if ($tempMinimum=="250"){echo "selected";}?>>250</option>
                  
                  <option value="500"  <? if ($tempMinimum=="500"){echo "selected";}?>>500</option>
                  
                  <option value="1000"  <? if ($tempMinimum=="1000"){echo "selected";}?>>1000</option>
                  
                  <option value="2500"  <? if ($tempMinimum=="2500"){echo "selected";}?>>2500</option>
                  
                  <option value="5000"  <? if ($tempMinimum=="5000"){echo "selected";}?>>5000</option>
                </select>
            </p>
            <p>
              <INPUT TYPE="image" SRC="../../images/change_payout.png" ALT="" WIDTH="173" HEIGHT="30" BORDER="0">
              
                </p>
          </form></td>

        </tr>

      </table>            
      <p><strong>Previous Payouts</strong></p>

      <p>	<?

	

	//$secondsThisMonth=time(i)*60+time(G)*3600+time(j)*86400

	//$secondsAll=time();

		

	include('../../dbase.php');

	$count=0;

	$result = mysql_query("SELECT * FROM payments WHERE id='$id' ORDER BY date DESC");

	while($row = mysql_fetch_array($result)) 

	{

	$count++;	

	$ammount= $row['ammount'];

	echo'<table class="form_definitions" width="700" bgcolor="#333333" border="0" align="center" cellpadding="2" cellspacing="1">

		<tr>

		<td class="barbg">'.$count.') <b>Ammount: $'.$ammount .'</b> sent on '.date("d M Y, G:i", $row['date']).'</td>

		</tr> 

		<tr>

		<td class="tablebg"><p><b>Payout Method:</b> '.$row['method'].'<br><b>Payout Information: </b>'.$row['details'].'</p></td>

		</tr>

		</table>

		<br>';

	}

	mysql_free_result($result);

	?>

	</p></td>

  </tr>

</table>

<?
include("_models.footer.php");
?>