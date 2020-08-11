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
	<%@ include file="/filter/onHandQuantityFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			  	<c:if test="${param.cat == '1'}">
					<td width="60%">Inventory > Stock Unit > Stock > Stock Motor</td>
				</c:if>
			  	<c:if test="${param.cat == '2'}">
					<td width="60%">Inventory > Stock Unit > Stock > Stock Sparepart</td>
				</c:if>
			  	<c:if test="${param.cat == '3'}">
					<td width="60%">Inventory > Stock Unit > Stock > Stock Accessories</td>
				</c:if>
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
			  			<c:if test="${param.cat == '1'}">
							<h1 class="page-title">IO01 Stock Motor</h1>
						</c:if>
			  			<c:if test="${param.cat == '2'}">
							<h1 class="page-title">IO03 Stock Sparepart</h1>
						</c:if>
			  			<c:if test="${param.cat == '3'}">
							<h1 class="page-title">IO02 Stock Acesscories</h1>
						</c:if>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
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
							<th width="1%"><div style="width:40px"></div></th>
			  	  	  	  	<th width="10%">ID</th>
			  	  	  	  	<th width="20%">Product</th>
			  	  	  	  	<c:if test="${param.cat == '1'}">
			  	  	  	  		<th width="12%">Tipe</th>
			  	  	  	  		<th width="12%">Nama Tipe</th>
				  	  	  	  	<th width="12%">Warna</th>
	               	  	  	  	<!-- <th width="10%">Category</th> -->
	               	  	  	  	<th width="8%">On Hand</th>
	                            <th width="8%">Available</th>
	                            <th width="8%">Reserved</th>
			  	  	  	  	</c:if>
			  	  	  	  	<c:if test="${param.cat == '2'}">
	               	  	  	  	<th width="8%">On Hand</th>
	               	  	  	  	<th width="60%">HET</th>
			  	  	  	  	</c:if>
			  	  	  	  	<c:if test="${param.cat == '3'}">
			  	  	  	  		<th width="12%">Tipe</th>
			  	  	  	  		<th width="12%">Merk</th>
				  	  	  	  	<th width="12%">Warna</th>
	               	  	  	  	<!-- <th width="10%">Category</th> -->
	               	  	  	  	<th width="8%">On Hand</th>
	                            <th width="8%">Available</th>
	                            <th width="8%">Reserved</th>
			  	  	  	  	</c:if>
                           <!--  <th width="5%">UoM</th> -->
						</tr>
						<c:forEach items="${onhands}" var="on">
						<tr>
							<td class="tools">
			  	  	  	  		<c:if test="${param.cat == '1'}">
									<a class="item-button-edit" href="<c:url value='/page/onhandquantityeditview.htm?cat=${param.cat}&product=${on.product.id}&headOffice=${param.headOffice}'/>"  title="Edit"><span>Edit</span></a>
								</c:if>
			  	  	  	  		<c:if test="${param.cat == '2'}">
									<a class="item-button-edit" href="<c:url value='/page/onhandquantityeditsparepartview.htm?cat=${param.cat}&product=${on.product.id}&headOffice=${param.headOffice}'/>"  title="Edit"><span>Edit</span></a>
								</c:if>
			  	  	  	  		<c:if test="${param.cat == '3'}">
									<a class="item-button-edit" href="<c:url value='/page/onhandquantityeditaccessoriesview.htm?cat=${param.cat}&product=${on.product.id}&headOffice=${param.headOffice}'/>"  title="Edit"><span>Edit</span></a>
								</c:if>
							</td>
							<%-- <c:if test="${on.product.serial}">
								<td class="tools">
									<a class="item-button-edit" href="<c:url value='/page/onhandquantityeditview.htm?cat=${param.cat}&product=${on.product.id}'/>"  title="Edit"><span>Edit</span></a>
								</td>
							</c:if>
							<c:if test="${!on.product.serial}">
								<td>&nbsp;</td>
							</c:if> --%>
							<td><c:out value='${on.product.code}'/></td>
							<td><c:out value='${on.product.name}'/></td>
			  	  	  	  	<c:if test="${param.cat == '1'}">
								<td><c:out value='${on.product.types}'/></td>
								<td><c:out value='${on.product.typeNames}'/></td>
								<td><c:out value='${on.product.colors}'/></td>
								<%-- <td><c:out value='${on.product.productCategory.name}'/></td> --%>
								<td><fmt:formatNumber value='${on.onHand+on.onTransfer}' pattern=',##0.00'/></td>
	                            <td><fmt:formatNumber value='${on.onHand - on.product.reservedStock}' pattern=',##0.00'/></td>
	                            <td><fmt:formatNumber value='${on.product.reservedStock}' pattern=',##0.00'/></td>
	                            <%-- <td><c:out value='${on.product.unitOfMeasure.measureId}'/></td> --%>
							</c:if>
			  	  	  	  	<c:if test="${param.cat == '2'}">
								<td><fmt:formatNumber value='${on.onHand+on.onTransfer}' pattern=',##0.00'/></td>
								<td><fmt:formatNumber value='${on.product.defaultHET}' pattern=',##0.00'/></td>
							</c:if>
			  	  	  	  	<c:if test="${param.cat == '3'}">
								<td><c:out value='${on.product.types}'/></td>
								<td><c:out value='${on.product.brand}'/></td>
								<td><c:out value='${on.product.colors}'/></td>
								<td><fmt:formatNumber value='${on.onHand+on.onTransfer}' pattern=',##0.00'/></td>
	                            <td><fmt:formatNumber value='${on.onHand - on.product.reservedStock}' pattern=',##0.00'/></td>
	                            <td><fmt:formatNumber value='${on.product.reservedStock}' pattern=',##0.00'/></td>
							</c:if>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
						</table>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
								</tr>
							</table>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>

</body>
</html>
