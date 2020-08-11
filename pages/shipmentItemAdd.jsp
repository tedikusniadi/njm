<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":" +request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment Detail >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>    
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Transport Outsource > Transport Management > Shipment > Shipment Detail > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D12 - Shipment Detail</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/shipmentpreedit.htm?id=${item.shipment.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
							<a class="item-button-save-new" href="javascript:save(true);"><span>Save &amp; New</span></a>										
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="item">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="61%" valign="top">
                                  	<table width="100%" style="border:none">
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Shipment ID :</td>
                                        <td><input class="input-disabled" disabled value="${item.shipment.code}" size="35"/></td>
                                    </tr>
                                    <tr>
                                      	<td width="28%" align="right" nowrap="nowrap">Customer :</td>
                                        <td width="72%">
                                            <form:select id="customer" path="customer" cssClass="combobox-ext">
                                                <c:if test='${not empty item.customer}'>
                                                    <form:option value='${item.customer.id}' label='${item.customer.firstName} ${item.customer.lastName} ${item.customer.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcustomerview.htm?target=customer&organization=${item.shipment.organization.id}'/>');" style="CURSOR:pointer;" title="Customer" />
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Date :</td>
                                        <td><input id="date" name="date" onValueChanged="clears();" formatLength="long" dojoType="dropdowndatepicker" value="<fmt:formatDate value='${item.shipment.date}' pattern='MM/dd/yyyy'/>" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Contract :</td>
                                        <td>
                                            <form:select id="contract" path="contract" cssClass="combobox-ext">
                                                <c:if test='${not empty item.contract}'>
                                                    <form:option value='${item.contract.id}' label='${item.contract.code}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:showcontract();" style="CURSOR:pointer;" title="Contract" />
                                      </td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Destination :</td>
                                        <td>
                                            <form:select id="destination" path="destination" cssClass="combobox-ext">
                                                <c:if test='${not empty item.destination}'>
                                                    <form:option value='${item.destination.id}' label='${item.destination.name}' />
                                                </c:if>
                                            </form:select>
                                            <input type="hidden" id="destination-cost" value="0"/>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:showdestination()" style="CURSOR:pointer;" title="Destination" />
                                      	</td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Driver :</td>
                                        <td>
                                            <form:select id="driver" path="driver" cssClass="combobox-ext">
                                                <c:if test='${not empty item.driver}'>
                                                    <form:option value='${item.driver.id}' label='${item.driver.firstName} ${item.driver.lastName} ${shipment.driver.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="showdriver();" style="CURSOR:pointer;" title="Driver" />
                                        </td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Currency :</td>
                                        <td><input size="10" id="currency" class="input-disabled" disabled/></td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Origin :</td>
                                        <td><input id="origin" value="${item.contract.origin}" class="input-disabled" size="25" disabled/></td>
                                    </tr>
                                    <tr>
                                		<td nowrap="nowrap" align="right">Vehicle ID :</td>
                                    	<td><input class="input-disabled" disabled value="${item.shipment.vehicle.name}" size="35"/></td>
                                	</tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">DO No :</td>
                                        <td><form:input path='doNo' cssClass='inputbox'/></td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Rit :</td>
                                        <td>
                                        	<form:select path='rit'>
                                            	<c:forEach begin='1' end='10' var='index'>
                                                	<form:option value='${index}' label='${index}'/>
                                                </c:forEach>
                                        	</form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path="note" cols="55" rows="7"/></td>
                                    </tr>
                                	</table>
                              	</td>
                                <td width="39%" valign="top">
           	    					<fieldset>
                                        <legend>Recapitulation</legend>
                                        <table width="100%">
                                        <tr>
                                            <th width="26%">&nbsp;</th>
                                            <th width="36%"><strong>Amount 
                                            <c:out value='${item.shipment.currency.symbol}'/></strong></th>
                                            <th width="38%"><strong>Amount 
                                            <c:out value='${default.symbol}'/></strong></th>
                                        </tr>
                                        <tr>
                                            <td align="right">Main Cost</td>
                                            <td align="right"><input size="15" id="maincost" disabled class="input-disabled" value="0.00"/></td>
                                            <td align="right"><input size="15" id="maincostdef" disabled class="input-disabled" value="0.00"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Other Cost</td>
                                            <td align="right"><input size="15" id="othercost" disabled class="input-disabled" value="0.00"/></td>
                                            <td align="right"><input size="15" id="othercostdef" disabled class="input-disabled" value="0.00"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Total Cost</td>
                                            <td align="right"><input size="15" id="totalcost" disabled class="input-disabled" value="0.00"/></td>
                                            <td align="right"><input size="15" id="totalcostdef" disabled class="input-disabled" value="0.00"/></td>
                                        </tr>
                                        </table>
                                    </fieldset>
                              </td>
                            </tr>
                            </table>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                            	<div id="bank" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <tr>
                                        <td align="right">Bank/Cash Account : </td>
                                        <td>
                                            <form:select id='account' path='bankAccount' cssClass='combobox-ext'>
                                                <c:if test='${not empty item.bankAccount}'>
                                                    <form:option value='${item.bankAccount.id}' label='${item.bankAccount.code}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountview.htm?target=account&type=CASH&organization=${item.shipment.organization.id}'/>');" style="CURSOR:pointer;" title="Bank Account" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Account Name : </td>
                                        <td><input id='accountName' disabled='true' class='input-disabled' size="30" value="${item.bankAccount.accountName}"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Bank Name : </td>
                                        <td><input id='bankName' disabled='true' class='input-disabled' size="30" value="${item.bankAccount.bankName}"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Bank Branch : </td>
                                        <td><input id='bankBranch' disabled='true' class='input-disabled' size="30" value="${item.bankAccount.bankBranch}"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Account No : </td>
                                        <td><input id='accountNo' disabled='true' class='input-disabled' size="30" value="${item.bankAccount.accountNo}"/></td>
                                    </tr>
                                    </table>
                                </div>
                                <div id="main" dojoType="ContentPane" label="Main Cost" class="tab-pages" refreshOnShow="true">
                                    <table style="border:none" width="50%" id="maincosttable" align="center">
                                    <thead>
                                    <tr>
                                    	<td width="24%">&nbsp;</td>
                                        <td width="76%">&nbsp;</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                    </table>
                                </div>
                                <div id="cost" dojoType="ContentPane" label="Other Cost" class="tab-pages" refreshOnShow="true">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                    	<th width="20%">Type</th>
                                      	<th width="18%">Amount</th>
                                      	<th width="42%">Note</th>
                                    </tr>
                                    <c:forEach items='${item.otherCosts}' var='cost' varStatus='status'>
                                    <tr>
                                        <td>
                                        	<select class="combobox" disabled>
                                            	<option>${cost.masterCost.name}</option>
                                            </select>
                                        </td>          
                                        <td><form:input id='othercost[${status.index}]' path='otherCosts[${status.index}].money.amount' onchange='display();'/></td>
                                        <td><input value='${cost.masterCost.note}' size="48"/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save(_forward)
		{		
			var date = dojo.widget.byId("date").getValue();
		
			if(dojo.byId('customer').value == null || dojo.byId('customer').value == '')
			{
				alert('Customer Account cant be empty!');
				return;
			}
			
			if(dojo.byId('contract').value == null || dojo.byId('contract').value == '')
			{
				alert('Contract Account cant be empty!');
				return;
			}
			
			if(dojo.byId('destination').value == null || dojo.byId('destination').value == '')
			{
				alert('Destination Account cant be empty!');
				return;
			}
		
			if(date == null || date == '')
			{
				alert('Plase select date first!');
				return;
			}
		
			if(dojo.byId('account').value == null || dojo.byId('account').value == '')
			{
				alert('Bank/Cash Account cant be empty!');
				return;
			}
			
			if(dojo.byId('driver').value == null || dojo.byId('driver').value == '')
			{
				alert('Driver cant be empty!');
				return;
			}
		
			var send = true;
			if(date != "<fmt:formatDate value='${item.shipment.date}' pattern='dd-MM-yyyy'/>")
				send = confirm("Shipment Detail date not equal Shipment date,continue process?");
			
			if(send)
			{
				document.addForm.action = "<c:url value='/page/shipmentitemadd.htm?new='/>"+_forward;
				document.addForm.submit();
			}
		}
		
		function showdriver()
		{
			openpopup("<c:url value='/page/popupdriverview.htm?target=driver&organization=${item.shipment.organization.id}'/>");
		}
		
		function showcontract()
		{
			var destination = document.getElementById('destination');
			for(var idx=destination.options.length;idx>=0;idx--)
				destination.remove(destination.selectedIndex);
		
			var customer = document.getElementById('customer');
			if(customer.value == '')
			{
				alert('Please select customer first!');
				return;
			}
			
			openpopup("<c:url value='/page/popuptransportoutsourcecontractview.htm?target=contract&enabled=true&type=${item.shipment.vehicle.type.id}&customer='/>"+customer.value);
		}
		
		function showdestination()
		{
			var contract = document.getElementById('contract');
			if(contract.value == '')
			{
				alert('Please select contract first!');
				return;
			}
			
			var date = dojo.widget.byId("date").getValue();
			if(date == null || date == '')
			{
				alert('Plase select date first!');
				return;
			}
			
			openpopup("<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=destination&contract='/>"+contract.value+"&date="+date);
		}
		
		function display()
		{
			var othercost = document.getElementById('othercost');
			var othercostdef = document.getElementById('othercostdef');
			var totalcost = document.getElementById('totalcost');
			var totalcostdef = document.getElementById('totalcostdef');
			
			var _destinationcost = document.getElementById('destination-cost');
			
			var _totalcost_ = 0.0;
			var _othercost_ = 0.0;
			
			<c:forEach items='${item.otherCosts}' var='cost' varStatus='status'>
				var _othercost = document.getElementById('othercost[${status.index}]');
				if(_othercost && _othercost.value != '' && parseFloat(_othercost.value) != 0)
					_othercost_ += parseFloat(_othercost.value);	
			</c:forEach>
			
			othercost.value = _othercost_.numberFormat('#,#.00');
			othercostdef.value = _othercost_.numberFormat('#,#.00');
			
			if(_destinationcost && _destinationcost.value != '' &&  parseFloat(_destinationcost.value) != 0)
				_totalcost_ = _othercost_+parseFloat(_destinationcost.value);
			
			totalcost.value = _totalcost_.numberFormat('#,#.00');
			totalcostdef.value = _totalcost_.numberFormat('#,#.00');
		}
		
		function clears()
		{
			var contract = dojo.byId('contract');
			if(contract)
				contract.remove(contract.selectedIndex);
				
			var destination = dojo.byId('destination');
			if(destination)
				destination.remove(destination.selectedIndex);
				
			var tbl = dojo.byId('maincosttable');
			var t_section = tbl.tBodies[0];
					
			for(var idx=t_section.rows.length-1;idx>=0;idx--)
				t_section.deleteRow(idx);
		}
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>