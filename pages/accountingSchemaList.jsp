<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
		<title>Accounting Schema</title>
		<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    	<%@ include file="/common/popup.jsp"%>
		<%@ include file="/filter/accountingSchemaFilter.jsp"%>
		<script type="text/javascript" src="assets/dialog.js"></script>
	</head>
<body>

<%@ include file="/common/sirius-header.jsp"%>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">	
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Schema > List</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">F13 - Accounting Schema</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
										<a class="item-button-new" href="<c:url value='/page/accountingschemapreadd.htm' />"><span>New Schema</span></a>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
								</tr>
							</table>
					  	</div>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="6%"><div style="width:40px"></div></th>
					  	  <th width="11%">ID</th>
					  	  <th width="28%">Name</th>
						  	<th width="33%">Company</th>
					  	  <th width="22%">Note</th>
						</tr>
						<c:forEach items="${accountingSchemas}" var="schema">
						<tr>
						 	<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/accountingschemapreedit.htm?id=${schema.id}'/>" title="Edit"><span>Edit</span></a>
                                <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/accountingschemadelete.htm?id=${schema.id}'/>');" title="Delete"><span>Delete</span></a>
						 	</td>
						 	<td>${schema.code}</td>
							<td>${schema.name}</td>
							<td>${schema.organization.firstName} ${schema.organization.middleName} ${schema.organization.lastName}</td>
							<td>${schema.note}</td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
					  	</table>
					  	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>



</body>
<%@ include file="/common/dialog.jsp"%>
</html>
