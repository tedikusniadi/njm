<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
											<td width="130" align="right" style="WIDTH:130px;">DO No&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td height="28" align="left">
                                            	<input id="name" name="name" value="${filterCriteria.code}" size="35"/>
                                                &nbsp;&nbsp;
                                            	<button onclick="search('<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Search</button>
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
							<td align="right"><a href="javascript:step('first','<c:url value='/page/unitdeliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="3%"><div style="width:10px"></div></th>
					  		<th width="27%">Realization No</th>
                          	<th width="26%">DO No</th>
					  		<th width="44%">Expedition</th>
					  	</tr>
						<c:forEach items="${orders}" var="client">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-edit" href="javascript:setclient('${client.id}','${client.deliveryOrder.code}')"><span>Pilih</span></a>
					  		</td>
							<td><c:out value='${client.code}'/></td>
                            <td><c:out value='${client.deliveryOrder.code}'/></td>
							<td><c:out value='${client.expedition.firstName} ${client.expedition.middleName} ${client.expedition.lastName}'/></td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?arget=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
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
				_client.focus();
			}
		}

		window.close();
	}
</script>