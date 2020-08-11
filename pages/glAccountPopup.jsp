<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>GL Account Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
	
		function setclient(id,code,name,group)
		{
			if(id && code && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					
					<c:if test='${empty split}'>
						_opt.text = code+" "+name;
					</c:if>
					<c:if test='${not empty split}'>
						_opt.text = name;
						
						var i_code = self.opener.document.getElementById('code[${index}]');
						if(i_code)
							i_code.value = code;
					</c:if>
					
					_client.appendChild(_opt);
				}
				
				var _group = self.opener.document.getElementById('glAccountGroup[${index}]');
				if(_group)
				{
					_group.remove(_group.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = group;
					_opt.text = group;
					
					_group.appendChild(_opt);
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
											<td width="130" align="right" style="WIDTH:130px;">GL Account Name&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="215" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
											<td align="left">
												<input type="button" value="Search" style="WIDTH:60px; HEIGHT:26px" alt="Search" onclick="search('<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');" class="btn" />
												<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:26px" alt="Reset" onClick="resetPopup();" class="btn"/>
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
								<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Last</a></td>
							</tr>
						</table>
						

						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
					  		<tr>
					  			<th width="5%"><div style="width:10px"></div></th>
				  			  <th width="13%">Code</th>
			  			  	  <th width="50%">Name</th>
                              <th width="32%">Group</th>
				  		  </tr>
							<c:forEach items="${accounts}" var="account">
							<tr>
					  			<td class="tools">
					  				<a class="item-button-add-row" href="javascript:setclient('${account.id}','${account.code}','${account.name}','${account.parent.name}')"  title="${account.note}"><span>Edit</span></a>
					  			</td>
								<td>${account.code}</td> 
								<td>${account.name}</td>
                                <td>${account.parent.name}</td>
					  		</tr>
							</c:forEach>
					  		<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}coa=${filterCriteria.coa}&"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupglaccountview.htm?coa=${filterCriteria.coa}&target=${target}&split=${split}&index=${index}'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file='/common/sirius-footer.jsp' %>
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>