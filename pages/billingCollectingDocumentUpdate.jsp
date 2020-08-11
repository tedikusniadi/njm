<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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
            <td width="60%">Financial Accounting > Accounting Setting > Collecting > Edit</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">						
						<h1 class="page-title">F90 - Collecting</h1>
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingcollectingdocumentview.htm'/>"><span>List</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="billing_status_edit">
			 				<table width="100%" style="border:none" cellpadding="2">
							<tr>
                                <td width="23%" align="right">Collecting/Accepted Date</td>
                           		<td width="1%">:</td>
                                <td width="76%"><input class="input-disabled" size="15" disabled value="<fmt:formatDate value='${billing_status_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                    	<option><c:out value='${billing_status_edit.organization.firstName} ${billing_status_edit.organization.middleName} ${billing_status_edit.organization.lastName}'/></option>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <td width="23%" nowrap="nowrap" align="right">Collector Name</td>
                              	<td>:</td>
                                <td width="76%">
                                  	<form:select id="collector" path='collector' cssClass='combobox-ext' disabled='true'>
                                    	<option><c:out value='${billing_status_edit.collector.firstName} ${billing_status_edit.collector.middleName} ${billing_status_edit.collector.lastName}'/></option>
                                    </form:select>
                              </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Status</td>
                                <td>:</td>
                                <td>
                                    <form:select cssClass='collections' path="status" disabled='true'>
                                    	<form:option value='FINANCE' label='FINANCE'/>
                                        <form:option value='COLLECTOR' label='COLLECTOR'/>
                                        <form:option value='ACCEPTED' label='ACCEPTED'/>
                                    </form:select>
                                </td>
                            </tr>
							</table>
                            <div class="clears">&nbsp;</div>
                            <table class="table-list iBody" cellspacing="0" cellpadding="0" width="100%">
                            <thead>
                            <tr>
                                <th width="44%">Customer</th>
                              	<th width="27%">Billing Legend</th>
                              	<th width="13%">Billing Date</th>
                           	  	<th width="16%" style="text-align:right;">Total Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${billing_status_edit.details}' var='det'>
                            <tr>
                            	<td><c:out value='${det.status.billing.customer.firstName}'/></td>
                                <td><c:out value='${det.status.billing.legend}'/></td>
                                <td><fmt:formatDate value='${det.status.billing.date}' pattern='dd-MM-yyyy'/></td>
                                <td style="text-align:right;"><fmt:formatNumber value='${det.status.billing.totalAmount}' pattern=',##0.00'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                            </tfoot>
                            </table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>