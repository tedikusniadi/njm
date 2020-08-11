<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement Journal Schema Detail >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/reimbursementjournalschemadetailadd.htm'/>";
			document.addForm.submit();
		}
		
		function openaccount()
		{
			var coa = document.getElementById('coa');
			if(coa.value == '')
			{
				alert('Please select valid Chart of Account first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupglaccountview.htm?target=account&level=ACCOUNT&coa='/>"+coa.value);
		}
		
		function showerror()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Reimbursement Journal Schema Detail > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F08 - Reimbursement Journal Schema Detail</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/reimbursementjournalschemapreedit.htm?id=${reimbursement.reimbursementJournalSchema.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="reimbursement">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="30%"><div align="right">Description</div></td>
                                  <td width="1%">:</td>
                               	  <td width="69%"><form:input path="name" cssClass="inputbox" /></td>
                                </tr>
                                <tr>
                                    <td><div align="right">Organization</div></td>
                                    <td width="1%">:</td>
                      				<td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Chart of Account</td>
                                    <td width="1%">:</td>
                            		<td>
                                      <select id="coa" class="combobox-ext">
                                      </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Account</div></td>
                                    <td width="1%">:</td>
                      				<td>
                                        <form:select id="account" path="account" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="GL Account" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><div align="right">Enabled</div></td>
                                    <td width="1%">:</td>
                      				<td>
                                        <form:radiobutton path='enabled' value='true' label='Enable'/>
                                        <form:radiobutton path='enabled' value='false' label='Disable'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Note</td>
                                    <td width="1%">:</td>
                                  <td><form:textarea path="note" cols="55" rows="6"/></td>
                                </tr>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
