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
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
    <%@ include file="/common/filterandpaging.jsp"%>
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
										<td width="349" align="right">Nama Pemohon&nbsp;&nbsp;</td>
								  	  	<td width="1%">:&nbsp;</td>
							  	  	  	<td width="886" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
									</tr>
                                    <tr>
										<td width="349" align="right">Nama STNK&nbsp;&nbsp;</td>
								  	  	<td>:&nbsp;</td>
							  	  	  	<td width="886" height="28" align="left"><input type="text" id="customerUnit" name="customerUnit" value="${filterCriteria.customerUnit}" size="35" class="inputbox"/></td>
									</tr>
                                    <tr>
										<td width="349" align="right">No SPK&nbsp;&nbsp;</td>
								  	  	<td>:&nbsp;</td>
							  	  	  	<td width="886" height="28" align="left"><input type="text" id="spkCode" name="spkCode" value="${filterCriteria.spkCode}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>')" class="btn"/>
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="1%" nowrap="nowrap"><div style="width:10px"></div></th>
			  		  	  	<th width="15%" nowrap="nowrap">Invoice</th>
			  		  	  	<th width="12%" nowrap="nowrap">SPK</th>
			  		  	  	<th width="12%" nowrap="nowrap">No Mesin</th>
			  		  	  	<th width="12%" nowrap="nowrap">No Rangka</th>
			  		  	  	<th width="15%" nowrap="nowrap">Nama Pemohon</th>
	  		  	  	  	  	<th width="12%" nowrap="nowrap">Ori Unpaid</th>
                          	<th width="12%" nowrap="nowrap">Trx Unpaid</th>
				  		</tr>
						<c:forEach items="${billings}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.unitBilling.id}','${fn:replace(com.unitBilling.unitSalesOrder.customer.name,'\'','-')}','${fn:replace(com.unitBilling.unitSalesOrder.customerUnit.name,'\'','-')}', '${com.unitBilling.unitSalesOrder.code}','${com.unpaid}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td nowrap="nowrap">${com.unitBilling.code}</td>
							<td nowrap="nowrap">${com.unitBilling.unitSalesOrder.code}</td>
							<td nowrap="nowrap">${com.unitBilling.unitSalesOrder.serial}</td>
							<td nowrap="nowrap">${com.unitBilling.unitSalesOrder.serialExt1}</td>
							<td nowrap="nowrap">${com.unitBilling.unitSalesOrder.customer.name}</td>
							<td nowrap="nowrap"><fmt:formatNumber value='${com.unitBilling.unpaid}' pattern='#,###'/></td>
                            <td nowrap="nowrap"><fmt:formatNumber value='${com.unpaid}' pattern='#,###'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupbilling4paymentview.htm?popup=${popup}&defCurrency=${filterCriteria.defCurrency}&organization=${filterCriteria.organization}&target=${target}&customer=${filterCriteria.customer}&index=${index}&currency=${filterCriteria.currency}&exchangeType=${filterCriteria.exchangeType}&referenceType=${filterCriteria.referenceType}&name=${filterCriteria.name}&customerUnit=${filterCriteria.customerUnit}&spkCode=${filterCriteria.spkCode}&dateFrom='/><fmt:formatDate value='${filterCriteria.dateFrom}' pattern='dd-MM-yyyy'/>');">Last</a></td>
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
<script type="text/javascript">
	function setclient(id,name,unitName,spkCode,unpaid)
	{
		if(id && name)
		{
			var newname = name.replace("-","'");
			var newname2 = newname.replace("-","'");
			var newUnitname = unitName.replace("-","'");
			var newUnitname2 = newUnitname.replace("-","'");
			var _client = self.opener.document.getElementById('${target}');
			if(_client)
			{
				_client.remove(_client.selectedIndex);
				
				var _opt = document.createElement('option');
				_opt.value = id;
				_opt.text = newname2;
				
				_client.appendChild(_opt);
			}
			
			var _clientName = self.opener.document.getElementById('billingNames[${index}]');
			if(_clientName)
			{
				_clientName.remove(_clientName.selectedIndex);
				
				var _opt = document.createElement('option');
				_opt.value = id;
				_opt.text = newUnitname2;
				
				_clientName.appendChild(_opt);
			}
			
			var _spkCode = self.opener.document.getElementById('spkCodes[${index}]');
			if(_spkCode)
			{
				_spkCode.remove(_spkCode.selectedIndex);
				
				var _opt = document.createElement('option');
				_opt.value = id;
				_opt.text = spkCode;
				
				_spkCode.appendChild(_opt);
			}
			
			var _unpaid = self.opener.document.getElementById('unpaid_${index}');
			if(_unpaid)
			{
				var _unpaidF = new Number(unpaid);
				_unpaid.value = _unpaidF.numberFormat('#,###');
			}
		}
		
		window.close();
	}
</script>