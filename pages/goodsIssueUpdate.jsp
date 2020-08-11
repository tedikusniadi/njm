<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Issue >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/goodsissueedit.htm'/>";
			document.editForm.submit();
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Inventory > Warehouse Management > Goods Issue > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I25 - Goods Issue</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/goodsissueview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
							</c:if>
							<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/goodsissueprintoutoption.htm?id=${goodsIssue_edit.id}'/>"><span>Print</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="goodsIssue_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="74%"><input value="${goodsIssue_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsIssue_edit.warehouseTransaction.issuedFacility.id}"><c:out value='${goodsIssue_edit.warehouseTransaction.issuedFacility.name}'/></option>
                                                </select>
                                        	</td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size='10' class="input-disabled" disabled value="<fmt:formatDate value='${goodsIssue_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
												<c:if test="${goodsIssue_edit.warehouseTransaction.transactionSource == 'DELIVERY_ORDER'}">
                                                	<input value="Delivery Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsIssue_edit.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45'/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsIssue_edit.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Issued From :</td>
                                          <td width="74%"><input value="${goodsIssue_edit.warehouseTransaction.issuedFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Destination :</td>
                                          <td width="74%"><input value="${goodsIssue_edit.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Journal Entry</strong></legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${goodsIssue_edit.journalEntry.id}'/>"><c:out value='${goodsIssue_edit.journalEntry.code}'/></a>
                                        </fieldset>
                                        <fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Issued</th>
                                                <th width="22%">Issued</th>
                                            </tr>
                                            <c:forEach items='${goodsIssue_edit.items}' var='rec'>
                                            <tr>
                                            	<td><c:out value='${rec.warehouseTransactionItem.product.name}'/></td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.issued - rec.issued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td><input value="<fmt:formatNumber value='${rec.issued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
                                <br/>
	                            <div class="clears">&nbsp;</div>
	                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
	                            <div id="unit" dojoType="ContentPane" label="Produk" class="tab-pages" refreshOnShow="true">
	                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
	                                <thead>
	                                <tr>
	                                    <!-- <th width="25%">Product</th> -->
		  	  	  	  	  	  			<th width="15%">Tipe</th>
		  	  	  	  	  	  			<th width="15%">Nama Tipe</th>
	                                    <th width="15%">Warna</th>
	                                    <th width="10%">Grid</th>
	                                  	<th width="10%">Issued</th>
	                                    <th width="13%">No.Mesin</th>
	                                    <th width="13%">No.Rangka</th>
	                                    <th width="9%">Tahun</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items='${goodsIssue_edit.items}' var='item' varStatus='status'>
	                                <c:if test="${item.warehouseTransactionItem.product.productCategory.id == 1}">
	                                <tr>
	                                	<%-- <td><c:out value='${item.warehouseTransactionItem.product.name}'/></td> --%>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.types}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.typeNames}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.colors}'/></td>
	                                	<td><c:out value='${item.grid.name}'/></td>
	                                    <td><fmt:formatNumber value='${item.issued}' pattern='#,###'/></td>
	                                    <%-- <td><c:out value='${item.warehouseTransactionItem.measureName}'/></td> --%>
	                                    <td colspan="3">&nbsp;</td>
	
	                                </tr>
	                                <c:forEach items="${item.details}" var="detail">
	                                	<tr>
			                             	<!-- <td></td> -->
			                             	<td></td>
			                             	<td></td>
			                             	<td></td>
			                             	<td></td>
			                                 <td><fmt:formatNumber value='${detail.quantity}' pattern='#,###'/></td>
			                                 <td><c:out value='${detail.serial}'/></td>
			                                 <td><c:out value='${detail.serialExt1}'/></td>
			                                 <td><c:out value='${detail.year}'/></td>
			                             </tr>
	                                </c:forEach>
	                                </c:if>
	                                </c:forEach>
	                                </tbody>
	                                <tfoot><tr class="end-table"><td colspan="8">&nbsp;</td></tr></tfoot>
	                                </table>
                                </div>
	                            <div id="acc" dojoType="ContentPane" label="Aksessoris" class="tab-pages" refreshOnShow="true">
	                                <table id="lineItemTable_acc" width="100%" cellpadding="0" cellspacing="0" class="table-list">
	                                <thead>
	                                <tr>
		  	  	  	  	  	  			<th width="25%">Produk</th>
		  	  	  	  	  	  			<th width="15%">Merk</th>
	                                    <th width="15%">Warna</th>
	                                    <th width="15%">Grid</th>
	                                  	<th width="15%">Issued</th>
	                                    <th width="15%">Serial</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items='${goodsIssue_edit.items}' var='item' varStatus='status'>
	                                <c:if test="${item.warehouseTransactionItem.product.productCategory.id == 3}">
	                                <tr>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.name}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.brand}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.primaryColors}'/></td>
	                                	<td><c:out value='${item.grid.name}'/></td>
	                                    <td><fmt:formatNumber value='${item.issued}' pattern='#,###'/></td>
	                                    <td>&nbsp;</td>
	                                </tr>
	                                <c:if test="${item.warehouseTransactionItem.product.serial}">
	                                <c:forEach items="${item.details}" var="detail">
	                                	<tr>
			                             	<td colspan="4">&nbsp;</td>
			                                <td><fmt:formatNumber value='${detail.quantity}' pattern='#,###'/></td>
			                                <td><c:out value='${detail.serial}'/></td>
			                             </tr>
	                                </c:forEach>
	                                </c:if>
	                                </c:if>
	                                </c:forEach>
	                                </tbody>
	                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
	                                </table>
                                </div>
                                <div id="sparepart" dojoType="ContentPane" label="Sparepart" class="tab-pages" refreshOnShow="true">
	                                <table id="lineItemTable_sparepart" width="100%" cellpadding="0" cellspacing="0" class="table-list">
	                                <thead>
	                                <tr>
		  	  	  	  	  	  			<th width="25%">Produk</th>
		  	  	  	  	  	  			<th width="15%">Merk</th>
	                                    <th width="15%">Quality</th>
	                                    <th width="15%">Grid</th>
	                                  	<th width="15%">Issued</th>
	                                    <th width="15%">Serial</th>
	                                </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach items='${goodsIssue_edit.items}' var='item' varStatus='status'>
	                                <c:if test="${item.warehouseTransactionItem.product.productCategory.id == 2}">
	                                <tr>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.name}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.brand}'/></td>
	                                	<td><c:out value='${item.warehouseTransactionItem.product.quality}'/></td>
	                                	<td><c:out value='${item.grid.name}'/></td>
	                                    <td><fmt:formatNumber value='${item.issued}' pattern='#,###'/></td>
	                                    <td>&nbsp;</td>
	                                </tr>
	                                <c:if test="${item.warehouseTransactionItem.product.serial}">
	                                <c:forEach items="${item.details}" var="detail">
	                                	<tr>
			                             	<td colspan="4">&nbsp;</td>
			                                <td><fmt:formatNumber value='${detail.quantity}' pattern='#,###'/></td>
			                                <td><c:out value='${detail.serial}'/></td>
			                             </tr>
	                                </c:forEach>
	                                </c:if>
	                                </c:if>
	                                </c:forEach>
	                                </tbody>
	                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
	                                </table>
                                </div>
                                </div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${goodsIssue_edit.createdBy.firstName} ${goodsIssue_edit.createdBy.middleName} ${goodsIssue_edit.createdBy.lastName}'/> (<fmt:formatDate value='${goodsIssue_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${goodsIssue_edit.updatedBy.firstName} ${goodsIssue_edit.updatedBy.middleName} ${goodsIssue_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${goodsIssue_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>