<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter Transaction Acknowledgement >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/intertransactionacknowledgementedit.htm'/>";
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter Transaction Acknowledgement > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F37 - Inter Transaction Acknowledgement</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/intertransactionacknowledgementview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="acknowledgement_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="61%" valign="top">
                                   	  <table style="border:none" width="100%">
                                        <tr>
                                            <td width="22%" align="right">ID :</td>
                                            <td width="78%"><input disabled size="30" class="input-disabled" value="${acknowledgement_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty acknowledgement_edit.organization}'>
                                                        <option value="${acknowledgement_edit.organization.id}"><c:out value='${acknowledgement_edit.organization.firstName} ${acknowledgement_edit.organization.middleName} ${acknowledgement_edit.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Company From :</td>
                                            <td>
                                                <form:select path="acknowledgable.from" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty acknowledgement_edit.acknowledgable.from}'>
                                                        <option value="${acknowledgement_edit.acknowledgable.from.id}"><c:out value='${acknowledgement_edit.acknowledgable.from.firstName} ${acknowledgement_edit.acknowledgable.from.middleName} ${acknowledgement_edit.acknowledgable.from.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Company To :</td>
                                            <td>
                                                <form:select path="acknowledgable.to" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty acknowledgement_edit.acknowledgable.to}'>
                                                        <option value="${acknowledgement_edit.acknowledgable.to.id}"><c:out value='${acknowledgement_edit.acknowledgable.to.firstName} ${acknowledgement_edit.acknowledgable.to.middleName} ${acknowledgement_edit.acknowledgable.to.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Request Amount :</td>
                                            <td width="78%"><input size="20" disabled class="input-disabled" value="<fmt:formatNumber value='${acknowledgement_edit.acknowledgable.maxAmount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='acknowledgable.currency' disabled='true'>
                                                    <form:option value='${acknowledgement_edit.acknowledgable.currency.id}' label='${acknowledgement_edit.acknowledgable.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='acknowledgable.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Note :</td>
                                            <td width="78%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="39%" valign="top">
                                    	<fieldset>
                                        	<legend>Recapitulation</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<th width="52%">&nbsp;</th>
                                                <th width="30%">Amount(<c:out value='${acknowledgement_edit.acknowledgable.currency.symbol}'/>)</th>
                                                <th width="18%">Amount(<c:out value='${acknowledgement_edit.exchange.to.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Unapplied</td>
                                                <td><input id="unapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${acknowledgement_edit.acknowledgable.maxAmount-amount}' pattern=',##0.00'/>"/></td>
                                                <td><input id="defunapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${(acknowledgement_edit.acknowledgable.maxAmount-amount)*acknowledgement_edit.exchange.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Applied</td>
                                                <td><input id="applied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${amount}' pattern=',##0.00'/>"/></td>
                                                <td><input id="defapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${amount*acknowledgement_edit.exchange.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="10%">Date</th>
                               	  	<th width="30%">Name</th>
                   	  	  	  	  	<th width="13%">Amount</th>                                    
                           	 	  	<th width="20%">Schema</th>
                                  	<th width="14%">Inter To</th>
                                  	<th width="13%">Inter From</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${acknowledgement_edit.details}' var='detail'>
                                <tr>
                                	<td><fmt:formatDate value='${detail.date}' pattern='dd-MM-yyyy'/></td>
                                    <td><c:out value='${detail.name}'/></td>
                                    <td><fmt:formatNumber value='${detail.information.amount}' pattern=',##0.00'/></td>
                                    <td><c:out value='${detail.journalSchema.code} ${detail.journalSchema.name}'/></td><br />
									<td><a href="<c:url value='/page/interjournaltopreedit.htm?id=${detail.journal.id}'/>"><c:out value='${detail.journal.entryFrom.code}'/></a></td>
                                    <td><a href="<c:url value='/page/interjournaltopreedit.htm?id=${detail.journal.entryTo.id}'/>"><c:out value='${detail.journal.entryTo.code}'/></a></td>                                    
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table">
                                    <td colspan="10">&nbsp;</td>
                                </tr>    
                                </tfoot>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : ${acknowledgement_edit.createdBy.firstName} ${acknowledgement_edit.createdBy.middleName} ${acknowledgement_edit.createdBy.lastName} (<fmt:formatDate value='${acknowledgement_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${acknowledgement_edit.updatedBy.firstName} ${acknowledgement_edit.updatedBy.middleName} ${acknowledgement_edit.updatedBy.lastName} (<fmt:formatDate value='${acknowledgement_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
