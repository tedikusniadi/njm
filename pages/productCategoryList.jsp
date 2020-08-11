<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>

	<%@ include file="/common/sirius-header.jsp"%>

	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/productCategoryFilter.jsp"%>

</head>
<!-- BEGIN OF BODY -->
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

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">${breadcrumb }</td>
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
						<div class="toolbar-clean" style="display:none;">
					  		<c:if test='${access.add}'>
					  			<a class="item-button-new" href="<c:url value='/page/productcategorypreadd.htm'/>"><span><spring:message code='new'/></span></a>
					  		</c:if>
							<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span><spring:message code='filter'/></span></a>
							</div>
					  	</div>


						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/productcategorypreadd.htm'/>"><span>New Category</span></a>
                                        </c:if>
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
		  			  	  	<th width="15%">ID</th>
		  			 	  	<th width="25%">Name</th>
		  			  	  	<th width="11%">Type</th>
                            <th width="19%">Parent</th>
		  			  	  	<th width="24%">Note</th>
				  		</tr>
						<c:forEach items="${categorys}" var="cat">
						<tr>
				  			<td class="tools">
				  				<c:if test='${access.edit}'>
				  					<a class="item-button-edit"  href="<c:url value='/page/productcategorypreedit.htm?id=${cat.id}'/>"><span>Edit</span></a>
								</c:if>
								<c:if test='${access.delete}'>
				  					<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productcategorydelete.htm?id=${cat.id}'/>');"><span>Delete</span></a>
				  				</c:if>
				  			</td>
				  			<td><c:out value='${cat.code}'/></td>
							<td><c:out value='${cat.name}'/></td>
							<td><c:out value='${cat.type}'/></td>
                            <td><c:out value='${cat.parent.name}'/></td>
							<td><c:out value='${cat.note}'/></td>
				  		</tr>
				  		</c:forEach>
				  		<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
				  		</table>
		    		</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>

	<!-- /footer -->
</div><!-- /main containers -->

</body>
</html>