<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Currency Managemenr >> Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.rateForm.action = "<c:url value='/page/exchangemanagementadd.htm'/>";
			document.rateForm.submit();
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
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Currency Management > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F14 - Currency Management</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/exchangemanagementview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>					  			

						<div class="main-box">
 							<form:form cssClass="edit-form" id="rateForm" name="rateForm" modelAttribute="exchange_add" method="post">
 							<table width="752" border="0" cellpadding="0" cellspacing="0">
 							<tr>
 								<td><div class="form-label">From Currency :</div></td>
								<td>
									<form:select path="from" cssClass="combobox">
										<form:options items="${currencys}" itemValue="id" itemLabel="symbol"/>
									</form:select>
								</td>
								<td><form:errors path="from" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td><div class="form-label">To Currency :</div></td>
								<td>
									<form:select path="to" cssClass="combobox">
										<form:options items="${currencys}" itemValue="id" itemLabel="symbol"/>
									</form:select>
								</td>
								<td><form:errors path="to" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td><div class="form-label">Rate Type :</div></td>
								<td>
									<form:select path="type" cssClass="combobox">
										<form:option value="SPOT" label="SPOT"/>
										<form:option value="MIDDLE" label="MIDDLE"/>
										<form:option value="TAX" label="TAX"/>
									</form:select>
								</td>
								<td><form:errors path="type" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td width="104"><div class="form-label">Rate :</div></td>
								<td width="171"><form:input path="rate" size="25"/></td>
								<td width="332"><form:errors path="rate" cssClass="error"/></td>
 							</tr>
 							<tr>
 								<td><div class="form-label">Valid From :</div></td>
								<td><input id="validFrom" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								<td><form:errors path="validFrom" cssClass="error"/></td>
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
