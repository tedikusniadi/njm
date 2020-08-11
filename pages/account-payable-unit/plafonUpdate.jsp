<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="plafon.htmltitle"/></title>
	<%@ include file="/common/sirius-header.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/plafonedit.htm'/>";
			document.addForm.submit();
		}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%"><spring:message code="plafon.breadcrumb"/></td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="plafon.title"/></h1>

						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/plafonview.htm'/>"><span><spring:message code="list"/></span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plafon">
								<table width="100%" style="border:none">
								<tr>
									<td width="18%" align="right">ID :</td>
									<td width="40%"><input size="35" class="input-disabled" disabled value='${plafon.code}'/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
								<tr>
 									<td align="right">Facility :</td>
									<td><input size="55" disabled value='${plafon.partyRelationship.fromRole.party.name}'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Plafon Name :</td>
									<td><input size="55" disabled value='${plafon.name}'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Bank :</td>
									<td><input size="55" disabled value='${plafon.bankAccount.bankName}'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
	                                <td align="right">Accounting Schema :</td>
	                                <td>
	                                    <select id="coa" class="combobox-ext" disabled>
	                                        <c:if test='${not empty plafon.chartOfAccount}'>
	                                            <option value='${plafon.chartOfAccount.id}'><c:out value='${plafon.chartOfAccount.code} ${plafon.chartOfAccount.name}'/></option>
	                                        </c:if>
	                                    </select>
	                                </td>
   									<td>&nbsp;</td>
	                            </tr>
	                            <tr>
	                            	<td align="right">Bank/Cash GL Account :</td>
	                                <td>
										<form:select id="account" path="account" cssClass="combobox-ext">
	                                    	<form:option value='${plafon.account.id}' label='${plafon.account.code} ${plafon.account.name}'/>
										</form:select>
	                                    &nbsp;
	                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:popup();" style="CURSOR:pointer;" title="GL Account" />
							  		</td>
   									<td>&nbsp;</td>
	                            </tr>
	 							<tr>
 									<td align="right">Date :</td>
									<td><input size="10" disabled value='<fmt:formatDate value='${plafon.validFrom}' pattern='dd-MM-yyyy'/>'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Mata Uang :</td>
									<td><input size="3" disabled value='${plafon.currency.name}'/>&nbsp;<input size="7" disabled value='${plafon.exchangeType}'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Limit Plafon :</td>
									<td><input size="19" disabled value='<fmt:formatNumber value='${plafon.plafon}' pattern=',##0.00'/>'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Catatan :</td>
									<td><form:textarea path='note' cols='30' rows='4' value='${plafon.note}'/></td>
   									<td>&nbsp;</td>
	 							</tr>
	 							
	 							<%-- <tr>
 									<td align="right">For Company :</td>
									<td>
                                    	<form:select id="relation" path="partyRelationship" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty plafon.partyRelationship}'>
                                                <form:option value='${plafon.partyRelationship.id}' label='${plafon.partyRelationship.fromRole.party.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                          		<tr>
									<td width="18%" align="right">Plafon :</td>
									<td width="40%"><input size="20" class='input-disabled' disabled value="<fmt:formatNumber value='${plafon.plafon}' pattern=',##0.00'/>"/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
								<tr>
									<td align="right">Valid From :</td>
									<td colspan="2"><input size='15' class='input-disabled' disabled value="<fmt:formatDate value='${plafon.validFrom}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
								<tr>
									<td align="right">Valid To :</td>
									<td colspan="2"><input size='15' class='input-disabled' disabled value="<fmt:formatDate value='${plafon.validTo}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td width="18%" align="right">Available Plafon :</td>
									<td width="40%"><input size="20" class='input-disabled' disabled value="<fmt:formatNumber value='${plafon.available}' pattern=',##0.00'/>"/></td>
   									<td width="42%">&nbsp;</td>
								</tr> --%>
	 							
								</table>
							</form:form>
                            <br/>
                            <!--table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <th width="17%">Sales Order</th>
                                <th width="13%">Date</th>
                                <th width="70%">Used</th>
                            </tr>
                            <c:forEach items='${plafon.bridges}' var='bridge'>
                            <tr>
                                <td><c:out value='${bridge.salesOrder.code}'/></td>
                                <td><fmt:formatDate value='${bridge.salesOrder.date}' pattern='dd-MM-yyyy'/></td>
                                <td><fmt:formatNumber value='${bridge.plafonUsed}' pattern=',##0.00'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
                            </table-->
						</div>
						<div class="info">Created by : <c:out value='${plafon.createdBy.firstName} ${plafon.createdBy.middleName} ${plafon.createdBy.lastName}'/> (<fmt:formatDate value='${plafon.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${plafon.updatedBy.firstName} ${plafon.updatedBy.middleName} ${plafon.updatedBy.lastName}'/> (<fmt:formatDate value='${plafon.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>

</div>
<script type="text/javascript">

	function popup()
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?target=account&coa='/>"+coa.value);
	}
</script>
</body>
<!-- END OF BODY -->
</html>
