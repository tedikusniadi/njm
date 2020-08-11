<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Order Realization >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/deliveryorderrealizationedit.htm'/>";
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
			<td width="60%">Sales > Delivery Order Realization > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Delivery Order Realization</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryorderrealizationview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="54%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="74%"><input value="${order_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select id="org" path="organization" cssClass="combobox-ext">
                                                    <option><c:out value='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">DO Date :</td>
                                            <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.deliveryOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Customer :</td>
                                          <td width="74%"><input value="${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Reference :</td>
                                          	<td width="74%">
                                          		<a href="<c:url value='/page/deliveryorderpreedit.htm?id=${order_edit.deliveryOrder.id}'/>">
                                          			<c:out value='${order_edit.deliveryOrder.code}'/>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                    <option><c:out value='${order_edit.deliveryOrder.deliveryPlanningSequence.facility.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="46%" valign="top">
   	    		    					<fieldset>
                                        	<legend>DO Realization</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<td width="45%" align="right">Delivery Acceptance Date</td>
                                                <td width="1%">:</td>
                                              	<td width="53%"><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.acceptanceDate}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Document Return Date</td>
                                                <td>:</td>
                                                <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.docDate}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Note</td>
                                                <td>:</td>
                                           	  <td><form:textarea path='note' rows='4' cols='30'/></td>
                                        	</tr>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                        	<legend>Reference</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<td align="right">Journal Entry:</td>
                                                <td><a href="<c:url value='/page/journalentrypreview.htm?id=${order_edit.journalEntry.id}'/>"><c:out value='${order_edit.journalEntry.code}'/></a></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Product" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="30%">Product</th>
                                          	<th width="9%">Quantity</th>
                                          	<th width="7%">Accepted</th>
                                          	<th width="8%">Canceled</th>
                                          	<th width="8%">Resend</th>
                                          	<th width="6%">UoM</th>
                                          	<th width="32%">Billing</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_edit.items}" var="line" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${line.item.item.sequenceable.product.code} - ${line.item.item.sequenceable.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.item.item.quantity}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.accepted}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.returned}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.item.item.quantity - line.item.quantity - line.returned}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.item.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
                                            <td>
                                            	<c:forEach items='${line.lineItems}' var='lineItem'>
                                                	<a href="<c:url value='/page/billingpreedit.htm?id=${lineItem.billing.id}'/>"><c:out value='${lineItem.billing.code}'/></a>,
                                                </c:forEach>
                                            </td> 
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="exp" dojoType="ContentPane" label="Shipping & Expedition" class="tab-pages" refreshOnShow="true">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Expedition :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                	<option><c:out value='${order_edit.expedition.firstName} ${order_edit.expedition.lastName} ${order_edit.deliveryOrder.expedition.middleName}'/></option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Vehicle :</td>
                                            <td>
                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.vehicle}'>
                                                    <form:option value='${order_edit.vehicle.id}' label='${order_edit.vehicle.name}' />
                                                </c:if>
                                            </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Driver :</td>
                                            <td>
                                                <form:select id="driver" path="driver" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.driver}'>
                                                    <form:option value='${order_edit.driver.id}' label='${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}' />
                                                </c:if>
                                            </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rit :</td>
                                            <td><input size="5" disabled class="input-disabled" value="${order_edit.deliveryOrder.rit}"/></td>
                                        </tr>
                                        </table>
                                    </div>
                                    <div id="cost" dojoType="ContentPane" label="Cost Component" class="tab-pages" refreshOnShow="true">
                                    	<c:if test="${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.lockStatus == 'UNLOCK'}">
                                    	<div class="item-navigator">
                                            <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                            <tr>
                                            	<td width="30%" height="30" align="left" valign="middle">															
                                                    <div class="toolbar-clean">
                                                        <a class="item-button-new" href="<c:url value='/page/dorealizationcostcomponentpreadd.htm?id=${order_edit.id}' />"><span>New Cost</span></a>
                                                    </div>
                                            	</td>
                                            </tr>
                                            </table>
                                        </div>
                                        </c:if>
                                        <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list" selected='true'>
                                        <thead>
                                        <tr>
                                   	  	  	<th width="6%"><div style="width:25px"></div></th>
                                            <th width="16%">ID</th>
                                          	<th width="25%">Name</th>
                                          	<th width="8%">Amount</th>
                                          	<th width="7%">Tax</th>
                                          	<th width="20%">Inv Verification</th>
                                          	<th width="9%">Payment</th>
                                       	  	<th width="9%">Payment Amt</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_edit.costs}" var="cost" varStatus='status'>
                                        <tr>
                                            <td class="tools">
                                                <c:if test='${access.edit}'>
                                                    <a class="item-button-edit" href="<c:url value='/page/dorealizationcostcomponentpreedit.htm?id=${cost.id}'/>"><span>Edit</span></a>
                                                </c:if>
                                                <c:if test='${access.delete and !cost.verified}'>
                                                	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/dorealizationcostcomponentdelete.htm?id=${cost.id}'/>');" title="Delete"><span>Delete</span></a>
                                                </c:if>
                                            </td>
                                            <td><c:out value='${cost.code}'/></td>
                                            <td><c:out value='${cost.cost.name}'/></td>
                                            <td><fmt:formatNumber value='${cost.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${cost.amount*cost.tax.taxRate/100}' pattern=',##0.00'/></td> 
                                            <td><a href="<c:url value='/page/socostcomponentverificationpreedit.htm?id=${cost.verification.id}'/>"><c:out value='${cost.verification.code}'/></a></td>
                                            <td>&nbsp;</td> 
                                            <td>&nbsp;</td> 
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="8">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
<%@ include file="/common/dialog.jsp"%>