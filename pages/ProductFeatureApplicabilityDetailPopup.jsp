<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Product Feature Applicability >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,name)
		{
			if(id && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				
				if(_client)
				{
					if(_client.type == 'text') {
						_client.value = name;
					} else {
						//_client.value=name;
						
						_client.remove(_client.selectedIndex);
						
						var _opt = document.createElement('option');
						_opt.text = name;
						
						if(_client.name == 'warna') {
							_opt.value = name;
						} else {
							_opt.value = name;
						}
						
						_client.appendChild(_opt);
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
								<form id="filterFormPopup" name="filterFormPopup" method="post">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
									
									<tr>
										<td align="right">Name&nbsp;&nbsp;</td>
									  	<td>:&nbsp;</td>
										<td width="888" height="28" align="left">
										<input type="text" id="content" name="content" value="${filterCriteria.content}" size="35" class="inputbox" />
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td align="left">
											<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchPopup('<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');" class="btn" />
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
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
					  		<th width="20%">Code</th>
				  		  	<th width="74%">Name</th>
				  		</tr>
						<c:forEach items="${content}" var="com">
						<c:if test="${com.content!=''}">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.content}');"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.id}</td> 
							<td>${com.content}</td>
					  		</tr>
					  	</c:if>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupproducttypeview.htm?target=${target}&feature=${feature}'/>');">Last</a></td>
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