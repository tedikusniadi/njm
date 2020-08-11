<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Balance Sheet Filter</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			document.reportForm.action = "<c:url value='/page/balancesheetreportview.htm'/>";
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
				
		function addLineItem()
		{
			var tbl = document.getElementById("lineItemTable");
			var row = tbl.insertRow(tbl.rows.length);
		
			row.insertCell(0).appendChild(generateIndex(row.rowIndex));
			row.insertCell(1).appendChild(generateCheckBox(row.rowIndex));
			row.insertCell(2).appendChild(genOrg(row.rowIndex));
			row.insertCell(3).appendChild(genOrgPopup(row.rowIndex));
			row.insertCell(4).appendChild(genPeriod(row.rowIndex));
			row.insertCell(5).appendChild(genPeriodPopup(row.rowIndex));
		}
						
		function generateIndex(index)
		{
			var idx = document.createElement("input");
			idx.type = "hidden";
			idx.name = "index";
			idx.id = "index";
			idx.value = index;
			
			return idx;
		}
						
		function generateCheckBox(index)
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
			organization.name="organizations";
			organization.id="org["+index+"]";
			organization.setAttribute('class','combobox-ext');
						
			return organization;
		}
		
		function genPeriod(index)
		{
			var period = document.createElement("select");
			period.name="periods";
			period.id="period["+index+"]";
			period.setAttribute('class','combobox-ext');
						
			return period;
		}
		
		function popup(target,index)
		{
			var period = dojo.byId('period['+index+']');
			if(period)
				period.remove(period.selectedIndex);
				
			openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target='/>"+target);
		}
		
		function openperiod(index)
		{
			var org = document.getElementById('org['+index+']');
			if(org.value == '')
			{
				alert('Please select valid Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupaccountingperiodreport.htm?target=period["+index+"]&openonly=false&organization='/>"+org.value);
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
		
		function genPeriodPopup(index)
		{
			var _popup = document.createElement('img');
			_popup.id = '_popup_line['+index+']';
			_popup.src = 'assets/icons/list_extensions.gif';
			_popup.setAttribute('onclick','openperiod('+index+')');
			_popup.setAttribute('style','CURSOR:pointer;');
			_popup.title='Accounting Period';

			return _popup;
		}
		
		function clickAll()
		{
			var checked = false;
			if(document.getElementById("checkMaster").checked == true)
				checked = true;
		
			var tbl = document.getElementById("lineItemTable");
			var rowLen = tbl.rows.length;
			for(var idx=0;idx<rowLen;idx++)
			{
				var row = tbl.rows[idx];
				var cell = row.cells[1];
				var node = cell.lastChild;			
				node.checked = checked;
			}
		}
		
		function deleteAll()
		{
			var tbl = document.getElementById("lineItemTable");
		
			var rowLen = tbl.rows.length-1;
			for(var idx=rowLen;idx > 0;idx--)
				tbl.deleteRow(idx)
		}
		
		function bufferRow(table)
		{
			var tbl = document.getElementById("lineItemTable");
			
			var rowLen = tbl.rows.length;
			for(var idx=0;idx<rowLen;idx++)
			{
				var row = tbl.rows[idx];
				var cell = row.cells[1];
				var node = cell.lastChild;
				if(node)
				{
					if(node.checked == false)
					{
						var _row = table.insertRow(table.rows.length);					
					
						for(var _cellLen=0;_cellLen<row.cells.length;_cellLen++)
							_row.insertCell(_cellLen).appendChild(row.cells[_cellLen].lastChild);
					}
				}
			}
		}
		
		function reIndex(table)
		{
			var tbl = document.getElementById("lineItemTable");
			
			var rowLen = table.rows.length;
			for(var idx=0;idx < rowLen;idx++)
			{
				var row = table.rows[idx];
				var _row = tbl.insertRow(tbl.rows.length);
				
				for(var _cellLen=0;_cellLen<row.cells.length;_cellLen++)
					_row.insertCell(_cellLen).appendChild(row.cells[_cellLen].lastChild);
			}
		}
		
		function deleteRow()
		{
			var tbl = document.getElementById("lineItemTable");
		
			var table = document.createElement("table");
				
			bufferRow(table);
			deleteAll();
			reIndex(table);
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
			<td width="60%">Reports > Financial Accounting > Accounting > Balance Sheet</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">RF65 - Balance Sheet Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:fillData();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute="filterCriteria">
								<table width="100%" style="border:none">
								<tr>
									<td width="32%" align="right">Company & Accounting Period</td>
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
                                        </table>
                                    </td>
								</tr>
                                <tr>
									<td colspan="4">&nbsp;</td>
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
