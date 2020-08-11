<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AR Ledger Detail</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '')
			{
				alert('Please select Organization first !!!');
				return;
			}
			
			var date = document.getElementById('dateId');
			if(date.value == null || date.value == '')
			{
				alert('Date cant be empty');
				return;
			}
			
			document.reportForm.action = "<c:url value='/page/ledgerdetailreportview.htm'/>";
			document.reportForm.submit();
		}
		
		function opencustomer()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
		}
		
		function openLeasing()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=leasing&organization='/>"+org.value);
		}
		
		function mainDealerValidation(valid)
		{
			if(valid)
				$("#mainDealerBrowse").removeAttr("hidden");
			else
				$("#mainDealerBrowse").attr("hidden", "true");
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
			<td width="60%">Financial Accounting > Account Receivables > Report &gt; AR Ledger Detail </td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F32 - AR Ledger Detail </h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td width="22%"><div align="right">Organization :</div></td>
                                    <td width="78%">
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date  :</td>
                                    <td>
                                        <input inputId="dateId" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Customer :</div></td>
                                    <td>
                                        <select id="customer" name="customer" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Leasing :</div></td>
                                    <td>
                                        <select id="leasing" name="customerLeasing" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openLeasing();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
							    <tr>
									<td nowrap="nowrap" align="right">Main Dealer :</td>
									<td>
										<select id="mainDealer" name="customerMainDealer" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img id="mainDealerBrowse" src="assets/icons/list_extensions.gif" onclick="opensupplierpersonal('mainDealer')" style="CURSOR:pointer;" title="Pelanggan" />
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
