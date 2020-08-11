<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Product >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
								<form id="filterForm" name="filterForm" method="post" >
									<table width="100%" cellspacing="0" cellpadding="1" align="center">
                                    <tr>
                                        <td width="460" align="right">Code</td>
                                        <td width="4">:</td>
                                      	<td width="765" height="28" align="left"><input id="code" name="code" value="${filterCriteria.code}" size="35"/></td>
                                    </tr>
                                    <tr>
                                        <td width="460" align="right">Name</td>
                                        <td width="4">:</td>
                                      <td height="28" align="left"><input id="name" name="name" value="${filterCriteria.name}" size="35"/></td>
                                    </tr>
                                    <tr>
                                        <td width="460" align="right">&nbsp;</td>
                                  		<td height="28" align="left" colspan="2">
                                  			<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');" class="btn" />
                                        	<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetPopup();" class="btn"/>
                                        </td>
                                    </tr>
									</table>
								</form>
							</td>
						</tr>
						</table>
                        <div class="clears">&nbsp;</div>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Last</a></td>
						</tr>
						</table>						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="1%"><div style="width:10px"></div></th>
			  		  	  	<th width="15%">Code</th>
		  		  	  	  	<th width="30%">Name</th>
		  		  	  	  	<th width="25%">Warna</th>
                          	<th width="10%">On Hand</th>
				  		</tr>
						<c:forEach items="${products}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.product.id}','${com.product.name}','${com.product.types}','${com.product.typeNames}','${com.product.colors}','${com.onHand}','${com.product.unitOfMeasure.measureId}','${com.product.buyingPrice.money.amount}','${com.product.quality}','${com.product.brand}','${com.product.primaryColors}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.product.code}'/></td> 
							<td><c:out value='${com.product.name}'/></td>
							<td><c:out value='${com.product.colors}'/></td>
                            <td><fmt:formatNumber value='${com.onHand}' pattern=',##0.00'/></td>
                        </tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductforadjustmentview.htm?target=${target}&index=${index}&container=${filterCriteria.container}&organization=${filterCriteria.organization}&grid=${filterCriteria.grid}&categoryId=${filterCriteria.categoryId}'/>');">Last</a></td>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function setclient(id,name,tipe,namaTipe,warna,onhand,uom,price,quality,brand,primaryColor)
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
			
			var _tipe = self.opener.document.getElementById('type[${index}]');
			var _namaTipe = self.opener.document.getElementById('typeName[${index}]');
			var _warna = self.opener.document.getElementById('color[${index}]');
			var _onhand = self.opener.document.getElementById('onhand[${index}]');
			var _uom = self.opener.document.getElementById('uom[${index}]');
			var _price = self.opener.document.getElementById('price[${index}]');
			var _quality = self.opener.document.getElementById('quality[${index}]');
			var _brand = self.opener.document.getElementById('brand[${index}]');
			var _primaryColors = self.opener.document.getElementById('primaryColor[${index}]');
			
			if(_tipe)
				_tipe.value = tipe;
			
			if(_namaTipe)
				_namaTipe.value = namaTipe;
			
			if(_warna)
				_warna.value = warna;
			
			if(_onhand)
				_onhand.value = parseFloat(onhand).numberFormat('#,#.00');
			
			if(_uom)
				_uom.value = uom;
				
			if(_price && price)
				_price.value = parseFloat(price).numberFormat('#,#.00');
			
			if(_quality)
				_quality.value = quality;
			
			if(_brand)
				_brand.value = brand;
			
			if(_primaryColors)
				_primaryColors.value = primaryColor;
			
			if(self.opener.setPrice)
				self.opener.setPrice('${index}');
		}
		
		window.close();
	}
</script>