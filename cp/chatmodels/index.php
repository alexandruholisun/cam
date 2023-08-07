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

?>

<?
include("_models.header.php");
?><style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
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
.style1 {font-family: Arial, Helvetica, sans-serif}
.style3 {	font-size: 14px;
	color: #FFFFFF;
}
.style5 {font-size: 14}
.style13 {font-size: 14px}
.style14 {color: #FFFFFF}
-->
</style>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr align="center" valign="middle">

    <td height="113" background="../../images/legs_bg.jpg"><br>      
      <table width="97%"  border="0" cellspacing="0" cellpadding="0">

      <tr>

        <td align="left" valign="top"><p class="form_definitions style14"><b>Welcome

              to your model control panel <? if (isset($username)){echo $username;} ?>.</b></p>
          <p class="style1"><span class="style3">Here you have the following options:</span></p>
          <p class="form_definitions style1 style13"><a href="broadcast.php" target="_self">Go Live.</a> </p>
          <p class="form_definitions style1 style13"><a href="paymentop.php" target="_self">Review your account.</a></p>
          <p class="form_definitions style1 style13"><a href="showslist.php" target="_self">Review your session history.</a></p>
          <p class="form_definitions style1 style13"><a href="updateprofile.php" target="_self">Change your profile settings</a><a href="buyminutes.php" target="_self">.</a></p>
          <p class="form_definitions style1 style13">&nbsp;</p>
          <p class="form_definitions style1 style5"><a href="favorites.php" target="_self"></a></p>
          <p class="form_definitions style1 style5"><a href="buyminutes.php" target="_self"></a></p>          
          <p class="form_definitions">&nbsp;</p>
          <p class="form_definitions"><br>
            <strong> <br>
              </strong></p></td>

      </tr>

      <tr>

        <td align="left" valign="top">&nbsp;</td>

      </tr>

    </table>    
      <p class="form_definitions"><br>

    </p>

    </td></tr>

</table>

<?
include("_models.footer.php");
?>
