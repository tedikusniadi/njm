<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cash/Bank Report</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->


<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">
				Reports > Financial Accounting > Accounting > Cash/Bank Report
			</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

						<h1 class="page-title">RF99 - Cash/Bank Account Report</h1>

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-cancel" href="<c:url value='/page/reportpayablecashbankpre.htm'/>"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generateReport();"><span>Generate</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute='criteria'>
								<table width="100%" style="border:none">
								 <tr>
                                    <td align="right"><spring:message code="date"/> &nbsp;&nbsp;</td>
                                    <td>:&nbsp;</td>
                                    <td>
                                        <input id="dateFrom" value="<fmt:formatDate value='${now}'/>" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
								<tr>
                                    <td><div align="right"><spring:message code="company"/></div></td>
                                    <td></td>
                                    <td>
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
									<td width="32%" align="right">Account</td>
								  	<td width="1%">:</td>
                              		<td width="" colspan="2" valign="top" align="left">
						  				<div class="toolbar-clean">
											<a class="item-button-new" href="javascript:addAccount();"><span>New Row</span></a>
											<a class="item-button-delete" href="javascript:deleteRow('accountTable')"><span>Delete Row</span></a>
						  				</div>
                                    </td>
								</tr>
								<tr>
									<td width="32%" align="right">&nbsp;</td>
								  	<td width="1%">&nbsp;</td>
                              		<td width="66%" colspan="2" valign="top">
						  				<table id="accountTable" cellspacing="0" cellpadding="1" align="center" width="100%">
                                        <thead>
                                        <tr>
                                        	<td width="3%">&nbsp;</td>
                                   	  	  	<td width="48%">&nbsp;</td>
                                            <td width="49%">&nbsp;</td>
                                       	</tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        </table>
                                    </td>
								</tr>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	function generateReport()
	{
		var from = dojo.widget.byId('dateFrom').getValue();
		if(from == '')
		{
			alert('Date from or Date to cannot be empty!');
			return;
		}

		document.reportForm.action = "<c:url value='/page/reportpayablecashbankview.htm'/>";
		document.reportForm.submit();
	}

	function resetform()
	{
		var org = document.getElementById('org');

		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);

		document.reportForm.reset();
	}

	var index = 0;

	function addAccount()
	{
		var tbl = document.getElementById("accountTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genChk(row.rowIndex));
				row.insertCell(1).appendChild(genAcc(row.rowIndex));
				row.insertCell(2).appendChild(genAccPopup(row.rowIndex));
			}
		}
	}

	function addLineItem()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genChkacc(row.rowIndex));
				row.insertCell(1).appendChild(genOrg(row.rowIndex));
				row.insertCell(2).appendChild(genOrgPopup(row.rowIndex));
			}
		}
	}
	function genChkacc(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "checkacc";
		check.id = "checkacc";

		return check;
	}
	function genChk(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";

		return check;
	}

	function genOrg(index)
	{
		var organization = document.createElement("select");
		organization.name="selected";
		organization.id="org["+index+"]";
		organization.setAttribute('class','combobox-ext');

		return organization;
	}
	function genAcc(index)
	{
		var organization = document.createElement("select");
		organization.name="selected";
		organization.id="acc["+index+"]";
		organization.setAttribute('class','combobox-ext');

		return organization;
	}
	function popupacc(target,index)
	{
		openpopup("<c:url value='/page/popupbankaccountview.htm?organization="+$("#org").val()+"&target='/>"+target);
	}
	function popup(target,index)
	{
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target='/>"+target);
	}

	function genAccPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popupacc("acc["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Account Popup';

		return _popup;
	}
	function genOrgPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("org["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Company';

		return _popup;
	}

	function clickAll(id)
	{
		var checked = false;
		if(document.getElementById("checkMaster_"+id).checked == true)
			checked = true;

		var tbl = document.getElementById(id);
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			for(var idx=len-1;idx>=0;idx--)
				t_section.rows[idx].cells[0].firstChild.setAttribute('checked',true);
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}

	function deleteRow(id)
	{
		var tbl = document.getElementById(id);

		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}

		var check = document.getElementById("checkMaster_"+id);
		if(check)
			check.checked = false;
	}
</script>