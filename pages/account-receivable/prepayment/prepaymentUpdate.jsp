<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" language="javascript">
		function save()
		{
			document.editForm.action="<c:url value='/page/prepaymentedit.htm'/>";
			document.editForm.submit();
		}
	</script>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">${breadcrumb}</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>

						<div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/prepaymentview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${prepayment.available > 0}'>
                            	<a class="item-button-new" href="<c:url value='/page/prepaymentapplicationpreadd.htm?id=${prepayment_edit.id}'/>"><span>Penarikan</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/prepaymentprint.htm?id=${prepayment_edit.id}'/>"><span>Print</span></a>
			    			</c:if>
                        </div>

                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='prepayment_edit'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${prepayment_edit.code}" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Facility : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty prepayment_edit.organization}'>
                                                        <form:option value='${prepayment_edit.organization.id}' label='${prepayment_edit.organization.firstName} ${prepayment_edit.organization.middleName} ${prepayment_edit.organization.lastName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${prepayment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Receive From :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty prepayment_edit.customer}'>
                                                        <form:option value='${prepayment_edit.customer.id}' label='${prepayment_edit.customer.firstName} ${prepayment_edit.customer.middleName} ${prepayment_edit.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Amount :</td>
                                            <td><input class='input-disabled' value="<fmt:formatNumber value='${prepayment_edit.amount}' pattern=',##0.00'/>" disabled size='15'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Available :</td>
                                            <td><input class='input-disabled' value="<fmt:formatNumber value='${prepayment_edit.available}' pattern=',##0.00'/>" disabled size='15'/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${prepayment_edit.currency.id}' label='${prepayment_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;&nbsp;
                                                Rate : <input class='input-disabled' value="<fmt:formatNumber value='${prepayment_edit.exchange.rate}' pattern=',##0.00'/>" disabled size='10'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          	<td><form:textarea path='note' cols='45' rows='6' value='${prepayment_edit.note}'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                    		<legend>Aplikasi</legend>
                                    		<c:forEach items="${prepayment_edit.applications}" var="app" varStatus="status">
                                    			<a href="<c:url value='/page/prepaymentapplicationpreedit.htm?id=${app.id}'/>">${app.code}</a>&nbsp;&nbsp;&nbsp;
                                    			<c:if test="${status.index%3==2}"><br/></c:if>
                                    		</c:forEach>
                                    	</fieldset>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                    		<legend>Referensi</legend>
                                    			<a href="<c:url value='/page/journalentrypreview.htm?id=${prepayment_edit.journalEntry.id}'/>">${prepayment_edit.journalEntry.code}</a>&nbsp;&nbsp;&nbsp;
                                    	</fieldset>
                                    </td>
                                </tr>
                                </table>
                                <br/>
							</form:form>
						</div>
						<div class="info">Created by : ${prepayment_edit.createdBy.firstName} ${prepayment_edit.createdBy.middleName} ${prepayment_edit.createdBy.lastName} (<fmt:formatDate value='${prepayment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${prepayment_edit.updatedBy.firstName} ${prepayment_edit.updatedBy.middleName} ${prepayment_edit.updatedBy.lastName} (<fmt:formatDate value='${prepayment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
