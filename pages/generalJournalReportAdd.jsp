<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
		<title>General Journal Report</title>
    	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
		<%@ include file="/common/sirius-header.jsp"%>
        <%@ include file="/common/popup.jsp"%>
		<script type="text/javascript" src="assets/main.js"></script>
		<script type="text/javascript">
			function generate()
			{
				document.addForm.action = "<c:url value='/page/generaljournalreportview.htm'/>";
				document.addForm.submit();
			}
		
			function resetform()
			{
				var org = document.getElementById('org');
				var coa = document.getElementById('coa');
				var account = document.getElementById('account');
			
				for(var idx=org.options.length;idx>=0;idx--)
					org.remove(org.selectedIndex);
					
				for(var idx=coa.options.length;idx>=0;idx--)
					coa.remove(coa.selectedIndex);
				
				for(var idx=account.options.length;idx>=0;idx--)
					account.remove(account.selectedIndex);
			
				document.addForm.reset();
			}
		
			function popup(target)
			{
				var coa = document.getElementById('coa');
				if(coa.value == '')
				{
					alert('Please select valid Journal Schema first!');
					return;
				}
			
				openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa='/>"+coa.value+"&target="+target);
			}
			
			function change(id,source)
			{
				if(source.checked)
					document.getElementById('content['+id+']').disabled = false;
				else
					document.getElementById('content['+id+']').disabled = true;
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
				organization.name="orgs";
				organization.id="org["+index+"]";
				organization.setAttribute('class','combobox-ext');
							
				return organization;
			}
						
			function genOrgPopup(index)
			{
				var _popup = document.createElement('img');
				_popup.id = '_popup_line['+index+']';
				_popup.src = 'assets/icons/list_extensions.gif';
				_popup.onclick = function()
				{
					openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org['/>"+index+']');
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
			<td width="60%">Reports > Financial Accounting > Accounting > General Journal</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title"> RF68 - General Journal</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="filterCriteria">
								<table width="100%" style="border:none">
								<tr>
									<td width="22%" align="right">Company</td>
                                    <td width="1%">:</td>
									<td width="76%">
										<div class="toolbar-clean">
											<a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
											<a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
						  				</div>
								  	</td>
						   			<td width="1%">&nbsp;</td>
								</tr>
                                <tr>
									<td align="right" colspan="2">&nbsp;</td>
                              		<td valign="top" align="left">
						  				<table id="lineItemTable" cellspacing="0" cellpadding="1" align="left" width="50%">
                                        <tbody>
                                        </tbody>
                                        </table>
                                    </td>
								</tr>
								<tr>
									<td align="right">Date From</td>
									<td>:</td>
									<td>
										<input id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
										&nbsp;Date To &nbsp;:&nbsp;
										<input id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Accounting Schema</td>
                                    <td>:</td>
									<td>
										<select id="coa" class="combobox-ext">
										</select>
									</td>
								</tr>
                                <tr>
									<td align="right">Account Name</td>
                                    <td>:</td>
									<td>
										<form:select id="account" path="account" cssClass="combobox-ext">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:popup('account');" style="CURSOR:pointer;" title="Account" />
									</td>
						   			<td><form:errors path="account" cssClass="error"/></td>
								</tr>
								<tr>
									<td align="right" valign="top">Entry Type</td>
                                    <td valign="top">:</td>
									<td valign="top">
                                    	<table border="0" cellpadding="0" cellspacing="5">
                                        <tr>
                                        	<td><form:checkbox value="true" path="correction" label="CORRECTION"/></td>
                                        </tr>
                                        <tr>
                                        	<td><form:checkbox value="true" path="entry" label="ENTRY"/></td>
                                        </tr>
                                        <tr>
                                        	<td><form:checkbox value="true" path="adjustment" label="ADJUSTMENT"/></td>
                                        </tr>
                                        </table>
									</td>
                                    <td>&nbsp;</td>
								</tr>
                                <tr>
									<td align="right">Status</td>
                                    <td>:</td>
									<td>
										<form:select id="status" path="status">
                                        	<option value=''>All</option>
                                            <option value='POSTED'>POSTED</option>
                                            <option value='BATCHED'>BATCHED</option>
										</form:select>
									</td>
						   			<td><form:errors path="account" cssClass="error"/></td>
								</tr>
                                <tr>
									<td align="right" valign="top">Index</td>
                                    <td valign="top">:</td>
									<td valign="top">
                                    	<table border="0" cellpadding="0" cellspacing="5">
                                        <c:forEach items='${accountingAdapter.indexes}' var='index' varStatus='status'>
                                        <tr>
                                        	<td><form:checkbox onkeyup="change('${status.index}',this);" onclick="change('${status.index}',this);" value="true" path="indexes[${status.index}].used" label="${index.indexType.name}"/></td>
                                        	<td><form:input disabled="true" id="content[${status.index}]" path="indexes[${status.index}].content"/></td>
                                        </tr>
                                        </c:forEach>
                                        </table>
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
