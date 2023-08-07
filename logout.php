<?



setcookie("username", "loggedOut", time()-3600);

setcookie("usertype",  "loggedOut", time()-3600);

setcookie("id", "loggedOut", time()-3600);





?>

<?
include("_main.header.php");
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

<table width="720" height="235" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td align="center" valign="middle"><table width="334" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><p class="message">You have been successfully logged out of your account.</p></td>
		
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <br />
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="30" height="11">
      <param name="movie" value="logout_redirect.swf" />
      <param name="quality" value="high" />
      <embed src="logout_redirect.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="30" height="11"></embed>
    </object></td><?
include("_main.footer.php");
?>
  </tr>
</table>


