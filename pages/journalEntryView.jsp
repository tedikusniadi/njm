<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
    <head>
        <title>Journal Entry >> View</title>
        <%@ include file="/common/sirius-header.jsp" %>
        <style type="text/css" media="screen">@import url("assets/sirius.css");</style>
        <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
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
                <td width="60%">Financial Accounting > Journal Entrys > Journal Entry > Edit</td>
                <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
            </tr>
            </table>	
        </div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F40 - Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/journalentryview.htm'/>"><span>List</span></a>
                            <a class="item-button-list" href="<c:url value='/page/schematicjournalentryview.htm'/>"><span>List Schematic</span></a>
							
							<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/journalentrypreedit.htm?id=${journalEntry_edit.id}'/>"><span>Edit</span></a>
                                </c:if>
							
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="journalEntry_edit">
							<table width="100%" border="0" cellpadding="0" cellspacing="20">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="${journalEntry_edit.code}" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><input value="${journalEntry_edit.name}" size="65"/> </td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input size="20" value="<fmt:formatDate value='${journalEntry_edit.entryDate}'/>"/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryType" disabled="true">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<select>
                                            	<option><c:out value='${journalEntry_edit.currency.symbol}'/></option>
											</select>
                                            &nbsp;
                                            <select>
                                            	<option><c:out value='${journalEntry_edit.exchange.type}'/></option>
											</select>
                                            &nbsp;
                                            <input size="10" value="<fmt:formatNumber value='${journalEntry_edit.exchange.rate}' groupingUsed='true' maxFractionDigits='0'/>"/>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td>
											<select id="org" class="combobox-ext">
												<option><c:out value='${journalEntry_edit.organization.firstName} ${journalEntry_edit.organization.middleName} ${journalEntry_edit.organization.lastName}'/></option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Accounting Period :</td>
										<td>
											<select id="period"  class="combobox-ext">
												<option><c:out value='${journalEntry_edit.accountingPeriod.name}'/></option>
											</select>
										</td>
									</tr>									
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <c:if test='${not empty journalEntry_edit.indexes}'>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${journalEntry_edit.indexes}' var='type'>
                                                <tr>
													<td align="right">${type.indexType.name}</td>
													<td align="center">:</td>
													<td><input value="${type.content}" size="15" disabled/></td>
												</tr>
                                                </c:forEach>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Entry Balance</strong></legend>
												<table width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="29%">&nbsp;</td>
													<td width="37%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input id='labelDebet' value="<fmt:formatNumber value='${display.debet}' pattern=',##0.00'/>" size="15" disabled /></td>
													<td><input id='labelCredit' value="<fmt:formatNumber value='${display.credit}' pattern=',##0.00'/>" size="15" disabled /></td>
												</tr>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </table>
								</td>
								</tr>
								</table>
                                <div class="clears">&nbsp;</div>
								<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
								<tr>
                                    <th width="10%">Code</th>
						  	  	  <th width="26%">Name</th>
					  	  	  	  <th width="12%">Amount</th>
                           	  	  <th width="7%">Type</th>
					  	  	  	  <th width="45%">Note</th>
								</tr>
                                <thead>
								<tbody>
                                <c:forEach items="${journalEntry_edit.details}" var="detail" varStatus='status'>
								<tr>
                                    <td><c:out value='${detail.account.code}'/></td>
                                    <td><c:out value='${detail.account.name}'/></td>
                                    <td><fmt:formatNumber value='${detail.amount}' pattern=',##0.00'/></td>
									<td><c:out value='${detail.postingType}'/></td>
									<td><c:out value='${detail.note}'/></td>
								</tr>
								</c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                </tfoot>
								</table>
								</form:form>
                        	</div>
							<div class="info">Created by : <c:out value='${journalEntry_edit.createdBy.firstName} ${journalEntry_edit.createdBy.middleName} ${journalEntry_edit.createdBy.lastName}'/> (<fmt:formatDate value='${journalEntry_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${journalEntry_edit.updatedBy.firstName} ${journalEntry_edit.updatedBy.middleName} ${journalEntry_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${journalEntry_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>