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
							<form:form name="reportForm" id="reportForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Warehouse" />
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Product Category :</td>
                                    <td>
                                        <form:select id="productCategory" path="productCategory" cssClass="combobox">
                                            <c:if test='${not empty criteria.productCategory}'>
                                                <form:option value='${criteria.productCategory.id}' label='${criteria.productCategory.name}'/>
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=productCategory'/>');" style="CURSOR:pointer;" title="Product Category" />
                                    </td>
                                </tr>
								<tr>
									<td nowrap="nowrap" align="right">Tipe :</td>
									<td>
										<form:select id="type" path="type" cssClass="combobox">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="opentype();" style="CURSOR:pointer;" title="Type" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Warna :</td>
									<td>
										<form:select id="warna" path="warna" cssClass="combobox">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openwarna();" style="CURSOR:pointer;" title="Warna" />
									</td>
								</tr>
								<tr>
                                    <td><div align="right">Tahun Rakit :</div></td>
                                    <td>
                                        <select id="year" name="year">
	 							  			<option value="0">--Tahun--</option>
	 							  			<c:forEach items="${years}" var="y">
	 							  				<option value="${y}">${y}</option>
	 							  			</c:forEach>
	 							  		</select>
                                    </td>
                                </tr>
                                <%-- <tr>
									<td nowrap="nowrap" align="right">Nama Tipe :</td>
									<td>
										<form:select id="jenis" path="jenis" cssClass="combobox">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openjenis();" style="CURSOR:pointer;" title="Jenis" />
									</td>
								</tr> --%>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input name="dateFrom" inputId='from' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date To :</td>
                                    <td>
                                        <input name="dateTo" inputId='to' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
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
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
<script type="text/javascript">
	function generate()
	{
		var org = document.getElementById('org');
		var fac = document.getElementById('facility');
		var from = document.getElementById('from');
		var to = document.getElementById('to');
		
		if(org.value == '') {
			alert('Please select Organization first !!!');
			return;
		}
		
		if(fac.value == '') {
			alert('Please select Facility first !!!');
			return;
		}
		
		if(from.value == '') {
			alert('Date From cannot be empty !!!');
			return;
		}
		
		if(to.value == '') {
			alert('Date To  cannot be empty !!!');
			return;
		}
		
		document.reportForm.action = "<c:url value='/page/inventoryledgerserialview.htm'/>";
		document.reportForm.submit();
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
			
		var facility = document.getElementById('facility');
		for(var idx=facility.options.length;idx>=0;idx--)
			facility.remove(facility.selectedIndex);
		
		var type = document.getElementById('type');
		for(var idx=type.options.length;idx>=0;idx--)
			type.remove(type.selectedIndex);
		
		var color = document.getElementById('warna');
		for(var idx=color.options.length;idx>=0;idx--)
			color.remove(color.selectedIndex);
		
		var from = document.getElementById('from');
		from.value = '';
		
		var to = document.getElementById('to');
		to.value = '';
		
		document.reportForm.reset();
	}
	
	function openfacility()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupfacilityview.htm?target=facility&organization='/>"+org.value);
	}
	
	function opentype()
	{
		openpopup("<c:url value='/page/popupproducttypeview.htm?target=type&feature=1'/>");
	}
	
	function openwarna()
	{
		openpopup("<c:url value='/page/popupproducttypeview.htm?target=warna&feature=3'/>");
	}
	
	/* function openjenis()
	{
		openpopup("<c:url value='/page/popupproducttypeview.htm?target=jenis&feature=4'/>");
	} */
</script>