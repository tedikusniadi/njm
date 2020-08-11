<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Schematic Journal Entry >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
			<td width="60%">Financial Accounting > Journal Entry > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F41 - Schematic Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/schematicjournalentryview.htm'/>"><span>List</span></a>
							<a class="item-button-save btn_add" style="cursor:pointer;"><span>Save</span></a>
							<a class="item-button-save-new btn_add" style="cursor:pointer;"><span>Save &amp; New</span></a>								
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="journalEntry_add">
							<table width="100%" border="0" cellpadding="0" cellspacing="5" id="tableRecord">
							<tr valign="top">
								<td width="60%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="Auto Number" size="30" disabled/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><form:input path="name" size="65"/> </td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input id="date" name="entryDate" value="<fmt:formatDate value='${journalEntry_add.entryDate}' pattern='dd-MM-yyyy'/>" class="datepicker"/></td>
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
                                            	<c:if test='${not empty organization}'>
                                                	<form:option value='${organization.id}' label='${organization.firstName} ${organization.lastName} ${organization.middleName}' />
                                                </c:if>
											</form:select>
											&nbsp;
											<img src="assets/icons/list_extensions.gif" onclick="javascript:opencompany()" style="CURSOR:pointer;" title="Company Structure" />
										</td>
									</tr>
                                     <tr>
										<td nowrap="nowrap" align="right">Journal Schema :</td>
										<td>
											<select id="schema" name="journalSchema" class="combobox-ext">
											</select>
                                            &nbsp;
											<img src="assets/icons/list_extensions.gif" onclick="javascript:openschema();" style="CURSOR:pointer;" title="Journal Schema" />
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Note :</td>
										<td><form:textarea path="note" cols="55" rows="7"/></td>
									</tr>
									</table>
								</td>
								<td width="40%">
									<table width="100%">
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${indexTypes}' var='type'>
                                                <tr>
													<td align="right">${type.name}</td>
													<td> :
                                                    	<c:if test='${type.id < 8}'>
                                                            <input id="hidden-id[${type.id}]" type="hidden" name="indexs" value="${type.id}"/>
                                                            <input id="text-id[${type.id}]" name="text" size="34"/>
                                                    	</c:if>
                                                        <c:if test='${type.id == 8}'>
															<input id="hidden-id[${type.id}]" type="hidden" name="indexs" value="${type.id}"/>
                                                            <select id="text-id[${type.id}]" name="text" class="inputbox">
                                                            	<option value=""></option>
                                                            </select>
															<img src="assets/icons/list_extensions.gif" onclick="openPopupVehicle('text-id[${type.id}]');" style="CURSOR:pointer;" title="Vehicle" />
                                                        </c:if>
                                                        <c:if test='${type.id == 9}'>
															<input id="hidden-id[${type.id}]" type="hidden" name="indexs" value="${type.id}"/>
                                                            <select id="text-id[${type.id}]" name="text" class="inputbox">
                                                            	<option value=""></option>
                                                            </select>
															<img src="assets/icons/list_extensions.gif" onclick="openPopupDepartment('text-id[${type.id}]');" style="CURSOR:pointer;" title="Department" />
                                                        </c:if>
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
												<table width="100%" border="0" cellpadding="2" cellspacing="2">
												<tr>
													<td width="20%">&nbsp;</td>
													<td width="40%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="40%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input value="0" id="txtBalanceDebet" style="text-align:right;" size="17" disabled /></td>
													<td><input value="0" id="txtBalanceCredit" style="text-align:right;" size="17" disabled /></td>
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
									<th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
									<th>Code</th>
                                    <th colspan="2">Name</th>
									<th width="19%">Amount</th>
                                    <th width="25%">Type</th>
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
											<a class="item-button-new" href="javascript:addLineItem();"><span>&nbsp;</span></a>
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
	<%@ include file="/common/sirius-footer.jsp"%>

</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		//var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Schematic Journal Entry',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.btn_add').click(function(e)
		{
			/* var dept = document.getElementById("text-id[9]");
			if(dept.value == '')
			{
				alert('Please select Department first !!!');
				return;
			} */
			
			$debet = $('#txtBalanceDebet').val();
			$credit = $('#txtBalanceCredit').val();	
			$date = $('#date').val();
			$today = "${now}";
			
			if(!$('#date').val())
			{
				alert('Please select date first!');
				return;
			}
			
			if(Date.parse($('#date').datepicker('getDate')) < Date.parse("<fmt:formatDate value='${now}' pattern='MMMM dd, yyyy'/>"))
			{
				$('#date').val("<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>");
				alert('Tanggal tidak boleh sebelum tanggal hari ini !!!');
				return;
			}
		
			if($debet.toNumber() == 0 || $credit.toNumber() == 0 || $debet != $credit)
			{
				alert("Amount not balance!");
				return;
			}
		
			if(!$('#schema').val())
			{
				alert('Please select Journal Schema!');
				return;
			}
			
			$send = true;
			
			if($date.substring(3,$date.length) != "<fmt:formatDate value='${now}' pattern='MM-yyyy'/>")
					$send = confirm("Journal Entry date not equal current month,are you sure want to continue processing?");
			
			var dept = document.getElementById("text-id[9]");
			if(dept.value == '' || dept.value == '0')
				$send = confirm("Department is empty, are you sure want to continue processing ?");

			if($send)
			{
				$.ajax({
					url:"<c:url value='/page/schematicjournalentryadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Schematic Journal Entry data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								
								if($(e.target).html() == 'Save')
									window.location="<c:url value='/page/schematicjournalentryview.htm'/>";
								else
									window.location="<c:url value='/page/schematicjournalentrypreadd.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason:<br/>'+json.message);
							}
						}
					}
				});			
			}
		});
	});

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
				_credit.value = credit.numberFormat('#,#.00');
				_debet.value = debet.numberFormat('#,#.00');
			}
		}
	}

	function openPopupVehicle(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupvehicleview.htm?organization='/>"+org.value+"&target="+target+"&byName=true");
	}

	function openPopupDepartment(target)
	{
		/* var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		} */
	
		openpopup("<c:url value='/page/departmentpopup.htm?target='/>"+target+"&byName=true");
	}

	var tbl = dojo.byId('lineItemTable');
	var index = 0;
	
	function addLineItem()
	{
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 && t_section.rows.length > index)
					index = t_section.rows.length+1;
									
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genCode(index));
				row.insertCell(2).appendChild(genAcc(index));
				row.insertCell(3).appendChild(genPopup(index));
				row.insertCell(4).appendChild(genAmt(index));
				row.insertCell(5).appendChild(genPostingType(index));
				row.insertCell(6).appendChild(genNote(index));
			
				index++;
			}
		}
	}
					
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genCode(index)
	{
		$code = $('<input/>').attr('id','code['+index+']').attr('size','10').change(function(e){
			if(e.target.value)
			{
				$target = $(e.target);
				
				$.ajax({
					url:"<c:url value='/page/popupglaccountjsonview.htm'/>",
					data:{code:e.target.value},
					method : 'GET',
					dataType : 'json',
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$account = $(document.getElementById('account['+index+']'));
								$account.empty();
								
								$('<option/>').val(json.account.id).html(json.account.name).appendTo($account);
							}
						}
					}
				});	
			}
		});
					
		return $code.get(0);
	}
	
	function genAcc(index)
	{
		var accounts = document.createElement("select");
		accounts.name="accounts";
		accounts.id="account["+index+"]";
		accounts.setAttribute('class','combobox');
					
		return accounts;
	}
	
	function popupAcc(target,type,typeValue,index)
	{
		if(!typeValue)
			typeValue = '';
	
		var coa = document.getElementById('schema');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		console.log();
		openpopup("<c:url value='/page/popupjournalschemaaccountview.htm?split=true&target='/>"+target+"&schema="+coa.value+"&postingType="+type+"&typeValue="+typeValue+'&index='+index);
	}
	
	/* function openperiod()
	{
		var org = dojo.byId('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		url = "<c:url value='/page/popupaccountingperiodview.htm?target=period&openonly=true&organization='/>"+org.value;
		
		var date = dojo.widget.byId('date').getValue();
		if(date != '')
			url = url+"&date="+date;
		
		openpopup(url);
	} */
	
	function openschema()
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupjournalschemaview.htm?target=schema&organization='/>"+org.value);
	}
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popupAcc('account['+index+']','postingTypes['+index+']',null,index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function genAmt(index)
	{
		var amounts = document.createElement("input");
		amounts.type = "text";
		amounts.name = "amounts";
		amounts.id = "amounts["+index+"]";
		amounts.setAttribute('size',"20");
		amounts.value = "0";
		amounts.setAttribute('onchange','amountView();');
		amounts.setAttribute('style','text-align:right;');
				
		return amounts;
	}
	
	function genPostingType(index)
	{	
		var postingTypes = document.createElement("select");
		postingTypes.name = "postingTypes";
		postingTypes.id = "postingTypes["+index+"]";
		postingTypes.readonly = true;
		postingTypes.setAttribute('onchange','amountView();');
		postingTypes.setAttribute('onfocus','amountView();');
		postingTypes.setAttribute('style','width:75px;');
		
		var opt1 = document.createElement("option");
		opt1.value = "DEBET";
		opt1.text = "DEBET";
		opt1.setAttribute('onclick','display()');
		
		postingTypes.appendChild(opt1);
		
		var opt2 = document.createElement("option");
		opt2.value = "CREDIT";
		opt2.text = "CREDIT";
		opt2.setAttribute('onclick','display()');
		
		postingTypes.appendChild(opt2);
		
		return postingTypes;
	}
	
	function genNote(index)
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
		if(dojo.byId("checkMaster").checked == true)
			checked = true;

		if(tbl)
		{
			var rowLen = tbl.rows.length;
			for(var idx=0;idx<rowLen;idx++)
			{
				var row = tbl.rows[idx];
				var cell = row.cells[0];
				if(cell)
				{
					var node = cell.lastChild;
				
					if(node && node.disabled == false)
						node.checked = checked;
				}
			}
		}
		else
			alert('Table doesnot exsist!');
	}
			
	function deleteRow()
	{
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
			
		amountView();
	}
			
	function opencompany()
	{
		if(!$('#date').val())
		{
			alert('Please select date first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcompanystructurerolebased4schematicjournalview.htm?target=org'/>");
	}
	
	/* function showaccount(index)
	{
		var code = dojo.byId('code['+index+']');
		var account = dojo.byId('glaccounts['+index+']');
		if(!account || !code)
		{
			alert('Target account or code does not exist!');
			return;
		}
		
		if(code.value)
		{
			$target = $(code);
			
			$.ajax({
				url:"<c:url value='/page/popupglaccountjsonview.htm'/>",
				data:{code:code.value},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$account = $(account);
							$account.empty();
							
							$('<option/>').val(json.account.id).html(json.account.name).appendTo($account);
						}
					}
				}
			});	
		}
	} */
	
	function display()
	{
		var _debet = 0.0;
		var _credit = 0.0;
	
		for(var idx=tbl.tBodies[0].rows.length-1;idx>=0;idx--)
		{
			var amt = tbl.tBodies[0].rows[idx].cells[4].firstChild.value;
			var type = tbl.tBodies[0].rows[idx].cells[5].firstChild.value;
		
			if(amt && type)
			{
				if(type == 'DEBET')
					_debet += amt.toNumber();
				else
					_credit += amt.toNumber();
			}
		}
		
		$('#labelDebet').val(_debet.numberFormat('#,#.00'));
		$('#labelCredit').val(_credit.numberFormat('#,#.00'));		
	}
</script>