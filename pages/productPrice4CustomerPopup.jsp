<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Product Price >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name,amount,uom,rate)
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
					
					var _amount = self.opener.document.getElementById('std[${index}]');
					var _uom = self.opener.document.getElementById('uom[${index}]');
					var _rate = self.opener.document.getElementById('hid[${index}]');
					
					if(_amount)
					{
						<c:if test="${empty format or format == 'true'}">
							_amount.value = new Number(amount).numberFormat('#,#.00');
						</c:if>
						<c:if test="${not empty format and format == 'false'}">
							_amount.value = new Number(amount).numberFormat('#.00');
						</c:if>
					}
						
					if(_uom)
						_uom.value = uom;
						
					if(_rate)
						_rate.value = rate;
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
								<form id="filterForm" name="filterForm" method="post" action="/page/popupproductpriceview.htm?target=${target}">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
									<tr>
										<td width="347" align="right">Code&nbsp;&nbsp;</td>
									  	<td width="10">:&nbsp;</td>
								  	  <td width="888" height="28" align="left"><input type="text" id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td align="right">Name&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="sumbit" value="Search" style="WIDTH:60px; HEIGHT:15px" alt="Search" class="btn" /></td>
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
		  		  	  	  	<th width="16%">Code</th>
	  		  	  	  	  	<th width="29%">Name</th>
                   	  	  	<th width="19%">Feature</th>
                   	  	  	<th width="8%">UoM</th>
                            <th width="14%">Geographic</th>
                            <th width="10%">Price</th>
				  		</tr>
						<c:forEach items="${prices}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.productPrice.id}','${com.productPrice.product.name}','${com.price}','${com.productPrice.product.unitOfMeasure.measureId}','${com.price}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.productPrice.product.code}'/></td> 
							<td><c:out value='${com.productPrice.product.name}'/></td>
                            <td><c:out value='${com.productPrice.feature.name}'/></td> 
							<td><c:out value='${com.productPrice.product.unitOfMeasure.measureId}'/></td>
                            <td><c:out value='${com.productPrice.geographic.name}'/></td> 
							<td><fmt:formatNumber value='${com.price}' pattern=',##0.00'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductpriceview.htm?target=${target}'/>');">Last</a></td>
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