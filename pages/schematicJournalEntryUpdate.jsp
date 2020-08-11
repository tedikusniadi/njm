<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Schematic Journal Entry >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
			<td width="60%">Financial Accounting > Journal Entry > Edit</td>
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
						
						<h1 class="page-title">F41 - Schematic Journal Entry</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/schematicjournalentryview.htm'/>"><span>List</span></a>
                            <c:if test="${access.edit}">
								<a class="item-button-save" id="_b_save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test="${access.edit and journalEntry_edit.accountingPeriod.status == 'OPEN' and journalEntry_edit.entryStatus == 'POSTED'}">
								<a class="item-button-unlock" href="<c:url value='/page/schematicjournalentryunpost.htm?id=${journalEntry_edit.id}'/>"><span>Unpost</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="journalEntry_edit">
							<table width="100%" border="0" cellpadding="0" cellspacing="5" id="tableRecord">
							<tr valign="top">
								<td width="50%">
									<table width="100%" style="border:none">
									<tr>
										<td width="32%" nowrap="nowrap" align="right">Entry Number :</td>
										<td width="68%"><input  value="${journalEntry_edit.code}" size="30" disabled class="input-disabled"/></td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Name :</td>
										<td><input value="${journalEntry_edit.name}" size="65" class="input-disabled" disabled/> </td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Date :</td>
										<td><input size="20" value="<fmt:formatDate value='${journalEntry_edit.entryDate}'/>" class="input-disabled" disabled/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Entry Type :</td>
										<td>
											<form:select path="entryType" disabled="true">
												<form:option value="ENTRY">ENTRY</form:option>
                                                <form:option value="CORRECTION">CORRECTION</form:option>
                                                <form:option value="ADJUSTMENT">ADJUSTMENT</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Currency :</td>
										<td>
											<form:select path="currency" disabled='true'>
                                            	<form:option label='${journalEntry_edit.currency.symbol}' value='${journalEntry_edit.currency.id}'/>
											</form:select>
                                            &nbsp;
                                            <form:select path="exchangeType" disabled='true'>
                                            	<form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
											</form:select>
										</td>
									</tr>
                                    <tr>
										<td nowrap="nowrap" align="right">Company :</td>
										<td>
											<select id="org" class="combobox-ext" disabled>
												<option><c:out value='${journalEntry_edit.organization.firstName} ${journalEntry_edit.organization.middleName} ${journalEntry_edit.organization.lastName}'/></option>
											</select>
										</td>
									</tr>
                                     <tr>
										<td nowrap="nowrap" align="right">Journal Schema :</td>
										<td><input size="50" value="${journalEntry_edit.journalSchema}" class="input-disabled" disabled/></td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="right">Accounting Period :</td>
										<td>
											<select id="period" class="combobox-ext" disabled>
												<option><c:out value='${journalEntry_edit.accountingPeriod.name}'/></option>
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
                                    <c:if test='${not empty journalEntry_edit.indexes}'>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Index</strong></legend>
												<table width="100%" border="0" cellpadding="0">
												<c:forEach items='${journalEntry_edit.indexes}' var='type' varStatus='status'>
                                                <tr>
													<td align="right"><c:out value='${type.indexType.name}'/></td>
													<td align="center">:</td>
													<td>
														<%-- <c:if test='${type.id != 8 && type.id != 9}'>
															<form:input id="indexContent[${status.index}]" path='indexes[${status.index}].content' value="${type.content}" size="15"/>
														</c:if>
                                                        <c:if test='${type.indexType.id == 8}'>
                                                            <form:select id="indexContent[${status.index}]" path='indexes[${status.index}].content' class="inputbox">
                                                            	<form:option value="${type.content}" label="${type.content}"/>
                                                            </form:select>
															<img src="assets/icons/list_extensions.gif" onclick="openPopupVehicle('indexContent[${status.index}]');" style="CURSOR:pointer;" title="Vehicle" />
														</c:if>
                                                        <c:if test='${type.indexType.id == 9}'>
                                                            <form:select id="indexContent[${status.index}]" path='indexes[${status.index}].content' class="inputbox">
                                                            	<form:option value="${type.content}" label="${type.content}"/>
                                                            </form:select>
															<img src="assets/icons/list_extensions.gif" onclick="openPopupDepartment('indexContent[${status.index}]');" style="CURSOR:pointer;" title="Department" />
														</c:if> --%>
														<input value="${type.content}" size="15" disabled/>
													</td>
												</tr>
                                                </c:forEach>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                    	<td>
                                        	<fieldset>
												<legend><strong>Entry Balance</strong></legend>
												<table width="100%" style="border:none">
												<tr>
													<td width="29%">&nbsp;</td>
													<td width="37%" align="center" bgcolor="#B7C9E3">Debit</td>
													<td width="34%" align="center" bgcolor="#B7C9E3">Credit</td>
												</tr>
												<tr>
													<td align="center"><strong>Total</strong></td>
													<td><input id='labelDebet' style="text-align:right" value="<fmt:formatNumber value='${display.debet}' pattern=',##0.00'/>" size="15" disabled /></td>
													<td><input id='labelCredit' style="text-align:right" value="<fmt:formatNumber value='${display.credit}' pattern=',##0.00'/>" size="15" disabled /></td>
												</tr>
												</table>
											</fieldset>
                                        </td>
                                    </tr>
                                    </table>
								</td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <c:if test="${access.edit and journalEntry_edit.accountingPeriod.status == 'OPEN' and journalEntry_edit.entryStatus != 'POSTED' and journalEntry_edit.entrySourceType != 'AUTOMATIC'}">
                            <div class="toolbar-clean">
                                <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                            </div>
                            </c:if>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                                <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                <th width="16%">Code</th>
                                <th width="42%" colspan="2">Name</th>
                                <th width="15%">Amount</th>
                                <th width="15%">Type</th>
                                <th width="32%">Note</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${journalEntry_edit.details}" var="detail" varStatus='status'>
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td><input id='code[${status.index}]' onchange="showaccount(${status.index})" value="${detail.account.code}" size="10"/></td>
                                <td>
                                    <select id='account[${status.index}]' name='accounts' class="combobox">
                                        <option value='${detail.account.id}'><c:out value='${detail.account.name}'/></option>
                                    </select>
                                </td>
                                <td><img src="assets/icons/list_extensions.gif" onclick="javascript:popup('account[${status.index}]',${status.index});" style="CURSOR:pointer;" title="Search Account" /></td>
                                <td><input id='amount[${status.index}]' style="text-align:right;" name="amounts" onchange="display()" value="<fmt:formatNumber value='${detail.amount}' pattern=',##0.00'/>"/></td>
                                <td><select id='type[${status.index}]' name='types' style="width:85px;">
                                        <option value='${detail.postingType}' onclick="display();"><c:out value='${detail.postingType}'/></option>
                                    </select>
                                </td>
                                <td><input name='notes' size='50' value="${detail.note}"/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                            </tfoot>
                            </table>
                            </form:form>
						</div>
						
						<div class="info">Created by : <c:out value='${journalEntry_edit.createdBy.firstName} ${journalEntry_edit.createdBy.middleName} ${journalEntry_edit.createdBy.lastName}'/> (<fmt:formatDate value='${journalEntry_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${journalEntry_edit.updatedBy.firstName} ${journalEntry_edit.updatedBy.middleName} ${journalEntry_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${journalEntry_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
	$(function(){
		$('#_b_save').click(function(){
			document.editForm.action = "<c:url value='/page/schematicjournalentryedit.htm'/>";
			document.editForm.submit();
		});
	});

	function openPopupVehicle(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupvehicleview.htm?organization='/>"+org.value+"&target="+target);
	}

	function openPopupDepartment(target)
	{
		/* var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		} */
	
		openpopup("<c:url value='/page/departmentpopup.htm?target='/>"+target);
	}
	
	var tbl = dojo.byId("lineItemTable");
	var index = 0;

	function addLineItem()
	{
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				var t_section = tbl.tBodies[0];
				if(t_section)
				{
					if(t_section.rows.length > 0 && t_section.rows.length > index)
						index = t_section.rows.length+1;
				}
			
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
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup('account['+index+']',index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function genAmt(index)
	{
		var amt = document.createElement("input");
		amt.name = "amounts";
		amt.id = "amounts["+index+"]";
		amt.value = "0";
		amt.setAttribute('size',"20");
		amt.setAttribute('style',"text-align:right;");
		amt.setAttribute('onchange',"display()");
		
		return amt;
	}
	
	function genType(index)
	{
		var postingTypes = document.createElement("select");
		postingTypes.name = "types";
		postingTypes.id = "type["+index+"]";
		postingTypes.setAttribute('style','width:85px;');
		
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
	
	function showaccount(index)
	{
		var code = dojo.byId('code['+index+']');
		var account = dojo.byId('account['+index+']');
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
	}
	
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
					_debet += parseFloat(amt.replace(/,/gi,''));
				else
					_credit += parseFloat(amt.replace(/,/gi,''));
			}
		}
		
		document.getElementById('labelDebet').value = _debet.numberFormat('#,#.00');
		document.getElementById('labelCredit').value = _credit.numberFormat('#,#.00');		
	}
	
	function popup(target,index)
	{
		openpopup("<c:url value='/page/popupjournalschemaaccountview.htm?schema=${journalEntry_edit.schemaId}&split=true&target='/>"+target+"&index="+index);
	}
</script>