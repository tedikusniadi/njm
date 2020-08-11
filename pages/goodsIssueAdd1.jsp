<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Issue >> Add</title>
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
				<td width="60%">Inventory > Warehouse Management > Goods Issue > Add</td>
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
						<h1 class="page-title">I25 - Goods Issue</h1>
						<br/>

						<strong>Reference :</strong>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							  <th width="4%"><div style="width:20px"></div></th>
							 <th width="10%">Tanggal</th>
				  	  	  	  <th width="12%">Gudang</th>
				  	  	  	  <th width="12%">Destination</th>
		  	  	  	  	  	  <th width="30%">No.Referensi / Nama</th>
		  	  	  	  	  	  <th width="15%">Warna</th>
		  	  	  	  	  	  <th width="15%">Tipe</th>
	       	  	  	  	  	  <th width="8%">Jumlah</th>
						</tr>
						<c:forEach items="${receiptables}" var="rec">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/goodsissuepreadd2.htm?id=${rec.id}'/>"  title="Edit"><span>Edit</span></a>
							</td>
							<td><fmt:formatDate value="${rec.date}" pattern="dd-MM-yyyy"/></td>
							<td><c:out value='${rec.issuedFacility.name}'/></td>
							<td><c:out value='${rec.receiptFacility.name}'/></td>
							<td><c:out value='${rec.code}'/></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                        <c:forEach items="${rec.issueables}" var="item">
                        <tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${item.product.name}'/></td>
							<td><c:out value='${item.product.colors}'/></td>
							<td><c:out value='${item.product.types}'/></td>
                            <td><fmt:formatNumber value='${item.unissued}' pattern=',##0.00'/></td>
						</tr>
                        </c:forEach>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
						</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

 	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
