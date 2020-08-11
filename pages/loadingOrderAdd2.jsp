<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loading Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/loadingorderadd.htm'/>";
			document.addForm.submit();
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
			<td width="60%">Procurement > Pertamina Procurement > Loading Order</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P24 - Loading Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/loadingorderview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="66%" valign="top">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          	<td width="25%" nowrap="nowrap" align="right">LO Internal ID :</td>
                                          	<td width="75%"><input name="code" value="" size='25'/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                              <select class="combobox-ext" disabled='true'>
                                                <option><c:out value='${order_add.organization.firstName} ${order_add.organization.lastName} ${order_add.organization.middleName}'/></option>
                                              </select>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Valid To Date :</td>
                                            <td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                          <td width="25%" nowrap="nowrap" align="right">PO Pertamina No :</td>
                                          <td width="75%"><a href="<c:url value='/page/${order_add.purchaseOrder.uri}?id=${order_add.id}'/>">
                                          <c:out value='${order_add.purchaseOrder.code}'/></a></td>
                                        </tr>
                                        </table>
                                 	</td>
                                    <td width="34%" valign="top">
                                    	<fieldset>
                                        	<legend>Reference</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<td width="46%" align="right">Pertamina SO : </td>
                                          		<td width="54%" align="right">
                               	  					<c:forEach items='${order_add.purchaseOrder.verifications}' var='ver'>
                                            			<c:out value='${ver.invoice}'/><br/>
                                            		</c:forEach>
                                                </td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
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