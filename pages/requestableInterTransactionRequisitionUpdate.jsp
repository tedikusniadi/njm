<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter AP >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/requestableintertransactionrequisitionedit.htm'/>";
			document.editForm.submit();
		}
		
		function openapprover()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupintertransactionrequisitionapproverview.htm?target=forwardTo&organization='/>"+org.value);
		}
		
		function showerror()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter AP > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F41 - Inter AP</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/requestableintertransactionrequisitionview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="editForm" method="post" modelAttribute="transaction_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="52%">
                                   	  <table style="border:none" width="100%">
                                        <tr>
                                            <td width="32%" align="right">ID :</td>
                                          <td width="68%"><input disabled size="30" class="input-disabled" value="${transaction_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${transaction_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Requisition ID :</td>
                                          <td width="68%"><input disabled size="30" class="input-disabled" value="${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Acknowledgement ID :</td>
                                          <td width="68%"><input disabled size="30" class="input-disabled" value="${transaction_edit.acknowledgementDetail.acknowledgement.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">From Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty transaction_edit.from}'>
                                                        <option value="${transaction_edit.from.id}"><c:out value='${transaction_edit.from.firstName} ${transaction_edit.from.middleName} ${transaction_edit.from.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">To Company :</td>
                                            <td>
                                                <form:select id="to" path="to" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty transaction_edit.to}'>
                                                        <option value="${requisition.to.id}"><c:out value='${transaction_edit.to.firstName} ${transaction_edit.to.middleName} ${transaction_edit.from.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Person in Charge :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                    <c:if test='${not empty transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner}'>
                                                        <option><c:out value='${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.firstName} ${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.lastName} ${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.middleName}'/></option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Name :</td>
                                          <td width="68%"><form:input path='name' size='50' disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty transaction_edit.approver}'>
                                                        <form:option value='${transaction_edit.approver.id}' label='${transaction_edit.approver.firstName} ${transaction_edit.approver.lastName} ${transaction_edit.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Max Transaction Amount :</td>
                                          <td width="68%"><input size="20" class="input-disabled" disabled value="<fmt:formatNumber value='${transaction_edit.maxAmount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.currency.id}' label='${transaction_edit.acknowledgementDetail.acknowledgement.acknowledgable.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Note :</td>
                                          	<td width="68%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                  	</td>
                                    <td width="48%" valign="top">
                                   	  <table style='border:none;' width='100%'>
                                        <tr>
                                        	<td>
                                            	<fieldset>
                                                	<legend><strong>Repayment Information</strong></legend>
                                                    <strong>
                                                        Repayment Reference : <a href="<c:url value='/page/intertransactionacknowledgementpreedit.htm?id='/>"><c:out value='A'/></a>
                                                    </strong>
                                                </fieldset>
                                            </td>
                                        </tr>
										<tr>
											<td>
												<%@ include file="/common/approval-history.jsp" %>
                                  	 			<%@ include file="/common/approval.jsp" %>
											</td>
										</tr>
										</table>
                                  </td>
                                </tr>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : ${transaction_edit.createdBy.firstName} ${transaction_edit.createdBy.middleName} ${transaction_edit.createdBy.lastName} (<fmt:formatDate value='${requisition.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${requisition.updatedBy.firstName} ${requisition.updatedBy.middleName} ${requisition.updatedBy.lastName} (<fmt:formatDate value='${transaction_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
