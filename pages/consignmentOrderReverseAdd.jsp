<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Order Reverse Add>> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/consignmentorderreverseadd.htm'/>";
			document.addForm.submit();
		}
		
		function validate(obj,quan)
		{
			if(obj.value == '')
				obj.value = quan;
			
			if(parseFloat(obj.value) > parseFloat(quan))
			{
				alert('Quantity > '+quan);
				obj.value = quan;
			}
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
			<td width="60%">Sales > Consignment > Consignment Order > Consignment Order Reverse > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Consignment Order Reverse</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentorderpreedit.htm?id=${reverse.consignmentOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="reverse">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="48%" valign="top">
                               		<table width="100%" style="border:none">
                                   	<tr>
                                    	<td width="21%" nowrap="nowrap" align="right">ID :</td>
                                        <td width="79%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                    </tr>
                                    <tr>
                                        <td width="21%" align="right">Date :</td>
                                        <td width="79%"><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Company :</td>
                                        <td>
                                            <select class="combobox-ext" disabled>
                                                <option><c:out value='${reverse.consignmentOrder.organization.firstName} ${reverse.consignmentOrder.organization.lastName} ${reverse.consignmentOrder.organization.middleName}'/></option>
                                            </select>
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td width="27%" align="right">Customer : </td>
                                  		<td width="73%">
											<select class="combobox-ext" disabled>
                                                <option><c:out value='${reverse.consignmentOrder.customer.firstName} ${reverse.consignmentOrder.customer.middleName} ${reverse.consignmentOrder.customer.lastName}'/></option>
                                            </select>
                                      	</td>                                            
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path='note' cols='55' rows='6'/></td>
                                    </tr>
                                  	</table>
                              	</td>
                          		<td width="52%" valign="top">
									<fieldset>
                                        <legend><strong>Goods Issue Information</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                            <td width="19%" align="right">Wareouse : </td>
                                            <td width="81%">
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.receivedFrom.name}'/></option>
                                                </select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.receivedGrid.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.receivedContainer.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset>
                                        <legend><strong>Goods Receive Information</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                            <td width="19%" align="right">Wareouse : </td>
                                            <td width="81%">
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.receivedFrom.name}'/></option>
                                                </select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.issuedGrid.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                            	<select class="combobox-ext" disabled>
                                                    <option><c:out value='${reverse.consignmentOrder.issuedContainer.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset>
                                    	<legend><strong>Recapitulation</strong></legend>
                                        <c:if test='${not empty reverse.consignmentOrder.registrys}'>
                                            <table style="border:none" width="100%">
                                            <tr>
                                                <th width="54%">&nbsp;</th>
                                       	  	  	<th width="13%">Cons </th>
                                              	<th width="10%">Sales </th>
                                              	<th width="12%">Reversed </th>
                                           	  	<th width="11%">Available </th>
                                            </tr>
                                            <c:forEach items='${reverse.consignmentOrder.registrys}' var='registry'>
                                            <tr>
                                                <td align="right"><c:out value='${registry.productPrice.product.code} - ${registry.productPrice.product.name}'/> - <fmt:formatNumber value='${registry.productPrice.money.amount}' pattern=',##0.00'/></td>
                                                <td align="right"><input size="8" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.quantity}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="8" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.used}' pattern=',##0.00'/>"/></td>
                                                 <td align="right"><input size="8" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.reversed}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="8" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.quantity - registry.used-registry.reversed}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </c:if>
                                    </fieldset>
                                </td>
                            </tr>
                            </table>
                            <br/>
                            <table width="50%" cellpadding="0" cellspacing="0" class="table-list">
                            <tr>
                                <th width="3%">&nbsp;</th>
                                <th width="54%">Product</th>
                                <th width="43%">Reversed</th>
                            </tr>
                            <c:forEach items='${reverse.items}' var='item' varStatus='status'>
                            <tr>
                                <td><input type="hidden" value="${item.quantity}"/></td>
                                <td><c:out value='${item.product.code} - ${item.product.name}'/></td>
                                <td><form:input path='items[${status.index}].quantity' onchange="validate(this,'${item.quantity}');" size='20'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
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