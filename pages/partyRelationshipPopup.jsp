<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Party Relationship >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name)
		{
			if(id && name)
			{
				var _client = self.opener.document.getElementById('${target}');

				if(_client)
				{
					for(var idx=_client.options.length;idx>=0;idx--)
						_client.remove(_client.selectedIndex);

					var opt = document.createElement('option');
					opt.value = id;
					opt.text = name;

					_client.appendChild(opt);
				}
				
				var palfonfacility = self.opener.document.getElementById('facility');
				if(palfonfacility)
				{
					palfonfacility.value=name;
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
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="7%"><div style="width:10px"></div></th>
					  		<th width="93%">Name</th>
					  	</tr>
						<c:forEach items="${relationships}" var="rel">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${rel.id}','${rel.fromRole.party.name}')"  title="Pilih"><span>Pilih</span></a>
					  		</td>
							<td>${rel.fromRole.party.name}</td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuppartyrelationshipview.htm?'/>');">Last</a></td>
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