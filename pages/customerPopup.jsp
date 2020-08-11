<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Customer Popup</title>
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
                                            	<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&instant=${filterCriteria.instant}'/>');" class="btn"/>
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
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th><div style="width:10px"></div></th>
					  		<th width="20%" nowrap="nowrap">Code</th>
					  		<th width="50%" nowrap="nowrap">Name</th>
					  		<th width="29%" nowrap="nowrap">Blacklist</th>
					  	</tr>
						<c:forEach items="${customers}" var="client">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-ok" href='javascript:setclient("${client.id}", "${fn:replace(client.name,'\'','-')}","${client.discountRate}")'  title="Pilih"><span>Pilih</span></a>
					  		</td>
							<td nowrap="nowrap"><c:out value='${client.code}'/></td>
							<td nowrap="nowrap"><c:out value='${client.firstName} ${client.middleName} ${client.lastName}'/></td>
							<td>
								<c:if test="${client.blacklist}">
									Ya
								</c:if>
								<c:if test="${!client.blacklist}">
									Tidak
								</c:if>
							</td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">first</a> | <a href="javascript:step('prev','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> from <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcustomerview.htm?target=${target}&organization=${filterCriteria.organization}&name=${filterCriteria.name}&instant=${filterCriteria.instant}'/>');">Last</a></td>
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
	function setclient(id,name,discount)
	{
		if(id && name)
		{
			var newname = name.replace("-","'");
			var newname2 = newname.replace("-","'");
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
				opt.text = newname2;
				opt.selected=true;
				_client.appendChild(opt);
			}
		}

		var creditTerm = self.opener.document.getElementById('creditTerm');
		var plafon = self.opener.document.getElementById('plafon');
		var relation = self.opener.document.getElementById('relation');
		if(plafon || creditTerm)
		{
			if(plafon)
			{
				var handler = function(_plafon)
				{
					plafon.value = parseFloat(_plafon.plafon).numberFormat('#,#.00');
					relation.value = _plafon.id;
				}

				PlafonDWRRemote.loadPlafon(id,'${filterCriteria.organization}',1,{
					callback:handler,
				});
			}

			_client.focus();

			if(creditTerm)
			{
				var handler = function(_term)
				{
					creditTerm.value = _term;
				};

				CreditTermDWRRemote.loadCreditTerm(id,'${filterCriteria.organization}',handler);
			}
		}

		if(self.opener.setCustomerInfo){
			self.opener.setCustomerInfo("${target}",id,name);
		}
		
		if(self.opener.setCustomerType) {
			var customerType = "";
			<c:forEach items="${customers}" var="client">
			if('${client.id}' == id)
			{
				<c:forEach items="${client.classifications}" var="cl">
					<c:if test='${cl.type.id >= 19}'>
						customerType = '${cl.type.name}';
					</c:if>
				</c:forEach>
			}
		</c:forEach>
			self.opener.setCustomerType(customerType,discount);
		}
		_client.options[_client.options.length-1].selected=true;
		_client.focus();

		window.close();
	}

	function _reset()
	{
		window.location="<c:url value='/page/popupcustomerview.htm?target=customer&organization=${filterCriteria.organization}'/>";
	}
</script>