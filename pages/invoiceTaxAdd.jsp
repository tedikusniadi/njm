<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Tax >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Account Receivable > Invoice Tax Management > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">F22 - Invoice Tax Management</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/invoicetaxview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="tax_add">
								<table width="100%" style="border:none">
								<tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty tax_add.organization}'>
                                               	<form:option value='${tax_add.organization.id}' label='${tax_add.organization.firstName} ${tax_add.organization.middleName} ${tax_add.organization.lastName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Year :</td>
								  	<td width="80%"><form:input id="year" path='year' size='10' onblur='setstart();' onchange="setstart()"/></td>
								</tr>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Number Start :</td>
								  	<td width="80%">
                                    	<form:input id="start" path='start' size='10'/>
                                    	<input type="hidden" id="_start" value="1"/>
                                    </td>
								</tr>
								<%-- <tr>
									<td width="20%" nowrap="nowrap" align="right">Number End :</td>
								  	<td width="80%"><form:input id='end' path='end' size='10'/></td>
								</tr> --%>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Digit :</td>
								  	<td width="80%"><form:input path='digit' size='10'/></td>
								</tr>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/invoicetaxadd.htm'/>";
		document.addForm.submit();
	}

	function setstart()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please Select Company first!');
			return;
		}

		var year = document.getElementById('year');
		if(year.value == '')
		{
			alert('Year cannot be empty!');
			return;
		}
		$.get("<c:url value='/page/invoicetaxremote.loadStart.json'/>",{year:year.value,org:org.value},function(resp){
			document.getElementById('start').value = resp.start;
			document.getElementById('_start').value = resp.start;
		});
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>