<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Verification >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
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
				<td width="60%">Financial Accounting > Account Payable > Invoice Verification > Add</td>
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
						<h1 class="page-title">F26 - Invoice Verification</h1>
						<br/>
                        
						<strong>Reference :</strong>
						<table width="60%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
					  	  <th width="5%"><div style="width:20px"></div></th>
		  	  	  	  	  <th width="23%">ID</th>
  	  	  	  	  	  	  <th width="46%">Supplier/Goods Receipt Reference</th>
   	  	  	  	  	  	  <th width="26%">Type</th>
						</tr>
						<c:forEach items="${verificateables}" var="rec">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/invoiceverificationpreadd2.htm?id=${rec.id}'/>"  title="Edit"><span>Edit</span></a>
							</td>
							<td><a href="<c:url value='/page/${rec.uri}?id=${rec.id}'/>"><c:out value='${rec.code}'/></a></td>
                            <td><c:out value='${rec.receiveFrom}'/></td>
                            <td><c:out value='${rec.transactionSource}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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
