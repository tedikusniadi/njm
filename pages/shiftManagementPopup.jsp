<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Shift Management >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code,bankId,bankName,cashier)
		{
			if(id && code)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = code;
					
					_client.appendChild(_opt);
				}
				
				var accountName = self.opener.document.getElementById('bankAccount');
				var cashierName = self.opener.document.getElementById('cashier');
				
				if(accountName)
				{
					accountName.remove(accountName.selectedIndex);
					
					var _op = document.createElement('option');
					_op.value = bankId;
					_op.text = bankName;
					
					accountName.appendChild(_op);
				}
	
				if(cashierName)
					cashierName.value = cashier;
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
								  		<td width="888" height="28" align="left"><input id="code" name="code" value="${filterCriteria.code}" size="35" class="inputbox"/></td>
									</tr>
                                    <%-- <tr>
										<td align="right">Account Name&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left"><input id="accountName" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
									</tr> --%>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');" class="btn" />
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="1%"><div style="width:10px"></div></th>
				  			<th width="15%">Code</th>
				  		  	<th width="18%">Organization</th>
  				  		  	<!-- <th width="15%">Counter</th> -->
                            <th width="12%">Cashier</th>
                            <!-- <th width="15%">Cash Name</th> -->
                            <th width="12%">Fund</th>
				  		</tr>
						<c:forEach items="${shifts}" var="shift">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${shift.id}','${shift.code}','${shift.counterRegister.bankAccount.id}','${shift.counterRegister.bankAccount.bankName}','${shift.cashierPerson.name}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${shift.code}'/></td> 
							<td><c:out value='${shift.organization.name}'/></td>
                            <%-- <td><c:out value='${shift.counterRegister.code}'/></td> --%>
                            <td><c:out value='${shift.cashierPerson.name}'/></td>
                            <%-- <td><c:out value='${shift.counterRegister.bankAccount.bankName}'/></td> --%>
                            <td><c:out value='${shift.fundStart}'/></td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupshiftmanagementview.htm?target=${target}&organization=${filterCriteria.organization}'/>');">Last</a></td>
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