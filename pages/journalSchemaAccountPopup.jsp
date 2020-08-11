<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Journal Schema Account >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code,name,type)
		{
			var _split = '${split}';
		
			if(id && code && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					
					if(_split && _split == 'true')
						_opt.text = name;					
					else
						_opt.text = code+" "+name;
					
					_client.appendChild(_opt);
				}
				
				if(_split && _split == 'true')
				{
					var _code = self.opener.document.getElementById('code[${index}]');
					if(_code)
						_code.value = code;
				}
			}
			
			var postingType = self.opener.document.getElementById('${postingType}');
			if(postingType)
			{
				for(var idx=postingType.options.length-1;idx>=0;idx--)
					postingType.remove(postingType.selectedIndex)
			
				debet = document.createElement('option');
				debet.value = type;
				debet.text = type;
				debet.selected=true;
				debet.setAttribute('onclick','amountView();');
				debet.setAttribute('style','width:75px;');
				
				postingType.appendChild(debet);
				
				postingType.focus();
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
											<td width="130" align="right" style="WIDTH:130px;">Code / Name&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
											<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');" class="btn" /></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="5%"><div style="width:10px"></div></th>
				  		  	<th width="20%">Code</th>
			  		  	  	<th width="59%">Name</th>
                          	<th width="16%">Type</th>
				  		</tr>
						<c:forEach items="${accounts}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.account.id}','${com.account.code}','${com.account.name}','${com.postingType}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.account.code}</td> 
							<td>${com.account.name}</td>
                            <td>${com.postingType}</td>
				  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupjournalschemaaccountview.htm?target=${target}&postingType=${postingType}&schema=${filterCriteria.schema}'/>');">Last</a></td>
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