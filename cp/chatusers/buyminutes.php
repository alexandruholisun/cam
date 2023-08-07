<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatusers" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

$result=mysql_query("SELECT user from chatusers WHERE id='$_COOKIE[id]' LIMIT 1");

	while($row = mysql_fetch_array($result)) 

	{	$username=$row[user];	}

}

?>

<?
include("_members.header.php");
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
-->
</style>


<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr valign="top">

    <td height="113"><table width="700" border=0 align="center" cellPadding=4 cellSpacing=0 class="form_definitions">

        <TR>

          <TD><p>Date: <?php
echo date("m-d-Y");
?>
            <br />
            <br />
            Funds in your account:<span class="big_title"> $
              <?

			  include("../../dbase.php");

			  $result=mysql_query("SELECT money from chatusers where user='$username' LIMIT 1");

			  while($row = mysql_fetch_array($result)){

			  	$money=$row[money];

				echo $money."";

				} 

			  

			  

			  ?> 
              <a href="viewsessions.php">View your session history</a><br />
            </span><br />
          </p>          </TD>
        </TR>

        <TR>

          <TD height="16" class="barbg"><p><strong><font color="#FFFFFF"><br />
            Purchase Private Session Time <br />
  
              </font></strong>Select a payment method
          </p></TD>
        </TR>

        <TR>

          <TD><form name="frmpayment" method="post" action="frmPayment.php" onsubmit="javascript:return validte();">
              <table width="700" border="0" cellspacing="2" cellpadding="0">

                <!--<tr>

                  <td width="227"></td>

                  <td width="493" rowspan="6">&nbsp;</td>

                </tr>-->

                <tr>
 
                  <td width="186">&nbsp;</td><td width="508" valign="top"><input name="radiobutton" type="radio" value="paypal" checked>

PayPal<br/>
<img src="../../images/paypal.jpg" alt="english live chat room it is free" width="156" height="62" border=0" /><br>

<br>

<!--<input name="radiobutton" type="radio" value="google">

Google <br/> <img src="https://checkout.google.com/buttons/checkout.gif?merchant_id=fhoYsVGkXb2kkrj&w=160&h=43&style=trans&variant=text&loc=en_US" border=0" alt="english live chat room it is free">-->
</td>
                </tr>
                  <tr>

                  <td ><br/>Enter Amount- </td><td colspan="2"><br/><input name="amount" id="txtAmount" type="text" value="">  USD

</td>
                </tr>

               <!-- <tr>


                  <td><input name="radiobutton" type="radio" value="google">

Google Checkout </td>
                  

                </tr>
                
				<tr>


                  <td><input name="radiobutton" type="radio" value="ccbill">

CC Bill </td>
                  

                </tr>
				
                <tr>

                  <td><input name="radiobutton" type="radio" value="egold">

E-Gold </td>

                </tr>

                <tr>

                  <td><input name="radiobutton" type="radio" value="check">

                  Pay By Check</td>

                </tr>

                <tr>

                  <td><input name="radiobutton" type="radio" value="wire">

                  Western Union</td>

                </tr>-->
              </table>

              <br>
              <input name="image" type="image" src="../../images/purchase_time.png" alt="" width="173" height="30" border="0"/>
              <br>
<br><center><img src="../../images/rapidssl_ssl_certificate.gif" alt="" width="90" height="50" border=0">
</center>
          </form>  </TD>
        </TR>

        <TBODY>
        </TBODY>

      </TABLE></td>

  </tr>
<script language="javascript" type="text/javascript">
function validte()
{
if (document.getElementById('txtAmount').value == "")
{
	alert("Please enter Amount");
	document.getElementById('txtAmount').focus();
	return false;
}
return true;
}
</script>
</table>

<?
include("_members.footer.php");
?>