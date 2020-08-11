<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Payment Clearing >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Payment Clearing > Add</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"></h1>
						<h1 class="page-title">F39 - Loan Payment Clearing</h1>
						<br/>
                        
						<strong>Reference :</strong>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
		  	  		  	  	<th width="3%"><div style="width:20px"></div></th>
  	  	  	  	  	  	  	<th width="10%">Date</th>
                   	  	  	<th width="16%">ID</th>
  	  	  	  	  	  	  <th width="30%">Payer</th>
                          <th width="28%">Payee</th>
                          <th width="13%">Amount</th>
						</tr>
						<c:forEach items="${payments}" var="payment">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/interfacilitypaymentclearingpreadd2.htm?id=${payment.id}'/>" title="Edit"><span>Edit</span></a>
							</td>
                            <td><fmt:formatDate value='${payment.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${payment.code}'/></td>
                            <td><c:out value='${payment.payable.payer.firstName} ${payment.payable.payer.middleName} ${payment.payable.payer.lastName}'/></td>
                            <td><c:out value='${payment.payable.payee.firstName} ${payment.payable.payee.middleName} ${payment.payable.payee.lastName}'/></td>
                            <td><fmt:formatNumber value='${payment.amount+payment.writeoff}' pattern=',##0.00'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
						</table>
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
