<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Transport Outsource Route >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/filterandpaging.jsp"%>

	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function setclient(id,name,currency,amount)
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
				
				var _currency = self.opener.document.getElementById('currency');
				if(_currency)
					_currency.value = currency;
					
				var _maincost = self.opener.document.getElementById('maincost');
				var _maincostdef = self.opener.document.getElementById('maincostdef');
				
				var _destinationcost = self.opener.document.getElementById('destination-cost');
				
				if(_maincost)
					_maincost.value = new Number(amount).numberFormat('#,#.00');
					
				if(_maincostdef)
					_maincostdef.value = new Number(amount).numberFormat('#,#.00');
					
				if(_destinationcost)
					_destinationcost.value = amount;
					
				var tbl = self.opener.document.getElementById("maincosttable");
				if(tbl)
				{
					var t_section = tbl.tBodies[0];
					if(t_section)
					{
						var len = t_section.rows.length;
					
						for(var idx=len-1;idx>=0;idx--)
								t_section.deleteRow(idx);
					
						<c:forEach items="${destinations}" var="com">
							if('${com.id}' == id)
							{
								<c:forEach items="${com.costs}" var="cost">
									<c:if test="${cost.cost.type == 'MAIN'}">
										var row = t_section.insertRow(t_section.rows.length);
								
										var cell0 = row.insertCell(0);
										cell0.innerHTML = '${cost.cost.name} : ';
										cell0.setAttribute('align','right')
										
										var input = document.createElement('input');
										input.setAttribute('class','input-disabled');
										input.setAttribute('size','15');
										input.disabled = true;
									
										<c:forEach items="${cost.historys}" var="history">
											<c:if test="${(history.validFrom <= date and date <= history.validTo) or (history.validFrom <= date and history.validTo == null)}">
												input.value="<fmt:formatNumber value='${history.money.amount}' pattern=',##0.00'/>";
											</c:if>
										</c:forEach>
										
										row.insertCell(1).appendChild(input);
									</c:if>									
								</c:forEach>
							}
						</c:forEach>	
					}
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
								<form id="filterForm" name="filterForm" method="post" action="<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}&contract=${filterCriteria.contract}'/>">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
									<tr>
										<td width="347" align="right">Name&nbsp;&nbsp;</td>
								  	  <td width="10">:&nbsp;</td>
									  <td width="888" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="submit" value="Search"/></td>
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="7%"><div style="width:10px"></div></th>
				  		  	<th width="93%">Name</th>
				  		</tr>
						<c:forEach items="${destinations}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.name}','${com.price.money.currency.symbol}','${com.cost}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.name}</td> 
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=${target}&contract=${filterCriteria.contract}'/>');">Last</a></td>
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