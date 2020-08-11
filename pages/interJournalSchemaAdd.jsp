<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter Journal Schema >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Inter Journal Schema > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F07 - Inter Journal Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/interjournalschemaview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="journalSchema_add">
							<table style="border:none" width="100%">
							<tr>
								<td width="16%" align="right">Accounting Schema ID</td>
						  	  	<td width="1%">:</td>
					  	  	 	<td width="36%"><form:input path="code" cssClass="inputbox" /></td>
  	  	  		  				<td width="47%" rowspan="6" valign="top" align="left">
    								<fieldset>
                                    	<legend><strong>Inter Information</strong></legend>
                              			<table width="100%">
                                        <tr>
                                            <td width="28%"><div align="right">From Company</div></td>
                                            <td width="2%">:</td>
                                      		<td width="70%">
   											  <form:select id="org" path="organization" cssClass="combobox">
                                              </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                          </td>
                                        </tr>
                                        <tr>
                                            <td><div align="right">To Company</div></td>
                                            <td width="2%">:</td>
<td>
                                                <form:select id="to" path="to" cssClass="combobox">
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=to'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset>
                                    	<legend><strong>Index</strong></legend>
                              			<table width="100%">
                                        <tr>
                                        	<td width="38%" valign="top">
                                           	  <table>
                                                <c:forEach items='${journalSchema_add.indexes}' var='index' varStatus='status'>
                                        		<c:if test='${(status.index % 2) == 0}'>
                                                <tr>
                                        			<td width="5%"><form:checkbox path="indexes[${status.index}].on" value="true"/></td>
                                            		<td width="95%">${index.index.name}</td>
                                        		</tr>
                                                </c:if>
                                        		</c:forEach>
                                                </table>
                                            </td>
                                   		  <td width="62%" valign="top">
                   	 				  			<table>
                                                <c:forEach items='${journalSchema_add.indexes}' var='index' varStatus='status'>
                                        		<c:if test='${(status.index % 2) == 1}'>
                                                <tr>
                                        			<td width="5%"><form:checkbox path="indexes[${status.index}].on" value="true"/></td>
                                            		<td width="95%">${index.index.name}</td>
                                        		</tr>
                                                </c:if>
                                        		</c:forEach>
                                                </table>
                                            </td>
                                		</tr>                                        
                                        </table>
                                    </fieldset>
                           	  	</td>
							</tr>	
							<tr>
								<td><div align="right">Accounting Schema Name</div></td>
								<td width="1%">:</td>
						  	  <td width="36%"><form:input path="name" cssClass="inputbox" /></td>
		    				</tr>
							<tr>
								<td align="right">Chart of Account</td>
								<td width="1%">:</td>
		  				    <td>
								  <form:select id="coa" path="chartOfAccount" cssClass="combobox">
								  </form:select>
								</td>
							</tr>
							<tr>
								<td align="right">Note</td>
								<td width="1%">:</td>
					  	  	  <td><form:textarea path="note" cols="55" rows="6"/></td>
							</tr>
							</table>
							<div id="container" dojoType="TabContainer" style="width:100% ; height: 250px;">
								<div id="debet" dojoType="ContentPane" label="Debet" class="tab-pages">
									<div class="toolbar-clean">
										<div class="item-navigator">&nbsp;</div>
										<a class="item-button-new" href="javascript:addLineItem('DEBET','debet');"><span>New Row</span></a>
										<a class="item-button-delete" href="javascript:deleteRow('lineItemTable-debet')"><span>Delete Row</span></a>
			 						</div>
									<table class="table-list" cellspacing="0" cellpadding="0" id="lineItemTable-debet" width="100%">
									<thead>
                                    <tr>
										<th width="2%">&nbsp;</th>
									 	<th width="5%" align="left"><input type="checkbox" name="checkMaster" id="checkMaster-lineItemTable-debet" onClick="clickAll('lineItemTable-debet');"/></th>
									  	<th colspan="2">GL Account</th>
										<th width="55%">Mandatory</th>
                                        <th width="2%">&nbsp;</th>
									</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${journalSchema_add.accounts}' var='account' varStatus='status'>
                                    <c:if test="${account.postingType == 'DEBET'}">
                                    <tr>
                                   	  	<td align="center"><input type="hidden" id="index" name="index" value="${status.index}"/></td>
                                    	<td align="left"><input type="checkbox" id="check" name="check"/></td>
                                        <td width="30%">
									  		<select id="glaccount[${status.index}]-debet" name="accounts-debet" class="combobox-ext">
                                            	<option value='${account.account.id}'>${account.account.code} ${account.account.name}</option>
                                            </select>
                                      	</td>
                                      	<td width="8%"><img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]-debet');" style="CURSOR:pointer;"/></td>
<td>
                                        	<select id="mandatory[${status.index}]-debet" name="mandatory-debet" class="combobox-ext">
                                            	<option value='${account.mandatory}'>
                                                	<c:if test='${account.mandatory}'>MANDATORY</c:if><c:if test='${!account.mandatory}'>NOT MANDATORY</c:if>
                                                </option>
                                            </select>
                                        </td>
                                        <th width="2%">&nbsp;</th>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table">
										<td colspan="6">&nbsp;</td>
                               		</tr>
                                    </tfoot>
									</table>
									</div>
                                    <div id="credit" dojoType="ContentPane" label="Credit" class="tab-pages">
									<div class="toolbar-clean">
										<div class="item-navigator">&nbsp;</div>
										<a class="item-button-new" href="javascript:addLineItem('CREDIT','credit');"><span>New Row</span></a>
										<a class="item-button-delete" href="javascript:deleteRow('lineItemTable-credit')"><span>Delete Row</span></a>
			 						</div>
									<table class="table-list" cellspacing="0" cellpadding="0" id="lineItemTable-credit" width="100%">
									<thead>
                                    <tr>
										<th width="2%">&nbsp;</th>
									 	<th width="5%" align="left"><input type="checkbox" name="checkMaster" id="checkMaster-lineItemTable-credit" onClick="clickAll('lineItemTable-credit');"/></th>
									  	<th colspan="2">GL Account</th>
										<th width="55%">Mandatory</th>
                                        <th width="2%">&nbsp;</th>
									</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${journalSchema_add.accounts}' var='account' varStatus='status'>
                                    <c:if test="${account.postingType == 'CREDIT'}">
                                    <tr>
                                   	  	<td align="center"><input type="hidden" id="index" name="index" value="${status.index}"/></td>
                                    	<td align="left"><input type="checkbox" id="check" name="check"/></td>
                                        <td width="30%">
									  		<select id="glaccount[${status.index}]-credit" name="accounts-credit" class="combobox-ext">
                                            	<option value='${account.account.id}'>${account.account.code} ${account.account.name}</option>
                                            </select>
                                      	</td>
                                      	<td width="8%"><img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]-credit');" style="CURSOR:pointer;"/></td>
<td>
                                        	<select id="mandatory[${status.index}]-credit" name="mandatory-credit" class="combobox-ext">
                                            	<option value='${account.mandatory}'>
                                                	<c:if test='${account.mandatory}'>MANDATORY</c:if><c:if test='${!account.mandatory}'>NOT MANDATORY</c:if>
                                                </option>
                                            </select>
                                        </td>
                                        <th width="2%">&nbsp;</th>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table">
										<td colspan="6">&nbsp;</td>
                               		</tr>
                                    </tfoot>
									</table>
									</div>
								</div>
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
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/interjournalschemaadd.htm'/>";
		document.addForm.submit();
	}
		
	function savenew()
	{
		document.addForm.action = "<c:url value='/page/journalschemaaddnew.htm'/>";
		document.addForm.submit();
	}
	
	function popup(target)
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Chart of Account first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa='/>"+coa.value+"&target="+target);
	}
		
	var index = 0;
		
	function addLineItem(type,name)
	{
		var tbl = document.getElementById("lineItemTable-"+name);
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;
			
				var row = t_section.insertRow(t_section.rows.length);
				
				row.insertCell(0).appendChild(generateIndex(index,name));
				row.insertCell(1).appendChild(generateCheckBox(index,name));
				row.insertCell(2).appendChild(generateItem(index,name));
				row.insertCell(3).appendChild(itempopup(index,name));
				row.insertCell(4).appendChild(generatemandatory(index,name));
				
				index++;
			}
		}
	}	
	
	function types(index,type,name)
	{
		var types = document.createElement("input");
		types.type = "hidden";
		types.name = "types-"+name;
		types.value = type;
		
		return types;
	}	
		
	function generateIndex(index,name)
	{
		var idx = document.createElement("input");
		idx.type = "hidden";
		idx.name = "index";
		idx.id = "index";
		idx.value = index;
		
		return idx;
	}
					
	function generateCheckBox(index,name)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function generateItem(index,name)
	{
		var itm = document.createElement("select");
		itm.name="accounts-"+name;
		itm.id="glaccounts["+index+"]-"+name;
		itm.setAttribute('class','combobox-ext');
					
		return itm;
	}
	
	function itempopup(index,name)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("glaccounts["+index+"]-"+name);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function generatemandatory(index,name)
	{
		var _mandatory = document.createElement('select');
		_mandatory.name = 'mandatorys-'+name;
		_mandatory.setAttribute('class','combobox-ext');
		
		var _opt1 = document.createElement('option');
		_opt1.value = 'true';
		_opt1.text = 'MANDATORY';
		_opt1.selected = true;
		
		var _opt2 = document.createElement('option');
		_opt2.value = 'false';
		_opt2.text = 'NOT MANDATORY';
	
		_mandatory.appendChild(_opt1);
		_mandatory.appendChild(_opt2);
		
		return _mandatory;
	}
	
	function clickAll(name)
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
		
		var tbl = document.getElementById(name);
		if(tbl)
		{
			var rowLen = tbl.rows.length;
			for(var idx=0;idx<rowLen;idx++)
			{
				var row = tbl.rows[idx];
				var cell = row.cells[1];
				if(cell)
				{
					var node = cell.lastChild;
				
					if(node && node.disabled == false)
						node.checked = checked;
				}
			}
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}
			
	function deleteRow(name)
	{
		var tbl = document.getElementById(name);
			
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[1].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
	
	function showto(type)
	{
		var to = document.getElementById('to');
		var img = document.getElementById('img');
		if(to)
		{
			if(type == 'GENERAL')
			{
				to.disabled = true;
				img.setAttribute('onclick',"");
			}
			else
			{
				to.disabled = false;
				img.setAttribute('onclick',"javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=to'/>');");
			}
		}
	}
</script>