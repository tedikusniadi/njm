<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Cost >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{
			var valid = document.getElementById('validFromId').value;
			var cost = document.getElementById('amount').value;
			var geo = document.getElementById('geo').value;
			
			if(valid == '')
			{
				alert('Valid From date cannot be empty !!!');
				return;
			}
			
			if(cost == '' || parseFloat(cost.replace(/,/g,'')) <= 0)
			{
				alert('Cost Amount cannot be empty and must be greater than zero !!!');
				return;
			}
			
			if(geo == null || geo == '')
			{
				alert('Please select Geographic first !!!');
				return;
			}
			
			document.addForm.action = "<c:url value='/page/productcostadd.htm'/>";
			document.addForm.submit();
		}
		
		function separator()
		{
			var amount = document.getElementById('amount');

			if(amount.value != '')
			{
				amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
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
			<td width="60%">Inventory > Product Management > Product > Product Cost > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">I03 - Product Cost</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productpreedit.htm?id=${cost.product.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="cost">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
									<td width="20%" align="right" nowrap="nowrap">Valid From :</td>
							  	  <td width="45%"><input id="validFrom" inputId="validFromId" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
 								<tr>
 									<td align="right">Cost :</td>
									<td>
                                    	<form:input id='amount' path="money.amount" size='15' onkeyup="separator();"/>
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
 									<td align="right">Cost Type :</td>
									<td>
                                    	<form:select id="type" path="costType" cssClass="combobox">
                                        	<form:options items='${types}' itemValue='id' itemLabel='name'/>
                                        </form:select>
                                    </td>
									<td><form:errors path="costType"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Geographic :</td>
									<td>
                                    	<form:select id="geo" path="geographic" cssClass="combobox">
                                            <c:if test='${not empty cost.geographic}'>
                                                <form:option value='${cost.geographic.id}' label='${cost.geographic.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupgeographicview.htm?target=geo'/>');" style="CURSOR:pointer;" title="geographic" />
                                    </td>
									<td><form:errors path="geographic"/></td>
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