<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/collectingorderedit.htm'/>";
			document.addForm.submit();
		}
				
		function openvehicle()
		{
			openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&organization=${order_edit.organization.id}&type=${order_add.vehicle.id}'/>");
		}
    
    function opendriver()
    {
		  openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization=${order_edit.organization.id}'/>");
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
			<td width="60%">Procurement > Pertamina Procurement > Collecting Order > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P25 - Collecting Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/collectingorderview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.add and order_edit.receiptable}'>
                            	<a class="item-button-add-gl-child" href="<c:url value='/page/goodsreceiptpreadd2.htm?id=${order_edit.id}'/>"><span>Goods Receipt</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/collectingorderprint.htm?id=${order_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="19%" nowrap="nowrap" align="right">ID :</td>
                               	  <td width="52%"><input name="code" value="${order_edit.code}" size='25'/></td>
                                    <td width="29%" rowspan="5" valign="top">
                                    	<fieldset>
                                        	<legend>Goods Receipt Information</legend>
                                            <c:forEach items='${order_edit.receipts}' var='receipt'>
                                            	<a href="<c:url value='/page/goodsreceiptpreedit.htm?id=${receipt.id}'/>"><c:out value='${receipt.code}'/></a><br/>
                                            </c:forEach>
                                        </fieldset>
                                  </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <select class="combobox-ext" disabled='true'>
                                            <option><c:out value='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${order_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td width="19%" nowrap="nowrap" align="right">Reference :</td>
                               	  <td width="52%"><a href="<c:url value='/page/loadingorderpreedit.htm?id=${order_edit.loadingOrderPlan.loadingOrder.id}'/>">
                           	      <c:out value='${order_edit.loadingOrderPlan.loadingOrder.code}.${order_edit.loadingOrderPlan.no}'/></a></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true" selected='true'>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="32%">Product</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="9%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${order_edit.loadingOrderPlan.items}' var='line'>
                                        <tr>
                                        	<td><c:out value='${line.item.product.code} - ${line.item.product.name}'/></td>
                                        	<td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.item.product.unitOfMeasure.measureId}'/></td>
                                            <td><c:out value='${line.note}'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="20%" align="right">Ship To Address : </td>
                                      <td width="80%">
                           	  <select class="combobox-ext" disabled>
                                                    <option ><c:out value='${order_edit.loadingOrderPlan.loadingOrder.purchaseOrder.shipTo.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="status" dojoType="ContentPane" label="Delivery" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="20%" align="right" nowrap="nowrap">Vehicle Type :</td>
                                   		  	<td width="80%">
												<form:select id="type" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                                        <form:option value='${order_edit.vehicle.type.id}' label='${order_edit.vehicle.type.name}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Vehicle :</td>
                                            <td>
                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.vehicle}'>
                                                        <form:option value='${order_edit.vehicle.id}' label='${order_edit.vehicle.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openvehicle();" style="CURSOR:pointer;" title="Vehicle" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Driver :</td>
                                            <td>
                                                <form:select id="driver" path="driver" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.driver}'>
                                                        <form:option value='${order_edit.driver.id}' label='${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opendriver();" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : ${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName} (<fmt:formatDate value='${order_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName} (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>