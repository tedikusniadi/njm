<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cashflow Filter</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
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
			<td width="60%">Reports > Financial Accounting > Accounting > Cashflow</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">RF75 - Cashflow Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none">
								<tr>
									<td width="32%" align="right">Company</td>
								  	<td width="1%">:</td>
                              		<td width="67%" align="left">
                                   	  <form:select id='org' path='organization' cssClass='combobox-ext'>
                                      </form:select>
                                        &nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                  </td>
								</tr>
                                <tr>
									<td width="32%" align="right">Accounting Period</td>
								  	<td width="1%">:</td>
                              		<td width="67%" align="left">
                                    	<form:select id='period' path='period' cssClass='combobox-ext'>
                                        </form:select>
                                        &nbsp;
									  	<img src="assets/icons/list_extensions.gif" onclick="openperiod();" style="CURSOR:pointer;" title="Accounting Period" />
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
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
<script type="text/javascript">
	function generate()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		var period = document.getElementById('period');
		if(period.value == '')
		{
			alert('Please select valid Accounting Period first!');
			return;
		}
	
		document.reportForm.action = "<c:url value='/page/cashflowreportview.htm'/>";
		document.reportForm.submit();
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		var period = document.getElementById('period');
		
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
			
		for(var idx=period.options.length;idx>=0;idx--)
			period.remove(period.selectedIndex);
		
		document.reportForm.reset();
	}
	
	function openperiod()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupaccountingperiodreport.htm?target=period&openonly=false&organization='/>"+org.value);
	}
</script>