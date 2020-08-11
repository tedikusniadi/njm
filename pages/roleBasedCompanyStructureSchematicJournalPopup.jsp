<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Role Based Company Structure Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code,name)
		{
			if(id && code && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = code+" "+name;
					
					_client.appendChild(_opt);
					
					var coa = self.opener.document.getElementById('coa');
					if(coa != null)
					{
						for(var idx=coa.options.length;idx>=0;idx--)
							coa.remove(coa.selectedIndex);
						
						<c:forEach items='${companyfacilitys}' var='com'>
							if('${com.organization.id}' == id)
							{
								<c:forEach items='${com.organization.accountingSchemas}' var='schema'>
									var _opt_schema = document.createElement('option');
									_opt_schema.value = '${schema.chartOfAccount.id}';
									_opt_schema.text = '${schema.chartOfAccount.code} ${schema.chartOfAccount.name}';
					
									coa.appendChild(_opt_schema);
								</c:forEach>
							}
						</c:forEach>
					}
					
					var schema = self.opener.document.getElementById('schema');
					if(schema)
					{
						schema.remove(schema.selectedIndex);
					}
					
					var _debet = self.opener.document.getElementById('txtBalanceDebet');
					var _credit = self.opener.document.getElementById('txtBalanceCredit');
				
					if(_debet)
						_debet.value = 0;
					
					if(_credit)
						_credit.value = 0;
					
					<c:forEach items='${schema.indexes}' var='index'>
						var _index = self.opener.document.getElementById('hidden-id[${index.index.id}]');
						var _text = self.opener.document.getElementById('text-id[${index.index.id}]');
						
						if(_index)
						{
							<c:if test='${index.on}'>
								_index.disabled = false;
							</c:if>
							<c:if test='${not index.on}'>
								_index.disabled = true;
							</c:if>
						}	
						if(_text)
							<c:if test='${index.on}'>
								_text.disabled = false;
								_text.setAttribute('class','');
							</c:if>
							<c:if test='${not index.on}'>
								_text.disabled = true;
								_text.setAttribute('class','input-disabled');
							</c:if>
					</c:forEach>
					
					var __t_target = self.opener.document.getElementById("lineItemTable");
					if(__t_target)
					{
						var _body = __t_target.tBodies[0];
								
						for(var idx=_body.rows.length-1;idx>=0;idx--)
							_body.deleteRow(idx);
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
								<form id="filterForm" name="filterForm" method="post">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">Code / Name&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
											<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}&mode=search'/>');" class="btn" /></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
					  		<th width="20%">Code</th>
				  		  	<th width="74%">Name</th>
				  		</tr>
						<c:forEach items="${companyfacilitys}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.organization.id}','${com.organization.code}','${com.organization.firstName} ${com.organization.middleName} ${com.organization.lastName}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.organization.code}</td> 
							<td>${com.organization.firstName} ${com.organization.middleName} ${com.organization.lastName}</td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcompanystructurerolebasedview.htm?target=${target}'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
    <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer-pick">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>