<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Planning  Sequence >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{	
			if(document.getElementById('warehouse').value == null || document.getElementById('warehouse').value == '')
			{
				alert('Please select Warehouse first!');
				return;
			}
			
			if(document.getElementById('postalAddress').value == null || document.getElementById('postalAddress').value == '')
			{
				alert('Please select shipping address first!');
				return;
			}
			
			var tbl = document.getElementById("lineItemTable");
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
			{
				var quan = t_section.rows[idx].cells[1].firstChild.value;
				var hid = t_section.rows[idx].cells[4].firstChild.value;

				if(quan && hid && parseFloat(quan) > parseFloat(hid))
				{
					alert("Quantity cant greater than "+hid);
					return;
				}
			}
			
			document.addForm.action = "<c:url value='/page/deliveryplanningsequenceadd.htm'/>";
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
			<td width="60%">Sales > Delivery Planning > Delivery Planning Sequence > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S11 - Delivery Planning Sequence</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryplanningpreedit.htm?id=${plan.deliveryPlanning.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plan">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="58%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">Sequence :</td>
                                          	<td width="80%"><input class='input-disabled' size='5' value="${plan.no}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
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
                                            	<form:select id="warehouse" path="facility" cssClass="combobox-ext">
                                                    <c:if test='${not empty plan.facility}'>
                                                        <form:option value='${plan.facility.id}' label='${plan.facility.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupfacilityview.htm?target=warehouse&organization=${plan.deliveryPlanning.planable.organization.id}'/>');" style="CURSOR:pointer;" title="Warehouse" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Shipping Address : </td>
                                            <td width="35%">
                                            	 <form:select id="postalAddress" path="postalAddress" cssClass="combobox-ext">
                                                    <c:if test='${not empty plan.postalAddress}'>
                                                        <form:option value='${plan.postalAddress.id}' label='${plan.postalAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppostaladdressview.htm?target=postalAddress&party=${plan.deliveryPlanning.planable.customer.id}'/>');" style="CURSOR:pointer;" title="Address" />
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="42%" valign="top">
                                    	<fieldset>
                                        	<legend>Product Informatio</legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <th width="39%">Product</th>
                                                <th width="15%">Order</th>
                                                <th width="16%">Assign</th>
                                                <th width="14%">Unasign</th>
                                                <th width="14%">Resend</th>
                                                <th width="16%">Canceled</th>
                                            </tr>
                                            <c:forEach items='${planning.planable.sequenceables}' var='able'>
                                            <tr>
                                            	<td><c:out value='${able.product.name}'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.quantity}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.assigned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.quantity-able.assigned+able.resend+able.returned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                <td><input value="<fmt:formatNumber value='${able.resend}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
                                                 <td><input value="<fmt:formatNumber value='${able.returned}' pattern=',##0.00'/>" class="input-disabled" disabled size='5'/></td>
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
                                    <th width="34%">Product</th>
                                    <th width="13%">Quantity</th>
                                    <th width="7%">UoM</th>
                                    <th width="46%">Note</th>
                                    <th width="1%">&nbsp;</th>
                                    <th width="16%">Returned</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${plan.sequenceItems}" var="line" varStatus='status'>
                                <tr>
                                    <td><c:out value='${line.sequenceable.product.code} ${line.sequenceable.product.name}'/></td>
                                    <td><form:input path='sequenceItems[${status.index}].quantity' size='10'/></td>
                                    <td><c:out value='${line.sequenceable.product.unitOfMeasure.measureId}'/></td>
                                    <td><form:input path='sequenceItems[${status.index}].note' size='60'/></td>
                                    <td>
                                    	<input type="hidden" value="${line.sequenceable.quantity-line.sequenceable.assigned+line.sequenceable.returned+line.sequenceable.resend}"/>
                                    </td>
                                    <td><input size="10" class="input-disabled" disabled value="<fmt:formatNumber value='${line.sequenceable.quantity-line.sequenceable.assigned+line.sequenceable.returned+line.sequenceable.resend}' pattern=',##0.00'/>" /></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                </table>
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
</html>