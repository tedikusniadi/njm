<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement Journal Schema >> Add</title>
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
			<td width="60%">Financial Accounting > Accounting Setting > Reimbursement Journal Schema > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F08 - Reimbursement Journal Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/reimbursementjournalschemaview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="journalSchema_add">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="20%" align="right">Accounting Schema ID</td>
                                    <td width="1%">:</td>
                                    <td width="40%"><form:input path="code" cssClass="inputbox" /></td>
                                    <td width="39%" rowspan="6" valign="top" align="left">
                                        <fieldset>
                                            <legend>INDEX</legend>
                                            <table width="100%">
                                            <tr>
                                                <td width="38%" valign="top">
                                                  <table>
                                                    <c:forEach items='${journalSchema_add.indexes}' var='index' varStatus='status'>
                                                    <c:if test='${(status.index % 2) == 0}'>
                                                    <tr>
                                                        <td width="5%"><form:checkbox path="indexes[${status.index}].on" value="true"/></td>
                                                        <td width="95%">${index.index.name}</td>
                                                    </tr>
                                                    </c:if>
                                                    </c:forEach>
                                                    </table>
                                                </td>
                                              <td width="62%" valign="top">
                                                    <table>
                                                    <c:forEach items='${journalSchema_add.indexes}' var='index' varStatus='status'>
                                                    <c:if test='${(status.index % 2) == 1}'>
                                                    <tr>
                                                        <td width="5%"><form:checkbox path="indexes[${status.index}].on" value="true"/></td>
                                                        <td width="95%">${index.index.name}</td>
                                                    </tr>
                                                    </c:if>
                                                    </c:forEach>
                                                    </table>
                                                </td>
                                            </tr>                                        
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>	
                                <tr>
                                    <td><div align="right">Accounting Schema Name</div></td>
                                    <td width="1%">:</td>
                                  	<td width="40%"><form:input path="name" cssClass="inputbox" /></td>
                                </tr>
                                <tr>
                                    <td><div align="right">Chart of Account</div></td>
                                    <td width="1%">:</td>
                                    <td>
                                        <form:select id="coa" path="chartOfAccount" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupchartofaccountview.htm?target=coa'/>');" style="CURSOR:pointer;" title="Chart of Account" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Note</td>
                                    <td width="1%">:</td>
                                    <td><form:textarea path="note" cols="55" rows="6"/></td>
                                </tr>
                                </table>
                                <br/>
                                <div class="toolbar-clean">
                                    <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                    <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                </div>
                                <table class="table-list" id="lineItemTable" cellpadding="0" cellspacing="0" style="width:65%">
                                <thead>
                                <tr>
                                  <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                    <th width="32%">Description</th>
                                    <th width="66%" colspan="2">Account</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="4">&nbsp;</td></tr>    
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
		document.addForm.action = "<c:url value='/page/reimbursementjournalschemaadd.htm'/>";
		document.addForm.submit();
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
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genNote(index));
				row.insertCell(2).appendChild(genAccount(index));
				row.insertCell(3).appendChild(genPopup(index));
				
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
	
	function genAccount(index)
	{
		var accounts = document.createElement("select");
		accounts.name="accounts";
		accounts.id="account["+index+"]";
		accounts.setAttribute('class','combobox-ext');
					
		return accounts;
	}
	
	function popup(target)
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Chart of Account first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?coa='/>"+coa.value+"&target="+target);
	}
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("account["+index+"]");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='GL Account';

		return _popup;
	}
	
	function genNote(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.name = "names";
		note.id = "name["+index+']';
		note.setAttribute('size',"45");
		
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
			
		amountView();
	}
</script>