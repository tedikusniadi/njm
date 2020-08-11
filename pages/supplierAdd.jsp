<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/supplierview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form cssClass="ajax-form" id="addForm" name="addForm" method="post" modelAttribute="supplier" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Supplier Type</td>
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
                                        	<c:if test="${not empty supplier.organization }">
                                        		<form:option value='${supplier.organization.id}' label='${supplier.organization.firstName} ${supplier.organization.middleName} ${supplier.organization.lastName}'/>
                                        	</c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
 								<tr>
 									<td align="right">Supplier Code</td>
                                    <td width="1%" align="center">:</td>
									<td><input value="Auto Number" disabled class="input-disabled"/></td>
									<td><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Supplier First Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='firstName' path="firstName" size='30'/></td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Supplier Middle Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='middleName' path="middleName" size='30'/></td>
									<td><form:errors path="middleName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Supplier Last Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input cssClass='check_field' id='lastName' path="lastName" size='30'/></td>
									<td><form:errors path="lastName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Supplier Tax Code</td>
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
 									<td align="right">Supplier PKP Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="pkpDate" name="pkpDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Harga Diskon</td>
                                    <td width="1%" align="center">:</td>
									<td><form:checkbox path="personal"/></td>
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
	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
<script type="text/javascript">
	$(function() {
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
				url:"<c:url value='/page/supplieradd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'post',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Supplier data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/supplierview.htm'/>";
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

		/**
		$('.check_field').change(function(){
			if($first.val())
			{
				$.ajax({
					url: "<c:url value='/page/partyisexistjsonview.htm'/>",
					dataType: "json",
					data: {firstName: $first.val(),middleName:$middle.val(),lastName:$last.val()},
					success: function( data ) {
						if(data.exist)
						{
							alert('Customer with name '+$first.val()+' '+$middle.val()+' '+$last.val()+' already exist!');

							$first.val('');
							$middle.val('');
							$last.val('');

							return;
						}
					}
				});
			}
		});
		*/
});
</script>
</html>