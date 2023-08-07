<? if (!isset($_COOKIE["id"]) || $_COOKIE['usertype']!="chatmodels" )

{

header("location: ../../login.php");

} else{

include("../../dbase.php");

include("../../settings.php");

$result=mysql_query("SELECT user from $_COOKIE[usertype] WHERE id='$_COOKIE[id]' LIMIT 1");



	while($row = mysql_fetch_array($result)) 

	{	$username=$row[user];	}

}

mysql_free_result($result);

?>

<style type="text/css">
<!--
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
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
<?
include("_models.header.php");
?>
<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <?

  include("../../dbase.php");

  $model=$username;

 	$tempMoneyEarned=0;

  	$tempMoneySent=0;

	$result = mysql_query("SELECT * FROM videosessions WHERE model='$model'");

	while($row = mysql_fetch_array($result)) 

		{

		$epercentage=$row['epercentage'];

		$duration=$row['duration'];

		$cpm=$row['cpm'];

		$ammount=(($duration/60)*$cpm)*$epercentage/10000 ;

		$tempMoneyEarned+=$ammount;

		if ($row['paid']=="1"){

			$tempMoneySent+=$ammount;

			}

		}

	mysql_free_result($result);

 

  $nMoney=$tempMoneyEarned-$tempMoneySent;

  /*$result = mysql_query('SELECT moneyEarned,moneySent FROM chatmodelsstatus WHERE id="'.$_COOKIE["id"].'" LIMIT 1');

  while($row = mysql_fetch_array($result)) 

  {

  $nMoney=$row[moneyEarned];

  $nMoneySent=$row[moneySent];

  $nMoney=$nMoney-$nMoneySent;

  }*/

  $result = mysql_query('SELECT id,user,cpm,epercentage FROM chatmodels WHERE id="'.$_COOKIE["id"].'" LIMIT 1');

			while($row = mysql_fetch_array($result)) 

			{

			$nCpm=$row[cpm];

			$sUser=$row[user];

			$sId=$row[id];

			$epercentage=$row[epercentage];

			}

	mysql_free_result($result);

  ?>

  

  <tr valign="top">

    <td height="113" colspan="6"><div align="center">

      <p>&nbsp;        </p>
      <p>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="720" height="385">
          
          <param name="movie" value="BroadcastInterface.swf">
          
          <PARAM NAME=FlashVars VALUE="&tepercentage=<? echo $epercentage;?>&fuser=<? echo $sUser; ?>&fcpm=<? echo $nCpm; ?>&fid=<? echo $sId; ?>&fmoney=<? echo $nMoney; ?>&connection=<? echo $connection_string;?>">
          
          <param name="quality" value="high">
          
          <embed flashvars="&tepercentage=<? echo $epercentage;?>&fuser=<? echo $sUser; ?>&fcpm=<? echo $nCpm; ?>&fid=<? echo $sId; ?>&fmoney=<? echo $nMoney; ?>&connection=<? echo $connection_string;?>" src="BroadcastInterface.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="720" height="385"></embed>
        </object>
        
        </p>
    </div></td>

  </tr>

  <tr>

    <td width="171">&nbsp;</td>

    <td width="129">&nbsp;</td>

    <td width="134">&nbsp;</td>

    <td width="286" colspan="2">&nbsp;</td>

  </tr>

</table>
<?
include("_models.footer.php");
?>