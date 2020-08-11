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
							<a class="item-button-list" href="<c:url value='/page/accessoriespurchaseorderview.htm'/>"><span><spring:message code="list"/></span></a>
					  	</div>

						<div class="main-box">
							<table width="100%" border="0">
                               <tr>
                               	<td width="59%">
                                  	  <table width="100%" style="border:none">
                                       <tr>
                                           <td width="28%" nowrap="nowrap" align="right"><spring:message code="id"/></td>
                                         <td width="72%"><input value="${purchaseOrder.code }" class='input-disabled' size='25' disabled/></td>
                                       </tr>
                                       <tr>
                                           <td nowrap="nowrap" align="right">Fasilitas</td>
                                           <td>
                                           	<select class="combobox-ext input-disabled" disabled>
                                           		<option>${purchaseOrder.organization.code} ${purchaseOrder.organization.name}</option>
                                           	</select>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td nowrap="nowrap" align="right">Gudang Penerimaan</td>
                                           <td>
                                           	<select class="combobox-ext input-disabled" disabled>
                                           		<option>${purchaseOrder.shipTo.name}</option>
                                           	</select>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td nowrap="nowrap" align="right">Tanggal</td>
                                           <td><input class="input-disabled" disabled value="<fmt:formatDate value='${purchaseOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
                                       </tr>
                                       <tr>
                                           <td nowrap="nowrap" align="right">Pemasok</td>
                                           <td>
                                           	<select disabled class="combobox-ext input-disabled">
                                           		<option>${purchaseOrder.supplier.name}</option>
                                           	</select>
                                           </td>
                                       </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">No. Nota Debit</td>
                                            <td><input class='input-disabled' disabled value="${purchaseOrder.invoiceNo}"/></td>
                                       </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">No. Sales Order</td>
                                            <td><input class='input-disabled' disabled value="${purchaseOrder.salesOrderNo}"/></td>
                                       </tr>
                                       </table>
                                   </td>
                               </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                            <div id="info" dojoType="ContentPane" label="Item" class="tab-pages" refreshOnShow="true">
                            	<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                   	<th width="1%">&nbsp;</th>
                                    <th width="30%"><spring:message code='product'/></th>
                                    <th width="15%">Merk</th>
                                    <th width="15%"><spring:message code="color"/></th>
                                    <th width="39%"><spring:message code="quantity"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                   	<c:forEach items="${purchaseOrder.items}" var="item" varStatus='itemStatus'>
	                                <tr>
	                                	<td>&nbsp;</td>
	                                    <td><c:out value='${item.product.name}'/></td>
	                                    <td><c:out value='${item.product.brand}'/></td>
	                                    <td><c:out value='${item.product.primaryColors}'/></td>
	                                    <td><fmt:formatNumber value='${item.quantity}' pattern='#,###'/></td>
	                                </tr>
	                                </c:forEach>
                                </tbody>
                                <tfoot>
                                	<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                </tfoot>
                                </table>
                            </div>
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
