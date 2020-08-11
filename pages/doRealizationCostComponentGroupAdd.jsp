<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SO Cost Component Distribution >> Add</title>
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
			<td width="60%">Sales > Sales Order > Standard Sales Order > Sales Cost Component Distribution > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S100 - Sales Cost Component Distribution</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/dorealizationcostcomponentgroupview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="cost_group_add">
								<table width="100%" style="border:none" cellpadding="2">
                                <tr>
                                    <td width="12%" nowrap="nowrap" align="right">ID</td>
                           	  	  	<td width="1%">:</td>
                       	  	  	  	<td width="42%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                   	  	  	  		<td width="45%" rowspan="10" valign="top">
										<fieldset>
                                        	<legend>Master Cost</legend>
                                            <table width="100%">
                                            <tr>
                                                <td width="20%" align="right" nowrap="nowrap"><strong>Total</strong></td>
                                                <td width="2%">:</td>
                                          		<td width="78%"><input id='grant' size="28" style="text-align:right" disabled class="input-disabled" value="0"/></td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right" nowrap="nowrap">Cash Account</td>
                                                <td width="2%">:</td>
                                                <td width="70%">
                                                  	<form:select id="account" path="account" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img class="_popaccount" src="assets/icons/list_extensions.gif" style="CURSOR:pointer;"/>
                                              	</td>
                                            </tr>
                                            </table>
                                            <div class="clears">&nbsp;</div>
                                            <table width="100%" border="0" cellpadding="1">
                                            <c:forEach items='${costs}' var='cost'>
                                            <tr>
                                            	<td width="34%">
                                           	 		<select name="costs" style="width:125px;">
                                                    	<option value="${cost.id}"><c:out value='${cost.name}'/></option>
                                                    </select>
                                                </td>
                                                <td width="66%"><input class="grant_class" name="amount" size="25" style="text-align:right" value="0"/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                  	</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date</td>
                                    <td>:</td>
                                    <td><input id="date" name="date" formatLength="long" value="<fmt:formatDate value='${cost_group_add.date}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                    	</form:select>
                                        &nbsp;
                                        <img class="_poporg" src="assets/icons/list_extensions.gif" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Expedition</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="expedition" path="supplier" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img class="_popexp" src="assets/icons/list_extensions.gif" style="CURSOR:pointer;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Vehicle</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="vehicle" path="vehicle" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img class="_popvec" src="assets/icons/list_extensions.gif" style="CURSOR:pointer;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Rit</td>
                                    <td>:</td>
                                    <td><form:input id='rit' path='rit' size="5"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">DO Realization Date</td>
                                    <td>:</td>
                                    <td><input id="realizationDate" name="realizationDate" formatLength="long" value="<fmt:formatDate value='${order_add.realizationDate}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Receipt By</td>
                                    <td>:</td>
                                    <td><form:input path='receiptby' size="35"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Currency</td>
                                  	<td>:</td>
                                    <td>
                                        <form:select id='currency' path='currency'>
                                        	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType'>
                                            <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                            <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                            <form:option value='TAX' label='TAX' onclick='display();'/>
                                        </form:select>
                                  	</td>
                                </tr>
                                <tr>
                                    <td align="right">Tax</td>
                                  	<td>:</td>
                                    <td>
                                        <form:select id='tax' path='tax'>
                                        	<form:options items='${taxes}' itemValue='id' itemLabel='taxId'/>
                                        </form:select>
                                  	</td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div class="toolbar-clean">
                                    <a class="item-button-new" id='iNew' style="cursor:pointer;"><span>New Row</span></a>
                                    <a class="item-button-delete" id='iRem' style="cursor:pointer;"><span>Delete Row</span></a>
                                </div>
                                <table id='iTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0">
                                <thead>
                                <tr>
                                  	<th width="2%"><input type="checkbox" id='ix' class='mChx'/></th>
                                  	<th width="32%">Delivery Order Realization</th>
                           	  	  	<th width="0%">&nbsp;</th>
                                    <th width="34%">Customer</th>
                                    <th width="32%">Address</th>
                                </tr>
                                </thead>
                                <tbody id="iBody">
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/currency.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('._poporg').click(function(){
			openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>");
		});
		
		$('._popexp').click(function(){
			if(!$('#org').val())
			{
				alert('Please select company first.');
				return;
			}
			
			openpopup("<c:url value='/page/popupexpeditionview.htm?target=expedition&organization='/>"+$('#org').val());
		});
		
		$('._popvec').click(function(){
			if(!$('#expedition').val())
			{
				alert('Please select expedition first.');
				return;
			}
			
			openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&organization='/>"+$('#expedition').val());
		});
		
		$('._popaccount').click(function(){
			if(!$('#org').val())
			{
				alert('Please select company first.');
				return;
			}
			
			openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&type=CASH&organization='/>"+$('#org').val());
		});
	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sales Cost Component Distribution',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			
			$.ajax({
				url:"<c:url value='/page/dorealizationcostcomponentgroupadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sales Cost Component Distribution data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/dorealizationcostcomponentgroupview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});		
		});
		
		$('.grant_class').change(function(e){
			$amt = 0.0;
			$.each($('.grant_class'),function(idx,obj){
				if(obj.value)
				$amt += obj.value.toNumber();
			});
			
			$('#grant').val($amt.numberFormat('#,#.00'));
		});
	});
	
	var iIndex = 0;
	
	$('.mChx').click(function(e){			
		if(e.target.id == 'ix')
		{
			$('.iChk').each(function(idx,obj){
				obj.checked = e.target.checked;
			});
		}
	});
	
	$('#iNew').click(function(){
		tbody = $('#iTable').find('tbody').get(0);
		row = tbody.insertRow(tbody.rows.length);
		row.insertCell(0).appendChild($("<input type='checkbox' class='iChk'/>").get(0));
		row.insertCell(1).appendChild(getDO(iIndex));
		$td = $(row.insertCell(2));
		$td.html(getImg(iIndex));
		$td.attr('style','text-align:left');
		
		row.insertCell(3).appendChild(getCustom(iIndex));
		row.insertCell(4).appendChild(getAddress(iIndex));	
		
		iIndex++;
	});
	
	$('#iRem').click(function(){
		$tbody = $('#iBody');
		$tbody.find('tr').each(function(idx,obj){
			$obj = $(obj);
			if($obj.find('.iChk').get(0).checked)
				$obj.remove();
		});
		
		$('#ix').get(0).checked = false;
	});
	
	function getDO($index)
	{
		$itm = $("<select></select>");
		$itm.attr('id','order'+$index);
		$itm.attr('name','dos');
		$itm.attr('index',$index);
		$itm.addClass('combobox-ext');
		$itm.focus(function(e){
			$.ajax({
				url:"<c:url value='/page/deliveryorderrealizationget.htm'/>",
				data:{id:e.target.value},
				method : 'POST',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$custom = $('#customer'+$(e.target).attr('index'));
							if($custom)
								$custom.val(json.real.customer);
							
							$address = $('#address'+$(e.target).attr('index'));
							if($address)
								$address.val(json.real.address);
						}
					}
					
					e.target.blur();
				}
			});	
		});
		
		return $itm.get(0);
	}
	
	function getImg($index)
	{
		$img = $('<img/>');
		$img.attr('src','assets/icons/list_extensions.gif');
		$img.attr('id',$index);
		$img.attr('style','cursor:pointer;');
		$img.click(function(e){
			if(!$('#org').val())
			{
				alert('Please select Organization first!');
				return;
			}
			
			if(!$('#expedition').val())
			{
				alert('Please select Expedition first!');
				return;
			}
			
			if(!$('#vehicle').val())
			{
				alert('Please select Vehicle first!');
				return;
			}
			
			if(!$('#rit').val())
			{
				alert('Rit cannot be empty!');
				return;
			}
			
			if(!dojo.widget.byId('realizationDate').getValue())
			{
				alert('DO Realization date cannot be empty!');
				return;
			}
		
			openpopup("<c:url value='/page/deliveryorderrealizationforgroupingpopup.htm?target=order'/>"+$index+'&organization='+$('#org').val()+'&expedition='+$('#expedition').val()+'&vehicle='+$('#vehicle').val()+'&rit='+$('#rit').val()+'&dateFrom='+dojo.widget.byId('realizationDate').getValue());
		});
		
		return $img.get(0);
	}
	
	function getCustom($index)
	{
		$custom = $("<input/>");
		$custom.attr('id','customer'+$index);
		$custom.attr('size','40');
		$custom.attr('class','input-disabled');
		$custom.attr('disabled','disabled');
		
		return $custom.get(0);
	}
	
	function getAddress($index)
	{	
		$address = $("<input/>");
		$address.attr('id','address'+$index);
		$address.attr('size','40');
		$address.attr('class','input-disabled');
		$address.attr('disabled','disabled');
		
		return $address.get(0);
	}
</script>