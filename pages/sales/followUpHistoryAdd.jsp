<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Follow Up History > Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
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
			<td width="60%">Sales > Follow Up History > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S08 - Follow Up History</h1>
							
						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/followuphistoryview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
						</div>					  
						  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="followUp_add">
								<table width="100%" border="0">
								<tr>&nbsp;</tr>
								<tr>
									<td width="27%" nowrap="nowrap" align="right">ID :</td>
									<td width="73%"><input value="AUTOGENERATED" disabled='true' class='input-disabled' size='30'/></td>
								</tr>
		 						<tr>
									<td align="right">Customer Name :</td>
									<td width="230">
		                             	<form:select id="customer" path="customer" cssClass="combobox-ext">
		                                </form:select>&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcustomerview.htm?target=customer'/>');" style="CURSOR:pointer;" title="Sales Person" />
		                            </td>
								</tr>
								<tr>
									<td align="right">Follow Up Date :</td>
									<td colspan="2"><input id="prevdate" inputid="prevdateid" name="prevDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
								<tr>
		                            <td nowrap="nowrap" align="right">Motor :</td>
		                            <td>
		                                <select name="product" id="product" class="combobox-ext">
		                                	<option></option>
		                                </select>
		                                &nbsp;
		                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openProductByCategory('product','1');" style="CURSOR:pointer;" title="Product" />
		                            </td>
		                        </tr>
		                        <tr>
									<td align="right">Sales Person :</td>
									<td>
		                             	<form:select id="salesperson" path="salesPerson" cssClass="combobox-ext">
		                                     
		                                </form:select>&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesperson'/>');" style="CURSOR:pointer;" title="Sales Person" />
		                            </td>
								</tr>
								<tr>
									<td align="right">Follow Up Type :</td>
									<td>
			    						<div class="form-value">
		 									<form:select path="type" cssClass="combobox">
		 									<c:forEach items="${type}" var="type">
												<form:option value='${type.id}' label='${type.name}'/>
											</c:forEach>
											</form:select>
										</div>
									</td>
								</tr>
								<tr>
									<td align="right">Note :</td>
									<td><form:textarea path='note' cols='55' rows='6'/></td>
								</tr>
								<tr>
									<td align="right">Next Follow Up Date :</td>
									<td colspan="2"><input id="nextdate" inputid="nextdateid" name="nextDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>	
		                        <tr>
									<td align="right">Agenda :</td>
									<td><form:textarea path='agenda' cols='55' rows='6'/></td>
								</tr>
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
			<span>&copy; 2007 siriusERP v1.0GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Follow Up History',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if($("#customer").val() == null || $("#customer").val() == '')
		{
			alert('Please select Customer first !!!');
			return;
		}
		
		if($("#prevdateid").val() == '')
		{
			alert('Follow Up Date cannot be empty !!!');
			return;
		}
		
		if($("#product").val() == null || $("#product").val() == '')
		{
			alert('Please select Product first !!!');
			return;
		}
		
		if($("#salesperson").val() == null || $("#salesperson").val() == '')
		{
			alert('Please select Sales Person first !!!');
			return;
		}
		
		if($("#nextdateid").val() == '')
		{
			alert('Next Follow Up Date cannot be empty !!!');
			return;
		}
		
		$.ajax({
			url:"<c:url value='/page/followuphistoryadd.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Follow Up History data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/followuphistoryview.htm?'/>";
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason:<br/>'+json.message);
					}
				}
			}
		});
	});
});
</script>
