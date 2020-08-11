<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Grid >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,container,grid_name,grid_id,facility_name)
		{
			if(id && container)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = container;
					
					_client.appendChild(_opt);
				}
				
				var grid = self.opener.document.getElementById('grid[${index}]');
				if(grid)
				{
					
					grid.remove(grid.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = grid_id;
					_opt.text = grid_name;
					
					grid.appendChild(_opt);
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
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Last</a></td>
						</tr>
						</table>						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="5%"><div style="width:10px"></div></th>
							<th width="38%">Container</th>
				  		  	<th width="28%">Grid</th>
				  			<th width="29%">Facility</th>
						</tr>
						<c:forEach items="${containers}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.name}','${com.grid.name}','${com.grid.id}'),'${com.grid.facility.name}'"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.name}</td>
                            <td>${com.grid.name}</td>
                            <td>${com.grid.facility.name}</td>
					  	</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupcontainerbyfacilityview.htm?target=${target}&facility=${filterCriteria.facility}'/>');">Last</a></td>
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