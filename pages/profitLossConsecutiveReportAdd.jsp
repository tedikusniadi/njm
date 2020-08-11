<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Profit And Loss Consecutive</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '')
			{
				alert('Please select company first!');
				return;
			}
			document.reportForm.action = "<c:url value='/page/profitlossconsecutivereportview.htm'/>";
			document.reportForm.submit();
		}
		
		function resetform()
		{
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
			<td width="60%">Reports > Financial Accounting > Accounting > Profit Loss Consecutive</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">RF81 - Profit Loss Consecutive</h1>
						`
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" method="post" modelAttribute="filterCriteria">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Company :</div></td>
                                    <td>
                                        <select id="org" name="org" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Accounting Period :</div></td>
                                    <td>
                                        <select id="year" name="year" class="combobox">
                                        <c:forEach items='${years}' var='year'>
                                           <option><c:out value='${year}'/></option>
                                        </c:forEach>
                                        </select>
									</td>
                                </tr>
                                <tr>
									<td align="right">Aliases :</td>
									<td>
										<input type="radio" name="aliases" value="alias" checked="checked" id="alias"/> <label for="alias">Alias</label>
										<input type="radio" name="aliases" value="name" id="name"/> <label for="name">Name</label>
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
			<span>&copy; 2007 siriusERP v1.0GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
