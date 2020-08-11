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

			var subType = document.getElementById('subdictionType').value;
			if(subType == 'pilih')
			{
				alert("Mohon pilih Tipe Subsidi terlebih dahulu !!!");
				return;
			}

			document.reportForm.action = "<c:url value='/page/unitsalesordersubdictionreportview.htm'/>";
			document.reportForm.submit();
		}

		function resetform()
		{
			var org = document.getElementById('org');
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
			
			var unit = document.getElementById('unitType');
			for(var idx=unit.options.length;idx>=0;idx--)
				unit.remove(unit.selectedIndex);
				
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
							<form name="reportForm" id="reportForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none">
								<tr>
                                    <td align="right">Organization</td>
                                    <td>:
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
                                            </c:if>
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
			 					<tr>
									<td align="right">Tipe Unit</td>
									<td>:
										<select id="unitType" name="unitType" class="combobox">
										</select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitType&feature=1'/>');" style="CURSOR:pointer;" title="Unit Type" />
									</td>
								</tr>
								<tr>
							  		<td align="right">Tipe Subsidi</td>
							  		<td>:
							  			<select id="subdictionType" name="subdictionType">
							  				<option value="pilih">---PILIH---</option>
											<option value="DISC_DEALER">DISCOUNT DEALER</option>
											<option value="DISC_PROGRAM">DISCOUNT PROGRAM</option>
											<option value="LEASING">LEASING</option>
											<option value="MAIN_DEALER">MAIN DEALER</option>
										</select>
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
