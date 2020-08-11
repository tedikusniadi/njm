<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Bank/Cash Account >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name,bank,branch,rek,holder,_gl)
		{
			if(id && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = bank+" - "+rek;
					
					_client.appendChild(_opt);
				}
				
				//var org = document.getElementById('target');
				var accountName = self.opener.document.getElementById('accountName');
				var bankName = self.opener.document.getElementById('bankName');
				var bankBranch = self.opener.document.getElementById('bankBranch');
				var accountNo = self.opener.document.getElementById('accountNo');
				var accountHolder = self.opener.document.getElementById('accountHolder');
				
				if(accountName)
					accountName.value = name;
	
				if(bankName)
					bankName.value = bank;
		
				if(bankBranch)
					bankBranch.value = branch;
		
				if(accountNo)
					accountNo.value = rek;
					
				if(accountHolder)
					accountHolder.value = holder;
					
				var gl = self.opener.document.getElementById('glAccount');
				if(gl && _gl)
					gl.value = _gl;
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
                                    <tr>
										<td align="right">Account Name&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left"><input id="accountName" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');" class="btn" />
									</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
				  			<th width="17%">Code</th>
				  		  	<th width="24%">Account Name</th>
  				  		  	<th width="26%">Bank Name</th>
                            <th width="18%">Branch</th>
                            <th width="11%">No</th>
				  		</tr>
						<c:forEach items="${accounts}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.accountName}','${com.bankName}','${com.bankBranch}','${com.accountNo}','${com.holder.firstName}','${com.account.code} - ${com.account.name}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.code}'/></td> 
							<td><c:out value='${com.accountName}'/></td>
                            <td><c:out value='${com.bankName}'/></td>
                            <td><c:out value='${com.bankBranch}'/></td>
                            <td><c:out value='${com.accountNo}'/></td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupbankaccountview.htm?target=${target}&type=${filterCriteria.type}&organization=${filterCriteria.organization}&holderId=${filterCriteria.holderId}'/>');">Last</a></td>
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