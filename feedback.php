<?

include("dbase.php");

include("settings.php");

if($_POST[suggestion]!="" && $_POST[details]!=""){

	//$result=mysql_query("INSERT INTO `feedback` ( `id`, `option` , `details` , `username` , `email` , `model` , `phone` , `timetocall`, `status` ) VALUES ('', '$_POST[suggestion]', '$_POST[details]', '$_POST[username]', '$_POST[email]', '$_POST[model]', '$_POST[phone]', '$_POST[timetocall]', 'pending')");

	//echo "boss";

	

		$subject = "$_POST[suggestion]"; 

 		$message = "Message about: $_POST[suggestion]\r\nDetails: $_POST[details]\r\n	From:$_POST[username]\r\n	Email:$_POST[email]\r\n		Model:$_POST[model]\r\n	Phone:$_POST[phone]\r\n	Time to call:$_POST[timetocall]\r\n Connection: $_POST[speed]"; 

	   			

		mail($feedbackemail, $subject, $message,

     "MIME-Version: 1.0\r\n".

     "Content-type: text/plain; charset=iso-8859-1\r\n".

     "From:$_POST[email]\r\n".

     "Reply-To:$feedbackemail\r\n".

     "X-Mailer: PHP/" . phpversion() );

	header("location: feedbackposted.php");

	} else{

	$errorMsg="Select at least an option from the dropdown menu and write your suggestions.";

	}



?>

<?
include("_main.header.php");
?><style type="text/css">
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

<table width="720" height="400" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">

  <tr>

    <td align="center" valign="middle"><form action="feedback.php" method="post" enctype="application/x-www-form-urlencoded" name="form1">

      <br>

      <table width="600" align="center" cellSpacing="8" class="form_definitions">

        <tbody>

          <tr>

            <td align="left"><span class="error">

      <?php if ( isset($errorMsg) && $errorMsg!=""){ echo $errorMsg; } ?>

      </span></td>

          </tr>

          <tr>

            <td align="left"><table class="specialcolors">

              <tbody>

                <tr>

                  <td class="specialcolor2mediumstrong">This page is for you to send us either:</td>

                </tr>

                <tr>

                  <td class="specialcolor2smallstrong">

                    <ul>

                      <li>your complaints</li>

                      <li>your suggestions</li>

                  </ul></td>

                </tr>

              </tbody>

            </table></td>

          </tr>

          <tr>

            <td align="left">

              <hr>

            </td>

          </tr>

          <tr>

            <td align="left" class="linkmedium"><b>1. Select the type of suggestion you want to make</b></td>

          </tr>

          <tr>

            <td align="left"><select name="suggestion">

                <option style="COLOR: #999999" value="" selected>Select an option from the list below...</option>

                <option style="COLOR: #999999" value="">COMPLAINTS</option>

                <option style="COLOR: #999999" value="">----------------------</option>

                <option value="ComplaintModel">Complain about a model</option>

                <option value="ComplaintWebsite">Complain about the website</option>

                <option value="ComplaintOther">Complain about something else</option>

                <option value=""></option>

                <option style="COLOR: #999999" value="">SUGGESTIONS</option>

                <option style="COLOR: #999999" value="">------------------------</option>

                <option value="SuggestionModel">Suggestion about a model/the models</option>

                <option value="SuggestionWebsite">Suggestion about the website</option>

                <option value="SuggestionOther">Suggestion about something else</option>

            </select></td>

          </tr>

          <tr>

            <td align="left" class="linkmedium"><b>2. Add further details here</b></td>

          </tr>

          <tr>

            <td align="left"><textarea name="details" rows="6" cols="50"></textarea></td>

          </tr>

          <tr>

            <td align="left" class="linkmedium"><b>3. Add/Edit if necessary</b></td>

          </tr>

          <tr>

            <td align="left">

              <table width="543">

                <tbody>

                  <tr>

                    <td class="textmediumstrong" align="right">Your username:</td>

                    <td><input maxLength="25" name="username" size="20">

                        <span class="attentionsmallstrong"> - Only if you are a member</span></td>

                  </tr>

                  <tr>

                    <td class="textmediumstrong" align="right">Your email:</td>

                    <td><input maxLength="32" name="email" size="20">

                        <span class="attentionsmallstrong"> - if you need a reply to this message </span></td>

                  </tr>

                  <tr>

                    <td class="textmediumstrong" align="right">Model:</td>

                    <td><input maxLength="24" name="model" size="20"></td>

                  </tr>

                </tbody>

            </table></td>

          </tr>

          <tr>

            <td align="left" class="linkmedium"><b>4. Optional - please fill in if appropriate</b></td>

          </tr>

          <tr>

            <td align="left">

              <table>

                <tbody>

                  <tr>

                    <td class="textmediumstrong" align="right">Your phone:</td>

                    <td><input maxLength="30" name="phone" size="20">

                        <span class="attentionsmallstrong"> - if you want us to call you (include country code)</span></td>

                  </tr>

                  <tr>

                    <td class="textmediumstrong" align="right">Time to call:</td>

                    <td><input maxLength="30" name="timetocall" size="20">

                        <span class="attentionsmallstrong"> - enter YOUR LOCAL TIME</span></td>

                  </tr>

                  <tr>

                    <td class="textmediumstrong" align="right">Your connection:</td>

                    <td><select name="speed">

                        <option value>Select speed &gt;&gt;&gt;</option>

                        <option value="300">300k (ADSL)</option>

                        <option value="128">128k</option>

                        <option value="56">56k</option>

                        <option value="0" selected>Unknown</option>

                    </select></td>

                  </tr>

                </tbody>

            </table></td>

          </tr>

          <tr>

            <td align="left"><input type="submit" value="Submit!" name="submitButton"></td>

          </tr>

          <tr>

            <td class="textmediumstrong" align="left">NOTE: if you want a reply please remember to include your email address!</td>

          </tr>

        </tbody>

      </table>

      <br>

    </form></td>

  </tr>

</table>
<?
include("_main.footer.php");
?>

