<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			document.filterForm.action = "<c:url value='/page/accountreceivablesbillingreportdetailview.htm'/>";
			document.filterForm.submit();
		}
		
		function resetform()
		{
			var org = document.getElementById('org');
			
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
				
			var customer = document.getElementById('customer');
			
			for(var idx=customer.options.length;idx>=0;idx--)
				customer.remove(customer.selectedIndex);				
				
			document.reportForm.reset();
		}
		
		function opencustomer()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
		}
		
		function opencollector()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcollectorview.htm?target=collector&organization='/>"+org.value);
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
			<td width="60%">Financial Accounting > Account Receivables > Billing</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F42 - Billing Detail Recapitulation </h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
						<div class="main-box">
							<form id="filterForm" name="filterForm" method="post">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%"><div align="right">Organization :</div></td>
									<td width="80%">
										<select id="org" name="organization" class="combobox-ext">
											<c:if test='${not empty organization}'>
											<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
											</c:if>
										</select>
										&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								    </tr>
								    <tr>
									<td><div align="right">Collector :</div></td>
									<td>
										<select id="collector" name="collector" class="combobox-ext">
										</select>
										&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencollector();" style="CURSOR:pointer;" title="Collector" />
									</td>
								</tr>	
								    <tr>
									<td><div align="right">Customer :</div></td>
									<td>
										<select id="customer" name="customer" class="combobox-ext">
										</select>
										&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
									</td>
								</tr>
								    <tr>
									<td align="right">Date From :</td>
									<td>
										<input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
										&nbsp;Date To &nbsp;:&nbsp;
										<input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
									</td>
								</tr>
				  				</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
