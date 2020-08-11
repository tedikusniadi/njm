<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Association >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save()
		{			
			document.editForm.action = "<c:url value='/page/productassociationedit.htm'/>";
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
			<td width="60%">Inventory > Product Management > Product > Product Association > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">I03 - Product Association</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productpreedit.htm?id=${association.parent.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="association">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
									<td width="20%" align="right" nowrap="nowrap">Product :</td>
							  	  	<td width="45%"><input value="${association.parent.name}" class="input-disabled" disabled size="40"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">Valid From :</td>
							  	  	<td width="45%"><input class="input-disabled" value="<fmt:formatDate value='${association.from}' pattern='dd-MM-yyyy'/>"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="to" name="to" value="${association.to}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
 								<tr>
 									<td align="right">Quantity :</td>
									<td><form:input path="quantity" cssClass='input-disabled' disabled='true'/></td>
									<td width="35%">&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Associated Product :</td>
									<td>
                                    	<form:select id="pro" path="product" cssClass="combobox" disabled='true'>
                                            <c:if test='${not empty association.product}'>
                                                <form:option value='${association.product.id}' label='${association.product.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td><form:errors path="product"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Type :</td>
									<td>
                                    	<form:select path="associationType" cssClass="combobox" disabled='true'>
                                           <form:option value='${association.associationType.id}' label='${association.associationType.name}'/>
                                        </form:select>
                                    </td>
									<td><form:errors path="associationType"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Note :</td>
									<td><form:textarea path="note" cols='45' rows='6'/></td>
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