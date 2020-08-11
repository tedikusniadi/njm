<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Product Period >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function setclient(id,name,onhand,uom,price)
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
				
				var _onhand = self.opener.document.getElementById('onhand[${index}]');
				var _uom = self.opener.document.getElementById('uom[${index}]');
				var _price = self.opener.document.getElementById('price[${index}]');
				
				if(_onhand)
					_onhand.value = parseFloat(onhand).numberFormat('#,#.00');
				
				if(_uom)
					_uom.value = uom;
					
				if(_price && price)
					_price.value = parseFloat(price).numberFormat('#.00');
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
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
			  		  	  	<th width="17%">Code</th>
		  		  	  	  	<th width="38%">Name</th>
                          	<th width="17%">On Hand</th>
				  		</tr>
						<c:forEach items="${products}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.product.name}','${com.onHand}','${com.product.unitOfMeasure.measureId}','${com.product.sellingPrice.money.amount}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.product.code}'/></td> 
							<td><c:out value='${com.product.name}'/></td>
                            <td><fmt:formatNumber value='${com.onHand}' pattern=',##0.00'/></td>
                        </tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinventoryitemview.htm?target=${target}'/>');">Last</a></td>
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