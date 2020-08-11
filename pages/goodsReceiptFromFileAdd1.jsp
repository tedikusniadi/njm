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
	<script type="text/javascript" src="assets/dialog.js"></script>
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
						<br/>

						<strong>Reference :</strong>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<thead>
                        <tr>
						  <th width="1%"><div style="width:20px"></div></th>
                          <th width="8%">Tanggal</th>
			  	  	  	  <th width="15%">Gudang</th>
	  	  	  	  	  	  <th width="15%">No.Referensi / Nama</th>
	  	  	  	  	  	  <th width="12%">No Sales Order</th>
	  	  	  	  	  	  <th width="12%">Warna</th>
	  	  	  	  	  	  <th width="12%">Tipe</th>
       	  	  	  	  	  <th width="8%">Jumlah</th>
                          <th width="18%">Dari</th>
						</tr>
                        </thead>
                        <tbody>
						<c:forEach items="${receiptables}" var="rec">
						<tr>
							<td class="tools"><a class="item-button-edit" href="<c:url value='/page/goodsreceiptfromfilepreadd2.htm?id=${rec.id}'/>" title="Edit"><span>Edit</span></a></td>
                            <td><fmt:formatDate value='${rec.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${rec.receiptFacility.name}'/></td>
							<td><strong><c:out value='${rec.code}'/></strong></td>
							<td colspan="4"><strong><c:out value='${rec.salesOrderNo}'/></strong></td>
                            <td><c:out value='${rec.receiveFrom}'/></td>
						</tr>
                        <c:forEach items="${rec.receiptables}" var="item">
                        <c:if test="${item.product.productCategory.id == 1}">
                        <tr>
							<td></td>
							<td></td>
							<td></td>
							<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${item.product.names}'/></td>
							<td><c:out value='${item.product.colors}'/></td>
							<td><c:out value='${item.product.types}'/></td>
                            <td><fmt:formatNumber value='${item.unreceipted}' pattern='#'/></td>
                            <td>&nbsp;</td>
						</tr>
						</c:if>
                        </c:forEach>
						</c:forEach>
                        </tbody>
                        <tfoot>
						<tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                        </tfoot>
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
