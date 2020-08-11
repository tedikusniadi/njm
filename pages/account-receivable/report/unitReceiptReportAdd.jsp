<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org').value;
			if(org == '' || org == null)
			{
				alert('Please select Organization first !!!');
				return;
			}
			
			/* var type = document.getElementById('receiptType').value;
			if(type == '')
			{
				alert("Mohon pilih Tipe Kwitansi terlebih dahulu !!!");
				return;
			} */

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
			
			document.reportForm.action = "<c:url value='/page/receiptrecapreportview.htm'/>";
			document.reportForm.submit();
		}
		
		function resetform()
		{
			var org = document.getElementById('org');
			
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
			
			var cust = document.getElementById('cust');
			
			for(var idx=cust.options.length;idx>=0;idx--)
				cust.remove(cust.selectedIndex);
			
			document.reportForm.reset();
		}

		function openLeasing(target)
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first !!!');
				return;
			}
			
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization="+org.value+"'/>");
		}
		
		function billedTo(target){
			var org = document.getElementById('org').value;
			
			switch($("#receiptType").val()){
				case "10":
					openCustomerFacilityByOrg(target);
					break;
				case "9":
					opensupplierpersonal(target);
					break;
				case "8":
					openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
					break;
				case "7":
					openCustomerByOrg(target);
					break;
				case "6":
					openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
					break;
				default:
					alert("Silahkan pilih tipe kwitansi");
					break;
			}
		}
		$(function(){
			$("#receiptType").change(function(){
				$("#customer").empty();
			});
		});
	</script>
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
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
                                            </c:if>
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Tipe Kwitansi : </td>
                                    <td>
                                        <select id='receiptType' name='receiptType' cssClass='combobox-ext'>
                                        	<option value="" selected>--All--</option>
                                            <c:forEach items="${billingTypes}" var="billType">
                                            <c:if test="${billType.id == 6}">
                                                <option value='LEASING'>${billType.name}</option>
                                               </c:if>
                                            <c:if test="${billType.id == 7}">
                                                <option value='CUSTOMER'>${billType.name}</option>
                                               </c:if>
                                            <c:if test="${billType.id == 8}">
                                                <option value='SUBDICTION'>${billType.name}</option>
                                               </c:if>
                                            <c:if test="${billType.id == 9}">
                                                <option value='SUBDICTION_HOLDER'>${billType.name}</option>
                                               </c:if>
                                            <c:if test="${billType.id == 10}">
                                                <option value='CUSTOMER_DEALER'>${billType.name}</option>
                                               </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
							    <!-- <tr>
									<td nowrap="nowrap" align="right">Tagihan ke :</td>
									<td>
										<select id="cust" name="customer" cssClass="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="billedTo('cust')" style="CURSOR:pointer;" title="Pelanggan" />
									</td>
								</tr> -->
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                    	<input id="dateFrom" name="dateFrom" inputId="dateFromId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    	Date To :
                                        <input id="dateTo" name="dateTo" inputId="dateToId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
