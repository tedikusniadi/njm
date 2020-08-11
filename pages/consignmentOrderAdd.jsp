<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Order >> Add</title>
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
			<td width="60%">Sales > Consignment > Consignment Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Consignment Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentorderview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table style="border:none" width="100%">
                                <tr>
                                	<td valign="top">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="21%" nowrap="nowrap" align="right">ID :</td>
                                            <td width="79%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td width="21%" align="right">Date :</td>
                                            <td width="79%"><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                <form:option value='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.id}' label='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}'/>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opensales();" style="CURSOR:pointer;" title="Sales Person" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="21%" align="right">Customer : </td>
                                            <td width="79%">
                                                <form:select id='customer' path='customer' cssClass='combobox-ext'>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
                                          </td>                                            
                                        </tr>
                                        <tr>
                                            <td width="21%" align="right">Contact Person : </td>
                                            <td width="79%">
                                                <form:select id='contact' path='contact' cssClass='combobox-ext'>
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opencontact();" style="CURSOR:pointer;" title="Contact Person" />
                                          </td>  
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Currency :</td>
                                            <td>
                                                <form:select path="currency">
                                                    <form:options items='${currencys}' itemLabel='symbol' itemValue='id'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select path="exchangeType">
                                                    <form:option value='SPOT'>SPOT</form:option>
                                                    <form:option value='MIDDLE'>MIDDLE</form:option>
                                                    <form:option value='TAX'>TAX</form:option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path='note' cols='55' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                            <legend><strong>Goods Issue Information</strong></legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                                <td width="19%" align="right">Wareouse : </td>
                                                <td width="81%">
                                                    <form:select id="issuedFrom" path="issuedFacilityFrom" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="assets/icons/list_extensions.gif" onclick="openfacility('org','issuedFrom');" style="CURSOR:pointer;" title="Address" />
                                              </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Grid : </td>
                                                <td>
                                                    <form:select id="issuedGrid" path="issuedGrid" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('issuedFrom','issuedGrid');" style="CURSOR:pointer;" title="Grid" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Container : </td>
                                                <td>
                                                    <form:select id="issuedContainer" path="issuedContainer" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('issuedGrid','issuedContainer');" style="CURSOR:pointer;" title="Container" />
                                                </td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                            <legend><strong>Goods Receive Information</strong></legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                                <td width="19%" align="right">Wareouse : </td>
                                                <td width="81%">
                                                    <form:select id="receivedFrom" path="receivedFrom" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="assets/icons/list_extensions.gif" onclick="openfacility('customer','receivedFrom');" style="CURSOR:pointer;" title="Address" />
                                              </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Grid : </td>
                                                <td>
                                                    <form:select id="receivedGrid" path="receivedGrid" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('receivedFrom','receivedGrid');" style="CURSOR:pointer;" title="Grid" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Container : </td>
                                                <td>
                                                    <form:select id="receivedContainer" path="receivedContainer" cssClass="combobox">
                                                    </form:select>
                                                    &nbsp;
                                                    <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('receivedGrid','receivedContainer');" style="CURSOR:pointer;" title="Container" />
                                                </td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Consignment Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});		
		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/consignmentorderadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Consignment Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/consignmentorderpreedit.htm?id='/>"+json.id;
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
	
	function opensales()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsalespersonview.htm?target=salesPerson&organization='/>"+org.value);
	}
	
	function opencustomer()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
	}
	
	function opencontact()
	{
		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcontactpersonview.htm?target=contact&organization='/>"+customer.value);
	}
	
	function openfacility(ref,target)
	{
		var org = document.getElementById(ref);
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?target='/>"+target+'&organization='+org.value);
	}
	
	function opengrid(ref,target)
	{
		var warehouse = document.getElementById(ref);
		if(warehouse.value == null || warehouse.value == '')
		{
			alert('Please select Warehouse first!');
			return;
		}
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+warehouse.value);
	}
	
	function opencontainer(ref,target)
	{
		var grid = document.getElementById(ref);
		if(grid.value == null || grid.value == '')
		{
			alert('Please select grid first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcontainerview.htm?target='/>"+target+'&grid='+grid.value);
	}
</script>