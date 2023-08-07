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
<form name="form1" method="post" action="dosendemail.php">
<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">
  <tr>
    <td bgcolor="#333333">
	<table width="100%"  border="0">
      <tr>
        <td class="a_small_title">Send To: <? echo $_POST['email']?> (<? echo $_POST['username']?>)</td>
        </tr>
    </table>
	<table width="100%" height="150"  border="0" bgcolor="#333333" class="small_title">
      <tr>
        <td class="a_small_title">Subject:          
          <input name="subject" type="text" id="subject" size="32" maxlength="32"></td>
      </tr>
      <tr>
        <td class="a_small_title">Message:</td>
      </tr>
      <tr>
        <td class="big_title"><textarea name="message" cols="64" rows="6" id="message"></textarea>
          <br>
          <input type="submit" name="Submit" value="Send Email">
          <input name="email" type="hidden" id="date4" value="<? echo $_POST['email']; ?>">
          <input name="id" type="hidden" id="id45" value="<? echo $_POST['id']; ?>">
          <input name="type" type="hidden" id="type" value="<? echo $_POST['type']; ?>">
          <input name="username" type="hidden" id="username4" value="<? echo $_POST['username']; ?>"></td>
      </tr>
    </table>	
	<p>&nbsp;    </p>	</td>
  </tr>
</table>
</form>
<?
include("_footer-admin.php")
?>
