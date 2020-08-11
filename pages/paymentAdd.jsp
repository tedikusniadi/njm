<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
</head>

<body onload="javascript:setPaymentType('MAIN');">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">${breadcrumb}</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>

						<div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/paymentview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
                            	<a class="item-button-save b_entry" style="cursor:pointer;"><span>Save</span></a>
								<!-- <a class="item-button-save-new b_entry" style="cursor:pointer;"><span>Save &amp; New</span></a> -->
                            </c:if>
                        </div>

                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute='payment_add'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="Auto Number" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${payment_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" class="combobox-ext">
                                                    <c:if test='${not empty payment_add.organization}'>
                                                        <form:option value='${payment_add.organization.id}' label='${payment_add.organization.firstName} ${payment_add.organization.lastName} ${payment_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencompany();" style="CURSOR:pointer;" title="Company Structure" />
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td align="right"> Category : </td>
                              				<td>
                                                <form:select id='productCategory' path='productCategory' class='combobox' onchange="setPaymentType('MAIN');">
                                                    <form:option value='1' label='UNIT'/>
                                                    <form:option value='2' label='SPAREPART'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" class="combobox-ext">
                                                    <c:if test='${not empty payment_add.supplier}'>
                                                        <form:option value='${payment_add.supplier.id}' label='${payment_add.supplier.firstName} ${payment_add.supplier.lastName} ${payment_add.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency'>
                                                    <form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="47%" align="center" valign="top">
                                    	<fieldset>
                                        	<legend><strong>Receipt Information</strong></legend>
                                  			<table width="100%" style="border:none">
                                            <tr>
                                            	<th width="44%">&nbsp;</th>
                                                <th width="30%"><div id="divamount">Amount</div></th>
                                                <th width="26%">Amount in (
                                              <c:out value='${default.symbol}'/>)</th>
                                   			</tr>
                                            <tr>
                                            	<td align="right">Unapplied : </td>
                                                <td><input id="unapplied" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                                <td><input id="unappliedDef" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Reversed : </td>
                                                <td><input id="reversed" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                                <td><input id="reversedDef" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Applied : </td>
                                                <td><input id="applied" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                                <td><input id="appliedDef" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Write Off : </td>
                                                <td><input id="writeoff" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                                <td><input id="writeoffDef" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Payment Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                        	<td width="53%" align="left"  valign="top">
                                           	  	<table width="100%">
                                            	<tr>
                                                    <td width="27%" align="right">Type : </td>
                               	  	  		  		<td width="73%">
									  					<form:select id='methodType' path='paymentInformation.paymentMethodType'>
                                                            <option value='CASH' selected onclick="setState(true);">CASH</option>
                                                            <form:option value='TRANSFER' label='TRANSFER' onclick="setState(false);"/>
                                                            <form:option value='NOTADEBET' label='NOTA DEBET' onclick="setState(false);"/>
                                                            <%-- <form:option value='CLEARING' label='CLEARING' onclick="setState(false);"/> --%>
                                                    	</form:select>
                                               	  	</td>
                                                </tr>
                                                <tr>
                                                    <td width="27%" align="right">Transfer/Clearing No : </td>
                                                  <td width="73%"><form:input id='ref' path='paymentInformation.reference' size='35' disabled='true' class='input-disabled'/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Bank/Cash Account : </td>
                                                    <td>
                                                        <form:select id='account' path='paymentInformation.bankAccount' class='combobox'>
                                                            <c:if test='${not empty paymentInformation.bankAccount}'>
                                                                <form:option value='${paymentInformation.bankAccount.id}' label='${paymentInformation.bankAccount.code}' />
                                                            </c:if>
                                                        </form:select>
                                                        &nbsp;
                                                        <img id="browseAccount" src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Plafon Account : </td>
                                                    <td>
                                                        <form:select id='plafonAccount' path='paymentInformation.plafon' class='combobox'>
                                                            <c:if test='${not empty paymentInformation.plafon}'>
                                                                <form:option value='${paymentInformation.plafon.id}' label='${paymentInformation.plafon.code}' />
                                                            </c:if>
                                                        </form:select>
                                                        &nbsp;
                                                        <img id="browsePlafon" src="assets/icons/list_extensions.gif" onclick="openplafon();" disabled='true' style="CURSOR:pointer;" title="Bank Account" />
	                                                    &nbsp;
	                                                    <input id='plafonName' disabled='true' class='input-disabled' size="30"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Account Name : </td>
                                                    <td><input id='accountName' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Bank Name : </td>
                                                    <td><input id='bankName' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Bank Branch : </td>
                                                    <td><input id='bankBranch' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Account No : </td>
                                                    <td><input id='accountNo' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                </table>
                                            </td>
                                         	<td width="47%" align="left" valign="top">
											<table width="100%">
                                                <tr>
                                                  <td width="39%" align="right" nowrap="nowrap">Due Date :</td>
                                                  <td width="61%"><input id="date" name="paymentInformation.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                            	</tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Payment Amount : </td>
                                                    <td>
                                                    	<form:input id='amount' path="paymentInformation.amount" onchange="showunapplied();" onkeyup="separator('amount');" cssStyle='text-align:right;'/>
                                                        <input type="hidden" id="amountdef" value="0"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Bank Charges : </td>
                                                    <td>
                                                    	<form:input id='bankCharges' path="paymentInformation.bankCharges" onchange="showunapplied();" onkeyup="separator('bankCharges');" cssStyle='text-align:right;'/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  <td align="right">Note : </td>
                                                    <td><form:textarea path='paymentInformation.note' cols='40' rows='6'/></td>
                                                </tr>
                                                </table>
                                          </td>
                                        </tr>
                                        </table>
                                	</div>
                                	<div id="line" dojoType="ContentPane" label="Payment Application" class="tab-pages" refreshOnShow="true">
                                        <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                        </div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                            <th width="19%">Invoice</th>
                                            <th width="1%">&nbsp;</th>
                                            <th width="25%">Unpaid</th>
                                            <th width="20%">Write Off Type</th>
                                            <th width="20%">Write Off</th>
                                            <th width="20%">Paid</th>
                                            <th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items='${applications}' var='app' varStatus='status'>
                                        <tr>
                                        	<td><input type="checkbox" disabled/></td>
                                        	<td>
                                            	<select name='payables' class='combobox-ext'>
                                                	<option value='${app.payable.id}'><c:out value='${app.payable.code}'/></option>
                                                </select>
                                           	</td>
                                            <td>&nbsp;</td>
                                            <td><input size="17" id='unpaid[${status.index}]' value="<fmt:formatNumber value='${app.payable.unpaid}' pattern=',#00.00'/>" style="text-align:right" class="input-disabled" disabled/></td>
                                            <td>
                                            	<select name='wots'>
                                                	<option value='ADJUSTMENT'>ADJUSTMENT</option>
                                                    <option value='STAMP'>STAMP</option>
                                                    <option value='BADDEBT'>BADDEBT</option>
                                                    <option value='UNDERTABLE'>UNDERTABLE</option>
                                                </select>
                                            </td>
                                            <td><input size='10' id='writeoffs[${status.index}]' name='writeoffs' onchange='display();' style='text-align:right;' value="0"/></td>
                                            <td><input size='20' id='paids[${status.index}]' name='paids' onchange='display();' cssStyle='text-align:right;' value="0"/></td>
                                        	<td><input type="hidden" id='rate[${status.index}]' value='${app.exchange.rate}'/></td>
                                        </tr>
                                        </c:forEach>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="11">&nbsp;</td></tr>
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
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" language="javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Payment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_entry').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/paymentadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Payment data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/paymentview.htm'/>";
	
								/* if($(e.target).html() == 'Save')
									window.location="<c:url value='/page/paymentview.htm'/>";
								else
									window.location="<c:url value='/page/paymentpreadd.htm'/>"; */
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
	
	function validation()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		var supplier = document.getElementById('supplier');
		if(supplier.value == '')
		{
			alert('Please select Supplier first!');
			return;
		}

		var type = document.getElementById('methodType');
		if(type.value == 'NOTADEBET')
		{
			var plafon = document.getElementById('plafonAccount').value;
			if(plafon == '')
			{
				alert('Plafon Account can not be empty!');
				return;
			}
		}
		else if(type.value != 'NOTADEBET')
		{
			var account = document.getElementById('account').value;
			if(account == '')
			{
				alert('Bank/Cash Account can not be empty!');
				return;
			}
		}
		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			for(var idx=len-1;idx>=0;idx--)
			{
				var _amt = 0.0;
				var _woff = 0.0;
				var _paid = 0.0;

				var itm = t_section.rows[idx].cells[1].childNodes[0];
				var amt = t_section.rows[idx].cells[3].firstChild;
				var woff = t_section.rows[idx].cells[5].firstChild;
				var paid = t_section.rows[idx].cells[6].firstChild;

				if(amt.value != null && amt.value != '')
					_amt = new Number(amt.value.replace(/,/g,''));

				if(woff.value != null && woff.value != '')
					_woff = new Number(woff.value.replace(/,/g,''));

				if(paid.value != null && paid.value != '')
					_paid = new Number(paid.value.replace(/,/g,''));
					
				if(_paid > _amt)
				{
					if(_amt+_woff != _paid)
					{
						alert('Payment amount for '+itm.options[itm.selectedIndex].text+' unbalance,please fix it first!');
						return;
					}
				}
			}
		}

		var applied = document.getElementById('applied').value;
		if(parseFloat(applied.replace(/,/g,'')) <= 0)
		{
			alert('Payment amount or Payment application empty,please fix it first!');
			return;
		}
		
		var unapplied = document.getElementById('unapplied').value;
		if(parseFloat(unapplied.replace(/,/g,'')) != 0)
		{
			alert('Not all Payment amount applied,please fix it first!');
			return;
		}

		return true;
	}

	function setState(disabled)
	{
		if(disabled)
		{
			document.getElementById('ref').setAttribute('class','input-disabled');
			document.getElementById('ref').disabled = true;

			//dojo.widget.byId('date').disable();

			document.getElementById('bankCharges').setAttribute('class','input-disabled');
			document.getElementById('bankCharges').disabled = true;
		}
		else
		{
			document.getElementById('ref').setAttribute('class','');
			document.getElementById('ref').disabled = false;

			//dojo.widget.byId('date').enable();

			document.getElementById('bankCharges').setAttribute('class','');
			document.getElementById('bankCharges').disabled = false;
		}

		var type = document.getElementById('methodType');
		var bank = document.getElementById('account');
		var plafon = document.getElementById('plafonAccount');
		
		if(type.value == 'NOTADEBET')
		{
			bank.setAttribute('class','combobox input-disabled');
			$("#browseAccount").attr("hidden", "true");
			$("#browsePlafon").removeAttr("hidden");
			plafon.setAttribute('class','combobox');
		}
		else
		{
			bank.setAttribute('class','combobox');
			$("#browsePlafon").attr("hidden", "true");
			$("#browseAccount").removeAttr("hidden");
			plafon.setAttribute('class','combobox input-disabled');
		}
		
		document.getElementById('ref').value='';
		bank.remove(bank.selectedIndex);
		plafon.remove(plafon.selectedIndex);
		document.getElementById('plafonName').value='';
		document.getElementById('accountName').value='';
		document.getElementById('bankName').value='';
		document.getElementById('bankBranch').value='';
		document.getElementById('accountNo').value='';
	}

	function opencompany()
	{
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>");

		var supplier = document.getElementById('supplier');
		for(var idx=supplier.options.length;idx>=0;idx--)
			supplier.remove(supplier.selectedIndex);

		var tbody = document.getElementById("lineItemTable").tBodies[0];
		while (tbody.rows.length > 0)
		{
			tbody.deleteRow(0);
		}
	}

	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
	}

	function openaccount()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		var methodType = document.getElementById('methodType');

		if(methodType.value == 'NOTADEBET')
		{
			alert('This is not for NOTA DEBET !!!');
			return;
		}
		else
		{
			var method = 'CASH';
			
			if(methodType.value != 'CASH')
				method = 'BANK';
			
			openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+'&type='+method);
		}
	}
	
	function openplafon()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		var methodType = document.getElementById('methodType');

		if(methodType.value != 'NOTADEBET')
		{
			alert('This is for NOTA DEBET only !!!');
			return;
		}
		else
			openpopup("<c:url value='/page/popupplafonlist.htm?target=plafonAccount&organization='/>"+org.value);
	}
	
	function setPaymentType(type)
	{
		var category = document.getElementById('productCategory');
		if(category.value == '1')
		{
			if(type == 'MAIN')
			{
				$("#methodType option").remove();
				$("<option></option>").text("NOTADEBET").val("NOTADEBET").attr("onclick","setState(false)").appendTo("#methodType");
				setState(false);
			}
			else
			{
				$("#methodType option").remove();
				$("<option></option>").text("CASH").val("CASH").attr("onclick","setState(true)").appendTo("#methodType");
				$("<option></option>").text("TRANSFER").val("TRANSFER").attr("onclick","setState(false)").appendTo("#methodType");
				/* $("<option></option>").text("CLEARING").val("CLEARING").attr("onclick","setState(false)").appendTo("#methodType"); */
				setState(true);
			}
		}
		else
		{
			$("#methodType option").remove();
			$("<option></option>").text("CASH").val("CASH").attr("onclick","setState(true)").appendTo("#methodType");
			$("<option></option>").text("TRANSFER").val("TRANSFER").attr("onclick","setState(false)").appendTo("#methodType");
			/* $("<option></option>").text("CLEARING").val("CLEARING").attr("onclick","setState(false)").appendTo("#methodType"); */
			setState(true);
		}
	}

	function showunapplied()
	{
		var date = dojo.widget.byId('date').getValue();
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		var _event = function(rate)
		{
			var amount = document.getElementById('amount');
			var amountdef = document.getElementById('amountdef');
			var unapplied = document.getElementById('unapplied');
			var unappliedDef = document.getElementById('unappliedDef');

			unapplied.value = (amount.value.toNumber()-$('#bankCharges').val().toNumber()).numberFormat('#,#.00');
			unappliedDef.value = (unapplied.value.toNumber()*rate).numberFormat('#,#.00');

			amountdef.value = amount.value.toNumber()*rate;

			display();
		};
		var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){_event(json.rate);});
	}
	
	function separator(id)
	{
		var amount = document.getElementById(id);
		
		if(amount.value != '')
		{
			if(id.substring(0,5) == 'write')
			{
				var minus = "";
				if(amount.value.substring(0,1) == '-')
				{
					minus = "-";
					amount.value = amount.value.replace('-','0');
				}
				amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
				amount.value = minus+amount.value;
			}
			else
				amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}

	function display()
	{
		var date = dojo.widget.byId('date').getValue();
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		var _f = function(_rate)
		{
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var amount = document.getElementById('amount');
				var amountdef = document.getElementById('amountdef');

				var unapplied = document.getElementById('unapplied');
				var unappliedDef = document.getElementById('unappliedDef');

				var reversed = document.getElementById('reversed');
				var reversedDef = document.getElementById('reversedDef');

				var applied = document.getElementById('applied');
				var appliedDef = document.getElementById('appliedDef');

				var writeoff = document.getElementById('writeoff');
				var writeoffDef = document.getElementById('writeoffDef');

				unapplied.value = amount.value.replace(/,/g,'').toNumber()-$('#bankCharges').val().toNumber();
				applied.value = 0.0;
				writeoff.value = 0.0;

				unappliedDef.value = amountdef.value.toNumber()-$('#bankCharges').val().toNumber()*_rate;
				appliedDef.value = 0.0;
				writeoffDef.value = 0.0;

				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;

				for(var idx=len-1;idx>=0;idx--)
				{
					var _writeoff = t_section.rows[idx].cells[5].firstChild;
					var _paid = t_section.rows[idx].cells[6].firstChild;

					unapplied.value = unapplied.value.toNumber()-_paid.value.toNumber();
					applied.value = applied.value.toNumber()+_paid.value.toNumber();
					writeoff.value = writeoff.value.toNumber()+_writeoff.value.toNumber();

					var _row = (_paid.value.toNumber()+_writeoff.value.toNumber)*_rate;

					unappliedDef.value = unappliedDef.value.toNumber()-(_paid.value.toNumber()*_rate);
					writeoffDef.value = writeoffDef.value.toNumber()+(_writeoff.value.toNumber()*_rate);
					appliedDef.value = appliedDef.value.toNumber()+(_paid.value.toNumber()*_rate);
				}

				unapplied.value = unapplied.value.toNumber().numberFormat('#,#.00');
				writeoff.value =  writeoff.value.toNumber().numberFormat('#,#.00');
				applied.value =  applied.value.toNumber().numberFormat('#,#.00');

				unappliedDef.value =  unappliedDef.value.toNumber().numberFormat('#,#.00');
				writeoffDef.value =  writeoffDef.value.toNumber().numberFormat('#,#.00');
				appliedDef.value =  appliedDef.value.toNumber().numberFormat('#,#.00');
			}
		}
		var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){_f(json.rate);});
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

				row.insertCell(0).appendChild(genChckBox(index));
				row.insertCell(1).appendChild(genInv(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genUnpaid(index));
				row.insertCell(4).appendChild(genWOT(index));
				row.insertCell(5).appendChild(genWriteoff(index));
				row.insertCell(6).appendChild(genPaid(index));
				row.insertCell(7).appendChild(genRate(index));

				index++;
			}
		}
	}

	function genChckBox(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		
		return check;
	}

	function genInv(index)
	{
		var inv = document.createElement("select");
		inv.name="payables";
		inv.id="payable["+index+"]";
		inv.setAttribute('class','combobox-ext');

		return inv;
	}

	function popup(target,index)
	{
		var date = document.getElementById('date');
		if(date.firstChild.value == '')
		{
			alert('Please select Date first!');
			return;
		}

		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Company first!');
			return;
		}

		var supplier = document.getElementById('supplier');
		if(supplier.value == '')
		{
			alert('Please select valid Supplier first!');
			return;
		}

		var currency = document.getElementById('currency');
		var type = document.getElementById('type');
		var methodType = document.getElementById('methodType');
		
		if(methodType.value == 'NOTADEBET')
			openpopup("<c:url value='/page/popupinvoice4paymentview.htm?defCurrency=${default.id}&organization='/>"+org.value+"&target="+target+"&supplier="+supplier.value+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+date.firstChild.value+"&paymentType="+methodType.value);
		else

			openpopup("<c:url value='/page/popupinvoice4paymentview.htm?defCurrency=${default.id}&organization='/>"+org.value+"&target="+target+"&supplier="+supplier.value+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+date.firstChild.value);
	}

	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("payable["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Invoice';

		return _popup;
	}

	function genUnpaid(index)
	{
		var unpaid = document.createElement("input");
		unpaid.id = "unpaid["+index+"]";
		unpaid.value = "0";
		unpaid.disabled = true;
		unpaid.setAttribute('size',"17");
		unpaid.setAttribute('class','input-disabled');
		unpaid.setAttribute('style','text-align:right;');

		return unpaid;
	}
	
	function genWriteoff(index)
	{
		var writeoff = document.createElement("input");
		writeoff.name = "writeoffs";
		writeoff.id = "writeoffs["+index+"]";
		writeoff.value = "0";
		writeoff.setAttribute('size',"10");
		writeoff.setAttribute('onchange','display();');
		writeoff.setAttribute('onkeyup','separator("writeoffs['+index+']");');
		writeoff.setAttribute('style','text-align:right;');

		return writeoff;
	}

	function genWOT(index)
	{
		var wot = document.createElement('select');
		wot.name = 'wots';
		wot.id = 'wot['+index+']';

		var adjustment = document.createElement('option');
		adjustment.value = 'ADJUSTMENT';
		adjustment.text = 'ADJUSTMENT';

		var stamp = document.createElement('option');
		stamp.value = 'STAMP';
		stamp.text = 'STAMP';

		wot.appendChild(adjustment);
		wot.appendChild(stamp);

		return wot;
	}

	function genPaid(index)
	{
		var paid = document.createElement("input");
		paid.name = "paids";
		paid.id = "paids["+index+"]";
		paid.value = "0";
		paid.setAttribute('size',"20");
		paid.setAttribute('onchange','display();validationAmount('+index+');');
		paid.setAttribute('onkeyup','separator("paids['+index+']");');
		paid.setAttribute('style','text-align:right;');

		return paid;
	}

	function genRate(index)
	{
		var rate = document.createElement("input");
		rate.type = "hidden";
		rate.id = "rate["+index+"]";

		return rate;
	}

	/* function clickAll()
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
			alert('Table doesnot exsist!');
	} */

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
	
	function validationAmount(target)
	{
		var unpaid = document.getElementById("unpaid["+target+"]");
		var paid = document.getElementById("paids["+target+"]");
		
		if(parseFloat(paid.value.replace(/,/g,'')) != parseFloat(unpaid.value.replace(/,/g,'')))
		{
			alert('Paid Amount harus sama dengan Unpaid Amount !!!');
			paid.value = '0';
			return;
		}
	}
</script>