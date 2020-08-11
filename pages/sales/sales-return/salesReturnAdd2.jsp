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
</head>

<body onload="display();">

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
							<a class="item-button-list" href="<c:url value='/page/salesreturnview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-next" href="javascript:save();"><span><spring:message code='next'/></span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="return_add">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="21%" align="right">Id :</td>
                                          	<td width="79%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input inputId="dateId" id="date" name="date" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty return_add.organization}'>
                                                        <form:option value='${return_add.organization.id}' label='${return_add.organization.firstName} ${return_add.organization.lastName} ${return_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty return_add.returable.customer}'>
                                                        <form:option value='${return_add.returable.customer.id}' label='${return_add.returable.customer.firstName} ${return_add.returable.customer.middleName} ${return_add.returable.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Reference :</td>
                                            <td><input class="input-disabled" disabled size="35" value="${return_add.returable.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Return Destination : </td>
                                            <td>
                                            	<form:select id="warehouse" path="destination" cssClass="combobox-ext">
                                                    <c:if test='${not empty return_add.destination}'>
                                                        <form:option value='${return_add.destination.id}' label='${return_add.destination.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openFacility('warehouse')" style="CURSOR:pointer;" title="Warehouse" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="6"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                            <legend><strong>Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="29%">&nbsp;</td>
                                                <td width="37%" align="center"><strong>Amount (<c:out value='${return_add.returable.currency.symbol}'/>)</strong></td>
                                                <td width="34%" align="center"><strong>Amount (<c:out value='${default.symbol}'/>)</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><strong>Total</strong></td>
                                                <td><input value="<fmt:formatNumber value='${0}' pattern='#,###'/>" id="total" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                                <td><input value="<fmt:formatNumber value='${0}' pattern='#,###'/>" id="totaldef" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                    <div id="itemTab" dojoType="ContentPane" label="Products" class="tab-pages" refreshOnShow="true">
                                    	<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="31%">Product</th>
                                       	  	<th width="12%">Delivered</th>
                                       	  	<th width="12%">Returned</th>
                                            <th width="6%">UoM</th>
                                            <th width="13%">Unit Price</th>
                                            <th width="11%">Currency</th>
                                       	  	<th width="14%">Amount</th>
                                          	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${return_add.items}" var="retItem" varStatus='status'>
                                        <tr>
                                            <td><c:out value='${retItem.returableItem.product.code} - ${retItem.returableItem.product.name}'/></td>
                                            <td><input class="input-disabled" disabled size="10" value="<fmt:formatNumber value='${retItem.returableItem.accepted - retItem.returableItem.totalReturned}' pattern='##.00'/>"/></td>
                                            <td><form:input size='10' path="items[${status.index}].unreceipted" onchange="display();"/></td>
                                            <td><c:out value='${retItem.returableItem.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${retItem.returableItem.unitPrice.amount}' pattern=',##0.00'/></td>
                                            <td><c:out value='${retItem.returableItem.unitPrice.currency.symbol}'/></td>
                                            <td><input id='total[${status.index}]' class="input-disabled" disabled value="<fmt:formatNumber value='${retItem.returableItem.unitPrice.amount*retItem.quantity}' pattern=',##0.00'/>" size='15'/></td>
                                            <td><input type="hidden" value='${retItem.returableItem.unitPrice.amount}'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                </div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->
</body>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/salesreturnpreadd3.htm?id=${returableId}'/>";
		document.addForm.submit();
	}

	function display()
	{
		var tbl = document.getElementById("lineItemTable");
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		var t_recap = 0.0;

		for(var idx=len-1;idx>=0;idx--)
		{
			var onhand = t_section.rows[idx].cells[1].firstChild.value;
			var returned = t_section.rows[idx].cells[2].firstChild.value;
			var price = t_section.rows[idx].cells[7].firstChild.value;
			var total = t_section.rows[idx].cells[6].firstChild;

			if(returned == null || returned == '')
			{
				alert('Returned must be 0 or greater!');
				return;
			}

			if(parseFloat(returned) > parseFloat(onhand))
			{
				alert('Returned Quantity must be less or equal to '+onhand);
				return;
			}

			var t_amount = parseFloat(returned)*parseFloat(price);

			t_recap += t_amount;

			total.value = t_amount.numberFormat('#,#.00');
		}

		document.getElementById('total').value = t_recap.numberFormat('#,#.00');
		document.getElementById('totaldef').value = t_recap.numberFormat('#,#.00');
	}

</script>
</html>