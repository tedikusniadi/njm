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

			var date = document.getElementById('dateFromId').value;
			if(date == '' || date == null)
			{
				alert("Date From cannot be empty !!!");
				return;
			}
			
			document.reportForm.action = "<c:url value='/page/unitsalestransactionreportview.htm'/>";
			document.reportForm.submit();
		}

		function opencustomer(target)
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			else
			{
				if(org.value != 1824)
					openpopup("<c:url value='/page/popupcustomerview.htm?organization='/>"+org.value+"&target="+target);
				else
					openpopup("<c:url value='/page/popupcustomerview.htm?target='/>"+target);
			}
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
		
		function resetform()
		{
			var org = document.getElementById('org');
			
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
				
			document.reportForm.reset();
		}
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
                                	<td nowrap="nowrap" align="right">Salesman :</td>
                                  	<td>
                                    	<select id="salesPerson" name="salesPersonId" class="combobox-ext">
                                      	</select>
                                      	<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesPerson'/>');" style="CURSOR:pointer;" title="Salesman" />
                                  	</td>
                              	</tr>
								<tr>
                                	<td nowrap="nowrap" align="right">Nama Pemesan :</td>
                                  	<td>
                                    	<select id="customer" name="customerId" class="combobox-ext">
                                      	</select>
                                      	<img src="assets/icons/list_extensions.gif" onclick="opencustomer('customer');" style="CURSOR:pointer;" title="Customer" />
                                  	</td>
                              	</tr>
								<tr>
                                	<td nowrap="nowrap" align="right">Nama STNK :</td>
                                  	<td>
                                    	<select id="customerUnit" name="customerUnitId" class="combobox-ext">
                                      	</select>
                                      	<img src="assets/icons/list_extensions.gif" onclick="opencustomer('customerUnit');" style="CURSOR:pointer;" title="Customer" />
                                  	</td>
                              	</tr>
								<tr>
                                	<td nowrap="nowrap" align="right">Leasing :</td>
                                  	<td>
                                    	<select id="leasing" name="leasingId" class="combobox-ext">
                                      	</select>
                                      	<img src="assets/icons/list_extensions.gif" onclick="openLeasing('leasing');" style="CURSOR:pointer;" title="Customer" />
                                  	</td>
                              	</tr>
			 					<tr>
									<td align="right">Tipe Unit :</td>
									<td>
										<select id="unitType" name="unitType" class="combobox">
										</select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
									</td>
								</tr>
			 					<tr>
									<td align="right">Warna :</td>
									<td>
										<select id="unitColor" name="unitColor" class="combobox">
										</select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitColor&feature=3'/>');" style="CURSOR:pointer;" title="Product Colors" />
									</td>
								</tr>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input id="dateFrom" name="dateFrom" inputId="dateFromId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="dateTo" name="dateTo" inputId="dateToId" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
                                <tr>
                                	<td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="notYetDelivery" value="true"/>Belum dikirim/Belum buat DO/Surat Jalan</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="alreadyDelivery" value="true"/>Sudah dikirim/Sudah buat DO/Surat Jalan</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="notYetLeasing" value="true"/>Belum proses Leasing</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="alreadyLeasing" value="true"/>Sudah proses Leasing</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="rejectLeasing" value="true"/>Reject Leasing</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="notYetBillingLeasing" value="true"/>Belum Billing</td>
                                </tr>
                                <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><input type="checkbox" name="alreadyBillingLeasing" value="true"/>Sudah Billing</td>
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
