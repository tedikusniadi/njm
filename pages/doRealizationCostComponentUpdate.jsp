<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>DO Realization Cost Component >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Sales > Delivery Order Realization > Cost Component > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - DO Realization Cost Component</h1>
                        <div class="clears">&nbsp;</div>
                        
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryorderrealizationpreedit.htm?id=${component_edit.deliveryOrderRealization.id}'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="component_edit">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="17%" nowrap="nowrap" align="right">ID :</td>
                                  	<td><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                    <td valign="top" rowspan="2">
                                    	<fieldset>
                                        	<legend><strong>Total Amount</strong></legend>
                                            <input id="total" size="40" disabled class="input-disabled" value="<fmt:formatNumber value='${component_edit.amount+(component_edit.amount*component_edit.tax.taxRate/100)}' pattern=',##0.00'/>" style="text-align:right;"/>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Cost Component :</td>
                                  	<td width="49%">
                       			  <form:select id="cost" path="cost" cssClass="combobox-ext">
                                            <c:if test='${not empty component_edit.cost}'>
                                              <form:option value='${component_edit.cost.id}' label='${component_edit.cost.name}' />
                                            </c:if>
                                        </form:select>
                                  </td>
                                </tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                  	<td>
                                        <form:select id='currency' path='currency'>
                                        	<form:option value='${component_edit.currency.id}' label='${component_edit.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                        &nbsp;
                                        <input class="input-disabled" value="<fmt:formatNumber value='${component_edit.exchange.rate}' pattern=',##0.00'/>" disabled/>
                                  	</td>
                                    <td width="34%"><form:errors cssClass="error" path="currency"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Tax :</td>
                                  	<td>
                                        <form:select id='tax' path='tax'>
                                        	<form:option value='${component_edit.tax.id}' label='${component_edit.tax.taxId}'/>
                                        </form:select>
                                        &nbsp;
                                        <input size="7" class="input-disabled" disabled value="<fmt:formatNumber value='${component_edit.tax.taxRate}' pattern=',##0.00'/>"/>
                                  </td>
                                    <td width="34%"><form:errors cssClass="error" path="tax"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Supplier :</td>
                                  <td>
                                        <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                            <c:if test='${not empty component_edit.supplier}'>
                                                <form:option value='${component_edit.supplier.id}' label='${component_edit.supplier.firstName} ${component_edit.supplier.lastName} ${component_edit.supplier.middleName}' />
                                            </c:if>
                                        </form:select>
                                  </td>
                                    <td width="34%"><form:errors cssClass="error" path="supplier"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Amount :</td>
                                  	<td><input style="text-align:right;" size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${component_edit.amount}' pattern=',##0.00'/>"/></td>
                                    <td width="34%"><form:errors cssClass="error" path="amount"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Tax Amount :</td>
                                    <td><input style="text-align:right;" size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${component_edit.amount*component_edit.tax.taxRate/100}' pattern=',##0.00'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
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
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/dorealizationcostcomponentedit.htm'/>";
		document.addForm.submit();
	}
			
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>