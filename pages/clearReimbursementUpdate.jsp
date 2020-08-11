<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Reimbursement >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/clearreimbursementedit.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Financial Accounting > Cash Bank Management > Reimbursements > Clear Reimbursement > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F33 - Clear Reimbursement</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/clearreimbursementview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="clear_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="21%" align="right">ID :</td>
                                    <td width="79%"><input disabled size="30" class="input-disabled" value="${clear_edit.code}"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${clear_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Organization :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                            <option value="${clear_edit.organization.id}"><c:out value='${clear_edit.organization.firstName} ${clear_edit.organization.middleName} ${clear_edit.organization.lastName}'/></option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Reimbursement :</td>
                                    <td><a href="<c:url value='/page/reimbursementpreedit.htm?id=${clear_edit.reimbursement.id}'/>"><c:out value='${clear_edit.reimbursement.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Clearing No :</td>
                                    <td width="79%"><input disabled size="30" class="input-disabled" value="${clear_edit.reimbursement.information.reference}"/></td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Amount :</td>
                                    <td width="79%">
                                        <input disabled size="15" class="input-disabled" value="<fmt:formatNumber value='${clear_edit.reimbursement.information.amount}' pattern=',##0.00'/>"/>
                                        <input disabled size="5" class="input-disabled" value="${clear_edit.reimbursement.requisition.currency.symbol}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Note :</td>
                                    <td width="79%"><form:textarea path='note' cols='45' rows='6'/></td>
                                </tr>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${clear_edit.createdBy.firstName} ${clear_edit.createdBy.middleName} ${clear_edit.createdBy.lastName}'/> (<fmt:formatDate value='${clear_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${clear_edit.updatedBy.firstName} ${clear_edit.reimbursement.updatedBy.middleName} ${clear_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${clear_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear_edit:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear_edit:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
