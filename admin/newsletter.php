<style type="text/css">
<!--
body,td,th {
	color: #FFFFFF;
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
-->
</style>
<form name="form1" method="post" action="newslettersent.php">
<?
include("_header-admin.php")
?>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
  <tr>
    <td bgcolor="#333333">
	<table width="100%"  border="0" bgcolor="#333333">
      <tr>
        <td class="big_title">Send To:</td>
        </tr>
      <tr>
        <td class="form_definitions">
          <input name="members1" type="checkbox" id="members1" value="true">
    Free Acess Members </td>
      </tr>
      <tr>
        <td class="form_definitions">
          <input name="members2" type="checkbox" id="members2" value="true">
          Paying  Members       </td>
        </tr>
      <tr>
        <td class="form_definitions"><input name="models" type="checkbox" id="models" value="true">
          Models</td>
        </tr>
    </table>
	<table width="100%" height="150"  border="0" bgcolor="#333333">
      <tr>
        <td class="big_title">&nbsp;</td>
      </tr>
      <tr>
        <td class="big_title">Subject:          
          <input name="subject" type="text" id="subject" size="32" maxlength="32"></td>
      </tr>
      <tr>
        <td class="big_title">Message:</td>
      </tr>
      <tr>
        <td class="big_title"><textarea name="message" cols="64" rows="6" id="message"></textarea>
          <br>
          <input type="submit" name="Submit" value="Send Newsletter"></td>
      </tr>
    </table>	
	<p>&nbsp;    </p>	</td>
  </tr>
</table>
<?
include("_footer-admin.php")
?>
</form>
