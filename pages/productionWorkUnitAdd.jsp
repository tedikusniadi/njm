<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Work Unit >> Add</title>
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
			<td width="60%">Production > Master > Work Unit > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U12 - Work Unit</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionworkunitview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="work_unit_add">
								<table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="12%" align="right">Code</td>
                                  	<td width="1%">:</td>
                               	  	<td width="87%"><form:input id='code' path='code' size="30"/></td>
                                </tr>
                                <tr>
                                    <td width="12%" align="right">Name</td>
                                  <td>:</td>
                                  	<td width="87%"><form:input id='name' path='name' size="50"/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid From</td>
                                    <td>:</td>
									<td><input id="validFrom" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To</td>
                                    <td>:</td>
									<td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note</td>
                                    <td>:</td>
									<td><form:textarea path='note' rows='6' cols='45'/></td>
								</tr>
                                </table>
                                <div class="toolbar-clean">
									<div class="item-navigator">&nbsp;</div>
									<a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
									<a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
						  		</div>
								<table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="position:relative;width:50%;">
								<thead>
                                <tr>
								  	<th width="1%"><input type="checkbox" id="checkMaster" onclick="clickAll();"/></th>
									<th colspan="2">Resource</th>
                                    <th>Type</th>
								</tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                <tr class="end-table">
									<td colspan="4">&nbsp;</td>
                                </tr>    
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
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	var index=0;

	$(function(){
		$('#code').focus();
	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Resource',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			if($('#code').val() == '')
			{
				alert('Code cannot be empty!');
				return;
			}
			
			if($('#name').val() == '')
			{
				alert('Name cannot be empty!');
				return;
			}
			
			var from = dojo.widget.byId('validFrom').getValue();
			var to = dojo.widget.byId('validTo').getValue();
			
			if(from == '')
			{
				alert('Valid From cannot be empty!');
				return;
			}
			
			if(to == '')
			{
				alert('Valid To cannot be empty!');
				return;
			}
		
			$.ajax({
				url:"<c:url value='/page/productionworkunitadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'html',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Work Unit data......');
					$dialog.dialog('open');
				},
				success : function(html) {
					if(html)
					{
						if(html.search('success') != -1)
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productionworkunitview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+html);
						}
					}
				},
				error : function(xhr) {
					alert('Proccess fail '+xhr.responseText);
				},
			});		
		});
	});
	
	var tbl = dojo.byId("lineItemTable");
	var index = 0;
	
	function addLineItem()
	{
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genRes(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genType(index));
				
				index++;
			}
		}
	}
					
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.setAttribute('size','25');
		
		return check;
	}
	
	function genRes(index)
	{
		var resource = document.createElement("select");
		resource.name="resource";
		resource.id='resource['+index+']';
		resource.setAttribute('class','combobox-ext');
					
		return resource;
	}
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			openpopup("<c:url value='/page/popupproductionresourceview.htm?target=resource&index='/>"+index);
		}
		
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Resource';

		return _popup;
	}
	
	function genType(index)
	{
		var type = document.createElement("input");
		type.id = 'type['+index+']';
		type.setAttribute('size',"25");
		type.setAttribute('disabled',"true");
		type.setAttribute('class',"input-disabled");
		
		return type;
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
	}
</script>