<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/budgetsettingview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="budget_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">ID :</td>
								  			<td width="80%"><input value="Auto Generated" class='input-disabled' disabled size='25'/></td>
                                        </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Organization :</td>
		                                    <td>
		                                        <form:select path="organization" id="org" class="combobox-ext">
		                                        	<c:if test='${not empty budget_add.organization}'>
		                                               	<form:option value='${budget_add.organization.id}' label='${budget_add.organization.name}' />
		                                            </c:if>
		                                        </form:select>
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Period :</td>
		                                    <td>
		                                        <form:select path="accountingPeriod" id="accPeriod" class="combobox-ext">
		                                        </form:select>
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openAccountingPeriod('accPeriod');" style="CURSOR:pointer;" title="Accounting Period" />
		                                    </td>
		                                </tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Budget Type :</td>
			 							  	<td><input value="${budget_add.budgetType}" disabled class='input-disabled' size='25'/></td>
			 							  	<td></td>
			 							</tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Department :</td>
		                                    <td>
                                            	<select id="department" class="combobox-ext">
                                            		<option value='${budget_add.department.id}'>${budget_add.department.name}</option>
                                                </select>
		                                    </td>
		                                </tr>
		                                <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><textarea name="note" cols="55" rows="7">${budget_add.note}</textarea></td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                            <thead>
	                            <tr>
	                              	<th width="1%">&nbsp;</th>
	                                <th width="25%">Account</th>
	                                <th width="14%">Account Group</th>
	                                <th width="60%">Amount</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${budget_edit.details}' var='detail' varStatus='status'>
	                            <tr>
	                            	<td>&nbsp;</td>
	                                <td><c:out value='${detail.glAccount.name}'/></td>
	                                <td><c:out value='${detail.glAccount.parent.name}'/></td>
	                                <td><form:input id="amount[${status.index}]" path='details[${status.index}].amount' size='25'/></td>
	                            </tr>
	                            </c:forEach>
	                            </tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
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
</html>
<script type="text/javascript">

function openAccountingPeriod(target)
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Company first !!!');
		return;
	}
	openpopup("<c:url value='/page/popupaccountingperiodview.htm?target="+target+"&level=CHILD&openonly=false&organization="+org.value+"'/>");
}

function validation()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Company first !!!');
		return;
	}

	var period = document.getElementById('accPeriod');
	if(period.value == '')
	{
		alert('Accounting Period tidak boleh kosong !!!');
		return;
	}

	var dept = document.getElementById('department');
	if(dept.value == '')
	{
		alert('Nama Department tidak boleh kosong !!!');
		return;
	}
	
	var tblResult = document.getElementById("lineItemTable");
	if(tblResult)
	{
		var t_section = tblResult.tBodies[0];
		var len = t_section.rows.length;

		if(len == 0)
		{
			alert('Mohon pilih Account Detail terlebih dahulu !!!');
			return;
		}
		else
		{
			var arr = new Array();
	        arr = document.getElementsByName("checkIdx");
	        for(var i = 0; i < arr.length; i++)
	        {
	            var obj = document.getElementsByName("checkIdx").item(i);
	            
	            if($("#glAccount\\["+obj.value+"\\]").val() == '' || $("#glAccount\\["+obj.value+"\\]").val() == null)
				{
					alert('Mohon pilih Account terlebih dahulu !!!');
					return;
				}
	            
	            if($("#amount\\["+obj.value+"\\]").val() == '' || $("#amount\\["+obj.value+"\\]").val() == null)
				{
					alert('Amount tidak boleh kosong !!!');
					return;
				}

				if(new Number($("#amount\\["+obj.value+"\\]").val()) <= 0)
				{
					alert('Amount harus lebih besar dari 0 !!!');
					return;
				}
	        }
		}
	}
	
	return true;
}

$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Budget Setting',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/budgetsettingaddcopy.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Budget Setting data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/budgetsettingview.htm'/>";
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
			row.insertCell(1).appendChild(genAcc(index));
			row.insertCell(2).appendChild(genAccPopup(index));
			row.insertCell(3).appendChild(genAccGroup(index));
			row.insertCell(4).appendChild(genAmount(index));

			index++;
		}
	}
}

function genCbx(index)
{
	var check = document.createElement("input");
	check.type = "checkbox";
	check.name = "checkIdx";
	check.id = "check["+index+"]";
	check.value = index;

	return check;
}

function genAcc(index)
{
	var acc = document.createElement("select");
	acc.name="glAccounts";
	acc.id="glAccount["+index+"]";
	acc.setAttribute('class','inputbox-ext');
	acc.value = "";

	return acc;
}

function genAccPopup(index)
{
	var _popup = document.createElement('img');
	_popup.id = '_popup_line['+index+']';
	_popup.src = 'assets/icons/list_extensions.gif';
	_popup.onclick = function()
	{
		openaccpopup("glAccount["+index+"]", index);
	}
	_popup.setAttribute('style','CURSOR:pointer;');
	_popup.title='GL Account';

	return _popup;
}

function openaccpopup(target, index)
{
	openpopup("<c:url value='/page/popupglaccountview.htm?target='/>"+target+"&index="+index);
}

function genAccGroup(index)
{
	var accGroup = document.createElement("select");
	accGroup.name="glAccountGroups";
	accGroup.id="glAccountGroup["+index+"]";
	accGroup.setAttribute('class','inputbox');

	return accGroup;
}

function genAmount(index)
{
	var amount = document.createElement("input");
	amount.name = "amounts";
	amount.id = "amount["+index+']';
	amount.setAttribute('size',"20");
	amount.value = '0';

	return amount;
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