<?
include("_main.header.php");
?>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
body,td,th {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
body {
	background-color: #333333;
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
.style4 {font-family: Arial, Helvetica, sans-serif}
.style5 {color: #FFFFFF}
-->
</style>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td height="24" align="center" class="form_definitions"><div align="left"> &nbsp;&nbsp;&nbsp;<span class="style4">There are

        <? 

		  $nTime=time(); 

		  

		  //we set the status to offline to models that have not changed theyr status for 30 seconds

		  mysql_query("UPDATE chatmodels SET status='offline' WHERE $nTime-lastupdate>30 AND status!='rejected' AND status!='blocked' AND status!='pending'");

		  

		  if (!isset($_GET['category']))

			{

			$select="SELECT * FROM chatmodels WHERE status='online'";//100hours

			} else{

			$select="SELECT * FROM chatmodels WHERE category='$_GET[category]' AND status='online'";

			}

		  	$result = mysql_query($select);

			$nOnline=mysql_num_rows($result);

			mysql_free_result($result);

			

			if (!isset($_GET['category']))

			{

			$select="SELECT * FROM chatmodels WHERE status!='pending' AND status!='rejected'";

			} else{

			$select="SELECT * FROM chatmodels WHERE category='$_GET[category]' AND  status!='pending' AND status!='rejected'";

			}

			$result = mysql_query($select);

			$nTotal=mysql_num_rows($result);

			mysql_free_result($result);

			

		  echo $nOnline;

		  ?>

    models online out of <? echo $nTotal;?> registered models.</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<? if (isset($_COOKIE["usertype"])){

	

	echo '<a href="cp/'.$_COOKIE["usertype"].'/index.php"><img src="images/member_area.png" border="0" ></a>';

	

	

	echo '<a href="logout.php"><img src="images/logout.png" border="0" ></a>';

	} else {

	//echo '<a href="login.php"><img src="images/header_6.gif" border="0"></a>';

	}?></div></td>
  </tr>
</table>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td align="center" valign="top"><?php echo '<table width="720" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#333333">';



		    $count=0;

			$nTime=time();

			

			

			if (!isset($_GET['category']))

			{

			$select="SELECT * FROM chatmodels WHERE status='online'";//100hours

			} else{

			$select="SELECT * FROM chatmodels WHERE category='$_GET[category]' AND status='online'";

			}

						

			

			$result = mysql_query($select);

			while($row = mysql_fetch_array($result)) 

				{			
				

				$tBirthD=$row[birthDate];

				$nYears=date('Y',time()-$tBirthD)-1970;

					

				$username=$row[user];

				$tempMessage=$row[message];

				$tempCity=$row[city];

				$tempPlace=$row[broadcastplace];

				$tempL1=$row[language1];

				$tempL2=$row[language2];
				
				$status=$row[status];
				
					
	



					

				

			

				$count++;

				if ($count==1) {echo' <tr>';}

				echo '<td width="178" height="180" align="center" valign="middle" background="images/modelbox.gif">';

  				echo '<table width="178" height="180" border="0" cellpadding="2" cellspacing="1">';
				
	 			echo '<tr>';

		 		echo '<td height=10 align="center" valign="top"><span class="modelbox_title">'.$username .'</span></td>';

				echo '</tr><tr>';

	 			echo '<tr>';
				

		 		echo '<td height=80 align="center" valign="middle"><a href="liveshow.php?model='.$username.'"><img src="models/'.$username.'/thumbnail.jpg" width="140" height="105" border="0"></td>';
				

			    echo '</tr><tr>';

		      	echo '<td height=26 align="left" valign="top">';

		        echo '<span class="model_title_small">';

				echo '<span class="model_message">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;'.$status.'</span><br>';

		        	//echo '<span class="model_message">&nbsp&nbsp&nbsp&nbsp&nbsp'.$tempMessage.'</span></td>';

				echo '</tr></table>';

				echo '  </td>';

				if ($count==4){ echo"</tr>"; $count=0;}

				}

			



			if ($count==1){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			} else if ($count==2){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			} else if ($count==3){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			}

			

			mysql_free_result($result);

			echo'</table>';

 			?></td>

  </tr>

</table>

<table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td align="center" valign="top"><strong><?php echo '<table width="720" border="0" align="center" cellpadding="0" cellspacing="1">';

			include("dbase.php");

include("settings.php");

		    $count=0;

			$nTime=time();

			if (!isset($_GET['category']))

			{

			$select="SELECT * FROM chatmodels WHERE status='offline'";

			} else{

			$select="SELECT * FROM chatmodels WHERE category='$_GET[category]' AND status='offline'";

			}



			$result = mysql_query($select);

			while($row = mysql_fetch_array($result)) 

				{			

				$tBirthD=$row['birthDate'];

				$nYears=date('Y',time()-$tBirthD)-1970;

					

				$tempMessage=$row['message'];

				$username=$row['user'];

				$tempCity=$row['city'];

				$tempPlace=$row['broadcastplace'];

				$tempL1=$row['language1'];

				$tempL2=$row['language2'];	

				$tempL3=$row['language3'];	

				$tempL4=$row['language4'];	
                
				$status=$row['status'];
						

				$languagestring=$tempL1;

				if (strtolower($tempL2)!="none"){

				$languagestring.= ", ".$tempL2;

				}

				if (strtolower($tempL3)!="none"){

				$languagestring.= ", ".$tempL3;

				}

				if (strtolower($tempL4)!="none"){

				$languagestring.= ", ".$tempL4;

				}

				$count++;

				if ($count==1) {echo' <tr>';}

				echo '<td width="178" height="180" align="center" valign="middle" background="images/modelbox.gif">';

  				echo '<table width="178" height="180" border="0" cellpadding="2" cellspacing="1">';
				
	 			echo '<tr>';

		 		echo '<td height=10 align="center" valign="top"><span class="modelbox_title">'.$username .'</span></td>';

				echo '</tr><tr>';

	 			echo '<tr>';

		 			echo '<td height=80 align="center" valign="middle"><img src="models/'.$username.'/thumbnail.jpg" width="140" height="105" border="0"></td>';

				echo '</tr><tr>';

		      	    echo '<td height=26 align="left" valign="top">';

		        	echo '<span class="model_title_small">';

				    echo '<span class="model_message">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;'.$status.'</span><br>';

		        	//echo '<span class="model_message">&nbsp&nbsp&nbsp&nbsp&nbsp'.$tempMessage.'</span></td>';

				echo '</tr></table>';

				echo '  </td>';

				if ($count==4){ echo"</tr>"; $count=0;}

				}

			



			if ($count==1){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			} else if ($count==2){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			} else if ($count==3){

			echo'<td width="240"  height="120" align="center" valign="middle">&nbsp</td>';

			echo'</tr>';

			}

			

			mysql_free_result($result);

			echo'</table>';

 			?></strong></td>
  </tr>
</table>

<?
include("_main.footer.php");
?>