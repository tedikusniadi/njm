<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Customer Service Transaction Popup</title>
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
								<form id="filterForm" name="filterForm" method="post" >
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">Customer Name&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td height="28" align="left">
                                            	<input id="name" name="name" value="${filterCriteria.name}" size="35"/>
                                                &nbsp;&nbsp;
                                            	<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');" class="btn"/>
												<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onclick="resetPopup();" class="btn"/>
                                            </td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>
						<br/><br/>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
					  	<tr>
					  		<th width="1%"><div style="width:10px"></div></th>
					  		<th width="15%">Name</th>
					  		<th width="12%">Plat</th>
					  		<th width="15%">Tipe</th>
					  		<th width="15%">No Rangka</th>
					  	</tr>
						<c:forEach items="${customers}" var="client">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-ok" href="javascript:setclient('${client.id}','${client.customer.name}','${client.plateNo}','${client.unitType}','${client.serialExt1}','${client.year}')"  title="Pilih"><span>Pilih</span></a>
					  		</td>
							<td><c:out value='${client.customer.name}'/></td>
							<td><c:out value='${client.plateNo}'/></td>
							<td><c:out value='${client.unitType}'/></td>
							<td><c:out value='${client.serialExt1}'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcustomerservicetransactionview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
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
	function setclient(id,name,plate,unit,serial,year)
	{
		if(id && name)
		{
			var _client = self.opener.document.getElementById('${target}');
			if(_client)
			{
				for(var idx=_client.options.length;idx > 0;idx--)
				{
					if(_client.options[_client.selectedIndex].value!=0)
						_client.remove(_client.selectedIndex);
				}

				var opt = document.createElement('option');
				opt.value = id;
				opt.text = name;
				opt.selected=true;
				_client.appendChild(opt);
			}
		}

		var plat = self.opener.document.getElementById('plateNumber');
		if(plat){
			plat.value = plate;
		}
		
		var unitType = self.opener.document.getElementById('unitType');
		if(unitType) {
			unitType.value = unit;
		}
		
		var serialExt1 = self.opener.document.getElementById('serialExt1');
		if(serialExt1) {
			serialExt1.value = serial;
		}
		
		var tahun = self.opener.document.getElementById('year');
		if(tahun) {
			tahun.value = year;
		}
		
		window.close();
	}
</script>