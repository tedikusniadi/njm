<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter To Journal Report</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			document.reportForm.action = "<c:url value='/page/intertojournalreportview.htm'/>";
			document.reportForm.submit();
		}
		
		function resetform()
		{
			var org = document.getElementById('org');
			
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
			
			document.reportForm.reset();
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
			<td width="60%">Reports > Financial Accounting > Accounting > Inter To Journal</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">RF71 - Inter To Journal</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute="filterCriteria">
								<table width="100%" style="border:none">
								<tr>
									<td align="right">Company</td>
									<td>:</td>
                                    <td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
					    			<td><form:errors path="organization"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Date From</td>
									<td>:</td>
                                    <td>
                                    	<input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    	&nbsp;&nbsp;Date To
                                    	<input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                    <td><form:errors path="dateFrom"/>&nbsp;<form:errors path="dateTo"/></td>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
