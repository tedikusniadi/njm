<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Unit Service Transaction >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name,date,plate,type,mechanic)
		{
			if(id && name)
			{
				var _client = document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);

					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = name;
					_client.appendChild(_opt);
				}
			}
			
			var _date = self.opener.document.getElementById("serviceDate");
			if(_date)
				_date.value = date;
			
			var _plate = self.opener.document.getElementById("plateNo");
			if(_plate)
				_plate.value = plate;
			
			var _type = self.opener.document.getElementById("unitType");
			if(_type)
				_type.value = type;
			
			var _mechanic = self.opener.document.getElementById("serviceByBefore");
			if(_mechanic)
				_mechanic.value = mechanic;

			window.close();
		}
	</script>
</head>
<body>
<div id="se-containers_pick">
	<div id="se-r00">
		<div id="se-r01a">&nbsp;</div>
		<div id="se-r03">&nbsp;</div>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<form id="filterForm" name="filterForm" method="post">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">Code</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td align="right">Customer Name</td>
											<td>:&nbsp;</td>
											<td align="left"><input type="text" id="customerName" name="customerName" value="${filterCriteria.customerName}" size="35" class="inputbox"/></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');" class="btn" /></td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
							<th width="1%"><div style="width:25px"></div></th>
						  	<th width="20%">Code</th>
						  	<th width="30%">Customer</th>
						  	<th width="10%">Plate No</th>
						  	<th width="20%">Type</th>
						</tr>
						<c:forEach items="${sales}" var="service">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${service.serviceTransaction.id}','${service.serviceTransaction.code}','<fmt:formatDate value='${service.serviceTransaction.date}' pattern='dd-MM-yyyy'/>','${service.serviceTransaction.customerOwner.plateNo}','${service.serviceTransaction.customerOwner.unitType}','${service.serviceTransaction.detail.serviceBy.name}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${service.serviceTransaction.code}'/></td>
							<td><c:out value='${service.serviceTransaction.customerOwner.customer.name}'/></td>
							<td><c:out value="${service.serviceTransaction.customerOwner.plateNo}"/></td>
							<td><c:out value='${service.serviceTransaction.customerOwner.unitType}'/></td>
				  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/unitservicetransactionpopup.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>