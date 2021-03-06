<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Plafon Account Report</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org');
			var plafon = document.getElementById('plafon');
			var from = dojo.widget.byId('from');
			var to = dojo.widget.byId('to');
			
			if(org.value == null || org.value == '')
			{
				alert('Please select company first!');
				return;
			}
			
			if(plafon.value == null || plafon.value == '')
			{
				alert('Please select Plafon first !!!');
				return;
			}
			
			if(from.getValue() == '' || to.getValue() == '')
			{
				alert('Date from/to cannot be empty!');
				return;
			}
		
			document.reportForm.action = "<c:url value='/page/plafonreportview.htm'/>";
			document.reportForm.submit();
		}
		
		function openplafon()
		{
			var org = document.getElementById('org').value;
			if(org == '')
			{
				alert('Please select Organization first !!!');
				return;
			}
			else if(org == '1824')
			{
				openpopup("<c:url value='/page/popupplafonlist.htm?target=plafon'/>");
			}
			else
			{
				openpopup("<c:url value='/page/popupplafonlist.htm?target=plafon&organization='/>"+org);
			}
		}
		
		function resetform()
		{
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
			<td width="60%">Financial Accounting > Report > Financial Accounting > Plafon Account Report</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">RF83 - Plafon Account</h1>
						`
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="org" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Plafon :</div></td>
                                    <td>
                                        <select id="plafon" name="plafon" class="combobox-ext">
                                        	<c:if test='${not empty plafon}'>
                                            	<option value="${plafon.id}"><c:out value='${plafon.name}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openplafon();" style="CURSOR:pointer;" title="Plafon Account" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input id="from" name="from" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="to" name="to" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
