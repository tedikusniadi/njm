<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Transport Outsource Contract >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name,origin)
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
				
				var _origin = self.opener.document.getElementById('origin');
				if(_origin)
					_origin.value = origin;
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
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');" class="btn" /></td>
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
				  		  <th width="24%">Code</th>
			  		  	  <th width="12%">Date</th>
                          <th width="16%">Origin</th>
                          <th width="44%">Customer</th>
				  		</tr>
						<c:forEach items="${contracts}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.code}','${com.origin}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.code}</td> 
                            <td><fmt:formatDate value='${com.date}' pattern='dd-MM-yyyy'/></td> 
							<td>${com.origin}</td>
                            <td><c:out value='${com.customer.firstName} ${com.customer.middleName} ${com.customer.lastName}'/></td> 
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popuptransportoutsourcecontractview.htm?target=${target}&enabled=true&type=${filterCriteria.type}&customer=${filterCriteria.customer}'/>');">Last</a></td>
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