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
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td width="30%"><div align="right">Organization :</div></td>
                                    <td width="70%">
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
                                            </c:if>
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Tipe Referensi :</td>
                                    <td>
                                        <select id='referenceType' name='referenceType'>
                                        	<option value="STNK">STNK</option>
                                        	<option value="PLAT">PLAT</option>
                                        	<option value="BPKB">BPKB</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Tipe : </td>
                                    <td>
                                        <select id='type' name='type' class="combobox-medium">
                                        	<option value="UNRECEIVED">Belum Diterima Dari Samsat</option>
                                        	<option value="RECEIVED">Sudah Diterima Dari Samsat</option>
                                        	<option value="UNDELIVERED">Belum Diserahkan</option>
                                        	<option value="DELIVERED">Sudah Diserahkan</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr id="rowDateFrom" style="visibility: hidden;">
                                    <td align="right"><div id="dateFromText">SPK Date From :</div></td>
                                    <td>
                                        <input id="dateFrom" inputId="dateFromId" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
                                <tr id="rowDateTo" style="visibility: hidden;">
                                    <td align="right"><div id="dateToText">SPK Date To :</div></td>
                                    <td>
                                        <input id="dateTo" inputId="dateToId" name="dateTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
	$(function()
	{
		$("#referenceType").change(function()
		{
			$("#type option").remove();
			if($("#referenceType").val() == 'BPKB')
			{
				$("<option></option>").text("Belum Diterima Dari Samsat").val("UNRECEIVED").appendTo("#type");
				$("<option></option>").text("Sudah Diterima Dari Samsat").val("RECEIVED").appendTo("#type");
				$("<option></option>").text("Belum Diserahkan Ke Leasing").val("UNDELIVERED_LEASING").appendTo("#type");
				$("<option></option>").text("Belum Diserahkan Ke Konsumen").val("UNDELIVERED_CUSTOMER").appendTo("#type");
				$("<option></option>").text("Sudah Diserahkan Ke Leasing").val("DELIVERED_LEASING").appendTo("#type");
				$("<option></option>").text("Sudah Diserahkan Ke Konsumen").val("DELIVERED_CUSTOMER").appendTo("#type");
			}
			else
			{
				$("<option></option>").text("Belum Diterima Dari Samsat").val("UNRECEIVED").appendTo("#type");
				$("<option></option>").text("Sudah Diterima Dari Samsat").val("RECEIVED").appendTo("#type");
				$("<option></option>").text("Belum Diserahkan").val("UNDELIVERED").appendTo("#type");
				$("<option></option>").text("Sudah Diserahkan").val("DELIVERED").appendTo("#type");
			}
			
			$("#type").change();
		});
		
		$("#type").change(function()
		{
			if($("#referenceType").val() == 'BPKB')
			{
				if($("#type").val() == 'UNRECEIVED') {
					$('#dateFromText').text('SPK Date From :');
					$('#dateToText').text('SPK Date To :');
					$('#rowDateFrom').attr('style', 'visibility:hidden;');
					$('#rowDateTo').attr('style', 'visibility:hidden;');
				} else if($("#type").val() == 'RECEIVED' || $("#type").val() == 'UNDELIVERED_LEASING' || $("#type").val() == 'UNDELIVERED_CUSTOMER') {
					$('#dateFromText').text('BPKB Received Date From :');
					$('#dateToText').text('BPKB Received Date To :');

					if($("#type").val() == 'RECEIVED') {
						$('#rowDateFrom').attr('style', 'visibility:visible;');
						$('#rowDateTo').attr('style', 'visibility:visible;');
					}
					else {
						$('#rowDateFrom').attr('style', 'visibility:hidden;');
						$('#rowDateTo').attr('style', 'visibility:hidden;');
					}
				} else {
					$('#dateFromText').text('BPKB Delivered Date From :');
					$('#dateToText').text('BPKB Delivered Date To :');
					$('#rowDateFrom').attr('style', 'visibility:visible;');
					$('#rowDateTo').attr('style', 'visibility:visible;');
				}
			} else
			{
				if($("#type").val() == 'UNRECEIVED') {
					$('#dateFromText').text('SPK Date From :');
					$('#dateToText').text('SPK Date To :');
					$('#rowDateFrom').attr('style', 'visibility:hidden;');
					$('#rowDateTo').attr('style', 'visibility:hidden;');
				} else if($("#type").val() == 'RECEIVED' || $("#type").val() == 'UNDELIVERED') {
					$('#dateFromText').text($("#referenceType").val()+' Received Date From :');
					$('#dateToText').text($("#referenceType").val()+' Received Date To :');

					if($("#type").val() == 'RECEIVED') {
						$('#rowDateFrom').attr('style', 'visibility:visible;');
						$('#rowDateTo').attr('style', 'visibility:visible;');
					}
					else {
						$('#rowDateFrom').attr('style', 'visibility:hidden;');
						$('#rowDateTo').attr('style', 'visibility:hidden;');
					}
				} else {
					$('#dateFromText').text($("#referenceType").val()+' Delivered Date From :');
					$('#dateToText').text($("#referenceType").val()+' Delivered Date To :');
					$('#rowDateFrom').attr('style', 'visibility:visible;');
					$('#rowDateTo').attr('style', 'visibility:visible;');
				}
			}
		});
	});
	
	function generate()
	{
		var org = document.getElementById('org').value;
		if(org == '' || org == null)
		{
			alert('Please select Organization first !!!');
			return;
		}
		
		var type = document.getElementById('type').value;
		if(type == 'ALL')
		{
			alert('Mohon pilih Tipe terlebih dahulu !!!');
			return;
		}

		if(type == 'RECEIVED' || type == 'DELIVERED' || type == 'DELIVERED_LEASING' || type == 'DELIVERED_CUSTOMER')
		{
			var dateFrom = document.getElementById('dateFromId').value;
			if(dateFrom == '' || dateFrom == null)
			{
				alert("Date From cannot be empty !!!");
				return;
			}
	
			var dateTo = document.getElementById('dateToId').value;
			if(dateTo == '' || dateTo == null)
			{
				alert("Date To cannot be empty !!!");
				return;
			}
		}
		
		document.reportForm.action = "<c:url value='/page/bbndetailreportview2.htm'/>";
		document.reportForm.submit();
	}
	
	/* function checkReference()
	{
		if($("#type").val() == 'ALL') {
			$("#referenceType").attr("disabled", "true");
			$("#referenceType option[value='ALL']").attr("selected", "selected");
		}
		else
			$("#referenceType").removeAttr("disabled");
	} */

	function resetform()
	{
		var org = document.getElementById('org');
		
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);

		document.getElementById('dateFromId').value = '';
		document.getElementById('dateToId').value = '';
			
		document.reportForm.reset();
	}
</script>
