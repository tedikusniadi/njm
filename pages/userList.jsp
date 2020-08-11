<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>User</title>

	<%@ include file="/common/sirius-header.jsp"%>

	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/userFilter.jsp"%>
</head>

<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Tools > User Management > User</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
		</table>
	</div>

	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">T12 - User</h1>
						<div class="clears">&nbsp;</div>
						<div class="toolbar-clean" style="display:none;">
					  		<a class="item-button-new" href="<c:url value='/page/userpreadd.htm' />"><span>New User</span></a>
				    	</div>
						
						<div class="item-navigator">
							
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
                                    	
											<a class="item-button-new" href="<c:url value='/page/userpreadd.htm'/>"><span>New User</span></a>
                                        
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
												
						</div>
		  				<table class="table-list" cellspacing="0" cellpadding="0" width="100%">				
						<tr>
							<th><div style="WIDTH:40px;"></div></th>
							<th>User ID</th>
						  	<th>Employee Name</th>
						  	<th>Role Name</th>
						</tr>
						<c:forEach items="${users}" var="user">
						<tr>
							<td class="tools">
						   		<a class="item-button-search" href="<c:url value='/page/userdetailview.htm?id=${user.id}'/>"><span>View</span></a>
						  		<a class="item-button-edit" href="<c:url value='/page/userpreedit.htm?id=${user.id}'/>"><span>Edit</span></a>
						  		<a class="item-button-delete" id="tes" name="tes" href="javascript:deleteDialog('<c:url value='/page/userdelete.htm?id=${user.id}'/>');" title="Delete"><span>Delete</span></a>
							</td>
							<td>${user.username}</td>
						  	<td>${user.person.firstName} ${user.person.middleName} ${user.person.lastName}</td>
						  	<td>${user.role.name}</td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        	<tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/common/sirius-footer.jsp" %>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>