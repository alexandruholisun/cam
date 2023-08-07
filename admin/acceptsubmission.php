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
a:link {
	color: #99CC00;
}
a:visited {
	color: #99CC00;
}
a:hover {
	color: #99FF00;
}
a:active {
	color: #99CC00;
}
-->
</style>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333">	
	  <div align="center">
	    <p>
	      <br />
        </p>
	    <p>&nbsp;</p>
	    <p>
	      <?
	include('../dbase.php');
	include('../settings.php');
	mysql_query("UPDATE chatmodels SET status='offline', cpm='$_POST[cpm]',epercentage='$_POST[epc]' WHERE id = '$_POST[id]' LIMIT 1");
$message="Welcome $_POST[username],

Your subscription for becoming a Video Chat Model has been approved!
You can now login to your account and start broadcasting

$siteurl/login.php?user=$_POST[username]

For assistance feel free to contact us by email at $contactemail
Thanks for choosing $siteurl!
";
	
	@mail($_POST['email'], "Your submission at $sitename has been approoved",$message,
     "MIME-Version: 1.0\r\n".
     "Content-type: text/plain; charset=iso-8859-1\r\n".
     "From:'$registrationemail'\r\n".
     "Reply-To:'$registrationemail'\r\n".
     "X-Mailer: PHP/" . phpversion() );
	
	if ($_POST[owner]!='none'){
	$result3=mysql_query("SELECT email FROM chatoperators WHERE user='$_POST[owner]' LIMIT 1");
			 {
			$tOwnerEmail=$row3[email];
			}
	@mail($tOwnerEmail, "Submission approoval", "Model:$_POST[username] subscription has been approoved, the model can now  login to her account and start broadcasting\r\n$siteurl/login.php?user=$_POST[owner]",
     	"MIME-Version: 1.0\r\n".
		 "Content-type: text/plain; charset=iso-8859-1\r\n".
		 "From:'$registrationemail'\r\n".
		 "Reply-To:'$registrationemail'\r\n".
		 "X-Mailer: PHP/" . phpversion() );
	
	}
	echo"Model Approved";
	?>
        </p>
	  </div>
	  <table width="700" align="center">
      <tr>
        <td>&nbsp;</td>
        </tr>
    </table>		</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>