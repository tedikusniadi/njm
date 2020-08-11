<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-next" href="javascript:generate();"><span>Next</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="add1Form" id="add1Form" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
								<tr>
                                	<td nowrap="nowrap" align="right">Method Type :</td>
                                  	<td>
                                    	<select id="methodType" name="methodType" class="combobox" onchange="methodTypeChanged();">
                                    		<option value="KPB">KPB</option>
                                    		<option value="CLAIM">CLAIM</option>
                                    		<option value="AR">AR</option>
                                      	</select>
                                  	</td>
                              	</tr>
								<tr>
                                    <td><div align="right">Supplier :</div></td>
                                    <td>
                                        <select id="supplier" name="supplier" class="combobox-ext">
                                        </select>
                                        <img id="browseSupplier" src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opensupplier();" style="CURSOR:pointer;"title="Supplier" />
                                    </td>
                                </tr>
								<tr>
                                    <td><div align="right">Customer :</div></td>
                                    <td>
                                        <select id="customer" name="customer" class="combobox-ext input-disabled" disabled="disabled">
                                        </select>
                                        <img id="browseCustomer" hidden="true" src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrgInstant('customer', 'false');" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date From :</td>
									<td>
										<input inputId="dateFromId" id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
										Date To :
										<input inputId="dateToId" id="dateTo" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
									</td>
								</tr>
				  				</table>
							</form>
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
	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&personal=yes&organization='/>"+org.value);
	}
	
	function generate()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first !!!');
			return;
		}
		
		if($("#methodType").val() == 'KPB' || $("#methodType").val() == 'CLAIM')
		{
			var supplier = document.getElementById('supplier');
			if(supplier.value == '')
			{
				alert('Please select Supplier first !!!');
				return;
			}
		}
		else
		{
			var customer = document.getElementById('customer');
			if(customer.value == '')
			{
				alert('Please select Customer first !!!');
				return;
			}
		}
		
		if(!$("#dateFromId").val())
		{
			alert('Date From cannot be empty !!!');
			return;
		}
		
		if(!$("#dateToId").val())
		{
			alert('Date To cannot be empty !!!');
			return;
		}
		
		document.add1Form.action = "<c:url value='/page/sparepartbillingpayablepreaddtwo.htm'/>";
		document.add1Form.submit();
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
		
		document.reportForm.reset();
	}
	
	$(function()
	{
		$("#methodType").change(function()
		{
			if($("#methodType").val() == 'KPB' || $("#methodType").val() == 'CLAIM')
			{
				$("#supplier").removeAttr("disabled");
				$("#supplier").attr("class","combobox-ext");
				$("#browseSupplier").removeAttr("hidden");
				$("#supplier option").remove();
				$("<option></option>").text("").val("").appendTo("#supplier");
				
				$("#customer").attr("disabled", "true");
				$("#customer").attr("class","combobox-ext input-disabled");
				$("#browseCustomer").attr("hidden", "true");
				$("#customer option").remove();
				$("<option></option>").text("").val("").appendTo("#customer");
				
			}
			else
			{
				$("#customer").removeAttr("disabled");
				$("#customer").attr("class","combobox-ext");
				$("#customer option").remove();
				$("#browseCustomer").removeAttr("hidden");;
				$("<option></option>").text("").val("").appendTo("#customer");
				
				$("#supplier").attr("disabled", "true");
				$("#supplier").attr("class","combobox-ext input-disabled");
				$("#browseSupplier").attr("hidden", "true");
				$("#supplier option").remove()
				$("<option></option>").text("").val("").appendTo("#supplier");
			}
		});
	});
</script>
