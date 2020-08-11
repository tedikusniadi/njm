<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
                        	<a class="item-button-back" href="<c:url value='/page/productpreedit.htm?id=${default_grid_edit.product.id}'/>"><span>Back</span></a>
                        	<c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="default_grid_edit">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
 									<td width="20%" align="right">Product Code :</td>
							  	  	<td width="80%"><input disabled='true' class='input-disabled' value="${default_grid_edit.product.code}"/></td>
 								</tr>
 								<tr>
 									<td align="right">Product Name :</td>
									<td><input disabled='true' class='input-disabled' size='45' value="${default_grid_edit.product.name}"/></td>
	 							</tr>
								<tr>
                                    <td align="right">Organization :</td>
                                    <td>
                                        <select id="org" name="organization" class="combobox-ext">
                                        	<option value="${default_grid_edit.grid.facility.owner.id}">${default_grid_edit.grid.facility.owner.name}</option>
                                        </select>
                                       <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
								<tr>
                                    <td align="right">Facility :</td>
                                    <td>
                                        <select id="facility" name="facility" class="combobox-ext">
                                        	<option value="${default_grid_edit.grid.facility.id}">${default_grid_edit.grid.facility.name}</option>
                                        </select>
                                        <img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Facility" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Grid :</td>
                                    <td>
                                    	<form:select id="grid" path="grid" class="combobox-ext">
                                    		<form:option value='${default_grid_edit.grid.id}' label='${default_grid_edit.grid.name}'/>
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="opengrid();" style="CURSOR:pointer;" title="Grid" />
                                    </td>
                                </tr>
 								</table>
 							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${default_grid_edit.createdBy.firstName} ${default_grid_edit.createdBy.middleName} ${default_grid_edit.createdBy.lastName}'/> (<fmt:formatDate value='${default_grid_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${default_grid_edit.updatedBy.firstName} ${default_grid_edit.updatedBy.middleName} ${default_grid_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${default_grid_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product Default Grid',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productdefaultgridedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Product Defaut Grid data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productpreedit.htm?id='/>"+${default_grid_edit.product.id};
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
						}
					}
				}
			});
		});
	});
	
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
</script>