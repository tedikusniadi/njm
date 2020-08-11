<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Master Cost Schema >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/transportoutsourcemastercostaccountingschemaadd.htm'/>";
			document.addForm.submit();
		}
				
		function popup(target)
		{
				
			openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa=${masterCostSchema.accountingSchema.chartOfAccount.id}&target='/>"+target);
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
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Schema > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F13 - Accounting Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/accountingschemapreedit.htm?id=${masterCostSchema.accountingSchema.id}'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="masterCostSchema">
								<table width="100%" style="border:none">
                                <tr>
									<td width="21%" align="right" nowrap="nowrap">Name :</td>
						  		  <td width="68%"><form:input path='name' size='50'/></td>
                                    <td width="11%">&nbsp;</td>
								</tr>
                                <tr>
									<td width="21%" align="right" nowrap="nowrap">Accounting Schema :</td>
	  <td>
										<form:select id="accountingSchema" path="accountingSchema" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${masterCostSchema.accountingSchema.id}' label='${masterCostSchema.accountingSchema.name}' />
										</form:select>
								  	</td>
                                    <td width="11%">&nbsp;</td>
								</tr>
                                <tr>
                                    <td align="right">GL Account : </td>
                              		<td>
                                        <form:select id="account" path="account" cssClass="combobox-ext">
                                            <option value="${masterCostSchema.account.id}">${masterCostSchema.account.code} ${masterCostSchema.account.name}</option>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('account');" style="CURSOR:pointer;" title="Search Account" />
                                    </td>							
                                    <td width="11%">&nbsp;</td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
                                    <td>&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Master Cost :</td>
									<td valign="top" align="left">
                                    	<c:forEach items='${masterCostSchema.schemas}' var='schema' varStatus='status'>
                                			<form:checkbox path='schemas[${status.index}].enabled' value='true' label='${schema.masterCost.name}'/><br/>
                                		</c:forEach>
                                    </td>
                                    <td>&nbsp;</td>
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