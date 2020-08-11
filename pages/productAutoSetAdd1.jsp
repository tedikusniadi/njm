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
							<a class="item-button-next" href="javascript:next();"><span>Next</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form name="addForm" id="addForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none;">
								<tr>
									<table width="100%" style="border:none">
									<tr>
										<td width="30%" align="right">Type</td>
										<td width="70%" align="left">:
											<select id="type" name="type">
												<option value="CATEGORY">Add Category</option>
												<option value="GRID">Add Default Grid</option>
											</select>
										</td>
									</tr>
									</table>
								</tr>
								<tr>
									<table id="tabAddCategory" width="100%" style="border:none;">
									<tr>
										<td width="30%" align="right">Category</td>
										<td width="70%" align="left">:
											<select id="category" name="category">
												<option value="AGP">AGP</option>
												<option value="HGP">HGP</option>
												<option value="NON_HGP">NON HGP</option>
												<option value="OLI">OLI</option>
											</select>
										</td>
									</tr>
									</table>
								</tr>
								<tr>
									<table id="tabAddGrid" width="100%" style="border:none" hidden="hidden">
									<tr>
	                                    <td width="30%" align="right">Organization</td>
	                                    <td width="70%" align="left">:
	                                        <select id="org" name="organization" class="combobox-ext">
	                                        	<c:if test='${not empty organization}'>
	                                            	<option value="${organization.id}"><c:out value='${organization.name}'/></option>
	                                            </c:if>
	                                        </select>
	                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
	                                    </td>
	                                </tr>
									<tr>
	                                    <td align="right">Facility</td>
	                                    <td>:
	                                        <select id="facility" name="facility" class="combobox-ext">
	                                        </select>
	                                        <img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Facility" />
	                                    </td>
	                                </tr>
	                                <!-- <tr>
	                                    <td align="right">Grid</td>
	                                    <td>:
	                                        <select id="grid" name="grid" class="combobox-ext">
	                                        </select>
	                                        <img src="assets/icons/list_extensions.gif" onclick="opengrid();" style="CURSOR:pointer;" title="Grid" />
	                                    </td>
	                                </tr> -->
	                                </table>
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
	function next()
	{
		if($("#type").val() == 'GRID')
		{
			if($("#facility").val() == null || $("#facility").val() == '')
			{
				alert('Please select Facility first!');
				return;
			}
		}
		document.addForm.action = "<c:url value='/page/productautosetpreaddtwo.htm'/>";
		document.addForm.submit();
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
	
	function opengrid()
	{
		var fac = document.getElementById('facility');
		if(fac.value == '')
		{
			alert('Please select Facility first!');
			return;
		}
	
		openpopup("<c:url value='/page/popupgridview.htm?target=grid&facility='/>"+fac.value);
	}
	
	$(function()
	{
		$("#type").change(function()
		{
			if($("#type").val() == 'CATEGORY')
			{
				$("#tabAddCategory").removeAttr("hidden");
				$("#tabAddGrid").attr("hidden", "hidden");
			}
			else
			{
				$("#tabAddGrid").removeAttr("hidden");
				$("#tabAddCategory").attr("hidden", "hidden");
			}
		});
	});
</script>
