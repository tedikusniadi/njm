<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product >> Product Feature Applicability >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{			
			document.addForm.action = "<c:url value='/page/productfeatureapplicabilityadd.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Inventory > Product Management > Product > Product Feature Applicability > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">I03 - Product Feature Applicability</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productpreedit.htm?id=${applicability.product.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="applicability">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
									<td nowrap="nowrap" align="right">Valid From :</td>
									<td><input id="validFrom" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <form:errors path="validFrom"/>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <form:errors path="validTo"/>
								</tr>
                                <tr>
 									<td width="24%" align="right">Type :</td>
							  	  	<td width="40%">
                                  		<form:select path='type' cssClass='combobox'>
                                        	<form:option value='REQUIRED' label='REQUIRED'/>
                                            <form:option value='STANDARD' label='STANDARD'/>
                                            <form:option value='OPTIONAL' label='OPTIONAL'/>
                                            <form:option value='SELECTABLE' label='SELECTABLE'/>
                                        </form:select>
                                  	</td>
							  	  	<td width="36%"><form:errors path="type"/></td>
 								</tr>
                                <tr>
 									<td align="right">Product Feature :</td>
									<td>
                                    	<form:select id="fet" path="productFeature" cssClass="combobox-ext">
                                            <c:if test='${not empty applicability.productFeature}'>
                                                <form:option value='${applicability.productFeature.id}' label='${applicability.productFeature.content}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductfeatureview.htm?target=fet'/>');" style="CURSOR:pointer;" title="Product Feature" />
                                    </td>
									<td><form:errors path="productFeature"/></td>
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