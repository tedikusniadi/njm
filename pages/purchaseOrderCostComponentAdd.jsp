<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PO Cost Component >> Add</title>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action="<c:url value='/page/purchaseordercostcomponentadd.htm'/>";
			document.addForm.submit();
		}
		
		function opensupplier()
		{
			openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization=${component.purchaseOrder.organization.id}'/>");
		}
		
		function display()
		{
			var tax = document.getElementById('tax').value;
	
			<c:forEach items='${taxes}' var='tax'>
				if('${tax.id}' == tax)
				{
					var amount = document.getElementById('amount').value;
					if(amount == null || amount == '')
						amount = 0.0;
						
					var rate = parseFloat('${tax.taxRate}');
					var amt = parseFloat(amount);
					var txt = rate/100*amt;
					
					document.getElementById('taxAmount').value = txt.numberFormat('#,#.00');
					
					dojo.byId('total').value = (txt+amt).numberFormat('#,#.00');
					
					return false;
				}
			</c:forEach>
		}
	</script>
	
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">Procurement > PO Cost Component > Add</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P27 - PO Cost Component</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/${component.purchaseOrder.uri}?id=${component.purchaseOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="component">
                            <input type="hidden" name="source" value="${source}"/>
			 				<table width="99%" style="border:none" class="space">
							<tr>
								<td width="20%" align="right">Code</td>
				  		  	  	<td width="1%"><div align="center">:</div></td>
					 		  	<td width="46%"><input disabled class="input-disabled" size="35" value="Auto Generated"/></td>
                                <td width="33%" rowspan="2" valign="top">
                                	<fieldset>
                                    	<legend><strong>Total Amount</strong></legend>
                                        <input id="total" value="0.00" style="text-align:right" disabled class="input-disabled" size="40"/>
                                    </fieldset>
                              	</td>
							</tr>	
							<tr>
								<td align="right">Master Cost </td>
								<td><div align="center">:</div></td>
								<td>
                                	<form:select path="cost" cssClass="combobox">
                                        <form:options items='${costs}' itemValue='id' itemLabel='name'/>
									</form:select>
                                </td>
							</tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Supplier</td>
                                <td>:</td>
                                <td>
                                    <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                        <c:if test='${not empty component.supplier}'>
                                            <form:option value='${component.supplier.id}' label='${component.supplier.firstName} ${component.supplier.lastName} ${component.supplier.middleName}' />
                                        </c:if>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Tax</td>
                                <td>:</td>
                                <td>
                                   <form:select path="tax" cssClass="combobox">
                                        <c:forEach items='${taxes}' var='tax'>
                                        	<option value="${tax.id}" onclick="display();">${tax.taxName}</option>
                                        </c:forEach>
									</form:select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Amount</td>
                                <td>:</td>
                                <td><form:input path='amount' size='25' onchange='display();'/></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Tax Amount</td>
                                <td>:</td>
                                <td><input id='taxAmount' size='25' value='0'/></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Note</td>
                                <td>:</td>
                                <td><form:textarea path='note' cols='45' rows='6'/></td>
                            </tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
