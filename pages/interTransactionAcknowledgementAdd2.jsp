<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter Transaction Acknowledgement >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter Transaction Acknowledgement > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F37 - Inter Transaction Acknowledgement</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/intertransactionacknowledgementview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="acknowledgement_add">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="54%" valign="top">
                                   	  <table style="border:none" width="100%">
                                        <tr>
                                            <td width="26%" align="right">ID :</td>
                                          <td width="74%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty acknowledgement_add.organization}'>
                                                        <option value="${acknowledgement_add.organization.id}"><c:out value='${acknowledgement_add.organization.firstName} ${acknowledgement_add.organization.middleName} ${acknowledgement_add.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Company From :</td>
                                            <td>
                                                <form:select path="acknowledgable.from" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty acknowledgement_add.acknowledgable.from}'>
                                                        <option value="${acknowledgement_add.acknowledgable.from.id}"><c:out value='${acknowledgement_add.acknowledgable.from.firstName} ${acknowledgement_add.acknowledgable.from.middleName} ${acknowledgement_add.acknowledgable.from.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Company To :</td>
                                            <td>
                                                <form:select path="acknowledgable.to" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty acknowledgement_add.acknowledgable.to}'>
                                                        <option value="${acknowledgement_add.acknowledgable.to.id}"><c:out value='${acknowledgement_add.acknowledgable.to.firstName} ${acknowledgement_add.acknowledgable.to.middleName} ${acknowledgement_add.acknowledgable.to.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" align="right">Request Amount :</td>
                                          <td width="74%"><input size="20" disabled class="input-disabled" value="<fmt:formatNumber value='${acknowledgement_add.acknowledgable.maxAmount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='acknowledgable.currency' disabled='true'>
                                                    <form:option value='${acknowledgement_add.acknowledgable.currency.id}' label='${acknowledgement_add.acknowledgable.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='acknowledgable.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" align="right">Note :</td>
                                          <td width="74%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                              		<td width="46%" valign="top">
                   						<fieldset>
                                        	<legend>Recapitulation</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<th width="52%">&nbsp;</th>
                                                <th width="30%">Amount(
                                              <c:out value='${acknowledgement_add.acknowledgable.currency.symbol}'/>)</th>
                                                <th width="18%">Amount(
                                              <c:out value='${currency.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Unapplied</td>
                                                <td><input id="unapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${acknowledgement_add.acknowledgable.maxAmount}' pattern=',##0.00'/>"/></td>
                                                <td><input id="defunapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${acknowledgement_add.acknowledgable.maxAmount}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Applied</td>
                                                <td><input id="applied" size="15" class="input-disabled" disabled style="text-align:right" value="0.00"/></td>
                                                <td><input id="defapplied" size="15" class="input-disabled" disabled style="text-align:right" value="0.00"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div class="toolbar-clean">
                                    <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                    <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                     <div class="item-navigator">&nbsp;</div>
                                </div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                    <th width="9%">Date</th>
                                    <th width="26%">Name</th>
                                  	<th width="9%">Amount</th>                                    
                                  	<th width="34%" colspan="2">Schema</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                <tr class="end-table">
                                    <td colspan="10">&nbsp;</td>
                                </tr>    
                                </tfoot>
                                </table>
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
</html>
<script type="text/javascript">
	function save()
	{
		if(document.getElementById('org').value == null || document.getElementById('org').value == '')
		{
			alert("Please select Organization first!");
			return;
		}
	
		if(parseFloat(document.getElementById('unapplied').value) < 0)
		{
			alert("Applied amount cant more then <fmt:formatNumber value='${acknowledgement_add.acknowledgable.maxAmount}' pattern=',##0.00'/>");
			return;
		}
	
		var t_section = document.getElementById("lineItemTable").tBodies[0];
		var len = t_section.rows.length;
				
		var _amount = 0.0;
		
		for(var idx=len-1;idx>=0;idx--)
		{
			var date = t_section.rows[idx].cells[1].firstChild.firstChild;
			if(date == null || date.value == '')
			{
				alert("Date cant be empty !");
				return;
			}
			
			var name = t_section.rows[idx].cells[2].firstChild;
			if(name == null || name.value == '')
			{
				alert("Name cant be empty !");
				return;
			}
		
			var amount = t_section.rows[idx].cells[3].firstChild;
			if(amount == null || amount.value == '' || amount.value == '0')
			{
				alert("Amount cant be empty or 0!");
				return;
			}
			
			var schema = t_section.rows[idx].cells[4].firstChild;
			if(schema == null || schema.value == '')
			{
				alert("Inter Journal Schema cant be empty !");
				return;
			}
			
			_amount += parseFloat( t_section.rows[idx].cells[3].firstChild.value);
		}
		
		if(parseFloat('${acknowledgement_add.acknowledgable.maxAmount}') != _amount)
		{
			alert("Amount must be equal to <fmt:formatNumber value='${acknowledgement_add.acknowledgable.maxAmount}' pattern=',##0.00'/>");
			return;
		}
	
		document.addForm.action = "<c:url value='/page/intertransactionacknowledgementadd.htm'/>";
		document.addForm.submit();
	}
	
	function display()
	{
		var _amount = 0.0;
		var _unapplied = 0.0;	
			
		var t_section = document.getElementById("lineItemTable").tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			var amount = t_section.rows[idx].cells[3].firstChild;				
			if(amount && amount.value != '')
				_amount += parseFloat(amount.value);
		}
		
		_unapplied = parseFloat('${acknowledgement_add.acknowledgable.maxAmount}') - _amount;
		
		document.getElementById('unapplied').value = _unapplied.numberFormat('#,#.00');
		document.getElementById('defunapplied').value = (_unapplied*parseFloat('${exchange.rate}')).numberFormat('#,#.00');
		
		document.getElementById('applied').value = _amount.numberFormat('#,#.00');
		document.getElementById('defapplied').value = (_amount*parseFloat('${exchange.rate}')).numberFormat('#,#.00');
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
<script language="javascript" type="application/javascript">
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
	
				row.insertCell(0).appendChild(genCheck(index));
				
				var _date = genDate(index);
				
				row.insertCell(1).appendChild(_date);
				
				var node = dojo.widget.createWidget("DropdownDatePicker", {inputName:"dates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_date);
				
				row.insertCell(2).appendChild(genName(index));
				row.insertCell(3).appendChild(genAmount(index));
				row.insertCell(4).appendChild(genSchema(index));
				row.insertCell(5).appendChild(genPopup(index));
				
				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genDate(index)
	{
		var date = document.createElement("input");
		date.type = "text";
		date.name = 'dates';
		date.id = "date["+index+"]";
		date.setAttribute('size',"10");
		
		return date;
	}
	
	function genName(index)
	{
		var name = document.createElement("input");
		name.setAttribute('name','names');
		name.setAttribute('size','35');
		
		return name;
	}
	
	function genAmount(index)
	{
		var amount = document.createElement("input");
		amount.setAttribute('name','amounts');
		amount.setAttribute('size','15');
		amount.setAttribute('value','0');
		amount.setAttribute('onchange','display();');
		
		return amount;
	}
	
	function genSchema(index)
	{
		var schema = document.createElement("select");
		schema.setAttribute('name','schemas');
		schema.setAttribute('id','schema['+index+']');
		schema.setAttribute('class','combobox-ext');
		
		return schema;
	}
	
	function genPopup(index)
	{
		var _target = 'schema['+index+']';
	
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			openpopup("<c:url value='/page/popupinterjournalschemaview.htm?render=false&from=${acknowledgement_add.acknowledgable.to.id}&to=${acknowledgement_add.acknowledgable.from.id}&target='/>"+_target);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Inter Journal Schema';

		return _popup;
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
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
	}
</script>