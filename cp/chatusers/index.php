<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatusers" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

include("../../settings.php");

$result=mysql_query("SELECT user,freetime,freetimeexpired from chatusers WHERE id='$_COOKIE[id]' LIMIT 1");

	while($row = mysql_fetch_array($result)) 

	{	$username=$row['user'];	

		$freetime=$row['freetime'];

		$freetimeexpired=$row['freetimeexpired'];

	}

	if ($freetime==0 && (time()-$freetimeexpired)>(3600*$freehours)){

	mysql_query("UPDATE chatusers SET freetime='120', freetimeexpired='0' WHERE id='$_COOKIE[id]' LIMIT 1");

	$freetime=120;

	}

}

?>

<style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
}
body {
	background-color: #000000;
	background-repeat: no-repeat;
}
.style1 {font-family: Arial, Helvetica, sans-serif}
.style2 {font-size: 12px}
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
.style3 {
	font-size: 14px;
	color: #FFFFFF;
}
.style4 {font-size: 14px}
.style5 {font-size: 14}
-->
</style>
<?
include("_members.header.php");
?>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr align="center" valign="middle">

    <td height="113" bgcolor="#333333"><table width="720"  border="0" cellpadding="0" cellspacing="4" bgcolor="#333333">

          <tr>

            <td align="left" valign="top" background="../../images/legs_bg.jpg"><p class="style1">Welcome to your member control panel
              <? if (isset($username)){echo $username;} ?>
.<br />
<br />
<span class="style3">Here you have the following options:</span></p>
              <p class="form_definitions style1 style2"><span class="style4"><span class="style5"><a href="../../index.php" target="_self">View live models.</a></span></span></p>
              <p class="form_definitions style1 style5"><a href="updateprofile.php" target="_self">Change your profile settings.</a></p>
              <p class="form_definitions style1 style5"><a href="buyminutes.php" target="_self">Check your account balance.</a></p>
              <p class="form_definitions style1 style5"><a href="viewsessions.php" target="_self">Review your past session information.</a></p>
              <p class="form_definitions style1 style5"><a href="favorites.php" target="_self">Add or delete models from your favorite models list.</a></p>
              <p class="form_definitions style1 style5"><a href="buyminutes.php" target="_self">Purchase   minutes for use in 1 on 1 model sessions.</a>&nbsp;&nbsp;</p>
              <p class="form_definitions style1 style5">&nbsp;</p>
              <p class="form_definitions style1 style5">&nbsp;</p>
              <p class="form_definitions style1 style5">&nbsp;</p>
              <p class="form_definitions style1 style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
              </td>
<?
include("_members.footer.php");
?>
          </tr>
      </table>

        <p class="form_definitions"><br>

    </p></td>

  </tr>

</table>

