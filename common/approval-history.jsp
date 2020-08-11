<table width="100%" style="border:none">
<tr>
    <td>
        <fieldset>
            <legend><strong>Approval History</strong></legend>
            <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
            <tr>
                <th width="3%">No</th>
              	<th width="27%">Approver</th>
       	  	  <th width="22%">Status</th>
              <th width="26%">Date</th>
           	  <th width="22%">Remark</th>
            </tr>
            <c:forEach items='${approvalDecision.historys}' var='history'>
            <tr>
                <td class="small-font"><c:out value='${history.sequence}'/></td>
                <td class="small-font"><c:out value='${history.approver.firstName} ${history.approver.middleName} ${history.approver.lastName}'/></td>
                <td class="small-font">
                	<c:if test="${history.decisionStatus == 'APPROVE_AND_FINISH'}">APP & FINISH</c:if>
                    <c:if test="${history.decisionStatus == 'APPROVE_AND_FORWARD'}">APP & FORWARD</c:if>
                    <c:if test="${history.decisionStatus == 'FORWARD'}">FORWARD</c:if>
                    <c:if test="${history.decisionStatus == 'REQUESTED'}">REQUESTED</c:if>
                    <c:if test="${history.decisionStatus == 'REJECTED'}">REJECTED</c:if>
                </td>
                <td class="small-font"><fmt:formatDate value='${history.dateTime}' pattern='dd/MM/yyyy HH:mm:dd'/></td>
                <td class="small-font"><c:out value='${history.remark}'/></td>
            </tr>
            </c:forEach>
        </table>
        </fieldset>
    </td>
</tr>
</table>
