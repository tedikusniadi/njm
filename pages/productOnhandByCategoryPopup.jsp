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
	<script type="text/javascript">

		function resets()
		{
			window.location = "<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&index=${index}&active=true&categoryId=${filterCriteria.categoryId}&facility=${filterCriteria.facility}&organization=${filterCriteria.organization}'/>";
		}
	
		function setclient(id,name,tipe,namaTipe,warna,onhand,uom,serial)
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
				var _onhand = self.opener.document.getElementById('av[${index}]');
				var _hidquan = self.opener.document.getElementById('hidquan[${index}]');
				var _uom = self.opener.document.getElementById('product[${index}]-uom');
				var _serialAccessories = self.opener.document.getElementById('product[${index}]-serial');
				
				if(_tipe)
					_tipe.value = tipe;
				
				if(_namaTipe)
					_namaTipe.value = namaTipe;
				
				if(_warna)
					_warna.value = warna;
				
				if(_onhand)
					_onhand.value = parseFloat(onhand).numberFormat('#,#.00');
				
				if(_hidquan)
					_hidquan.value = onhand;
				
				if(_uom)
					_uom.value = uom;
				
				if(_serialAccessories)
				{
					if(serial == 'true')
					{
						$("#product\\["+${index}+"\\]-serial").removeAttr("disabled");
						$("#product\\["+${index}+"\\]-serial").attr("class","");
						$("#popup_line_accessories\\["+${index}+"\\]").removeAttr("hidden");
						$("#product\\["+${index}+"\\]-year").removeAttr("disabled");
					}
					else
					{
						$("#product\\["+${index}+"\\]-serial").attr("disabled","true");
						$("#product\\["+${index}+"\\]-serial").attr("class","input-disabled");
						$("#popup_line_accessories\\["+${index}+"\\]").attr("hidden","true");
						$("#product\\["+${index}+"\\]-year").attr("disabled","true");
					}
				}
				
				if(self.opener.setPrice)
					self.opener.setPrice('${index}');
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
										<td align="left">
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&index=${index}&active=true&categoryId=${filterCriteria.categoryId}&facility=${filterCriteria.facility}&organization=${filterCriteria.organization}'/>');" class="btn" />
											<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetPopup();" class="btn"/>
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
				  		  <th width="25%">Code</th>
			  		  	  <th width="46%">Name</th>
                            <th width="23%">On Hand</th>
				  		</tr>
						<c:forEach items="${products}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.product.id}','${com.product.name}','${com.product.types}','${com.product.typeNames}','${com.product.colors}','${com.onHand}','${com.product.unitOfMeasure.measureId}','${com.product.serial}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.product.code}</td> 
							<td>${com.product.name}</td>
                            <td><fmt:formatNumber value='${com.onHand}' pattern=',##0.00'/></td>
				  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproductonhandbycategoryview.htm?target=${target}&facility=${filterCriteria.facility}&index=${index}&categoryId=${filterCriteria.categoryId}&organization=${filterCriteria.organization}'/>');">Last</a></td>
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