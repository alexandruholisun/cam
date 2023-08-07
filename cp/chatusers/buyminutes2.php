<?
include("_members.header.php");
?>

<table width="720" border="0" align="center">

  <tr valign="top">

    <td width="382" height="113"><br>      <table width="720" border="0" cellpadding="0" cellspacing="0">

      <tr>

          <td><p><span class="big_title style1">My Virtual Wallet</span><br>

              <span class="form_definitions">Having money in your virtual wallet allows you to have full acces to this site's features. That means you can engage in private sessions with your models, have full acess to model's galleries and video recordings.<br>

              <br>

              </span><span class="small_title"><span class="style1">Money in your virtual wallet:</span>			  <?

			  include("../../dbase.php");

			  $result=mysql_query("SELECT money from chatusers where user='$_COOKIE[username]' LIMIT 1");

			  while($row = mysql_fetch_array($result)){

			  	$money=$row[money];

				echo $money/100 ." USD";

				} 

			  

			  

			  ?> 

              </span><span class="form_definitions">That means you can engage in private sessions with our models up to <? echo round($money/195); ?> minutes (at 1.95 $ a minute).</span></p></td>

        </tr>

      </table>    <p>

	

	  </p>    </td></tr>

</table>

<?
include("_members.footer.php");
?>