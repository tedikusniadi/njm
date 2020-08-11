<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Billing >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function setclient(id,name,amount)
		{
			if(id && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = name;
					
					_client.appendChild(_opt);
				}
				
				var _unpaid = self.opener.document.getElementById('unpaid[${index}]');
				if(_unpaid)
				{
					var _unpaidF = new Number(amount);
					_unpaid.value = _unpaidF.numberFormat('#,###');
				}
				
				var unpaid = self.opener.document.getElementById('${target}-unpaidAmount');
				if(unpaid)
				{
					unpaid.value = new Number(amount).numberFormat('#,###');
				}
			}
			
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
										<td width="349" align="right">Code&nbsp;&nbsp;</td>
								  	  	<td width="1%">:&nbsp;</td>
							  	  	  	<td width="886" height="28" align="left"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
									</tr>
                                    <tr>
										<td width="349" align="right">Customer&nbsp;&nbsp;</td>
								  	  	<td>:&nbsp;</td>
							  	  	  	<td width="886" height="28" align="left"><input type="text" id="name" name="customer" value="${filterCriteria.customer}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceDetail=${filterCriteria.referenceDetail}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>')"/>
											<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onclick="resetPopup();" class="btn"/>
										</td>
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="1%"><div style="width:10px"></div></th>
			  		  	  	<th width="15%">Invoice</th>
			  		  	  	<th width="15%">Customer</th>
	  		  	  	  	  	<th width="12%">Unpaid</th>
				  		</tr>
						<c:forEach items="${billings}" var="billing">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${billing.id}','${billing.code}','${billing.unpaid}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${billing.code}</td>
							<td>${billing.customer.name}</td>
							<td><fmt:formatNumber value='${billing.unpaid}' pattern='#,###'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupunitbillingmanualview.htm?defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&custId=${filterCriteria.custId}&referenceDetail=${filterCriteria.referenceDetail}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>