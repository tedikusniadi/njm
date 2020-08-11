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
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{
			var tbl = document.getElementById('lineItemTable');
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
				if(len == 0)
				{
					alert('Requisition item cannot be empty!');
					return;
				}				
						
				for(var idx=len-1;idx>=0;idx--)
				{
					var account = t_section.rows[idx].cells[2].firstChild;
					if(account.value == null || account.value == '')
					{
						alert('Requisition item Account cannot be empty!');
						return;
					}
					
					var organization = t_section.rows[idx].cells[2].firstChild;
					if(organization.value == null || organization.value == '')
					{
						alert('Requisition item Organization cannot be empty!');
						return;
					}
				
					var _amount = t_section.rows[idx].cells[6].firstChild;
					if(_amount.value == '' || _amount.value == '0')
					{
						alert('Requisition item Amount cannot be empty!');
						return;
					}
				}
				
				document.addForm.action = "<c:url value='/page/reimbursementrequisitionadd.htm'/>";
				document.addForm.submit();
			}
		}
		
		function display()
		{
			var amount = 0.0;
			
			var tbl = document.getElementById('lineItemTable');
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
						
				for(var idx=len-1;idx>=0;idx--)
				{
					var _amount = t_section.rows[idx].cells[6].firstChild;
					if(_amount.value != null && _amount.value != '' && _amount.value != '0')
						amount = amount+parseFloat(_amount.value);
				}
				
				document.getElementById('total').value = amount.numberFormat('#,#.00');
				document.getElementById('totaldef').value = (amount*parseFloat('${adapter.requisition.exchange.rate}')).numberFormat('#,#.00');
			}
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
					row.insertCell(7).appendChild(genNote(index));

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
			organization.setAttribute('class','combobox');
						
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
			var amount = document.createElement("input");
			amount.name = 'amounts';
			amount.setAttribute('size',"10");
			amount.value = "0";
			amount.setAttribute('onchange',"display();");
			
			return amount;
		}
		
		function genNote(index)
		{
			var notes = document.createElement("input");
			notes.name = 'notes';
			notes.setAttribute('size',"15");
			notes.value = '-';
			
			return notes;
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
	</script>
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
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="adapter">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="21%" align="right">ID :</td>
                                          	<td width="79%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input disabled size='15' class="input-disabled" value="<fmt:formatDate value='${adapter.requisition.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="requisition.organization" cssClass="combobox-ext" disabled='true'>
                                                    <option value="${adapter.requisition.organization.id}"><c:out value='${adapter.requisition.organization.firstName} ${adapter.requisition.organization.middleName} ${adapter.requisition.organization.lastName}'/></option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="requisition.approver" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty adapter.requisition.approver}'>
                                                        <form:option value='${adapter.requisition.approver.id}' label='${adapter.requisition.approver.firstName} ${adapter.requisition.approver.lastName} ${adapter.requisition.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisition.requisitioner" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition.requisitioner}'>
                                                        <form:option value='${requisition.requisitioner.id}' label='${requisition.requisitioner.firstName} ${requisition.requisitioner.lastName} ${requisition.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Created By :</td>
                                            <td>
                                                <form:select path="requisition.createdBy" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition.createdBy}'>
                                                        <form:option value='${requisition.createdBy.id}' label='${requisition.createdBy.firstName} ${requisition.createdBy.lastName} ${requisition.createdBy.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Journal Schema :</td>
                                            <td>
                                                <form:select id="schema" path="requisition.journalSchema" cssClass="combobox-ext" disabled='true'>
                                                    <option value="${adapter.requisition.journalSchema.id}"><c:out value='${adapter.requisition.journalSchema.code} ${adapter.requisition.journalSchema.name}'/></option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                                    <option><c:out value='${adapter.requisition.currency.symbol}'/></option>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" size="10" disabled value="<fmt:formatNumber value='${adapter.requisition.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="21%" align="right">Type : </td>
                                          	<td width="79%">
                                                <form:select id='type' path='requisition.type' disabled='true'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input id='bankName' name='bankName' size="30"  value="${adapter.requisition.bankName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input id="bankBranch" name='bankBranch' size="30" value='${adapter.requisition.bankBranch}'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input id="accountNo" name='accountNo' size="30" value='${adapter.requisition.accountNo}'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Holder : </td>
                                            <td><input id="accountHolder" name='accountHolder' size="30" value='${adapter.requisition.accountHolder}'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path="requisition.note" cols="55" rows="6"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                            <legend><strong>Index</strong></legend>
                                            <table width="100%" border="0" cellpadding="0">
                                            <c:forEach items='${adapter.indexes}' var='index' varStatus='status'>
                                            <tr>
                                                <td width="42%" align="right"><c:out value='${index.index.index.name}'/></td>
                                                <td width="2%" align="center">:</td>
                                              	<td width="56%"><form:input id='index[${index.index.index.id}]' path="indexes[${status.index}].content"/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                    	<fieldset>
                                            <legend><strong>Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="29%">&nbsp;</td>
                                                <td width="37%" align="center"><strong>Amount (<c:out value='${adapter.requisition.currency.symbol}'/>)</strong></td>
                                                <td width="34%" align="center"><strong>Amount (<c:out value='${adapter.requisition.exchange.to.symbol}'/>)</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><strong>Total</strong></td>
                                                <td><input value="0" id="total" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                                <td><input value="0" id="totaldef" size="20" disabled style="text-align:right" class="input-disabled"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                </table>
								<div class="toolbar-clean">
                                    <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                    <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                    <div class="item-navigator">&nbsp;</div>
                                </div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                    <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                    <th width="20%">Description</th>
                                 	<th colspan="2">Account</th>
                                  	<th colspan="2">Company</th>
                               	  	<th width="11%">Amount</th>
                                    <th width="21%">Note</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="13">&nbsp;</td></tr></tfoot>
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
