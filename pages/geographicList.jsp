<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Geographic >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/geographicFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
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
			<td width="60%">Company Administration > General Setting > Geographic</td>
			<td width="5%"></td>
			<td width="35%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						<h1 class="page-title"></h1>
						<h1 class="page-title">C32 - Geographic</h1>
						<div class="clears">&nbsp;</div>
				  		
                        <div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
							<tr>
								<td width="35%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
									<c:if test='${access.add}'>
					  					<a class="item-button-new" href="<c:url value='/page/geographicpreadd.htm' />"><span>New Geographic</span></a>
                           		 	</c:if>
							   		</div>
								</td>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
								</tr>
							</table>
					  	</div>
				  		<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
				  		<tr>
				  			<th width="7%"><div style="width:40px"></div></th>
				  			<th width="15%">ID</th>
		  			  	  	<th width="25%">Name</th>
		  			  	 	<th width="28%">Type</th>
                            <th width="25%">Parent</th>
				  		</tr>
						<c:forEach items="${geographics}" var="geo">
						<tr>
				  			<td class="tools">
                            	<c:if test='${access.edit}'>
				  					<a class="item-button-edit"   href="<c:url value='/page/geographicpreedit.htm?id=${geo.id}'/>"  title="Edit"><span>Edit</span></a>
                                </c:if>
                                <c:if test='${access.delete}'>
				  					<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/geographicdelete.htm?id=${geo.id}'/>');" title="Delete"><span>Del</span></a>
                                </c:if>
				  			</td>
				  			<td>${geo.code}</td> 
							<td>${geo.name}</td>
							<td>${geo.geographicType.name}</td>
                            <td>${geo.parent.name}</td>
				  		</tr>
				  		</c:forEach>
				  		<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
				  		</table>
                    	<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
						<tr>
							<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
		<%@ include file="/common/dialog.jsp"%>
</body>
<!-- END OF BODY -->
</html>