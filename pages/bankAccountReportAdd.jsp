<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Bank Account Report</title>
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
				Reports > Financial Accounting > Accounting > GL Register
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
						
						<h1 class="page-title">RF76 - Bank Account Report</h1>
						
						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:fillData();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generateReport();"><span>Generate</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute='criteria'>
								<table width="100%" style="border:none">
                                <tr>
									<td width="32%" align="right">Account</td>
								  	<td width="1%">:</td>
                              		<td>
                                    	<form:select id='bankAccount' path='bankAccount' cssClass='combobox-ext'>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openpopup('<c:url value='/page/popupbankaccountview.htm?target=bankAccount'/>')" style="CURSOR:pointer;" title="Bank Account" />
                                    </td>
								</tr>
                                <tr>
									<td width="32%" align="right">Company</td>
								  	<td width="1%">:</td>
                              		<td width="66%" colspan="2" valign="top" align="left">
						  				<div class="toolbar-clean">
											<a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
											<a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
						  				</div>
                                    </td>
								</tr>
								<tr>
									<td width="32%" align="right">&nbsp;</td>
								  	<td width="1%">&nbsp;</td>
                              		<td width="66%" colspan="2" valign="top">
						  				<table id="lineItemTable" cellspacing="0" cellpadding="1" align="center" width="100%">
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
                                <tr>
									<td colspan="4">&nbsp;</td>
								</tr>
                                <tr>
                                    <td align="right">Date From &nbsp;&nbsp;</td>
                                    <td>:&nbsp;</td>
                                    <td>
                                        <input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Currency</td>
									<td>:</td>
                                    <td>
										<select name="currency" cssClass="combobox">
                                        	<c:forEach items='${currencys}' var='currency'>
                                            	<option value="${currency.id}"><c:out value='${currency.name}'/></option>
                                            </c:forEach>
										</select>
									</td>
                                    <td>&nbsp;</td>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	function generateReport()
	{
		var from = dojo.widget.byId('dateFrom').getValue();
		var to = dojo.widget.byId('dateTo').getValue();
	
		if(from == '' || to == '')
		{
			alert('Date from or Date to cannot be empty!');
			return;
		}
	
		document.reportForm.action = "<c:url value='/page/reportbankaccountview.htm'/>";
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
				
				row.insertCell(0).appendChild(genChk(row.rowIndex));
				row.insertCell(1).appendChild(genOrg(row.rowIndex));
				row.insertCell(2).appendChild(genOrgPopup(row.rowIndex));
			}
		}
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
	
	function popup(target,index)
	{
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target='/>"+target);
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
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
		
		var tbl = document.getElementById("lineItemTable");
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
	
	function deleteRow()
	{
		var tbl = document.getElementById("lineItemTable");
			
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
	}
</script>