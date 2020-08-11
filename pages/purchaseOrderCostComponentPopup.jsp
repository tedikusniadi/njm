<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>PO Cost Component >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
     <script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/page/dwrService/interface/ExchangeDWRRemote.js'/>"></script>
	<script type="text/javascript">
		function setclient(id,code,currId,symbol,exchange,amount,tax)
		{
			if(id && code)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = code;
					
					_client.appendChild(_opt);
				}
				
				var _symbol = self.opener.document.getElementById('trxCurrency');
				if(_symbol)
					_symbol.innerHTML = symbol
					
				var _trx = self.opener.document.getElementById('trx');
				if(_trx)
					_trx.value = parseFloat(amount).numberFormat('#,#.00');
					
				var _tax = self.opener.document.getElementById('tax');
				if(_tax)
					_tax.value = parseFloat(tax).numberFormat('#,#.00');
					
				var _total = self.opener.document.getElementById('total');
				if(_total)
					_total.value = (parseFloat(amount)+parseFloat(tax)).numberFormat('#,#.00');
					
				var _event = function(rate)
				{
					var _deftrx = self.opener.document.getElementById('deftrx');
					if(_deftrx)
						_deftrx.value = (parseFloat(amount)*parseFloat(rate)).numberFormat('#,#.00');
						
					var _deftax = self.opener.document.getElementById('deftax');
					if(_deftax)
						_deftax.value = (parseFloat(tax)*parseFloat(rate)).numberFormat('#,#.00');
				
					var _deftotal = self.opener.document.getElementById('deftotal');
					if(_deftotal)
						_deftotal.value = ((parseFloat(amount)+parseFloat(tax))*parseFloat(rate)).numberFormat('#,#.00');
				
					window.close();
				}
				
				ExchangeDWRRemote.loadRate(currId,'${filterCriteria.defaultCurrency.id}','${filterCriteria.date}',exchange,_event);
			}
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
								  	  <td width="888" height="28" align="left"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35"/></td>
									</tr>
									<tr>
										<td align="right">PO&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.po}" size="35"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}&organization=${filterCriteria.organization}&supplier=${filterCriteria.supplier}'/>');" class="btn" /></td>
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="5%"><div style="width:10px"></div></th>
				  		  	<th width="27%">Code</th>
		  		  	  	  <th width="48%">PO</th>
                          <th width="20%">Amount</th>
				  		</tr>
						<c:forEach items="${components}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.code}','${com.purchaseOrder.currency.id}','${com.purchaseOrder.currency.symbol}','${com.purchaseOrder.exchangeType}','${com.amount}','${com.amount*com.tax.taxRate*0.01}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.code}</td> 
							<td>${com.purchaseOrder.code}</td>
                            <td><fmt:formatNumber value='${com.amount+(com.amount*com.tax.taxRate*0.01)}' pattern=',##0.00'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcostcomponentview.htm?target=${target}&supplier=${supplier}'/>');">Last</a></td>
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