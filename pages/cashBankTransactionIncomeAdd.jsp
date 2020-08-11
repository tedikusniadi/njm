<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cash Bank Transaction Income >> Add</title>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Cash/Bank Income > Add</td>
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
						
						<h1 class="page-title">F51 - Financial Accounting > Cash Bank Management > Cash/Bank Income</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/cashbanktransactionincomeview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
							<a class="item-button-save-new" href="javascript:save(true);"><span>Save &amp; New</span></a>							
					  	</div>
						<div class="main-box" style="overflow:auto;">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="cashBankIncome_add">
                                <table width="100%" cellpadding="2" cellspacing="0" style="border:none;">
   				  				<tr>
                                    <td width="15%" nowrap="nowrap" align="right">ID</td>
                                	<td width="0%">:</td>
       								<td width="49%"><input  value="Auto Number" size="30" disabled/></td>
                    				<td width="36%" rowspan="3" valign="top">
                                    	<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table cellspacing="2" style="border:none;" width="100%">
                                            <thead>
                                            <tr>
                                            	<th height="25">&nbsp;</th>
                                              	<th bgcolor="#B7C9E3">Debet</th>
                                                <th bgcolor="#B7C9E3">Credit</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                            	<td>Total:</td>
                                                <td><input disabled id='debet' class="input-disabled" size="17" style="text-align:right" value="0.00" /></td>
                                                <td><input disabled id='credit' class="input-disabled" size="17" style="text-align:right" value="0.00" /></td>
                                            </tr>
                                            </tbody>
                                            </table>
                                        </fieldset>
                    				</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date</td>
                                    <td>:</td>
                                    <td><input id="date" name="date" value="<fmt:formatDate value='${cashBankIncome_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                            <c:if test='${not empty cashBankIncome_add.organization}'>
                                                <form:option value='${cashBankIncome_add.organization.id}' label='${cashBankIncome_add.organization.firstName} ${cashBankIncome_add.organization.lastName} ${cashBankIncome_add.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Cash/Bank Account</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id='bankAccount' path="bankAccount">
                                            <c:if test='${not empty cashBankIncome_add.bankAccount}'>
                                                <form:option value='${cashBankIncome_add.bankAccount.id}' label='${cashBankIncome_add.bankAccount.code} ${cashBankIncome_add.bankAccount.accountName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openbank();" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                    <td rowspan="10" valign="top">
                                    	<fieldset>
                                        	<legend><strong>Index</strong></legend>
                                            <table id="index_table" width="100%" style="border:none;" cellpadding="3">
                                            <tbody>
                                            </tbody>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Cash/Bank GL Account</td>
                                    <td>:</td>
                                    <td><input id="glAccount" disabled size="50" class="input-disabled"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Journal Schema</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id='journalSchema' path="journalSchema" onfocus='showindex();'>
                                            <c:if test='${not empty cashBankIncome_add.journalSchema}'>
                                                <form:option value='${cashBankIncome_add.journalSchema.id}' label='${cashBankIncome_add.journalSchema.code} ${cashBankIncome_add.journalSchema.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openschema();" style="CURSOR:pointer;" title="Journal Schema" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Amount</td>
                                    <td>:</td>
                                    <td><input id="t_credit" name='amount' value="0.00" size="20" onchange="display();"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Currency</td>
                                    <td>:</td>
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
                                    <td nowrap="nowrap" align="right">Note</td>
                                    <td>:</td>
                                    <td><form:textarea path="note" cols="55" rows="7"/></td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
								<div class="toolbar-clean">
                                    <div class="item-navigator">&nbsp;</div>
                                    <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                    <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                </div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                    <th colspan="2">Account</th>
                                    <th width="19%" colspan="2">Company</th>
                                    <th width="25%">Amount</th>
                                    <th width="20%">Note</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                <tr class="end-table">
                                    <td colspan="6">&nbsp;</td>
                                    <td align="right">
                                        <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                        </div>
                                    </td>
                                </tr>    
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/AccountingPeriodDWRRemote.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/JournalSchemaIndexDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save(_forward)
	{	
		var debet = dojo.byId('debet').value;
		var credit = dojo.byId('credit').value;			
	
		if(debet != credit)
		{
			alert("Amount not balance!");
			return;
		}
		
		if(debet == 0 || credit == 0)
		{
			alert("Debet or Credit cannot be 0!");
			return;
		}

		var _event = function(data)
		{
			if(data.id != null)
			{
				var period = document.getElementById('period');
				if(period)
					period.value = data.id;
					
				var send = true;
				var date = dojo.widget.byId('date').getValue();
				
				if(date.substring(3,date.length) != "<fmt:formatDate value='${now}' pattern='MM-yyyy'/>")
					send = confirm("Journal Entry date not equal current month,are you sure want to continue processing?");
			
				if(send)
				{
					document.addForm.action = "<c:url value='/page/cashbanktransactionincomeadd.htm?forward='/>"+_forward;
					document.addForm.submit();				
				}

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
	
	function showindex()
	{
		var t_credit = dojo.byId('t_credit');
		if(t_credit)
			t_credit.focus();
	
		var schema = dojo.byId('journalSchema').value;
		if(schema == '')
		{
			alert('Please select Journal Schema first!');
			return;
		}
		
		var in_body = dojo.byId('index_table').tBodies[0];
		if(in_body)
		{
			for(var idx=in_body.rows.length-1;idx>=0;idx--)
				in_body.deleteRow(idx);
		
			JournalSchemaIndexDWRRemote.loadIndexes(schema,function(indexes){			
				for(var idx=0;idx<indexes.length;idx++)
				{
					var map = indexes[idx];
					if(map)
					{
						var hidden = document.createElement('input');
						hidden.type = 'hidden';
						hidden.name = 'indexTypes';
						hidden.value = map.id;
					
						var content = null;
					
						if(map.id == '8')
						{
							content = document.createElement('select');
							
							var option = document.createElement('option');
							option.value='';
							
							content.appendChild(option);
						}
						else
							content = document.createElement('input');
					
						var content = document.createElement(content_type);
						content.setAttribute('style','width:125px;');
						content.name = 'contents';
						content.id = 'content['+idx+']';
						content.readonly = true;
					
						var row = in_body.insertRow(in_body.rows.length);
						row.insertCell(0).appendChild(hidden);
						
						var cel1 = row.insertCell(1);
						cel1.innerHTML = map.name;
						cel1.setAttribute('align','right;');
						cel1.setAttribute('style','font-weight:bold;');
						
						row.insertCell(2).appendChild(content);
						
						if(map.id == '8')
						{
							var img = document.createElement('img');
							img.setAttribute('src','assets/icons/list_extensions.gif');
							img.setAttribute('style','CURSOR:pointer;');
							img.setAttribute('title','Vehicle');
							img.setAttribute('onclick','openvehicle("content['+idx+']");');
							
							row.insertCell(3).appendChild(img);
						}
					}
				}
			});
		}
	}

	function display()
	{
		var in_body = dojo.byId('lineItemTable').tBodies[0];
		if(in_body)
		{
			var credit = dojo.byId('debet');
			var debet = dojo.byId('credit');

			var t_debet = 0.0;

			for(var idx=0;idx<in_body.rows.length;idx++)
			{
				var amt = in_body.rows[idx].cells[5].firstChild;
				if(amt.value == '' || amt.value == '0')
				{
					alert('Amount must be > 0');
					return;
				}
				
				t_debet += parseFloat(amt.value);
			}
			
			debet.value = t_debet.numberFormat('#,#.00');

			var t_credit = dojo.byId('t_credit').value;
			if(t_credit != '')
				credit.value = parseFloat(t_credit).numberFormat('#,#.00');
		}
	}
	
	function openbank()
	{
		var org = dojo.byId('org').value;
		if(org == '')
		{
			alert('Please select company first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&organization='/>"+org);
	}
	
	function openschema()
	{
		var org = dojo.byId('org').value;
		if(org == '')
		{
			alert('Please select company first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupjournalschema4cashbanktransactionview.htm?target=journalSchema&organization='/>"+org);
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
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
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genChx(index));
				row.insertCell(1).appendChild(genAcc(index));
				row.insertCell(2).appendChild(genAccPopup(index));
				row.insertCell(3).appendChild(genComp(index));
				row.insertCell(4).appendChild(genCompPopup(index));
				row.insertCell(5).appendChild(genAmt(index));
				row.insertCell(6).appendChild(genNote(index));
				
				index++;
			}
		}
	}
					
	function genChx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genAcc(index)
	{
		var accounts = document.createElement("select");
		accounts.name="bankaccounts";
		accounts.id="account["+index+"]";
		accounts.setAttribute('style','width:250px;');
					
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
	}
	
	function genAccPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var schema = dojo.byId('journalSchema').value;
			if(schema == '')
			{
				alert('Please select Journal Schema first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupjournalschemaaccountview.htm?typeValue=CREDIT&schema='/>"+schema+"&target=account["+index+"]");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function genComp(index)
	{
		var com = document.createElement("select");
		com.name="organizations";
		com.id="org["+index+"]";
		com.setAttribute('class','combobox-ext');
					
		return com;
	}
	
	function genCompPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org['/>"+index+"]");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Organization';

		return _popup;
	}
	
	function genAmt(index)
	{
		var amounts = document.createElement("input");
		amounts.type = "text";
		amounts.name = "amounts";
		amounts.id = "amount["+index+"]";
		amounts.setAttribute('size',"20");
		amounts.setAttribute('onchange','display();');
		amounts.value = "0.00";
		
		return amounts;
	}
		
	function genNote(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.name = "notes";
		note.id = "notes";
		note.setAttribute('size',"15");
		
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
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
				t_section.rows[idx].cells[0].firstChild.setAttribute('checked',true);
		}
		else
			alert('Table doesnot exsist!');
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
			
		display();
	}
	
	function openvehicle(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupvehicleview.htm?byName=true&organization='/>"+org.value+"&target="+target);
	}
</script>