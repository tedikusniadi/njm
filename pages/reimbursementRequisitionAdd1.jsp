<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement Requisition >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Reimbursements > Reimbursement Requisition > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F31 - Reimbursement Requisition</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/reimbursementrequisitionview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-next" href="javascript:save();"><span>Next</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="requisition">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="26%" align="right">ID :</td>
                                 	<td width="74%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Organization :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                            <c:if test='${not empty requisition.organization}'>
                                                <option value="${requisition.organization.id}"><c:out value='${requisition.organization.firstName} ${requisition.organization.middleName} ${requisition.organization.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Approver :</td>
                                    <td>
                                        <form:select id="approver" path="approver" cssClass="combobox-ext">
                                            <c:if test='${not empty requisition.approver}'>
                                                <form:option value='${requisition.approver.id}' label='${requisition.approver.firstName} ${requisition.approver.lastName} ${requisition.approver.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Requisitioner :</td>
                                    <td>
                                        <form:select id="requisitioner" path="requisitioner" cssClass="combobox-ext">
                                            <c:if test='${not empty requisition.requisitioner}'>
                                                <form:option value='${requisition.requisitioner.id}' label='${requisition.requisitioner.firstName} ${requisition.requisitioner.lastName} ${requisition.requisitioner.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openrequisitioner();" style="CURSOR:pointer;" title="Reimbursement Requisitioner" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Created By :</td>
                                    <td>
                                        <form:select path="createdBy" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty requisition.createdBy}'>
                                                <form:option value='${requisition.createdBy.id}' label='${requisition.createdBy.firstName} ${requisition.createdBy.lastName} ${requisition.createdBy.middleName}' />
                                            </c:if>
                                        </form:select>
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
                                    <td align="right">Currency :</td>
                                    <td>
                                        <form:select id='currency' path='currency'>
                                        <c:forEach items='${currencys}' var='currency'>
                                            <form:option value='${currency.id}' label='${currency.symbol}'/>
                                        </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='exchangeType' path='exchangeType'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                        &nbsp;
                                        <input id="trxrate" class="input-disabled" disabled value="1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="26%" align="right">Type : </td>
                                  	<td width="74%">
                                        <form:select id='type' path='type'>
                                            <form:option value='CASH' label='CASH' cssClass='opt-type'/>
                                            <form:option value='TRANSFER' label='TRANSFER' cssClass='opt-type'/>
                                            <form:option value='CLEARING' label='CLEARING' cssClass='opt-type'/>
                                        </form:select>
                                  	</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Bank Name : </td>
                                    <td><input id='bankName' name='bankName'  size="35" disabled class='input-disabled opt-target'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Bank Branch : </td>
                                    <td><input id="a_bankBranch" name='bankBranch' size="35" disabled class='input-disabled opt-target' /></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Account No : </td>
                                    <td><input id="a_accountNo" name='accountNo' size="35" disabled class='input-disabled opt-target'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Account Holder : </td>
                                    <td><input id="a_accountHolder" name='accountHolder' size="35" disabled class='input-disabled opt-target'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Note :</td>
                                    <td><form:textarea path="note" cols="55" rows="6"/></td>
                                </tr>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.opt-type').click(function(e){
			$target = $('.opt-target');
			
			if(e.target.value == 'CASH')
			{
				$target.attr('disabled',true);
				$target.addClass('input-disabled');
			}
			else
			{
				$target.attr('disabled',false);
				$target.removeClass('input-disabled');
			}
		});
	});

	function save()
	{
		var date = dojo.widget.byId('date').getValue();
	
		if( date == null || date == '')
		{
			alert('Date cannot be empty!');
			return;
		}
		
		if(dojo.byId('approver').value == null || dojo.byId('approver').value == '')
		{
			alert('Approver cannot be empty!');
			return;
		}
		
		if(dojo.byId('requisitioner').value == null || dojo.byId('requisitioner').value == '')
		{
			alert('Requisitioner cannot be empty!');
			return;
		}
		
		if(dojo.byId('schema').value == null || dojo.byId('schema').value == '')
		{
			alert('Journal Schema cannot be empty!');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/reimbursementrequisitionpreadd2.htm'/>";
		document.addForm.submit();
	}
	
	function openschema()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreimbursementjournalschemaview.htm?target=schema&enabled=true'/>");
	}
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreimbursementapproverview.htm?target=approver&organization='/>"+org.value);
	}
	
	function openrequisitioner()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreimbursementrequisitionerview.htm?target=requisitioner&organization='/>"+org.value);
	}
	
	function openaccount()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		var methodType = dojo.byId('type').value;
		
		var method = 'CASH';
		
		if(methodType != 'CASH')
			method = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+'&type='+method);
	}
	
	function showerror()
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
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genDesc(index));
				row.insertCell(2).appendChild(genAccount(index));
				row.insertCell(3).appendChild(genPopupDesc(index));
				row.insertCell(4).appendChild(genComp(index));
				row.insertCell(5).appendChild(genPopup(index));
				row.insertCell(6).appendChild(genAmount(index));
				
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
	
	function genDesc(index)
	{
		var description = document.createElement("input");
		description.id = "description["+index+"]";
		description.setAttribute('size','30');
		description.disabled = true;
		
		return description;
	}
	
	function genAccount(index)
	{
		var account = document.createElement("select");
		account.name="accounts";
		account.id="account["+index+"]";
		account.setAttribute('class','combobox');
					
		return account;
	}
	
	function genPopupDesc(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("account["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Schema Detail';
		
		return _popup;
	}
	
	function popup(target,index)
	{			
		var schema = document.getElementById('schema');
		if(schema.value == '')
		{
			alert('Please select Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreimbursementjournalshcemadetailview.htm?target='/>"+target+"&id="+schema.value+"&index="+index);
	}
	
	function genComp(index)
	{
		var organization = document.createElement("select");
		organization.name="organizations";
		organization.id="organization["+index+"]";
		organization.setAttribute('class','combobox-ext');
					
		return organization;
	}
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popuporg("organization["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Company Structure';
		
		return _popup;
	}
	
	function popuporg(target,index)
	{			
		var schema = document.getElementById('schema');
		if(schema.value == '')
		{
			alert('Please select Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target='/>"+target);
	}		
	
	function genAmount(index)
	{
		var std = document.createElement("input");
		std.type = "text";
		std.name = 'prices';
		std.id = "std["+index+"]";
		std.setAttribute('size',"10");
		std.value = "0";
		
		return std;
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
			
		display();
	}
	
	function showcash(isCash)
	{
		var name = dojo.byId('bankName');
		var branch = dojo.byId('a_bankBranch');
		var no = dojo.byId('a_accountNo');
		var holder = dojo.byId('a_accountHolder');
		
		if(isCash)
		{
			name.disabled = true;
			branch.disabled = true;
			no.disabled = true;
			holder.disabled = true;
			
			name.value = '';
			branch.value = '';
			no.value = '';
			holder.value = '';
			
			name.setAttribute('class','input-disabled');
			branch.setAttribute('class','input-disabled');
			no.setAttribute('class','input-disabled');
			holder.setAttribute('class','input-disabled');
		}
		else
		{
			name.disabled = false;
			branch.disabled = false;
			no.disabled = false;
			holder.disabled = false;
			
			name.setAttribute('class','');
			branch.setAttribute('class','');
			no.setAttribute('class','');
			holder.setAttribute('class','');
		}
	}
</script>