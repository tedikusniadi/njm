<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Issue >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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

						<h1 class="page-title">I25 - Goods Issue</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/goodsissueview.htm'/>"><span>List</span></a>
							<a class="item-button-next" style="cursor:pointer;"><span>Next</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsIssue_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsIssue_add.warehouseTransaction.issuedFacility.id}"><c:out value='${goodsIssue_add.warehouseTransaction.issuedFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${now}'/>" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          	<td width="74%">
												<c:if test="${goodsIssue_add.warehouseTransaction.transactionSource == 'DELIVERY_ORDER'}">
                                                	<input value="Delivery Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsIssue_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45'/>
                                                </c:if>
                                          	</td>
                                        </tr>
                                        <tr>
                                        	<td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Issued From :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.issuedFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Destination :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Issued</th>
                                                <th width="22%">Issue</th>
                                            </tr>
                                            <c:forEach items='${goodsIssue_add.warehouseTransaction.issueables}' var='rec'>
                                            <tr>
                                            	<td>${rec.product.name}</td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="pro-${rec.product.id}" value="${rec.quantity}"/>
                                                </td>
                                                <td>
                                                	<input id="rec" value="<fmt:formatNumber value='${rec.issued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="rec-${rec.product.id}" value="${rec.issued}"/>
                                                    </td>
                                                <td><input id="unrec-${rec.product.id}" value="<fmt:formatNumber value='${rec.unissued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
                                <br/>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                   	<th width="25%">Product</th>
	  	  	  	  	  	  			<th width="20%">Tipe</th>
	  	  	  	  	  	  			<th width="15%">Nama Tipe</th>
                                    <th width="15%">Warna</th>
                                  	<th width="8%">Jumlah</th>
                                    <!-- <th width="8%">Satuan</th> -->
                                    <th width="25%">Grid</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsIssue_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<td><input class="input-disabled" size="40" value="${item.warehouseTransactionItem.product.name}" disabled/></td>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.types}" disabled/></td>
                                	<td><input class="input-disabled" size="20" value="${item.warehouseTransactionItem.product.typeNames}" disabled/></td>
                                	<td><input class="input-disabled" size="20" value="${item.warehouseTransactionItem.product.colors}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='5' value="<fmt:formatNumber value='${item.issued}' pattern=',##0.00'/>"/></td>
                                    <%-- <td><input class="input-disabled" size="7" value="${item.warehouseTransactionItem.measureName}" disabled/></td> --%>
                                    <td>
                                    	<form:select id='grid[${status.index}]' path='items[${status.index}].grid' cssClass='combobox'>
                                        </form:select>
                                        &nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('grid[${status.index}]');;" style="CURSOR:pointer;" title="Grid" />
									</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>

</div>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.item-button-next').click(function(){
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
				
				for(var idx=0;idx<len;idx++) {
					var product = t_section.rows[idx].cells[0].firstChild.value;
					var grid = document.getElementById('grid['+idx+']').value;
					if(grid == '')
					{
						alert('Please select Grid for Product '+product+' first !!!');
						return
					}
				}
			}
			$("#addForm").attr("action","<c:url value='/page/goodsissuepreadd3.htm'/>");
			$("#addForm").submit();
		});
	});

	function opengrid(target)
	{
		var fac = document.getElementById('facility');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

</script>