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
	<%@ include file="/filter/productFilter.jsp"%>
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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>

						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<c:if test='${access.add}'>
                                        	<a class="item-button-new" href="<c:url value='/page/productpreadd.htm?categoryId=1' />"><span>New Product</span></a>
                                        </c:if>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
										<a class="item-button-print" href="<c:url value='/page/productprintoption.htm?categoryId=1' />"><span>Print</span></a>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
								</tr>
							</table>
					  	</div>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:45px"></div></th>
					  	  	<th width="12%">ID</th>
						  	<th width="25%">Product</th>
					  	  	<th width="15%">Tipe</th>
					  	  	<th width="15%">Nama Tipe</th>
					  	  	<th width="15%">Warna</th>
					  	  	<!-- <th width="10%">Goods/Service</th>
                          	<th width="10%">Category</th> -->
					  	  	<th width="10%">Note</th>
						</tr>
						<c:forEach items="${products}" var="product">
						<tr>
						 	<td class="tools">
                            	<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/productpreedit.htm?id=${product.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
								<c:if test='${access.delete}'>
                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productdelete.htm?id=${product.id}'/>','${product.name}');" title="Delete"><span>Delete</span></a>
                                </c:if>
						 	</td>
						 	<td>${product.code}</td>
							<td>${product.name}</td>
							<td>${product.types}</td>
							<td>${product.typeNames}</td>
							<td>${product.colors}</td>
                            <%-- <td>${product.type}</td>
							<td>${product.productCategory.name}</td> --%>
							<td>${product.note}</td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
					  </table>
					  	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
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
</html>
