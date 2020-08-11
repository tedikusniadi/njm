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
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
                                            </c:if>
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
								<tr>
                                	<td nowrap="nowrap" align="right">Customer Name :</td>
                                  	<td>
                                    	<select id="customer" name="customerId" class="combobox-ext">
                                      	</select>
                                      	<img src="assets/icons/list_extensions.gif" onclick="opencustomer('customer');" style="CURSOR:pointer;" title="Customer" />
                                  	</td>
                              	</tr>
								<tr>
                                    <td><div align="right">Type :</div></td>
                                    <td>
                                        <select id="type" name="type" class="combobox">
                                           	<option value="NONSPK">TANPA SPK</option>
                                           	<option value="SPK">SESUDAH SPK</option>
                                        </select>
                                    </td>
                                </tr>
								<tr>
                                    <td><div align="right">Apply Status :</div></td>
                                    <td>
                                        <select id="stat" name="status" class="combobox">
                                           	<option value="">---All---</option>
                                           	<option value="true">APPLIED</option>
                                           	<option value="false">UNAPPLIED</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input id="dateFrom" name="dateFrom" inputId="dateFromId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="dateTo" name="dateTo" inputId="dateToId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
<script type="text/javascript">
	function generate()
	{
		var org = document.getElementById('org').value;
		if(org == '' || org == null)
		{
			alert('Please select Organization first !!!');
			return;
		}

		var dateFrom = document.getElementById('dateFromId').value;
		if(dateFrom == '' || dateFrom == null)
		{
			alert("Date From cannot be empty !!!");
			return;
		}

		var dateTo = document.getElementById('dateToId').value;
		if(dateTo == '' || dateTo == null)
		{
			alert("Date To cannot be empty !!!");
			return;
		}
		
		document.reportForm.action = "<c:url value='/page/prepaymentreportview.htm'/>";
		document.reportForm.submit();
	}
	
	function opencustomer(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		else
		{
			if(org.value != 1824)
				openpopup("<c:url value='/page/popupcustomerview.htm?organization='/>"+org.value+"&target="+target);
			else
				openpopup("<c:url value='/page/popupcustomerview.htm?target='/>"+target);
		}
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		var cust = document.getElementById('customer');
		
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
		
		for(var idx=cust.options.length;idx>=0;idx--)
			cust.remove(cust.selectedIndex);
			
		document.reportForm.reset();
	}
</script>
