<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>DO Cost Component >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name)
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
										<td width="347" align="right">Name&nbsp;&nbsp;</td>
									  	<td width="10">:&nbsp;</td>
								  		<td width="888" height="28" align="left"><input id="name" name="name" value="${criteria.name}" size="35"/></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
                                        	<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupdorealizationcostcomponentview.htm?target=${target}'/>');" class="btn" />
                                            &nbsp;
                                            <input type="reset" class="btn" value="Reset" style="WIDTH:60px; HEIGHT:25px" onclick="javasctipt:window.location='<c:url value='/page/popupbankaccountallview.htm?target=${target}'/>'"/>
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Prev</a> | Page <c:out value="${criteria.page}"/> of <c:out value="${criteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="4%"><div style="width:10px"></div></th>
				  		  	<th width="24%">Name</th>
				  		</tr>
						<c:forEach items="${costs}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.name}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.name}'/></td> 
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="2">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Prev</a> | Page <c:out value="${criteria.page}"/> of <c:out value="${criteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='popupdorealizationcostcomponentview.htm?target=${target}&name=${criteria.name}'/>');">Last</a></td>
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