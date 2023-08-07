<?
include("_header-admin.php")
?>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#eeeeee">
  <tr>
    <td bgcolor="#FFFFFF"><br>
	<table width="600"  border="0" align="center">
      <tr>
        <td class="big_title"><div align="center">
          <p>The mail was sent to <? echo $_POST['email'];?> </p>
          <p><a href="<? if($_POST['type']=="model"){echo"modelviewdetails";} else if ($_POST['type']=="member"){echo"memberviewdetails";} else if ($_POST['type']=="sop"){echo"sopviewdetails";}?>.php?id=<? echo $_POST['id'];?>">Now ,get me back!</a><br>
                <br>
                <?
include('../dbase.php');
include('../settings.php');

$email=$_POST['email'];
$subject=$_POST['subject'];
$message=$_POST['message'];
@mail($email, $subject, $message,
     "MIME-Version: 1.0\r\n".
     $charset.
     "From:$newsletteremail\r\n".
     "Reply-To:$newsletteremail\r\n".
     "X-Mailer:PHP/" . phpversion() 
);

?>
                <br>
              </p>
        </div></td>
        </tr>
    </table>	
	</td>
  </tr>
</table>

<?
include("_footer-admin.php")
?>
