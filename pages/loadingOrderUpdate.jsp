<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loading Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/loadingorderedit.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Procurement > Pertamina Procurement > Loading Order > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P24 - Loading Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/loadingorderview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                                <a class="item-button-add-gl-child" href="<c:url value='/page/loadingorderplanpreadd.htm?id=${order_edit.id}'/>"><span>Add LO</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="51%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                          <td width="30%" nowrap="nowrap" align="right">LO Internal ID :</td>
                                          <td width="70%"><input name="code" value="${order_edit.code}" size='35'/></td>
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
                                          <td nowrap="nowrap" align="right">Valid To Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${order_edit.validTo}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          <td width="30%" nowrap="nowrap" align="right">PO Pertamina No :</td>
                                          <td width="70%"><a href="<c:url value='/page/${order_edit.purchaseOrder.uri}?id=${order_edit.purchaseOrder.id}'/>">
                                          <c:out value='${order_edit.purchaseOrder.code}'/></a></td>
                                        </tr>
                                      </table>
                                  	</td>
                                    <td width="49%" valign="top">
                                    	<fieldset>
                                        	<legend>Product Information</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<th width="47%" align="center">Product Name</th>
                                                <th width="19%" align="center">Quantity</th>
                                                <th width="18%" align="center">Assigned</th>
                                                <th width="16%" align="center">Unassigned</th>
                                            </tr>
                                            <c:forEach items='${order_edit.purchaseOrder.loadingableItems}' var='item'>
                                            <tr>
                                            	<td width="47%" align="left"><c:out value='${item.product.code} - ${item.product.name}'/></td>
                                                <td width="19%" align="center"><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                                <td width="18%" align="center"><fmt:formatNumber value='${item.assigned}' pattern=',##0.00'/></td>
                                                <td width="16%" align="center"><fmt:formatNumber value='${item.quantity - item.assigned}' pattern=',##0.00'/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                        	<legend>Reference</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<td width="46%" align="right">Pertamina SO : </td>
                                          		<td width="54%" align="right">
                               	  					<c:forEach items='${order_edit.purchaseOrder.verifications}' var='ver'>
                                            			<c:out value='${ver.invoice}'/><br/>
                                            		</c:forEach>
                                                </td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <c:if test='${not empty order_edit.plans}'>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 385px;">
                                	<c:forEach items='${order_edit.plans}' var='plan'>
                                    	<div id="${plan.id}" dojoType="ContentPane" label="${plan.no}" class="tab-pages" refreshOnShow="true">
                                            <div class="toolbar-clean">
                                            	<c:if test='${access.edit}'>
                                                	<a class="item-button-edit" href="<c:url value='/page/loadingorderplanpreedit.htm?id=${plan.id}'/>"><span>Edit</span></a>
                                                </c:if>
                                                <c:if test="${access.delete and !plan.collected and plan.journalEntry.entryStatus != 'POSTED'}">
				  									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/loadingorderplandelete.htm?id=${plan.id}'/>');" title="Delete"><span>Delete</span></a>
                                                </c:if>
                                                <c:if test='${access.delete and !plan.collected and empty plan.collectingOrder}'>
				  									<a class="item-button-create-delivery-planning" href="<c:url value='/page/collectingorderpreadd2.htm?id=${plan.id}'/>"><span>Collecting Order</span></a>
                                                </c:if>
                                                <!--
												<a class="item-button-print" href="<c:url value='/page/loadingorderprint.htm?id=${order_edit.id}&no=${plan.no}'/>"><span>Print</span></a>
                                                -->

                                            	<div class="item-navigator">&nbsp;</div>
                                            </div>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="16%" nowrap="nowrap" align="right">Loading Order No :</td>
                                              	<td width="35%"><input class='input-disabled' size='10' value="${plan.no}"/></td>
                                                <td width="10%" align="right" nowrap="nowrap">Vehicle Information :</td>
                                              	<td width="39%"><input class='input-disabled' disabled='true' value="${plan.vehicleNo}"/></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Date :</td>
                                                <td><input class="input-disabled" disabled value="<fmt:formatDate value='${plan.date}' pattern='dd-MM-yyyy'/>" size='15'/></td>
                                                <td nowrap="nowrap" align="right">Driver Name :</td>
                                                <td><input class='input-disabled' disabled='true' value="${plan.driverName}"/></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Shipping :</td>
                                                <td><input class='input-disabled' disabled='true' value="${plan.shipping}"/></td>
                                                <td nowrap="nowrap" align="right">Filling Point :</td>
                                                <td><input class='input-disabled' disabled='true' value="${plan.fillingPoint}"/></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Delivery :</td>
                                                <td><input class='input-disabled' disabled='true' value="${plan.delivery}"/></td>
                                                <td nowrap="nowrap" align="right">Seal No :</td>
                                                <td><input class='input-disabled' disabled='true' value="${plan.seal}"/></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Ship From :</td>
                                                <td><input class="input-disabled" disabled size="30" value="${plan.loadingOrder.purchaseOrder.shipTo.code} - ${plan.loadingOrder.purchaseOrder.shipTo.name}"/></td>
                                                <td nowrap="nowrap" align="right">Note :</td>
                                                <td rowspan="2"><textarea cols='40' rows='3' class="input-disabled" disabled>${plan.note}</textarea></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Valid From :</td>
                                                <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${plan.validFrom}' pattern='dd-MM-yyyy'/>"/>&nbsp;&nbsp;To&nbsp;&nbsp;<input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${plan.validTo}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" align="right">Collecting Order No :</td>
                                                <td><a href="<c:url value='/page/collectingorderpreedit.htm?id=${plan.collectingOrder.id}'/>"><c:out value='${plan.collectingOrder.code}'/></a></td>
                                            </tr>
                                            </table>
                                            <div class="clears">&nbsp;</div>
                                            <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                            <thead>
                                            <tr>
                                                <th width="34%">Product</th>
                                                <th width="13%">Quantity</th>
                                                <th width="7%">UoM</th>
                                                <th width="46%">Note</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${plan.items}" var="line" varStatus='status'>
                                            <tr>
                                                <td><c:out value='${line.item.product.code} ${line.item.product.name}'/></td>
                                                <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                                <td><c:out value='${line.item.product.unitOfMeasure.measureId}'/></td>
                                                <td><c:out value='${line.note}'/></td> 
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                            </table>
                                        </div>
                                    </c:forEach>
                                </div>
                                </c:if>
							    <div class="info">Created by : <c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName}'/> (<fmt:formatDate value='${order_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
							</form:form>
						</div>
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
<%@ include file="/common/dialog.jsp"%>
</html>