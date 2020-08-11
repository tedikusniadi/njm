<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org').value;
			if(org == '' || org == null)
			{
				alert('Please select Organization first !!!');
				return;
			}
			
			var dept = document.getElementById('department').value;
			if(dept == '' || dept == null)
			{
				alert('Please select Department first !!!');
				return;
			}
			
			var acc = document.getElementById('accountingPeriod').value;
			if(acc == '' || acc == null)
			{
				alert('Please select Accounting Period first !!!');
				return;
			}

			document.reportForm.action = "<c:url value='/page/budgetingreportview.htm'/>";
			document.reportForm.submit();
		}

		function opendepartment(target)
		{
			openpopup("<c:url value='/page/departmentpopup.htm?target='/>"+target);
		}
		
		function openAccountingPeriod(target)
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first !!!');
				return;
			}
			openpopup("<c:url value='/page/popupaccountingperiodview.htm?target="+target+"&level=CHILD&openonly=false&organization="+org.value+"'/>");
		}
		
		function resetform()
		{
			var org = document.getElementById('org');
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
			
			var dept = document.getElementById('department');
			for(var idx=dept.options.length;idx>=0;idx--)
				dept.remove(dept.selectedIndex);
			
			var acc = document.getElementById('accountingPeriod');
			for(var idx=acc.options.length;idx>=0;idx--)
				acc.remove(acc.selectedIndex);
				
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
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">${pageTitle}</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
								<tr>
                                    <td><div align="right">Department :</div></td>
                                    <td>
                                        <select id="department" name="departmentId" class="combobox-ext">
										</select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="opendepartment('department');" style="CURSOR:pointer;" title="Facility" />
                                    </td>
                                </tr>
								<tr>
                                    <td><div align="right">Accounting Period :</div></td>
                                    <td>
                                        <select id="accountingPeriod" name="periodId" class="combobox-ext">
										</select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openAccountingPeriod('accountingPeriod');" style="CURSOR:pointer;" title="Facility" />
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
