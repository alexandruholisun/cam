<?
include ("../dbase.php");
include ("../settings.php");
if ($_GET['type']=="model"){
mysql_query("UPDATE chatmodels SET status='blocked' WHERE user = '$_GET[username]' LIMIT 1");
} else if($_GET['type']=="member"){
mysql_query("UPDATE chatusers SET status='blocked' WHERE user = '$_GET[username]' LIMIT 1");
} else if ($_GET['type']=="sop"){
mysql_query("UPDATE chatoperators SET status='blocked' WHERE user = '$_GET[username]' LIMIT 1");
}

?>
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
    <td bgcolor="#333333"><p>&nbsp;</p>
      <table width="600"  border="0" align="center">
        <tr>
          <td width="590" class="big_title"><div align="left">
            <p align="center"> Account Blocked</p>
            <p align="center"><a href="<? if($_GET['type']=="model"){echo"modelviewdetails";} else if ($_GET['type']=="member"){echo"memberviewdetails";} else if ($_GET['type']=="sop"){echo"sopviewdetails";}?>.php?id=<? echo $_GET['id'];?>">Return to account information </a><br>
              </p>
          </div></td>
        </tr>
      </table>
    <p>&nbsp;</p></td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
