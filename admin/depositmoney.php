<?
include("_header-admin.php")
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
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333">	
	<table width="700" height="300" align="center" class="form_definitions">
      <tr>
        <td align="center" valign="middle"><?
	include('../dbase.php');
	include('../settings.php');
	$sum=$_POST[usd]*100+$_POST[cents];
	$sum2=$sum/100;
	mysql_query("UPDATE chatusers SET money=money+'$sum' WHERE user = '$_POST[username]' LIMIT 1");
	
	mail($_POST[email], "Money deposited to your account", "$$sum2 has been deposited to your account.\r\n \r\n You can login to your account to view your current balance at the link below:\r\n\r\n $siteurl/login.php?user=$_POST[username] \r\n",
     "MIME-Version: 1.0\r\n".
     "Content-type: text/plain; charset=iso-8859-1\r\n".
     "From:$registrationemail\r\n".
     "Reply-To:$registrationemail\r\n".
     "X-Mailer: PHP/" . phpversion() );
	
	echo "Funds have been added successfully.";
	?>
          <br>
          <br>
          <a href="memberviewdetails.php?id=<? echo $_POST[id];?>" class="a_left">Back to <? echo $_POST[username] ?>'s account</a> </td>
        </tr>
    </table>		</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
