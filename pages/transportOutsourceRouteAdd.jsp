<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Route >> Add</title>
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
			<td width="60%">Transport Outsource > Transport Outsource Route > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D10 - Transport Outsource Route</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/transportoutsourcecontractpreedit.htm?id=${route_add.contract.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
							<a class="item-button-save-new" href="javascript:save(true);"><span>Save &amp; New</span></a>								
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="route_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                               	  	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">Name :</td>
                                          	<td width="72%"><form:input cssClass='inputbox' id='name' path="name"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Valid From :</td>
                                            <td><input onValueChanged="gen(this.getDate());" id="price.validFrom" name="price.validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" onchange="javasctipt:alert('date');"/></td>
                                        </tr>
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">Total Kilometer :</td>
                                          	<td width="72%"><form:input cssClass='inputbox' id='kilometer' path="kilometer"/></td>
                                        </tr>
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">Fee Before Tax :</td>
                                          	<td width="72%">
                               		      		<form:input id='trxprice' cssClass='inputbox' path="price.money.amount"/>
                                                &nbsp;
                                                <form:select id='currency' path='price.money.currency'>
                                                    <form:options items='${currencys}' itemValue='id' itemLabel='symbol' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='price.money.exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">UoM :</td>
                                      		<td width="72%">
               					  				<form:select path='measure'>
                                                    <form:options items='${measures}' itemValue='id' itemLabel='measureId'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                           		  	<td width="41%" valign="top" align="right">
										<fieldset>
                                        	<legend><strong>Rekapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                            	<th width="32%">&nbsp;</th>
                                              <th width="35%"><div id="trx">Amount ()</div></th>
                                              <th width="33%">Amount (${default.symbol})</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Cost :</td>
                                                <td><input id="trxamount" size="14" class="input-disabled" style="text-align:right" disabled value="0.00"/></td>
                                                <td><input id="trxdefamount" size="14" class="input-disabled" style="text-align:right" disabled value="0.00"/></td>
                                            </tr>
                                            </table>
                                    	</fieldset>
                                    </td>
                                </tr>
                                </table>
                            <br/>
                            <table cellpadding="0" cellspacing="0" class="table-list" align="center" style="width:70%">
                            <thead>
                            <tr>
                              	<th width="49%">Cost Component</th>
                   	  	  	  	<th width="13%">Amount</th>
                              	<th width="12%">Valid From</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${route_add.costs}" var="cost" varStatus='status'>
                            <tr>
                                <td>${cost.cost.name}</td>
                                <td align="center"><form:input id='extracost[${status.index}]' path='costs[${status.index}].active.money.amount' onblur="display()" onchange="display()"/></td> 
                                <td><input id="costvalfrom[${status.index}]" name="costs[${status.index}].active.validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td> 
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
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
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/ExchangeDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save(_forward)
	{		
		if(dojo.byId('name').value == null || dojo.byId('name').value == '')
		{
			alert('Name cannot be empty!');
			return;
		}
		
		if(dojo.widget.byId('price.validFrom').getValue() == null || dojo.widget.byId('price.validFrom').getValue() == '')
		{
			alert('Valid from date cannot be empty!');
			return;
		}
		
		if(dojo.byId('kilometer').value == null || dojo.byId('kilometer').value == '' || parseFloat(dojo.byId('kilometer').value) <= 0)
		{
			alert('Total kilometer cannot be empty!');
			return;
		}
		
		if(dojo.byId('trxprice').value == null || dojo.byId('trxprice').value == '' || parseFloat(dojo.byId('trxprice').value) <= 0)
		{
			alert('Fee before tax must be > 0');
			return;
		}
		
		if(dojo.byId('trxamount').value == null || dojo.byId('trxamount').value == '' || parseFloat(dojo.byId('trxamount').value) <= 0)
		{
			alert('Total Cost must be > 0');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/transportoutsourcerouteadd.htm?new='/>"+_forward;
		document.addForm.submit();
	}
	
	function gen(date)
	{
		<c:forEach items='${route_add.costs}' var='cost' varStatus='status'>
			var _date = dojo.widget.byId("costvalfrom[${status.index}]");
			_date.setDate(date);
		</c:forEach>
	}
	
	function display()
	{
		var _date = dojo.widget.byId("price.validFrom");
		if(_date == null || _date.getDate() == '')
		{
			alert('Please select date first!');
			return;
		}
	
		var amount = 0.0;
		<c:forEach items='${route_add.costs}' var='cost' varStatus='status'>
			amount = amount+parseFloat(document.getElementById('extracost[${status.index}]').value);
		</c:forEach>
		
		//amount = amount+parseFloat(document.getElementById('trxprice').value);
		
		var _event = function(rate)
		{
			var trxdefamount = document.getElementById('trxdefamount');
			trxdefamount.value = (amount*parseFloat(rate)).numberFormat('#,#.00');
		}
		
		var trxamount = document.getElementById('trxamount');
		trxamount.value = amount.numberFormat('#,#.00');
		
		var cur = document.getElementById('currency');
		var type = document.getElementById('type');
		
		var trx = document.getElementById('trx');
		if(trx)
		{
			<c:forEach items='${currencys}' var='c'>
				if('${c.id}' == cur.value)
					trx.innerHTML = 'Amount (${c.symbol})';
			</c:forEach>
		}
		ExchangeDWRRemote.loadRate(cur.value,'${default.id}',_date.getValue(),type.value,_event);
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>