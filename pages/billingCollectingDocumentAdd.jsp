<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
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
            <td width="60%">Financial Accounting > Accounting Setting > Collecting > Add</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">						
						<h1 class="page-title">F90 - Collecting</h1>
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingcollectingdocumentview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="billing_status_add">
			 				<table width="100%" style="border:none" cellpadding="2">
							<tr>
                                <td width="23%" align="right">Collecting/Accepted Date</td>
                           		<td width="1%">:</td>
                                <td width="76%"><input id="date" name="date" value="<fmt:formatDate value='${order_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org" path="organization" cssClass="combobox-ext">
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                </td>
                            </tr>
                            <tr>
                                <td width="23%" nowrap="nowrap" align="right">Collector Name</td>
                              	<td>:</td>
                                <td width="76%">
                                  	<form:select id="collector" path='collector' cssClass='combobox-ext'>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" class="collector" style="CURSOR:pointer;" title="Collector" />
                              </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Status</td>
                                <td>:</td>
                                <td>
                                    <form:select cssClass='collections' path="status">
                                    	<form:option value='FINANCE' label='FINANCE'/>
                                        <form:option value='COLLECTOR' label='COLLECTOR'/>
                                        <form:option value='ACCEPTED' label='ACCEPTED'/>
                                    </form:select>
                                </td>
                            </tr>
							</table>
                            <div class="clears">&nbsp;</div>
                            <table class="table-list iBody" cellspacing="0" cellpadding="0" width="100%">
                            <thead>
                            <tr>
                                <th width="0%"><input type="checkbox" class="check"/></th>
                                <th width="44%">Customer</th>
                              	<th width="27%">Billing No</th>
                              	<th width="13%">Billing Date</th>
                           	  	<th width="16%">Total Amount</th>
                            </tr>
                            </thead>
                            <tbody>
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
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$('.item-button-save').click(function(){
			var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Collecting',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
			
			$.ajax({
				url:"<c:url value='/page/billingcollectingdocumentadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Collecting data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/billingcollectingdocumentview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				},
				error : function(xhr) {
					alert('Request fail,its maybe becouse you dont have permision to access the resources.');
				},
			});	
		});
	
		$('.collections').change(function(e){
			$.ajax({
				url:"<c:url value='/page/billingcollectingdocumentstatusjson.htm'/>",
				data:{status:e.target.value},
				method : 'POST',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						$body = $('.iBody').find('tbody');
						$body.empty();
						
						$.each(json.statuses,function(idx,obj){
							$tr = $('<tr/>').appendTo($body);
							
							$td1 = $('<td/>').appendTo($tr);
							$td2 = $('<td/>').appendTo($tr);
							$td3 = $('<td/>').appendTo($tr);
							$td4 = $('<td/>').appendTo($tr);
							$td5 = $('<td/>').appendTo($tr);
							
							$('<input/>').attr('type','checkbox').attr('class','collections').attr('name','collections').val(obj.id).appendTo($td1);
							$('<input/>').attr('style','width:355px').attr('class','input-disabled').val(obj.customer).appendTo($td2);
							$('<input/>').attr('style','width:235px').attr('class','input-disabled').val(obj.billing).appendTo($td3);
							$('<input/>').attr('style','width:77px').attr('class','input-disabled').val(obj.date).appendTo($td4);
							$('<input/>').attr('style','width:145px;text-align:right;').attr('class','input-disabled').val(obj.amount.numberFormat('#,#.00')).appendTo($td5);
						});
					}
				}
			});
		});
		
		$('.collector').click(function(){
			if(!$('#org').val())
			{
				alert('Please select company first!');
				return;
			}
		
			openpopup("<c:url value='/page/popupcollectorview.htm?target=collector&organization='/>"+$('#org').val());
		});
		
		$('.check').click(function(e){
			$check = $('.collections');
			if(e.target.checked)
				$check.attr('checked','checked');
			else
				$check.attr('checked','');
		});
	});
</script>