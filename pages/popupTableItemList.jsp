<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Daftar Barang</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code,name)
		{
			if(id && code && name)
			{
				var _client = self.opener.document.getElementById('item[${index}]');
				
				if(_client)
				{
					for(var idx=_client.options.length;idx>=0;idx--)
						_client.remove(_client.selectedIndex);
						
					var opt = document.createElement('option');
					opt.value = id;
					opt.text = code+' '+name;
					
					_client.appendChild(opt);
				}
				
				var measure = self.opener.document.getElementById('measure[${index}]');
				if(measure)
				{
					<c:forEach items="${items}" var="item">
						if('${item.id}' == id)
						{
							for(var idx=measure.options.length;idx>=0;idx--)
								measure.remove(measure.selectedIndex);
						
							var basic = document.createElement('option');
							basic.value = '${item.group.basic.id}';
							basic.text = '${item.group.basic.measure.measureId}';
					
							measure.appendChild(basic);
							
							var ext1 = document.createElement('option');
							ext1.value = '${item.group.ext1.id}';
							ext1.text = '${item.group.ext1.measure.measureId}';
					
							measure.appendChild(ext1);
							
							var ext2 = document.createElement('option');
							ext2.value = '${item.group.ext2.id}';
							ext2.text = '${item.group.ext2.measure.measureId}';
					
							measure.appendChild(ext2);
						}
					</c:forEach>
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
											<td width="130" align="right" style="WIDTH:130px;">Kode / Nama Barang&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td height="28" align="left"><input type="text" id="name" name="param" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
											<td align="left">
												<input type="button" value="Cari" style="WIDTH:60px; HEIGHT:25px" alt="Cari" onclick="search('<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');" class="btn" />
												<input type="button" value="Batal" style="WIDTH:60px; HEIGHT:25px" alt="Batal" onclick="window.location = '<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>';" class="btn" />
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
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Pertama</a> | <a href="javascript:step('prev','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Sebelum</a> | Halaman <c:out value="${filterCriteria.page}"/> dari <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Berikut</a> | <a href="javascript:step('last','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Terakhir</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  		<tr>
					  			<th><div style="width:10px"></div></th>
					  			<th width="40%">Kode</th>
					  			<th width="40%">Name</th>
					  		</tr>
							<c:forEach items="${items}" var="client">
							<tr>
					  			<td class="tools">
					  				<a class="item-button-edit" href="javascript:setclient('${client.id}','${client.itemId}','${client.name}')"  title="Pilih"><span>Pilih</span></a>
					  			</td>
								<td>${client.itemId}</td> 
								<td>${client.name}</td>
					  		</tr>
							</c:forEach>
					  		<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Pertama</a> | <a href="javascript:step('prev','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Sebelum</a> | Halaman <c:out value="${filterCriteria.page}"/> dari <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Berikut</a> | <a href="javascript:step('last','<c:url value='/page/popupHandlerPrepareTableItem.htm?'/>');">Terakhir</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
    <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer-pick">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>