<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement Requisition >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Cash Bank Management > Reimbursements > Reimbursement Requisition > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F31 - Reimbursement Requisition</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/reimbursementrequisitionview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/reimbursementrequisitionprint.htm?id=${requisition.id}'/>"><span>Print</span></a>
                            </c:if>
                            <c:if test="${access.edit and empty requisition.reimbursement and requisition.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
                            	<a class="item-button-store" href="<c:url value='/page/reimbursementpreadd2.htm?id=${requisition.id}'/>"><span>Create Reimbursement</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="editForm" method="post" modelAttribute="requisition">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="21%" align="right">ID :</td>
                                          	<td width="79%"><input disabled size="30" class="input-disabled" value="${requisition.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input disabled size='15' class="input-disabled" value="<fmt:formatDate value='${requisition.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <option value="${requisition.organization.id}"><c:out value='${requisition.organization.firstName} ${requisition.organization.middleName} ${requisition.organization.lastName}'/></option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition.approver}'>
                                                        <form:option value='${requisition.approver.id}' label='${requisition.approver.firstName} ${requisition.approver.lastName} ${requisition.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisitioner" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition.requisitioner}'>
                                                        <form:option value='${requisition.requisitioner.id}' label='${requisition.requisitioner.firstName} ${requisition.requisitioner.lastName} ${requisition.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Created By :</td>
                                            <td>
                                                <form:select path="createdBy" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition.createdBy}'>
                                                        <form:option value='${requisition.createdBy.id}' label='${requisition.createdBy.firstName} ${requisition.createdBy.lastName} ${requisition.createdBy.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Journal Schema :</td>
                                            <td>
                                                <form:select id="schema" path="journalSchema" cssClass="combobox-ext" disabled='true'>
                                                    <option><c:out value='${requisition.journalSchema.code} ${requisition.journalSchema.name}'/></option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <option><c:out value='${requisition.currency.symbol}'/></option>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" size="10" disabled value="<fmt:formatNumber value='${requisition.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="21%" align="right">Type : </td>
                                          	<td width="79%">
                                                <form:select id='type' path='type' disabled='true'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input id='bankName' disabled='true' class='input-disabled' size="35"  value="${requisition.bankName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input id='bankBranch' disabled='true' class='input-disabled' size="35"  value="${requisition.bankBranch}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input id='accountNo' disabled='true' class='input-disabled' size="35"  value="${requisition.accountNo}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Holder : </td>
                                            <td><input disabled='true' class='input-disabled' size="35"  value="${requisition.accountHolder}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="6"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<c:if test='${not empty requisition.indexes}'>
                                    	<fieldset>
                                            <legend><strong>Index</strong></legend>
                                            <table width="100%" border="0" cellpadding="0">
                                            <c:forEach items='${requisition.indexes}' var='index' varStatus='status'>
                                            <tr>
                                                <td width="42%" align="right"><c:out value='${index.index.index.name}'/></td>
                                                <td width="2%" 	align="center">:</td>
                                              	<td width="56%"><form:input path="indexes[${status.index}].content" disabled='true'/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                        </c:if>
                                    	<fieldset>
                                            <legend><strong>Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="29%">&nbsp;</td>
                                                <td width="37%" align="center"><strong>Amount (<c:out value='${requisition.currency.symbol}'/>)</strong></td>
                                                <td width="34%" align="center"><strong>Amount (<c:out value='${requisition.exchange.to.symbol}'/>)</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><strong>Total</strong></td>
                                                <td><input value="<fmt:formatNumber value='${total}' pattern=',##0.00'/>" id="total" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                                <td><input value="<fmt:formatNumber value='${total*requisition.exchange.rate}' pattern=',##0.00'/>" id="totaldef" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                        <%@ include file="/common/approval-history.jsp" %>
                                  	 	<%@ include file="/common/approval.jsp" %>
                                    </td>
                                </tr>
                                </table>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
								<thead>
                                <tr>
									<th width="17%">Description</th>
							  	  	<th width="30%">Account</th>
                                  	<th width="26%">Company</th>
								  	<th width="12%">Amount</th>
                                    <th width="15%">Note</th>
								</tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requisition.items}" var="item" varStatus='status'>
                                <tr>
                                	<td><c:out value='${item.journalSchema.name}'/></td>
                                    <td><c:out value='${item.journalSchema.account.code} ${item.journalSchema.account.name}'/></td>
                                    <td><c:out value='${item.organization.firstName} ${item.organization.middleName} ${item.organization.lastName}'/></td>
                                    <td><fmt:formatNumber value='${item.amount}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.note}'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                </tfoot>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${requisition.createdBy.firstName} ${requisition.createdBy.middleName} ${journalSchema.createdBy.lastName}'/> (<fmt:formatDate value='${requisition.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${requisition.updatedBy.firstName} ${requisition.updatedBy.middleName} ${requisition.updatedBy.lastName}'/> (<fmt:formatDate value='${requisition.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/reimbursementrequisitionedit.htm'/>";
		document.addForm.submit();
	}
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreimbursementapproverview.htm?target=forwardTo&organization=${requisition.organization.id}'/>");
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>