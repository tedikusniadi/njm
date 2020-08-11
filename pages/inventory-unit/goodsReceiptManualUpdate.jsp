<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
					  	<div class="toolbar">
							<a class="item-button-list" href="javascript:history.back();"><span>List</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="goodsReceipt">
								<table width="100%" style="border:none" >
                                <tr>
                                	<td width="53%" valign="top">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="${goodsReceipt.code}" class='input-disabled' size='35'/></td>
                                        </tr>
                                        <tr>
											<td nowrap="nowrap" align="right">Organization :</td>
											<td>
												<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option><c:out value='${goodsReceipt.organization.name}'/></option>
                                                </select>
											</td>
										</tr>
										<tr>
											<td nowrap="nowrap" align="right">Facility :</td>
											<td>
												<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option><c:out value='${goodsReceipt.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
											</td>
										</tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size='10' class="input-disabled" disabled value="<fmt:formatDate value='${goodsReceipt.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
										<fieldset>
                                        	<legend><strong>Journal Reference </strong></legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${goodsReceipt.journalEntry.id}'/>">
                                                <c:out value='${goodsReceipt.journalEntry.code}'/>
                                            </a>
                                        </fieldset>
										<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${goodsReceipt.items}' var='rec'>
                                            <tr>
                                            	<td><c:out value='${rec.warehouseTransactionItem.product.name}'/></td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.quantity - rec.warehouseTransactionItem.unissued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.receipted - rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td><input value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
								</form:form>
                                <div class="clears">&nbsp;</div>
	                            	<div id="item" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                       <tr>
		                                    <th width="18%">Nama</th>
			  	  	  	  	  	  			<th width="15%">Merk</th>
		                                    <th width="15%">Warna</th>
			  	  	  	  	  	  			<th width="18%">Grid</th>
		                                  	<th width="8%">Jumlah</th>
		                                    <th width="26%">Satuan/No.Serial</th>
		                                </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${goodsReceipt.items}' var='item' varStatus='status'>
		                                <tr>
		                                	<td>${item.product.name}</td>
		                                	<td>${item.product.brand}</td>
		                                	<td>${item.product.primaryColors}</td>
		                                	<td>${item.grid.name}</td>
		                                    <td><fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/></td>
		                                    <td>${item.product.unitOfMeasure.measureId}</td>
		                                </tr>
			                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
			                                	<tr>
				                                	<td colspan="4"></td>
				                                    <td><fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/></td>
				                                    <td>${detail.serial}</td>
				                                </tr>
			                                </c:forEach>
		                                </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                        </table>
                                </div>
							</div>
							<div class="info">Created by : <c:out value='${goodsReceipt.createdBy.firstName} ${goodsReceipt.createdBy.middleName} ${goodsReceipt.createdBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${goodsReceipt.updatedBy.firstName} ${goodsReceipt.updatedBy.middleName} ${goodsReceipt.updatedBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>