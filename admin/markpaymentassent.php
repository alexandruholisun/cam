<?
include("_header-admin.php")
?>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#eeeeee">
  <tr>
    <td align="center" valign="middle" bgcolor="#FFFFFF"><p class="form_definitions"><br>
        <?
			include('../dbase.php');
	$month=date("n");
	$year=date("Y");
	$endDate=mktime (0,0,0,22,$month,$year);
 	mysql_query("UPDATE videosessions SET paid='1' WHERE model='$_POST[username]' AND paid!='1' AND date<'$endDate'");
	echo"Payment was confirmed! ";

	$currentDate=time();
	echo date("d M Y, G:i", $currentDate);
	mysql_query("INSERT INTO payments ( id ,date, ammount , taxes, method , details) VALUES ('$_POST[id]','$currentDate','$_POST[ammount]','0','$_POST[method]','$_POST[info]')");
	
	$charset="Content-type: text/plain; charset=iso-8859-1\r\n";
	$subject="New Payment from $siteurl";
	$message="You have recieved a new payment.\n\r To view the details of the payment please login and browse to the payments section\r\n $siteurl/login.php?user=$_POST[username]";
	mail($_POST[Email], $subject, $message,
     "MIME-Version: 1.0\r\n".
     $charset.
     "From:$registrationemail\r\n".
     "Reply-To:$registrationemail\r\n".
     "X-Mailer:PHP/" . phpversion() );
	?>	
    </p>
    <p>&nbsp;      </p></td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
