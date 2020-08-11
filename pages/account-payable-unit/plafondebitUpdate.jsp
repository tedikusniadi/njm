<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="plafondebit.htmltitle"/></title>
	<%@ include file="/common/sirius-header.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/plafondebitedit.htm'/>";
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
            <td width="60%"><spring:message code="plafondebit.breadcrumb"/></td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="plafondebit.title"/></h1>

						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/plafondebitview.htm'/>"><span><spring:message code="list"/></span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plafondebit">
								<table width="100%" style="border:none">
								<tr>
                                	<td width="56%" align="left" valign="top">
                                   		<table width="100%" style="border:none">
										<tr>
											<td width="18%" align="right">ID :</td>
											<td width="40%"><input size="35" class="input-disabled" disabled value='${plafondebit.code}'/></td>
		   									<td width="42%">&nbsp;</td>
										</tr>
										<tr>
		 									<td align="right">Facility :</td>
											<td width="40%"><input size="55" disabled value='${plafondebit.plafon.partyRelationship.fromRole.party.name}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Plafon Name :</td>
											<td width="40%"><input size="55" disabled value='${plafondebit.plafon.name}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Date :</td>
											<td width="40%"><input size="10" disabled value='<fmt:formatDate value='${plafondebit.date}' pattern='dd-MM-yyyy'/>'/><%-- &nbsp;Due Date :&nbsp;<input size="10" disabled value='<fmt:formatDate value='${plafondebit.dueDate}' pattern='dd-MM-yyyy'/>'/> --%></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Mata Uang :</td>
											<td width="40%"><input size="4" disabled value='${plafondebit.money.currency.name}'/>&nbsp;<input size="7" disabled value='${plafondebit.money.exchangeType}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Payment Type :</td>
											<td width="40%"><input size="20" disabled value='TRANSFER'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Num Transfer :</td>
											<td width="40%"><input size="20" disabled value='${plafondebit.refNo}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Amount :</td>
											<td width="40%"><input size="20" disabled value='<fmt:formatNumber value='${plafondebit.money.amount}' pattern=',##0.00'/>'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Bank Account :</td>
											<td width="40%"><input size="55" disabled value='${plafondebit.bankAccount.bankName}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
			 							<tr>
		 									<td align="right">Catatan :</td>
											<td width="40%"><form:textarea path='note' cols='30' rows='4' value='${plafondebit.note}'/></td>
		   									<td width="42%">&nbsp;</td>
			 							</tr>
										<%-- <tr>
											<td width="18%" align="right">Code:</td>
											<td width="40%"><input size="30" disabled value="${plafondebit.code}"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr>
										<tr>
											<td width="18%" align="right">Plafon Name:</td>
											<td width="40%"><input size="30" disabled value="${plafondebit.plafon.name}"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr>
										<tr>
											<td width="18%" align="right">No. Reference:</td>
											<td width="40%"><input size="30" disabled value="${plafondebit.refNo}"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr>
										  <tr>
		 									<td align="right">For Company :</td>
											<td>
		                                    	 <form:select id="relation" path="plafondebit.partyRelationship" cssClass="combobox-ext" disabled='true'>
		                                            <c:if test='${not empty plafondebit.plafon.partyRelationship.fromRole.party}'>
		                                                <form:option value='${plafondebit.plafon.partyRelationship.fromRole.party.id}' label='${plafondebit.plafon.partyRelationship.fromRole.party.name}' />
		                                            </c:if>
		                                        </form:select>
		                                    </td>
											<td>&nbsp;</td>
			 							</tr>
		                          		
										<tr>
											<td align="right">Valid From :</td>
											<td colspan="2"><input size='15' class='input-disabled' disabled value="<fmt:formatDate value='${plafondebit.date}' pattern='dd-MM-yyyy'/>"/></td>
										</tr>
										<tr>
											<td align="right">Valid To :</td>
											<td colspan="2"><input size='15' class='input-disabled' disabled value="<fmt:formatDate value='${plafondebit.dueDate}' pattern='dd-MM-yyyy'/>"/></td>
										</tr>
										<tr>
											<td width="18%" align="right">Currency:</td>
											<td width="40%"><input size="15" disabled value="${plafondebit.money.currency.name}"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr>
										<tr>
											<td width="18%" align="right">Available:</td>
											<td width="40%"><input size="15" disabled value="<fmt:formatNumber value='${plafondebit.money.amount}' pattern=',##0.00'/>"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr> --%>
		                                <%-- <tr>
											<td width="18%" align="right">Available Plafon :</td>
											<td width="40%"><input size="20" class='input-disabled' disabled value="<fmt:formatNumber value='${plafondebit.available}' pattern=',##0.00'/>"/></td>
		   									<td width="42%">&nbsp;</td>
										</tr> --%>
										</table>
									</td>
									<td width="35%" align="center" valign="top">
                   						<table style="border:none" width="100%">
                                        <tr>
                                        	<td align="left" valign="top">
												<fieldset>
                                                	<legend><strong>Journal Reference</strong></legend>
                                                    <table style="border:none" width="100%">
 													<tr>
                                                        <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${plafondebit.journalEntry.id}'/>">${plafondebit.journalEntry.code}</td>
                                                      </tr>
                                                    </table>
                                                </fieldset>
                                        	</td>
                                        </tr>
                                		</table>
                            		</td>
								</tr>
								</table>
							</form:form>
                            <br/>

						</div>
						<div class="info">Created by : <c:out value='${plafondebit.createdBy.firstName} ${plafondebit.createdBy.middleName} ${plafondebit.createdBy.lastName}'/> (<fmt:formatDate value='${plafondebit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${plafondebit.updatedBy.firstName} ${plafondebit.updatedBy.middleName} ${plafondebit.updatedBy.lastName}'/> (<fmt:formatDate value='${plafondebit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>

</div>
</body>
<!-- END OF BODY -->
</html>
