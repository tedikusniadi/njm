<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Journal Entry >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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
						<h1 class="page-title">F40 - Journal Entry</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/journalentryview.htm'/>"><span>List</span></a>
							<a class="item-button-save btn_add" style="cursor:pointer;"><span>Save</span></a>
							<a class="item-button-save-new btn_add" style="cursor:pointer;"><span>Save &amp; New</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="journalEntry_add">
							<table width="100%" border="0" cellpadding="0" cellspacing="20" id="tableRecord">
							<tr valign="top">
								<td width="50%">
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
										<td><input inputId="date" name="entryDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" value="<fmt:formatDate value='${journalEntry_add.entryDate}' pattern='MM/dd/yyyy'/>"/></td>
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
                                            	<%-- <c:if test='${not empty organization}'>
                                                	<form:option value='${organization.id}' label='${organization.firstName} ${organization.lastName} ${organization.middleName}' />
                                                </c:if> --%>
											</form:select>
											&nbsp;
                                        	<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Chart of Account :</td>
										<td>
											<select id="coa" class="combobox-ext">
                                            	<c:if test='${not empty accountingSchema}'>
                                                	<option value='${accountingSchema.id}'>${accountingSchema.code} ${accountingSchema.name}</option>
                                                </c:if>
											</select>
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
												<table width="100%" border="0" cellpadding="0" cellspacing="1">
												<tr>
													<td width="29%">&nbsp;</td>
													<td width="37%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input value="0" style="text-align:right" id="txtBalanceDebet" size="15" disabled /></td>
													<td><input value="0" style="text-align:right" id="txtBalanceCredit" size="15" disabled /></td>
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
                                    <th colspan="2">Account</th>
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
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
</html><%-- 
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script> --%>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Journal Entry',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.btn_add').click(function(e){
			
			$debet = $('#txtBalanceDebet').val();
			$credit = $('#txtBalanceCredit').val();

			if($debet.toNumber() == 0 || $credit.toNumber() == 0 || $debet != $credit)
			{
				alert("Amount not balance!");
				return;
			}

			if(!$('#date').val())
			{
				alert('Please select date first!');
				return;
			}

			$send = true;
			$date = $('#date').val();

			if($date.substring(3,$date.length) != "<fmt:formatDate value='${now}' pattern='MM-yyyy'/>")
				$send = confirm("Journal Entry date not equal current month,are you sure want to continue processing ?");
			
			var dept = document.getElementById("text-id[9]");
			if(dept.value == '' || dept.value == '0')
				$send = confirm("Department is empty, are you sure want to continue processing ?");

			if($send)
			{
				$.ajax({
					url:"<c:url value='/page/journalentryadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Journal Entry data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');

								if($(e.target).html() == 'Save')
									window.location="<c:url value='/page/journalentryview.htm'/>";
								else
									window.location="<c:url value='/page/journalentrypreadd.htm'/>";
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

	function openvehicle(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}

		openpopup("<c:url value='/page/popupvehicleview.htm?organization='/>"+org.value+"&target="+target);
	}

	var tbl = dojo.byId("lineItemTable");

	var index = 0;

	var t_section = tbl.tBodies[0];
	if(t_section)
	{
		if(t_section.rows.length > 0 )
			index = t_section.rows.length+1;
	}

	function addLineItem()
	{
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genCode(index));
				row.insertCell(2).appendChild(genAcc(index));
				row.insertCell(3).appendChild(genPopup(index));
				row.insertCell(4).appendChild(genAmt(index));
				row.insertCell(5).appendChild(genType(index));
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
								$account = $(document.getElementById('glaccounts['+index+']'));
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
		accounts.id="glaccounts["+index+"]";
		accounts.setAttribute('class','combobox');

		return accounts;
	}

	function popup(target,index)
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}

		openpopup("<c:url value='/page/popupglaccountview.htm?split=true&coa='/>"+coa.value+"&target="+target+"&index="+index);
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
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupjournalschemaview.htm?target=schema&organization='/>"+org.value);
	}

	function openPopupDepartment(target)
	{
		openpopup("<c:url value='/page/departmentpopup.htm?target='/>"+target+"&byName=true");
	}

	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("glaccounts["+index+"]",index);
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
		amounts.setAttribute('style',"text-align:right;");
		amounts.value = "0";

		var action = function()
		{
			amountView();
		};

		amounts.onchange = action;
		amounts.onblur = action;
		amounts.onkeyup = action;
		amounts.onkeypress = action;

		return amounts;
	}

	function genType(index)
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

		amountView();
	}

	function showaccount(index)
	{
		var code = dojo.byId('code['+index+']');
		var account = dojo.byId('glaccounts['+index+']');
		if(!account || !code)
		{
			alert('Target account or code does not exist!');
			return;
		}

		$.get('/page/glaccountload.htm?code='+code.value, function(map) {
			if(map.data.status != 'ok')
			{
				alert(map.data.message);
				return;
			}
			for(var idx=account.options.length;idx>=0;idx--)
				account.remove(account.selectedIndex);

			var opt = document.createElement('option');
			opt.value = map.id;
			opt.text = map.name;

			account.appendChild(opt);
		});
	}
</script>