<script type="text/javascript">
	function changeStatus()
	{
		var forwardTo = document.getElementById('forwardTo').value;
		var remark = document.getElementById('remark').value;
		var decision = document.getElementById("decision").value;
		
		if(decision != 'APPROVE_AND_FINISH' && decision != 'REJECTED' && forwardTo == '')
		{
			alert('You need to choose next Approver first!');
			return;
		}
		
		if(forwardTo == '${approvalDecision.forwardTo.id}')
		{
			alert('Cannot forward document to same person.');
			return;
		}
		
		if(remark == '')
		{
			alert('Remark can not be empty!');
			return;
		}
	
		document.editForm.action="<c:url value='/page/approvaledit.htm?id=${approvalDecision.approvable.id}'/>";
		document.editForm.submit();
	}
	
	function on()
	{
		document.getElementById('forwardTo').disabled = false;
		document.getElementById('f_img').setAttribute('onclick','openapprover();');
	}
	
	function off()
	{
		document.getElementById('forwardTo').disabled = true;
		document.getElementById('f_img').setAttribute('onclick','');
	}
</script>
<table width="100%" style="border:none">
<c:if test="${not empty guest and guest.id == approvalDecision.forwardTo.id and approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH' and approvalDecision.approvalDecisionStatus != 'REJECTED'}">
<tr>
    <td>
        <fieldset>
            <legend><strong>Approval Decision</strong></legend>
            <table width="100%" style="border:none">
            <tr>
                <td align="right">Decision</td>
                <td>:</td>
              	<td>
                    <select id="decision" name="decision" class="combobox">
                        <option value="FORWARD" onclick="on();">FORWARD</option>
                        <option value="APPROVE_AND_FORWARD" onclick="on();">APPROVE AND FORWARD</option>
                        <option value="REJECTED" onclick="off();">REJECTED</option>
                        <option value="APPROVE_AND_FINISH" onclick="off();">APPROVE AND FINISH</option>
                    </select>
              	</td>
            </tr>
            <tr>
                <td align="right">Forward To</td>
                <td>:</td>
                <td>
                    <select id="forwardTo" name="forwardTo" class="combobox">
                    </select>
                    &nbsp;
                    <img id="f_img" src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                </td>
            </tr>
            <tr>
                <td align="right">Remark</td>
                <td>:</td>
                <td valign="top"><textarea id="remark" name="remark" cols="45" rows="3"></textarea></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><img onclick="changeStatus();" src="<c:url value='/assets/images/btn_process.gif'/>"/></td>
            </tr>
            </table>
        </fieldset>
    </td>
</tr>
</c:if>
</table>
