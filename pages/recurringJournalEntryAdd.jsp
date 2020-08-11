<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Journal Entry >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>
<!-- BEGIN OF BODY -->
<body onload="error();">


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Journal Entrys > Recurring Journal > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">F42 - Recurring Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/recurringjournalentryview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="recurringJournal_add">
							<table width="100%" border="0" cellpadding="0" cellspacing="20" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="Auto Number" size="30" disabled/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Day :</td>
										<td>
											<form:select path="day">
												<c:forEach begin="1" end="31" step="1" var='day'>
													<form:option value="${day}">${day}</form:option>
												</c:forEach>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><form:input path="name" size="65"/> </td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryType">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="currency">
                                            	<form:options items='${currencys}' itemLabel='symbol' itemValue='id'/>
											</form:select>
                                            &nbsp;
                                            <form:select path="exchangeType">
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td>
											<form:select id="org" path="organization" cssClass="combobox-ext">
											</form:select>
											&nbsp;
											<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Chart of Account :</td>
										<td>
											<select id="coa" class="combobox-ext">
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Status :</td>
										<td>
											<form:radiobutton path="enabled" value="true" label="Enabled"/>
											<form:radiobutton path="enabled" value="false" label="Disabled"/>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${indexTypes}' var='type'>
                                                <tr>
													<td align="right">${type.name}</td>
													<td align="center">:</td>
													<td>
                                                    	<input id="hidden-id[${type.id}]" type="hidden" name="indexes" value="${type.id}"/>
                                                        <input id="text-id[${type.id}]" name="text" size="15"/>
                                                    </td>
												</tr>
                                                </c:forEach>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Entry Balance</strong></legend>
												<table width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="29%">&nbsp;</td>
													<td width="37%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input value="0" type="text" id="txtBalanceDebet" size="15" disabled /></td>
													<td><input value="0" type="text" id="txtBalanceCredit" size="15" disabled /></td>
												</tr>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </table>
								</td>
								</tr>
								</table>			

								<div class="toolbar-clean">
									<div class="item-navigator">&nbsp;</div>
									<a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
									<a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
						  		</div>
								<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
								<tr>
									<th width="2%">&nbsp;</th>
								  	<th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
									<th colspan="2">Account</th>
								  	<th width="19%">Amount</th>
                                    <th width="25%">Type</th>
									<th width="20%">Note</th>
								</tr>
                                <c:forEach items='${recurringJournal_add.details}' var='detail' varStatus='status'>
                                <tr>
									<td><input type="hidden" id="index" value="${status.index+1}"/></td>
									<td><input type="checkbox" id="check"/></td>
									<td colspan="2">
                               	  <form:select id="glaccounts[${status.index+1}]" path="details[${status.index}].account" cssClass="combobox-ext">
                                        	<form:option value='${detail.account.id}'>${detail.account.code} ${detail.account.name}</form:option>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;"/>
                                    </td>
								  <td width="19%"><form:input path="details[${status.index}].amount" size="20"/></td>
                                    <td width="25%">
                                    	<form:select path="details[${status.index}].postingType">
                                        	<form:option value="DEBET">DEBET</form:option>
                                            <form:option value="CREDIT">DEBET</form:option>
                                        </form:select>
                                    </td>
									<td width="20%"><form:input path="details[${status.index}].note" size="50"/></td>
								</tr>
                                </c:forEach>
								</table>
							</form:form>
                    	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript">
	function save()
	{		
		var debet = document.getElementById('txtBalanceDebet').value;
		var credit = document.getElementById('txtBalanceCredit').value;			
	
		if(debet != credit)
		{
			alert("Amount not balance!");
			return;
		}
	
		document.addForm.action = "<c:url value='/page/recurringjournalentryadd.htm'/>";
		document.addForm.submit();
	}

	function savenew()
	{		
		var debet = document.getElementById('txtBalanceDebet').value;
		var credit = document.getElementById('txtBalanceCredit').value;			
	
		if(debet != credit)
		{
			alert("Amount not balance!");
			return;
		}
	
		document.addForm.action = "<c:url value='/page/recurringjournalentryaddnew.htm'/>";
		document.addForm.submit();
	}	

	function amountView()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var _credit = document.getElementById('txtBalanceCredit');
			var _debet = document.getElementById('txtBalanceDebet');

			var debet = 0;
			var credit = 0;
		
			var rows = tbl.rows;
			for(var idx=1;idx<rows.length;idx++)
			{
				var _amnt = document.getElementById('amounts['+idx+']');
				var _type = document.getElementById('postingTypes['+idx+']');
			
				if(_amnt && _type && _amnt.value)
				{
					if(_type.value == 'CREDIT')
						credit = credit + parseInt(_amnt.value);
					else
						debet = debet + parseInt(_amnt.value);
				}
			}
			
			if(_credit && _debet)
			{
				_credit.value = credit;
				_debet.value = debet;
			}
		}
	}

	function addLineItem()
	{
		var tbl = document.getElementById("lineItemTable");
		var row = tbl.insertRow(tbl.rows.length);
	
		row.insertCell(0).appendChild(generateIndex(row.rowIndex));
		row.insertCell(1).appendChild(generateCheckBox(row.rowIndex));
		row.insertCell(2).appendChild(generateAccount(row.rowIndex));
		row.insertCell(3).appendChild(generatePopup(row.rowIndex));
		row.insertCell(4).appendChild(generateAmount(row.rowIndex));
		row.insertCell(5).appendChild(generatePostingType(row.rowIndex));
		row.insertCell(6).appendChild(generateNote());
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
	
	function generateAccount(index)
	{
		var accounts = document.createElement("select");
		accounts.name="accounts";
		accounts.id="glaccounts["+index+"]";
		accounts.setAttribute('class','combobox-ext');
					
		return accounts;
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
	
	function openperiod()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupaccountingperiodview.htm?target=period&organization='/>"+org.value);
	}
	
	function openschema()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupjournalschemaview.htm?target=schema&organization='/>"+org.value);
	}
	
	function generatePopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("glaccounts["+index+"]");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function generateAmount(index)
	{
		var amounts = document.createElement("input");
		amounts.type = "text";
		amounts.name = "amounts";
		amounts.id = "amounts["+index+"]";
		amounts.setAttribute('size',"20");
		amounts.value = "0";
		
		var action = function()
		{
			amountView();		
		};
		
		amounts.onchange = action;
		amounts.onblur = action;
		
		return amounts;
	}
	
	function generatePostingType(index)
	{
		var postingTypes = document.createElement("select");
		postingTypes.name = "postingTypes";
		postingTypes.id = "postingTypes["+index+"]";
		
		var opt1 = document.createElement("option");
		opt1.value = "DEBET";
		opt1.text = "DEBET";
		opt1.onclick = function()
		{
			amountView();
		};
		
		postingTypes.appendChild(opt1);
		
		var opt2 = document.createElement("option");
		opt2.value = "CREDIT";
		opt2.text = "CREDIT";
		opt2.onclick = function()
		{
			amountView();
		};
		
		postingTypes.appendChild(opt2);
		
		return postingTypes;
	}
	
	function generateNote()
	{
		var note = document.createElement("input");
		note.type = "text";
		note.name = "notes";
		note.id = "notes";
		note.setAttribute('size',"50");
		
		return note;
	}
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
	
		var tbl = document.getElementById(name);
		var rowLen = tbl.rows.length;
		for(var idx=1;idx<rowLen;idx++)
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
	
		var rowLen = tbl.rows.length - 1;
		for(var idx=rowLen;idx > 0;idx--)
			tbl.deleteRow(idx)
	}
	
	function bufferRow(table)
	{
		var tbl = document.getElementById("lineItemTable");
		
		var rowLen = tbl.rows.length;
		for(var idx=1;idx<rowLen;idx++)
		{
			var row = tbl.rows[idx];
			var cell = row.cells[1];
			var node = cell.lastChild;			
			if(node.checked == false)
			{
				var _row = table.insertRow(table.rows.length);					
				
				for(var _cellLen=0;_cellLen<row.cells.length;_cellLen++)
					_row.insertCell(_cellLen).appendChild(row.cells[_cellLen].lastChild);
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
	
		if(document.getElementById("checkMaster").checked == true)
		{				
			deleteAll(name);
			document.getElementById("checkMaster").checked = false;
		}
		else
		{
			var table = document.createElement("table");
			
			bufferRow(table);
			deleteAll();
			reIndex(table);
		}
	}
	
	function setIndex(id)
	{
		if(id)
		{
			var input = document.getElementById('text-id['+id+']');
			var index = document.getElementById('hidden-id['+id+']');
		
			if(input && index)
			{
				if(input.value != '')
					index.disabled = false;
				else
					index.disabled = true;
			}
		}
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>