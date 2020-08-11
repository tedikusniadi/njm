<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Produk Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function resets()
		{
			window.location = "<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>";
		}

		function setclient(id,name,measure,type,typename,brandname,color,onprice,offprice)
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
				var uom=self.opener.document.getElementById("${target}-uom")
				if(uom)
					uom.value=measure;

				var utype=self.opener.document.getElementById("${target}-type");
				if(utype)
					utype.value=type;

				var utypename=self.opener.document.getElementById("${target}-type-name");
				if(utypename)
					utypename.value=typename;

				var ubrandname=self.opener.document.getElementById("${target}-brand-name");
				if(ubrandname)
					ubrandname.value=brandname;

				var ucolor=self.opener.document.getElementById("${target}-color");
				if(ucolor)
					ucolor.value=color;

				var pricetype=self.opener.document.getElementById("${target}-pricetype");
				if(pricetype){
					/* if(pricetype.value=="ON_THE_ROAD")
						self.opener.document.getElementById("${target}-price").value=new Number(onprice).numberFormat("#,###.00");
					else if(pricetype.value=="OFF_THE_ROAD")
						self.opener.document.getElementById("${target}-price").value=new Number(offprice).numberFormat("#,###.00");
					self.opener.document.getElementById("${target}-price-on").value=new Number(onprice).numberFormat("#,###.00");
					self.opener.document.getElementById("${target}-price-off").value=new Number(offprice).numberFormat("#,###.00"); */
					if(self.opener.flagPrice){
						if(pricetype.value=="ON_THE_ROAD")
							self.opener.flagPrice("on");
						else
							self.opener.flagPrice("off");
					}
				}

				if(self.opener.getsubdiction){
					if($("#cash-payment").attr("checked"))
						self.opener.getsubdiction(id, "CASH");
					else
						self.opener.getsubdiction(id, "CREDIT");
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
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');" class="btn" />
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Last</a></td>
						</tr>
						</table>

						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
					  		<th width="20%">Code</th>
				  		  	<th width="54%">Name</th>
				  		</tr>
						<c:forEach items="${products}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-ok" href="javascript:setclient('${com.id}','${com.name}','${com.unitOfMeasure.measureId}','${com.types}','${com.typeNames}','${com.brand}','${com.colors}','${com.onprice}','${com.offprice}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.code}</td>
							<td>${com.name}</td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/productpopupview.htm?target=${target}&active=true&categoryId=${categoryId}'/>');">Last</a></td>
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