<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>
						<div>&nbsp;</div>
						
					  	<form:form id="addForm" name="addForm" method="post">
					  	<table width="100%" style="border:none">
						<tr>
							<td width="1%" nowrap="nowrap">Type</td>
							<td width="99%">: Add Default Grid</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Facility</td>
							<td>: ${facility.name}</td>
						</tr>
						</table>
						<div>&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
                                	<div class="toolbar-clean">
                                		<a class="item-button-back" href="javascript:prev();"><span>Back</span></a>
                                		<a class="item-button-save"><span>Save</span></a>
                                       <%--  <div dojoType="Toggler" targetId="filter">
                                            <a class="item-button-search" href="javascript:return false;"><span><spring:message code="sirius.paging.filter"/></span></a>
                                        </div> --%>
							   		</div>
                                </td>
								<%-- <td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td> --%>
                            </tr>
							</table>
					  	</div>
                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" width="100%">
                        <thead>
                        <tr>
                            <th width="1%">&nbsp;</th>
                            <th width="10%">Product Code</th>
                          	<th width="10%">Product Name</th>
                          	<th width="79%">Default Grid</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="count" value="0"/>
                        <c:forEach items="${products}" var="product" varStatus="status">
                       	<tr>
                       		<td><input id="product[${status.index}]" name="productIds" type="hidden" value="${product.id}" class="inputbox"/></td>
                       		<td nowrap="nowrap">${product.code}</td>
                       		<td nowrap="nowrap">${product.name}</td>
                       		<td>
                       			<select id="grid[${status.index}]" name="gridIds">
                       				<option value=""></option>
                       				<c:forEach items='${grids}' var='grid'>
                       					<option value="${grid.id}">${grid.name}</option>
                       				</c:forEach>
                       			</select>
                       		</td>
                       	</tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                        </tfoot>
                        </table>
                        </form:form>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <%-- <tr><td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td></tr> --%>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
function prev()
{
	window.location = "<c:url value='/page/productautosetpreaddone.htm'/>";
}

$(document).ready(function(){
	$(".item-button-save").click(function()
	{
		/* var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product Auto Set Grid',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$.ajax({
			url:"<c:url value='/page/productautosetaddgrid.htm'/>",
			data:$('#addForm').serialize(),
			method : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Product Default Grid ......');
				$dialog.dialog('open');
			},
			success : function(json) {
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/productautosetpreaddone.htm'/>";
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason :<br/>'+json.message);
					}
				}
			}
		}); */
		document.addForm.action="<c:url value='/page/productautosetaddgrid.htm'/>";
		document.addForm.submit();
	});
});

</script>
</body>
</html>