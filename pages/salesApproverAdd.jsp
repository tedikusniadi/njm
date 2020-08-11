<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Sales Approver</title>
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
			<td width="60%">Sales > Sales Approver</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">S02 - Sales Approver</h1>
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/customerview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="approver" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Approver Type</td>
                                    <td width="1%" align="center">:</td>
							  		<td width="64%">
			  					  		<form:select path="type" class="combobox">
											<form:option value="group" label='ORGANIZATION/GROUPS'/>
											<form:option value="personal" label='PERSON/PERSONAL'/>
										</form:select>
									</td>
							  	  	<td width="1%">&nbsp;</td>
 								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
 								<tr>
 									<td align="right">Approver Code</td>
                                    <td width="1%" align="center">:</td>
									<td><input value="Auto Number" disabled class="input-disabled"/></td>
									<td><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Approver First Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='firstName' path="firstName" size='30'/></td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Approver Middle Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='middleName' path="middleName" size='30'/></td>
									<td><form:errors path="middleName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Approver Last Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='lastName' path="lastName" size='30'/></td>
									<td><form:errors path="lastName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Approver Tax Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="taxCode"  /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Legend</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="legend" size='30'/></td>
									<td><form:errors path="legend"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Salutation</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="salutation"  /></td>
									<td><form:errors path="salutation"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">NPPKP</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input path="nppkp"  /></td>
	 							  	<td><form:errors path="nppkp"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Approver PKP Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="pkpDate" name="pkpDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Birth/Startup Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="birthDate" name="birthDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td><input type="file" name="file"/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
 									<td align="right">Note</td>
                                    <td width="1%" align="center">:</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$first = $('#firstName');
		$middle = $('#middleName');
		$last = $('#lastName');

		$('.item-button-save').click(function(){
			if(!$first.val() && !$middle.val() && !$last.val())
			{
				alert('First Name/Middle Name/Last Name cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/salesapproveradd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sales Approver data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/salesapproverpreedit.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>