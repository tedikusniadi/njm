<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Payable >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function setclient(id,name,unpaid,rate)
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
					var _unpaidF = new Number(unpaid);
					_unpaid.value = _unpaidF.numberFormat('#,###');
				}
				
				var _rate = self.opener.document.getElementById('rate[${index}]');
				if(_rate)
					_rate.value = rate;
				
				var _paid = self.opener.document.getElementById('paids[${index}]');
				if(_paid)
				{
					var _paidF = new Number(unpaid);
					_paid.value = _paidF.numberFormat('#,###');
					
					if(self.opener.display)
						self.opener.display();
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
										<td width="347" align="right">Code&nbsp;&nbsp;</td>
									  	<td width="10">:&nbsp;</td>
								  		<td width="888" height="28" align="left"><input id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
                                        	<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');" class="btn" />
                                            <input type="reset" class="btn" value="Reset" style="WIDTH:60px; HEIGHT:25px" onclick="javasctipt:window.location='<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>'"/>
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
			  		  	  	<th width="25%">Code</th>
	  		  	  	  	  	<th width="13%">Ori Unpaid</th>
                       	  	<th width="9%">Curr</th>
                       	  	<th width="11%">Rate</th>
                          	<th width="14%">Trx Unpaid</th>
                          	<th width="14%">Nota Debet</th>
				  		</tr>
						<c:forEach items="${payables}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.payable.id}','${com.payable.code}','${com.unpaid}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.payable.code}'/></td> 
							<td><fmt:formatNumber value='${com.payable.unpaid}' pattern=',##0.00'/></td>
                            <td><c:out value='${com.payable.currency.symbol}'/></td>
                            <td><fmt:formatNumber value='${com.exchange.rate}' groupingUsed='true' maxFractionDigits='20'/></td>
                            <td><fmt:formatNumber value='${com.unpaid}' pattern=',##0.00'/></td>
							<td><c:out value='${com.payable.invoice}'/></td> 
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinvoice4paymentview.htm?&organization=${filterCriteria.organization}&target=${target}&supplier=${filterCriteria.supplier}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&paymentType=${filterCriteria.paymentType}&date='/><fmt:formatDate value='${filterCriteria.date}' pattern='dd-MM-yyyy'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	
    <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer-pick">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>

</html>