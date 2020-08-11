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
			document.addForm.action="<c:url value='/page/purchaseordercostcomponentedit.htm?source=${source}'/>";
			document.addForm.submit();
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
            <td width="60%">Procurement > PO Cost Component > Edit</td>
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
							<a class="item-button-list" href="<c:url value='/page/${source}?id=${component.purchaseOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            <c:if test='${empty component.verification}'>
                            	<a class="item-button-next" href="<c:url value='/page/purchaseordercostcomponentverificationpreadd.htm?id=${component.id}'/>"><span>Create verification</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="component">
                            <input type="hidden" name="source" value="${source}"/>
			 				<table width="99%" style="border:none" class="space">
							<tr>
								<td width="15%" align="right">Code</td>
				  		 	  	<td width="1%"><div align="center">:</div></td>
					 		  	<td width="53%"><input disabled class="input-disabled" size="35" value="${component.code}"/></td>
                                <td width="31%" rowspan="5" valign="top">
                       	    		<fieldset>
                                    	<legend><strong>Total Amount</strong></legend>
                                        <input id="total" value="<fmt:formatNumber value='${component.amount+(component.amount*component.tax.taxRate/100)}' pattern=',##0.00'/>" style="text-align:right" disabled class="input-disabled" size="40"/>
                                    </fieldset>
                                    <fieldset>
                                    	<legend><strong>Journal</strong></legend>
                                        <a href="<c:url value='/page/journalentrypreedit.htm?id=${component.journalEntry.id}'/>"><c:out value='${component.journalEntry.code}'/></a>
                                    </fieldset>
                           	  </td>
							</tr>	
							<tr>
								<td align="right">Master Cost </td>
								<td><div align="center">:</div></td>
								<td>
                                	<form:select path="cost" cssClass="combobox" disabled="true">
                                        <form:option value='${component.cost.id}' label='${component.cost.name}'/>
									</form:select>
                                </td>
							</tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Supplier</td>
                                <td>:</td>
                                <td>
                                    <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled="true">
                                        <c:if test='${not empty component.supplier}'>
                                            <form:option value='${component.supplier.id}' label='${component.supplier.firstName} ${component.supplier.lastName} ${component.supplier.middleName}' />
                                        </c:if>
                                    </form:select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Tax</td>
                                <td>:</td>
                                <td>
                                   <form:select path="tax" cssClass="combobox" disabled='true'>
                                        <option value="${component.tax.id}"><c:out value='${component.tax.taxName}'/></option>
									</form:select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Amount</td>
                                <td>:</td>
                                <td><input path='amount' size='25' class='input-disabled' disabled value="<fmt:formatNumber value='${component.amount}' pattern=',##0.00'/>"/></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Tax Amount</td>
                                <td>:</td>
                                <td><input id='taxAmount' size='25' value="<fmt:formatNumber value='${component.amount*component.tax.taxRate/100}' pattern=',##0.00'/>" class='input-disabled' disabled/></td>
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
