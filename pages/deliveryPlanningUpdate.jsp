<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Planning >> Edit</title>
    <%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="assets/dialog.js"></script>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/deliveryplanningupdate.htm'/>";
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
			<td width="60%">Sales > Delivery Planning > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S10 - Delivery Planning</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryplanningview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit and planning_edit.sequenceable}'>
                            	<a class="item-button-add-gl-child" href="<c:url value='/page/deliveryplanningsequencepreadd.htm?id=${planning_edit.id}'/>"><span>Add Sequence</span></a>
                            </c:if> 
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="planning_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="51%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="80%"><input value="${planning_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select class="combobox-ext" disabled='true'>
                                                    <option><c:out value='${planning_edit.planable.organization.firstName} ${planning_edit.planable.organization.lastName} ${planning_edit.planable.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${planning_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">Customer :</td>
                                          <td width="80%"><input value="${planning_edit.planable.customer.firstName} ${planning_edit.planable.customer.middleName} ${planning_edit.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">Sales Order :</td>
                                          <td width="80%"><a href="<c:url value='/page/${planning_edit.planable.uri}?id=${planning_edit.planable.id}'/>"><c:out value='${planning_edit.planable.code}'/></a></td>
                                        </tr>
                                        </table>
                                    </td>
                              		<td width="49%" valign="top">
                   						<fieldset>
                                        	<legend>Product Informatio</legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <th width="39%" align="left">Product</th>
                                                <th width="15%">Order</th>
                                                <th width="16%">Assign</th>
                                                <th width="14%">Unassign</th>
                                                <!--
                                                <th width="14%">Resend</th>
                                                <th width="16%">Canceled</th>
                                                -->
                                            </tr>
                                            <c:forEach items='${planning_edit.planable.sequenceables}' var='able'>
                                            <tr>
                                            	<td><c:out value='${able.product.name}'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.quantity}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.assigned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.quantity-able.assigned+able.resend+able.returned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <!--
                                                <td><input value="<fmt:formatNumber value='${able.resend}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                 <td><input value="<fmt:formatNumber value='${able.returned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                 -->
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                        	<legend>DO Information</legend>
                                            <c:forEach items='${planning_edit.sequences}' var='sequence'>
                                            <a href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${sequence.deliveryOrder.id}'/>">
                                            	<c:out value='${sequence.deliveryOrder.code}'/>&nbsp;
                                            </a>
                                            </c:forEach>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <c:if test='${not empty planning_edit.sequences}'>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<c:forEach items='${planning_edit.sequences}' var='plan'>
                                    	<div id="${plan.id}" dojoType="ContentPane" label="${planning_edit.code}.${plan.no}" class="tab-pages" refreshOnShow="true">
                                			<table style="border:none" width="100%">
                                            <tr>
                                            	<td width="63%" valign="top">
                                                	<div class="toolbar-clean">
                                                        <c:if test='${access.delete and plan.deliveryOrder == null}'>
                                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/deliveryplanningsequencedelete.htm?id=${plan.id}&plan=${planning_edit.id}'/>');" title="Delete"><span>Delete</span></a>
                                                        </c:if>
                                                        <c:if test='${access.edit and plan.deliveryOrder == null}'>
                                                            <a class="item-button-new" href="<c:url value='/page/deliveryorderpreadd2.htm?id=${plan.id}'/>" title="DO"><span>Create DO</span></a>
                                                        </c:if>
                                                        <div class="item-navigator">&nbsp;</div>
                                                    </div>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="26%" nowrap="nowrap" align="right">Sequence :</td>
                                                      <td width="74%"><input class='input-disabled' size='5' value="${plan.no}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap="nowrap" align="right">Date :</td>
                                                        <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${plan.date}' pattern='dd-MM-yyyy'/>"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap="nowrap" align="right">Company :</td>
                                                        <td>
                                                            <select class="combobox-ext" disabled='true'>
                                                                <option><c:out value='${plan.deliveryPlanning.planable.organization.firstName} ${plan.deliveryPlanning.planable.organization.lastName} ${plan.deliveryPlanning.planable.organization.middleName}'/></option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Warehouse : </td>
                                                        <td>
                                                            <select class="combobox-ext" disabled='true'>
                                                                <option><c:out value='${plan.facility.name}'/></option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="26%" align="right">Shipping Address : </td>
                                                  		<td width="74%">
                                          					<select class="combobox-ext">
                                                                <option><c:out value='${plan.postalAddress.address}'/></option>
                                                            </select>
                                                      </td>
                                                    </tr>
                                                    </table>
                                              	</td>
                                                <td width="37%" valign="top">
                                                	<fieldset>
                                                        <legend>Reference</legend>
                                                        <table width="100%" style="border:none">
                                                        <tr>
                                                            <td width="47%" align="right">Delivery Order :</td>
                                                            <td width="53%"><a href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${plan.deliveryOrder.id}'/>"><c:out value='${plan.deliveryOrder.code}'/></a></td>
                                                        </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                            </table>
                                            <br/>
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
                                            <c:forEach items="${plan.sequenceItems}" var="line" varStatus='status'>
                                            <tr>
                                                <td><c:out value='${line.sequenceable.product.code} ${line.sequenceable.product.name}'/></td>
                                                <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                                <td><c:out value='${line.sequenceable.product.unitOfMeasure.measureId}'/></td>
                                                <td><c:out value='${line.note}'/></td> 
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot><tr class="end-table"><td colspan="4">&nbsp;</td></tr></tfoot>
                                            </table>
                                        </div>
                                    </c:forEach>
                                </div>
                                </c:if>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${planning_edit.createdBy.firstName} ${planning_edit.createdBy.middleName} ${planning_edit.createdBy.lastName}'/> (<fmt:formatDate value='${planning_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${planning_edit.updatedBy.firstName} ${planning_edit.updatedBy.middleName} ${planning_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${planning_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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