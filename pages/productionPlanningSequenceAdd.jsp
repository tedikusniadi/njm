<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Planning Sequence >> Add</title>
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
			<td width="60%">Production > Production Planning Sequence > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U21 - Production Planning Sequence</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionplanningpreedit.htm?id=${planning_sequence_add.planning.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="planning_sequence_add">
								<table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="36%" align="right">Work Unit</td>
                                    <td width="1%">:</td>
                               	  	<td width="63%"><input value="${planning_sequence_add.workUnit.code} ${planning_sequence_add.workUnit.name}" size="50" class="input-disabled" disabled/></td>
                                </tr>
                                <tr>
                                    <td width="36%" align="right">Work Duration</td>
                                    <td width="1%">:</td>
                               	  	<td width="63%">
                                    	<form:input id='duration' path='duration' size='15'/>&nbsp;
                                    	<form:select path='unitOfMeasure'>
                                        	<c:forEach items='${uoms}' var='uom'>
                                            	<c:if test="${uom.type == 'TIME'}">
                                            		<form:option value='${uom.id}' label='${uom.name}'/>
                                                </c:if>
                                            </c:forEach>
                                        </form:select>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                    <div id="_resource" dojoType="ContentPane" label="Resource" class="tab-pages" refreshOnShow="true">
                                    	<table id='resource' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th width="43%">Item</th>
                                          	<th width="11%">UoM</th>
                                            <th width="18%">Estimated</th>
                                            <th width="15%">Unit</th>
                                            <th width="13%">Estimated/Unit</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${planning_sequence_add.resources}' var='resource' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${resource.resource.resource.code} ${resource.resource.resource.name}'/></td>
                                            <td><c:out value='${resource.unitOfMeasure.name}'/></td>
                                            <td><form:input id='#estimated[${status.index}]' path='resources[${status.index}].estimated' size='20' cssClass='rclass' cssStyle='text-align:right;'/></td>
                                            <td><form:input id='#unit[${status.index}]' path='resources[${status.index}].unit' size='20' cssClass='rclass' cssStyle='text-align:right;'/></td>
                                            <td><input id='#sum[${status.index}]' size='20' value="0" class='input-disabled' cssClass='rclass' disabled style="text-align:right;"/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="input" dojoType="ContentPane" label="Input Material" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" id='iNew' style="cursor:pointer;"><span>New Row</span></a>
                                            <a class="item-button-delete" id='iRem' style="cursor:pointer;"><span>Delete Row</span></a>
                                        </div>
                                    	<table id='iTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0" style="width:65%;">
                                        <thead>
                                        <tr>
                                       	  	<th width="3%"><input type="checkbox" id='ix' class='mChx'/></th>
                                          	<th colspan="2">Item</th>
                                            <th width="12%">UoM</th>
                                            <th width="25%">Estimated Usage</th>
                                        </tr>
                                        </thead>
                                        <tbody id="iBody">
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="output" dojoType="ContentPane" label="Output Material" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" id='oNew' style="cursor:pointer;"><span>New Row</span></a>
                                            <a class="item-button-delete" id='oRem' style="cursor:pointer;"><span>Delete Row</span></a>
                                        </div>
                                    	<table id='oTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0" style="width:65%;">
                                        <thead>
                                        <tr>
                                        	<th width="3%"><input type="checkbox" id="ox" class='mChx'/></th>
                                          	<th colspan="2">Item</th>
                                       	  	<th width="9%">UoM</th>
                                       	  	<th width="25%">Estimated output</th>
                                            <th width="15%">(%)PH</th>
                                        </tr>
                                        </thead>
                                        <tbody id="oBody">
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
                                        </tfoot>
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
<script src="<c:url value='/js/number-functions.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	var iIndex = 0;
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Planning Sequence',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.rclass').change(function(e){
			
			var target = e.target;
			if(target.value != '' && target.value != '0' && target.id)
			{
				var $est = $(dojo.byId(target.id.replace('unit','estimated')));
				var $unt = $(dojo.byId(target.id.replace('estimated','unit')));
				var $sum = $(dojo.byId(target.id.replace(/unit|estimated/,'sum')));
				
				if($est.val() != '' && $est.val() != '0' && $unt.val() != '' && $unt.val() != '0')
					$sum.val(parseFloat($est.val())/parseFloat($unt.val()));
			}
		});
	
		$('.item-button-save').click(function(){
			$ph = 0.0;
			$.each($('.ph_class'),function(idx,obj){
				if(obj.value)
					$ph += obj.value.toNumber();
			});
			
			if($ph != 100)
			{
				alert('Total (%)PH must be equal to 100');
				return;
			}
			
			if($('#duration').val().toNumber() <= 0)
			{
				alert('Work Duration mustbe > 0');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/productionplanningsequenceadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Planning Sequence data......');
					$dialog.dialog('open');
				},
				success : function(obj) {
					if(obj)
					{
						if(obj.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productionplanningpreedit.htm?id='/>"+obj.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+obj.message);
						}
					}
				},
				error : function(xhr) {
					console.log(xhr.responseText);
				},
			});
		});
		
		$('.mChx').click(function(e){
			
			if(e.target.id == 'ix')
			{
				$('.iChk').each(function(idx,obj){
					obj.checked = e.target.checked;
				});
			}
			else if(e.target.id == 'ox')
			{
				$('.oChk').each(function(idx,obj){
					obj.checked = e.target.checked;
				});
			}
		});
		
		$('#iNew').click(function(){
			tbody = $('#iTable').find('tbody').get(0);
			
			$itm = $("<select></select>");
			$itm.attr('id','iProd['+iIndex+']');
			$itm.attr('name','in.product.id');
			$itm.addClass('combobox-ext');
			
			$img = $('<img/>');
			$img.attr('src','assets/icons/list_extensions.gif');
			$img.attr('id',iIndex);
			$img.attr('style','cursor:pointer;');
			$img.click(function(e){
				openpopup("<c:url value='/page/popupproductview.htm?target=iProd['/>"+e.target.id+']&index='+e.target.id);
			});
			
			$uom = $('<input/>');
			$uom.attr('size','10');
			$uom.attr('id','uom['+iIndex+']');
			$uom.attr('disabled','true');
			$uom.addClass('input-disabled');
			
			$est = $('<input/>');
			$est.attr('size','20');
			$est.attr('id','iEst['+iIndex+']');
			$est.attr('name','in.estimated');
			$est.attr('style','text-align:right');
			
			row = tbody.insertRow(tbody.rows.length);
			row.insertCell(0).appendChild($("<input type='checkbox' class='iChk'/>").get(0));
			row.insertCell(1).appendChild($itm.get(0));
			row.insertCell(2).appendChild($img.get(0));
			row.insertCell(3).appendChild($uom.get(0));
			row.insertCell(4).appendChild($est.get(0));
			
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
		
		$('#oNew').click(function(){
			tbody = $('#oTable').find('tbody').get(0);
			
			$itm = $("<select></select>");
			$itm.attr('id','oProd['+iIndex+']');
			$itm.attr('name','out.product.id');
			$itm.addClass('combobox-ext');
			
			$img = $('<img/>');
			$img.attr('src','assets/icons/list_extensions.gif');
			$img.attr('id',iIndex);
			$img.attr('style','cursor:pointer;');
			$img.click(function(e){
				openpopup("<c:url value='/page/popupproductview.htm?target=oProd['/>"+e.target.id+']&index='+e.target.id);
			});
			
			$uom = $('<input/>');
			$uom.attr('size','10');
			$uom.attr('id','uom['+iIndex+']');
			$uom.attr('name','out.unitOfMeasure.id');
			$uom.attr('disabled','true');
			$uom.addClass('input-disabled');
			
			$est = $('<input/>');
			$est.attr('size','20');
			$est.attr('id','oEst['+iIndex+']');
			$est.attr('name','out.estimated');
			$est.attr('style','text-align:right');
			
			$ph = $('<input/>');
			$ph.attr('size','10');
			$ph.attr('id','oPh['+iIndex+']');
			$ph.attr('name','out.ph');
			$ph.attr('style','text-align:right');
			$ph.addClass('ph_class');
			$ph.val(0);
			
			row = tbody.insertRow(tbody.rows.length);
			row.insertCell(0).appendChild($("<input type='checkbox' class='oChk'/>").get(0));
			row.insertCell(1).appendChild($itm.get(0));
			row.insertCell(2).appendChild($img.get(0));
			row.insertCell(3).appendChild($uom.get(0));
			row.insertCell(4).appendChild($est.get(0));
			row.insertCell(5).appendChild($ph.get(0));
			
			iIndex++;
		});
		
		$('#oRem').click(function(){
			$tbody = $('#oBody');
			$tbody.find('tr').each(function(idx,obj){
				$obj = $(obj);
				if($obj.find('.oChk').get(0).checked)
					$obj.remove();
			});
			
			$('#ox').get(0).checked = false;
		});
	});
</script>