<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Price >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{			
			document.editForm.action = "<c:url value='${edit}'/>";
			document.editForm.submit();
		}
	</script>
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
			<td width="60%">Inventory > Item Management > Product > Product Price > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">I03 - Product Price</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='${list}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="price">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
 									<td align="right">For Company :</td>
									<td>
                                    	<form:select id="relation" path="partyRelationship" cssClass="combobox-ext" disabled='true'>
                                        	<form:option value='${price.partyRelationship.id}' label='${price.partyRelationship.toRole.party.firstName} ${price.partyRelationship.toRole.party.middleName} ${price.partyRelationship.toRole.party.lastName}' />
                                        </form:select>
                                    </td>
									<td><form:errors path="product"/></td>
	 							</tr>
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">Valid From :</td>
							  	  	<td width="45%"><input size="10" value="<fmt:formatDate value='${price.validFrom}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" value="${price.validTo}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Product :</td>
									<td>
                                    	<form:select id="pro" path="product" cssClass="combobox" disabled='true'>
                                             <form:option value='${price.product.id}' label='${price.product.name}' />
                                        </form:select>
                                    </td>
									<td><form:errors path="product"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Price :</td>
									<td>
                                    	<input size='15' cssClass='input-disabled' disabled='true' value="<fmt:formatNumber value='${price.money.amount}' pattern=',##0.00'/>"/>
                                        &nbsp;
                                        <form:select path='money.currency' disabled='true'>
                                        	<form:option value='${price.money.currency.id}' label='${price.money.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path='money.exchangeType' disabled='true'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                  	</td>
									<td width="35%">&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Price Type :</td>
									<td>
                                    	<form:select id="type" path="type" cssClass="combobox" disabled='true'>
                                        	<form:option value='${price.type.id}' label='${price.type.name}'/>
                                        </form:select>
                                    </td>
									<td><form:errors path="type"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Geographic :</td>
									<td>
                                    	<form:select id="geo" path="geographic" cssClass="combobox" disabled='true'>
                                            <form:option value='${price.geographic.id}' label='${price.geographic.name}' />
                                        </form:select>
                                    </td>
									<td><form:errors path="geographic"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Order Quantity :</td>
									<td>
                                    	<form:checkbox path='orderValue.enabled' disabled='true'/>&nbsp;
                                    	From&nbsp;
                                    	<form:input id='orderFrom' path="orderValue.fromAmount" size='8' cssClass='input-disabled' disabled='true'/>
                                        &nbsp;
                                        To&nbsp;
                                    	<form:input id='orderTo' path="orderValue.toAmount" size='8' cssClass='input-disabled' disabled='true'/>
                                        &nbsp;
                                  	</td>
									<td width="35%">&nbsp;</td>
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
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>