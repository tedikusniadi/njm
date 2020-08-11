<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter From Journal >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>
<!-- BEGIN OF BODY -->
<body>


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
			<td width="60%">Financial Accounting > Journal Entrys > Inter From Journal > Add</td>
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
					<!-- main contents goes here -->
						
						<h1 class="page-title">F45 - Inter From Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/interjournalfromview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="interJournal_add">
                    		<table width="100%" border="0" cellpadding="0" cellspacing="5" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="20%" nowrap="nowrap" align="right">Entry Number :</td>
									  <td width="80%"><input  value="${interJournal_add.code}" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input id="date" name="entryTo.entryDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company From:</td>
										<td>
											<select id="org" class="combobox-ext">
                                            	<option value="${interJournal_add.entryFrom.organization.id}"><c:out value='${interJournal_add.entryFrom.organization.firstName} ${interJournal_add.entryFrom.organization.middleName} ${interJournal_add.entryFrom.organization.lastName}'/></option>
											</select>
										</td>
									</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%">
                                    <tr>
										<td width="19%" align="right" nowrap="nowrap">Amount :</td>
									  	<td width="81%"><input id="amount" size="20" value="<fmt:formatNumber value='${interJournal_add.amount}' groupingUsed='false' maxFractionDigits='0'/>"/></td>
									</tr>
                                    <tr>
                                    	<td width="19%" align="right" nowrap="nowrap">Inter Type :</td>
                                    	<td>
                                        	<form:select path="postingType" disabled="true">
												<form:option value="DEBET">DEBET</form:option>
                                                <form:option value="CREDIT">CREDIT</form:option>
											</form:select>
                                        </td>
                                    </tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company To :</td>
										<td>
											<select id="orgto" class="combobox-ext">
                                            	<option value="${interJournal_add.organizationTo.id}"><c:out value='${interJournal_add.organizationTo.firstName} ${interJournal_add.organizationTo.middleName} ${interJournal_add.organizationTo.lastName}'/></option>                                            
											</select>
										</td>
									</tr>
                                    </table>
								</td>
							</tr>
							</table>
							<table width="100%" style="border:none" id="tableRecord">
							<tr valign="top">
								<td width="52%">
								  <table width="100%" style="border:none">
                                    <tr>
										<td width="24%" align="right" nowrap="nowrap">Name :</td>
									  <td width="76%"><form:input path="entryTo.name" size="50"/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryTo.entryType">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="entryFrom.currency" disabled="true">
                                            	<form:options items='${currencys}' itemLabel='symbol' itemValue='id'/>
											</form:select>
                                            &nbsp;
                                            <form:select path="entryFrom.exchangeType" disabled="true">
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                     <tr>
										<td nowrap="nowrap" align="right">Journal Schema :</td>
										<td>
											<select id="schema" name="entryTo.journalSchema" class="combobox-ext">
											</select>
                                            &nbsp;
											<img src="assets/icons/list_extensions.gif" onclick="javascript:openschema();" style="CURSOR:pointer;" title="Journal Schema" />
										</td>
									</tr>
                                    <form:hidden id='period' path='entryTo.accountingPeriod'/>
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="entryTo.note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
						  <td width="48%">
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
                                                    	<input id="hidden-id[${type.id}]" type="hidden" name="indexes" value="${type.id}" disabled/>
                                                        <input id="text-id[${type.id}]" name="text" size="15" disabled/>
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
												<table width="100%" style="border:none">
												<tr>
													<td width="32%">&nbsp;</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="right"><strong>Total :</strong></td>
													<td><input value="0" type="text" id="txtBalanceDebet" size="20" disabled /></td>
													<td><input value="0" type="text" id="txtBalanceCredit" size="20" disabled /></td>
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
								<thead>
                                <tr>
									<th>&nbsp;</th>
									<th><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
									<th width="32%" colspan="2">Account</th>
									<th width="19%">Amount</th>
                                    <th width="25%">Type</th>
									<th width="20%">Note</th>
								</tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                	<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                </tfoot>
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
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/AccountingPeriodDWRRemote.js'/>"></script>
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
	
		var amount = document.getElementById('amount');
		if(amount.value == '')
		{
			alert('amount cannot be empty!');
			return;
		}
	
		if(Format.format(amount.value) != debet)
		{
			alert('Amount not balance!');
			return;
		}
	
		var _event = function(data)
		{
			if(data.id != null)
			{
				var period = document.getElementById('period');
				if(period)
					period.value = data.id;
			
				document.addForm.action = "<c:url value='/page/interjournalfromadd.htm'/>";
				document.addForm.submit();
			}
			else
			{
				alert('Accounting Period doesnot exist!');
			}			
		}
		
		var date = document.getElementById('date');			
		if(date.firstChild.value == '')
		{
			alert("Please select date first!");
			return;
		}
		
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert("Please select Organization first!");
			return;
		}
		
		AccountingPeriodDWRRemote.load(date.firstChild.value,org.value,_event);
	}

	function amountView()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var _credit = document.getElementById('txtBalanceCredit');
			var _debet = document.getElementById('txtBalanceDebet');

			var debet = 0.00;
			var credit = 0.00;
		
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=0;idx<len;idx++)
			{
				var _amnt = t_section.rows[idx].cells[4].firstChild;
				var _type = t_section.rows[idx].cells[5].firstChild;
								
				if(_amnt && _type && _amnt.value && _type.value)
				{
					if(_type.value == 'CREDIT')
						credit = credit + parseFloat(_amnt.value);
					else
						debet = debet + parseFloat(_amnt.value);
				}
			}
			
			if(_credit && _debet)
			{
				_credit.value = Format.format(credit);
				_debet.value = Format.format(debet);
			}
		}
	}
</script>
<script type="text/javascript" language="javascript">
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
	
				row.insertCell(0).appendChild(generateIndex(index));
				row.insertCell(1).appendChild(generateCheckBox(index));
				row.insertCell(2).appendChild(generateAccount(index));
				row.insertCell(3).appendChild(generatePopup(index));
				row.insertCell(4).appendChild(generateAmount(index));
				row.insertCell(5).appendChild(generatePostingType(index));
				row.insertCell(6).appendChild(generateNote(index));
				
				index++;
			}
		}
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
		var coa = document.getElementById('schema');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupjournalschemaaccountview.htm?type=INTER&target='/>"+target);
	}
	
	function openperiod()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		url = "<c:url value='/page/popupaccountingperiodview.htm?target=period&openonly=true&organization='/>"+org.value;
		
		var date = document.getElementById('date');
		if(date && date.firstChild.value != '')
		{
			url = url+"&date="+date.firstChild.value;
		}
		
		openpopup(url);
	}
	
	function openschema()
	{
		var org = document.getElementById('org');
		var orgto = document.getElementById('orgto');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupinterjournalschemaview.htm?render=true&target=schema&to='/>"+org.value+"&from="+orgto.value);
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
					
		amounts.setAttribute('onchange','amountView();');
		amounts.setAttribute('onblur','amountView();');
		
		return amounts;
	}
	
	function generatePostingType(index)
	{
		var action = function()
		{
			amountView();
		};
	
		var postingTypes = document.createElement("select");
		postingTypes.name = "postingTypes";
		postingTypes.id = "postingTypes["+index+"]";
		postingTypes.onchange = action;
		
		var opt1 = document.createElement("option");
		opt1.value = "DEBET";
		opt1.text = "DEBET";
		opt1.onclick = action;
		
		postingTypes.appendChild(opt1);
		
		var opt2 = document.createElement("option");
		opt2.value = "CREDIT";
		opt2.text = "CREDIT";
		opt2.onclick = action;
		
		postingTypes.appendChild(opt2);
		
		return postingTypes;
	}
	
	function generateNote()
	{
		var note = document.createElement("input");
		note.type = "text";
		note.name = "notes";
		note.id = "notes";
		note.setAttribute('size',"45");
		
		return note;
	}
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
		
		var tbl = document.getElementById("lineItemTable");
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
			
	function deleteRow()
	{
		var tbl = document.getElementById("lineItemTable");
			
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
			
		amountView();
	}
</script>