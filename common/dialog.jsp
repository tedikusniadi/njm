<script type="text/javascript" src="assets/dialog.js"></script>
<div dojoType="dialog" id="DialogContent" bgColor="#666666" bgOpacity="0.6" toggle="fade" toggleDuration="250" lifetime="10000">
	<input type="hidden" id="deletedId" name="deletedId" value=""/>
	<table height="106" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="343" colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" align="center">Do you really want to delete the data ?</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" id="remove" onclick="remove()" value="Submit" size="30" class="btn" />
			<input type="submit" id="close" value="Cancel" size="30" class="btn"/>	
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
  </table>
</div>