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
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name,uom,rate)
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
				
				var _uom = self.opener.document.getElementById('uom[${filterCriteria.index}]');
				if(_uom)
					_uom.value = uom;
					
				var std = self.opener.document.getElementById('std[${filterCriteria.index}]');
				if(std)
				{
					<c:if test="${format == null or format == 'true'}">
						std.value = new Number(rate).numberFormat('#,#.00');
					</c:if>
					
					
					<c:if test="${format != null and format == 'false'}">
						std.value = new Number(rate).numberFormat('#.00');
					</c:if>
				}
				var hid = self.opener.document.getElementById('hid[${filterCriteria.index}]');
				if(hid)
					hid.value = rate;
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
								<form:form id="filterForm" name="filterForm" method="post" action="/page/popupproductview.htm?target=${target}" modelAttribute="filterCriteria">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
									<tr>
										<td width="347" align="right">Code&nbsp;&nbsp;</td>
									  	<td width="10">:&nbsp;</td>
								  	  	<td width="888" height="28" align="left"><form:input id="code" path="code" size="35"/></td>
									</tr>
									<tr>
										<td align="right">Name&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left"><form:input id="name" path="name" size="35"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="sumbit" value="Search" style="WIDTH:60px; HEIGHT:15px" alt="Search" class="btn" /></td>
									</tr>
									</table>
								</form:form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupproductview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Last</a></td>
						</tr>
						</table>						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="2%"><div style="width:10px"></div></th>
				  		  <th width="17%">Code</th>
			  		  	  <th width="32%">Name</th>
                            <th width="27%">Price</th>
                            <th width="22%">Currency</th>
				  		</tr>
						<c:forEach items="${products}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.product.sellingPrice.id}','${com.product.name}','${com.product.unitOfMeasure.measureId}','${com.price}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.product.code}</td> 
							<td>${com.product.name}</td>
                            <td><fmt:formatNumber value='${com.price}' pattern=',##0.00'/></td>
                            <td>${com.exchange.to.symbol}</td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupproductview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductview.htm?target=${target}'/>');">Last</a></td>
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