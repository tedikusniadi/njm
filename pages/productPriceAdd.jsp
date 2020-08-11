<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Price >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{			
			if(dojo.widget.byId('validFrom').getValue() == null || dojo.widget.byId('validFrom').getValue() == '')
			{
				alert('Valid From date can not be empty!');
				return;
			}
		
			document.addForm.action = "<c:url value='${add}'/>";
			document.addForm.submit();
		}
		
		function openorder(source)
		{
			var from = document.getElementById('orderFrom');
			var to = document.getElementById('orderTo');
		
			if(source.checked == true)
			{
				from.setAttribute('class','');
				from.disabled = false;
				to.setAttribute('class','');
				to.disabled = false;
			}
			else
			{
				from.value = '';
				from.setAttribute('class','input-disabled');
				from.setAttribute('disabled','true');
				to.value = '';
				to.setAttribute('class','input-disabled');
				to.setAttribute('disabled','true');
			}
		}
		
		function openbreak(source)
		{
			var from = document.getElementById('breakFrom');
			var to = document.getElementById('breakTo');
		
			if(source.checked == true)
			{
				from.setAttribute('class','');
				from.disabled = false;
				to.setAttribute('class','');
				to.disabled = false;
			}
			else
			{
				from.value = '';
				from.setAttribute('class','input-disabled');
				from.setAttribute('disabled','true');
				to.value = '';
				to.setAttribute('class','input-disabled');
				to.setAttribute('disabled','true');
			}
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
							<form:form id="addForm" name="addForm" method="post" modelAttribute="price">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
                                <tr>
 									<td align="right">For Company :</td>
									<td>
                                    	<form:select id="relation" path="partyRelationship" cssClass="combobox-ext">
                                            <c:if test='${not empty price.partyRelationship}'>
                                                <form:option value='${price.partyRelationship.id}' label='${price.partyRelationship.relationshipType.name} - ${price.partyRelationship.toRole.party.firstName} ${price.partyRelationship.toRole.party.middleName} ${price.partyRelationship.toRole.party.lastName}' />
                                            </c:if>
                                        </form:select>
                                        <c:if test='${not empty type}'>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popuppartyrelationshipview.htm?target=relation&party=${party}&type=${type}'/>');" style="CURSOR:pointer;" title="Party Relationship" />
                                        </c:if>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
									<td width="20%" align="right" nowrap="nowrap">Valid From :</td>
							  	  <td width="45%"><input id="validFrom" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Product :</td>
									<td>
                                    	<form:select id="pro" path="product" cssClass="combobox">
                                            <c:if test='${not empty price.product}'>
                                                <form:option value='${price.product.id}' label='${price.product.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductview.htm?target=pro&type=${GOODS}&for=${for}'/>');" style="CURSOR:pointer;" title="Product" />
                                    </td>
									<td><form:errors path="product"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Price :</td>
									<td>
                                    	<form:input id='amount' path="money.amount" size='15'/>
                                        &nbsp;
                                        <form:select path='money.currency'>
                                        	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path='money.exchangeType'>
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
                                    	<form:select id="type" path="type" cssClass="combobox">
                                        	<form:options items='${types}' itemValue='id' itemLabel='name'/>
                                        </form:select>
                                    </td>
									<td><form:errors path="type"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Geographic :</td>
									<td>
                                    	<form:select id="geo" path="geographic" cssClass="combobox">
                                            <c:if test='${not empty price.geographic}'>
                                                <form:option value='${price.geographic.id}' label='${price.geographic.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupgeographicview.htm?target=geo'/>');" style="CURSOR:pointer;" title="Geographic" />
                                    </td>
									<td><form:errors path="geographic"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Order Quantity :</td>
									<td>
                                    	<form:checkbox path='orderValue.enabled' onclick='openorder(this)'/>&nbsp;
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