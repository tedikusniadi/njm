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
                            <a class="item-button-list" href="<c:url value='/page/sparepartreceiptpayableview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
                            	<a class="item-button-save b_entry" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                        </div>

                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute='sparepartReceiptPayable_add'>
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
                                            <td><input id="date" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>" name="date" class="datepicker"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty sparepartReceiptPayable_add.organization}'>
                                                        <form:option value='${sparepartReceiptPayable_add.organization.id}' label='${sparepartReceiptPayable_add.organization.firstName} ${sparepartReceiptPayable_add.organization.lastName} ${sparepartReceiptPayable_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                          </td>
                                        </tr>
                                        <tr>
		                                    <td align="right">Tipe Kwitansi : </td>
		                                    <td>
		                                        <select id='receiptType' name='methodType' cssClass='combobox-ext'>
		                                        	<option value="" selected>--Tipe--</option>
	                                                <option value='KPB'>KPB</option>
	                                                <option value='CLAIM'>CLAIM</option>
	                                                <option value='AR'>AR</option>
		                                        </select>
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext">
                                                    <c:if test='${not empty sparepartReceiptPayable_add.customer}'>
                                                        <form:option value='${sparepartReceiptPayable_add.customer.id}' label='${sparepartReceiptPayable_add.customer.firstName} ${sparepartReceiptPayable_add.customer.lastName} ${sparepartReceiptPayable_add.customer.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="billedTo('customer');" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                        <input type="hidden" value='${currency.id}' name='currency' id='currency'/>
                                        <input type="hidden" value='SPOT' name='exchangeType' id='type'/>
                                    </td>
                                    <td width="47%" align="center" valign="top">
                                    	<fieldset>
                                        	<legend><strong>Receipt Information</strong></legend>
                                  			<table width="100%" style="border:none">
                                            <tr>
                                            	<th width="44%">&nbsp;</th>
                                                <th width="30%"><div id="divamount">Amount</div></th>
                                   			</tr>
                                            <tr>
                                            	<td align="right">Unapplied : </td>
                                                <td><input id="unapplied" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Reversed : </td>
                                                <td><input id="reversed" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Applied : </td>
                                                <td><input id="applied" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Write Off : </td>
                                                <td><input id="writeoff" value="0" class="input-disabled" style="text-align:right" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Receipt Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                        	<td width="58%" align="left"  valign="top">
                                       	  	  <table width="100%">
                                            	<tr>
                                                    <td width="25%" align="right">Type : </td>
                               	  	  		  		<td width="75%">
									  					<form:select id='methodType' path='receiptInformation.paymentMethodType'>
                                                            <form:option value='CASH' label='CASH' onclick='closeinfo()'/>
                                                            <form:option value='TRANSFER' label='TRANSFER' onclick='openinfo()'/>
                                                            <form:option value='CLEARING' label='CLEARING' onclick='openinfo()'/>
                                                    	</form:select>
                                               	  </td>
                                                </tr>
                                                <tr>
                                                    <td width="25%" align="right">Transfer/Clearing No : </td>
                                                  <td width="75%"><form:input id='clearing' path='receiptInformation.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Cash/Bank Account : </td>
                                                    <td>
                                                        <form:select id='account' path='receiptInformation.bankAccount' cssClass='combobox-ext'>
                                                            <c:if test='${not empty receiptInformation.bankAccount}'>
                                                                <form:option value='${receiptInformation.bankAccount.id}' label='${receiptInformation.bankAccount.code}' />
                                                            </c:if>
                                                        </form:select>
                                                        <img src="assets/icons/list_extensions.gif" onclick="checkTypeAccount();" style="CURSOR:pointer;" title="Bank Account" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Account Name : </td>
                                                    <td><input id='accountName' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Name : </td>
                                                    <td><input id='bankName' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Branch : </td>
                                                    <td><input id='bankBranch' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Account No : </td>
                                                    <td><input id='accountNo' disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                </table>
                                            </td>
                                          	<td width="42%" align="left" valign="top">
												<table width="100%">
                                                <tr>
                                                	<td width="39%" align="right" nowrap="nowrap">Tanggal Pencairan :</td>
                                                  	<td width="61%"><input id="date" disabled name="receiptInformation.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                            	</tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Receipt Amount : </td>
                                                    <td>
                                                    	<form:input id='amount' path='receiptInformation.amount' onchange="showunapplied()" onkeyup="separator('amount')" cssStyle='text-align:right;'/>
                                                        <input type="hidden" id="amountdef" value="0"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Bank Charges : </td>
                                                    <td><form:input id='bankCharges' path='receiptInformation.bankCharges' onchange="showunapplied()" onkeyup="separator('bankCharges')" cssStyle='text-align:right;'/></td>
                                                </tr>
                                                <tr>
                                                  	<td align="right">Note : </td>
                                                    <td><form:textarea path='receiptInformation.note' cols='40' rows='6'/></td>
                                                </tr>
                                                </table>
                                          </td>
                                        </tr>
                                        </table>
                                	</div>
                                	<div id="line" dojoType="ContentPane" label="Receipt Application" class="tab-pages" refreshOnShow="true">
                                        <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                        </div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                            <th width="33%">Invoice</th>
                                          	<th width="16%">Unpaid</th>
                                          	<th width="16%">Write Off Type</th>
                                          	<th width="16%">Write Off</th>
                                          	<th width="16%">Paid</th>
                                          	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" language="javascript">
	function init(e)
	{
		$target = $(e.target);
		$index = $target.attr('index');

		$unpaid = $('#unpaid_'+$index).val().toNumber();
		$write = $('#write_'+$index).val().toNumber();
		$paid = $('#paid_'+$index).val().toNumber();

		if($unpaid < $write+$paid)
		{
			alert('Paid + Write Off cannot > Unpaid.');
			$('#paid'+$index).val($unpaid-$write);
			e.preventDefault();
			return;
		}
	}
	
	$(function(){
		$("#receiptType").change(function(){
			$("#customer").empty();
		});
		$("#customer").focus(function(){
			loadReferences();
		})
	});

	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_entry').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/sparepartreceiptpayableadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Receipt data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/sparepartreceiptpayableview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	function validation()
	{
		if(!$('#account').val())
		{
			alert('Bank/Cash Account cant be empty!');
			return;
		}

		if($('#unapplied').val().toNumber() != 0)
		{
			alert('Not all Receipt amount applied,please fix it first!');
			return;
		}
		
		/* var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			
			if(len > 1)
			{
				var recType = $("#receiptType").val();
				if(recType == 'LEASING' || recType == 'SUBDICTION_HOLDER' || recType == 'SUBDICTION')
				{
					
				}
			}
		} */
		
		return true;
	}
	
	function billedTo(target){
		var org = document.getElementById('org').value;
		
		switch($("#receiptType").val()){
			case "KPB":
				opensupplierpersonal(target);
				break;
			case "CLAIM":
				opensupplierpersonal(target);
				break;
			case "AR":
				openCustomerByOrg(target);
				break;
			default:
				alert("Silahkan pilih tipe kwitansi");
				break;
		}
	}
	
	function checkTypeAccount()
	{
		var payment = 'CASH';
		if($("#methodType").val() == 'CASH')
			payment = 'CASH';
		else
			payment = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+$("#org").val()+'&type='+payment);
	}
	
	/* function checkPaymentType()
	{
		$("#methodType option").remove();
		var receiptType = $('#receiptType').val();
		if(receiptType == 'LEASING' || receiptType == 'SUBDICTION')
		{
			$("<option></option>").text("TRANSFER").val("TRANSFER").attr('onclick', 'openinfo()').appendTo("#methodType");
			openinfo();
		}
		else
		{
			$("<option></option>").text("CASH").val("CASH").attr('onclick', 'closeinfo()').appendTo("#methodType");
			$("<option></option>").text("TRANSFER").val("TRANSFER").attr('onclick', 'openinfo()').appendTo("#methodType");
			$("<option></option>").text("CLEARING").val("CLEARING").attr('onclick', 'openinfo()').appendTo("#methodType");
			closeinfo();
		}
	} */

	function openinfo()
	{
		dojo.byId('clearing').setAttribute('class','inputbox');
		dojo.byId('clearing').disabled = false;
		dojo.widget.byId('date').enable();
		
		resetSomeFields();
	}

	function closeinfo()
	{
		dojo.byId('clearing').setAttribute('class','input-disabled');
		dojo.byId('clearing').setAttribute('disabled','true');
		dojo.widget.byId('date').disable();
		
		resetSomeFields();
	}
	
	function resetSomeFields()
	{
		$("#account option").remove();
		$("<option></option>").text("").val(0).appendTo("#methodType");
		$('#clearing').val('');
		$('#accountName').val('');
		$('#bankName').val('');
		$('#bankBranch').val('');
		$('#accountNo').val('');
	}

	function showunapplied()
	{
		var date = document.getElementById('date');
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');
		display();
	}

	function display()
	{
		var _f = function(_rate)
		{
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var amount = document.getElementById('amount');
				var unapplied = document.getElementById('unapplied');
				var reversed = document.getElementById('reversed');
				var applied = document.getElementById('applied');
				var writeoff = document.getElementById('writeoff');

				unapplied.value = amount.value.toNumber()-$('#bankCharges').val().toNumber();
				applied.value = 0.0;
				writeoff.value = 0.0;

				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;

				for(var idx=len-1;idx>=0;idx--)
				{
					var _writeoff = t_section.rows[idx].cells[4].firstChild;
					var _paid = t_section.rows[idx].cells[5].firstChild;

					unapplied.value = unapplied.value.toNumber()-_paid.value.toNumber();
					applied.value = applied.value.toNumber()+_paid.value.toNumber();
					writeoff.value = writeoff.value.toNumber()+_writeoff.value.toNumber();
				}

				unapplied.value = unapplied.value.toNumber().numberFormat('#,#.00');
				applied.value =  applied.value.toNumber().numberFormat('#,#.00');
				writeoff.value =  writeoff.value.toNumber().numberFormat('#,#.00');
			}
		}

		var date = document.getElementById('date');
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		var data={from:currency.value,to:"${currency.id}",date:date.value,type:type.value};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,_f);
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
				row.insertCell(1).appendChild(genBill(index));
				row.insertCell(2).appendChild(genUnpaid(index));
				row.insertCell(3).appendChild(genWOT(index));
				row.insertCell(4).appendChild(genWriteoff(index));
				row.insertCell(5).appendChild(genPaid(index));
				row.insertCell(6).appendChild(genRate(index));

				index++;
			}
		}
	}

	function genChckBox(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";

		return check;
	}

	function genBill(index)
	{
		var elem=document.createElement("div");

		var billing = document.createElement("select");
		billing.name="billings";
		billing.id="billings["+index+"]";
		billing.setAttribute('style','width:235px;');

		elem.appendChild(billing);

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("billings["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Invoice';

		elem.appendChild(_popup);
		return elem;
	}

	function popup(target,index)
	{
		var date = document.getElementById('date');
		if(date.value == '')
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

		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select valid customer first!');
			return;
		}

		var currency = document.getElementById('currency');
		var type = document.getElementById('type');
		var referenceType = document.getElementById('receiptType');
		var custOrSup = '';
		
		if(referenceType.value == 'AR')
			custOrSup = '&customer='+customer.value;
		else
			custOrSup = '&supplier='+customer.value;

		openpopup("<c:url value='/page/popupbilling4paymentsparepartview.htm?defCurrency=${currency.id}&organization='/>"+org.value+"&target="+target+custOrSup+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&dateFrom="+date.value+"&methodType="+$("#receiptType").val());
	}

	function genUnpaid(index)
	{
		$unpaid = $('<input/>');
		$unpaid.attr('id','unpaid_'+index);
		$unpaid.val(0);
		$unpaid.attr('disabled',true);
		$unpaid.attr('size','20');
		$unpaid.addClass('input-disabled');
		$unpaid.addClass('in_class');
		$unpaid.attr('index',index);

		return $unpaid.get(0);
	}

	function genWriteoff(index)
	{
		$write = $('<input/>');
		$write.attr('name','writeoffs');
		$write.attr('id','write_'+index);
		$write.attr('size',"10");
		$write.attr('index',index);
		$write.val(0);
		$write.change(function(e){
			init(e);
			display();
		});
		$write.attr('onkeyup', "separator('write_"+index+"')");

		return $write.get(0);
	}

	function genWOT(index)
	{
		var wot = document.createElement('select');
		wot.name = 'wots';
		wot.id = 'wot['+index+']';

		var adjustment = document.createElement('option');
		adjustment.value = 'ADJUSTMENT';
		adjustment.text = 'ADJUSTMENT';

		/* var stamp = document.createElement('option');
		stamp.value = 'STAMP';
		stamp.text = 'STAMP';

		var baddebt = document.createElement('option');
		baddebt.value = 'UNDERTABLE';
		baddebt.text = 'DISCOUNT UNDERTABLE'; */

		wot.appendChild(adjustment);
		/* wot.appendChild(stamp);
		wot.appendChild(baddebt); */

		return wot;
	}

	function genPaid(index)
	{
		$paid = $('<input/>');
		$paid.attr('name','paids');
		$paid.attr('id','paid_'+index);
		$paid.attr('size',"20");
		$paid.attr('index',index);
		$paid.val(0);
		$paid.change(function(e){
			init(e);
			display();
		});
		$paid.attr('onkeyup', "separator('paid_"+index+"')");
		$paid.attr('onchange', "validationAmount('"+index+"')");

		return $paid.get(0);
	}

	function genRate(index)
	{
		var rate = document.createElement("input");
		rate.type = "hidden";
		rate.id = "rate["+index+"]";

		return rate;
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

	function separator(target)
	{
		var amount = document.getElementById(target);
		
		if(amount.value != '')
		{
			var minus = "";
			if(amount.value.substring(0,1) == '-')
			{
				minus = "-";
				amount.value = amount.value.replace('-','0');
			}
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
			amount.value = minus+amount.value;
		}
	}
	
	function validationAmount(target)
	{
		var unpaid = document.getElementById("unpaid_"+target);
		var paid = document.getElementById("paid_"+target);
		
		if(parseFloat(paid.value.replace(/,/g,'')) > parseFloat(unpaid.value.replace(/,/g,'')))
		{
			alert('Paid Amount cant greater than Unpaid Amount !!!');
			paid.value = '0';
			return;
		}
	}
	
	function resetFields()
	{
		$("#customer option").remove();
		$("<option></option>").text("").val("").appendTo("#customer");
		$('#clearing').val('');
		$("#account option").remove();
		$("<option></option>").text("").val("").appendTo("#account");
		$('#accountName').val('');
		$('#bankName').val('');
		$('#bankBranch').val('');
		$('#accountNo').val('');
	}
</script>