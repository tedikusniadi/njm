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
                                    <td nowrap="nowrap" align="right">Warehouse :</td>
                                    <td>
                                        <form:select id="warehouse" path="warehouse" cssClass="combobox">
                                            <c:if test='${not empty criteria.warehouse}'>
                                                <form:option value='${criteria.warehouse.id}' label='${criteria.warehouse.code} ${criteria.warehouse.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openfacility('warehouse');" style="CURSOR:pointer;" title="Warehouse" />
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
                                    <td align="right">Month:</td>
                                    <td>
                                    	<select id="month" name="month">
                                        	<option value="JANUARY" selected>JANUARY</option>
                                            <option value="FEBRUARY">FEBRUARY</option>
                                            <option value="MARCH">MARCH</option>
                                            <option value="APRIL">APRIL</option>
                                            <option value="MAY">MAY</option>
                                            <option value="JUNE">JUNE</option>
                                            <option value="JULY">JULY</option>
                                            <option value="AUGUST">AUGUST</option>
                                            <option value="SEPTEMBER">SEPTEMBER</option>
                                            <option value="OCTOBER">OCTOBER</option>
                                            <option value="NOVEMBER">NOVEMBER</option>
                                            <option value="DECEMBER">DECEMBER</option>
                                        </select>
                                        &nbsp;
                                        <select id="year" name="year">
                                        	<c:forEach items='${years}' var='year'>
                                            	<option value="${year}">${year}</option>
                                            </c:forEach>
                                        </select>
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
		document.reportForm.action = "<c:url value='/page/inventoryledgerview.htm'/>";
		document.reportForm.submit();
	}
	
	function resetform()
	{
		var org = document.getElementById('org');
		
		for(var idx=org.options.length;idx>=0;idx--)
			org.remove(org.selectedIndex);
			
		var warehouse = document.getElementById('warehouse');
		
		for(var idx=warehouse.options.length;idx>=0;idx--)
			warehouse.remove(warehouse.selectedIndex);
		
		document.reportForm.reset();
	}
	
	function openfacility(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?type=1&organization='/>"+org.value+"&target="+target);
	}
	
</script>