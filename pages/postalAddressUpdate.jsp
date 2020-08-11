<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Postal Address >> Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
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
			<td width="60%">Company Administration > Party > Postal Address > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

					<h1 class="page-title">A04 - Postal Address</h1>

					<div class="toolbar">
						<a class="item-button-list" style="cursor:pointer;"><span>List</span></a>
						<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					</div>
					<div class="main-box">
						<form:form id='editForm' name="editForm" method="post" modelAttribute="postalAddress_edit" cssClass="edit-form">
						<table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                        	<td width="59%" valign="top">
                           	  	<table width="100%">
                                <tr>
                                    <td width="225" align="right">Party</td>
                                  <td width="486">:&nbsp;<input class="input-disabled" disabled value="${postalAddress_edit.party.firstName} ${postalAddress_edit.party.middleName} ${postalAddress_edit.party.lastName}" size="50"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Address</td>
                                    <td>:&nbsp;<form:textarea path="address" cols="55" rows="6"/></td>
                                </tr>
                                <tr>
	 							  	<td align="right">Provinsi</td>
	 							  	<td>:
	 							  		<select name="province" id="province" onchange="javascript:getcity('province')" class="combobox-medium">
	 							  			<option value="0">--Provinsi--</option>
	 							  			<c:forEach items="${provinces}" var="province">
	 							  				<option value="${province.id}" ${(province.id==postalAddress_edit.province.id)?'selected':''}>${province.name}</option>
	 							  			</c:forEach>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kota/Kabupaten</td>
	 							  	<td>:
	 							  		<select name="city" id='city' onchange="javascript:getsubdistrict('city')" class="combobox-medium">
	 							  		<c:forEach items="${cities}" var="city">
	 							  			<option value="${city.id}" ${(city.id==postalAddress_edit.city.id)?'selected':''}>${city.name}</option>
	 							  		</c:forEach>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<%-- <td align="right">Wilayah Samsat</td>
	 							  	<td>:&nbsp;<input name="region" size="34" value="${postalAddress_edit.region}"/></td>
	 							  	<td></td> --%>
	 							  	<td align="right">Wilayah Samsat</td>
	 							  	<td>:
	 							  		<select name="city" id='city' onchange="javascript:checkavailableregion('city')" class="combobox-medium">
	 							  		<c:if test="${postalAddress_edit.city.availableRegion}">
	 							  			<c:forEach items="${regions}" var="reg">
		 							  			<option value="${reg.id}" ${(reg.id==postalAddress_edit.subdistrict.parent.id)?'selected':''}>${reg.name}</option>
		 							  		</c:forEach>
	 							  		</c:if>
	 							  		<c:if test="${!postalAddress_edit.city.availableRegion}">
	 							  			<option>--Wilayah Samsat--</option>
	 							  		</c:if>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kecamatan</td>
	 							  	<td>:
	 							  		<select name="subdistrict" id='subdistrict' class="combobox-medium">
	 							  		<c:forEach items="${subdis}" var="sub">
	 							  			<option value="${sub.id}" ${(sub.id==postalAddress_edit.subdistrict.id)?'selected':''}>${sub.name}</option>
 							  			</c:forEach>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kodepos</td>
	 							  	<td>:&nbsp;<input name="postalCode" value="${postalAddress_edit.postalCode}"/></td>
	 							  	<td></td>
	 							</tr>
                                <tr>
                                    <td align="right" valign="top">Note</td>
                                    <td>:&nbsp;<form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Status :</td>
                                    <td>
                                        <form:radiobutton path="enabled" label="Active" value="true"/>
                                        <form:radiobutton path="enabled" label="Inactive" value="false"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Default :</td>
                                    <td>
                                        <form:radiobutton path="selected" value='true' label='Yes'/>
                                        <form:radiobutton path="selected" value='false' label='No'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top">Address Type :</td>
                                    <td>
                                        <c:forEach items='${postalAddress_edit.addressTypes}' var='type' varStatus='status'>
                                            <form:checkbox path="addressTypes[${status.index}].enabled" value="true" label="${type.type}"/><br/>
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
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

  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
function getcity(target){
	$.get("<c:url value='/page/geographicsremote.getcity.json'/>",{id:$("#"+target).val()},function(json){
		$("#city option").remove();
		$("<option></option>").	text("--Kota/Kabupaten--").val(0).appendTo("#city");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.code+" "+val.name).val(val.id).appendTo("#city");
		});
	});
}

function checkavailableregion(target) {
	$.get("<c:url value='/page/geographicsremote.checkavailableregion.json'/>",{id:$("#"+target).val()},function(json){
		$("#region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#region");
		$("#subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#subdistrict");
		if(json.available)
			getregion(target);
		else
			getsubdistrict(target);
	});
}

function getregion(target){
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target).val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#region");
		});
	});
}

function getsubdistrict(target){
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#"+target).val()},function(json){
		$("#subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#subdistrict");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.code+" "+val.name).val(val.id).appendTo("#subdistrict");
		});
	});
}
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Postal Address',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			if(!$('#address').val())
			{
				alert('Address cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/postaladdressedit.htm'/>",
				data:$('#editForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Postal Address data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							<c:if test='${empty uri}'>
								window.location="<c:url value='/page/partypreedit.htm?id=${postalAddress_edit.party.id}'/>";
							</c:if>
							<c:if test='${not empty uri}'>
								window.location="<c:url value='/page/${uri}?id=${postalAddress_edit.party.id}'/>";
							</c:if>
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

		$('.item-button-list').click(function(){
			<c:if test='${empty uri}'>
				window.location="<c:url value='/page/partypreedit.htm?id=${postalAddress_edit.party.id}'/>";
			</c:if>
			<c:if test='${not empty uri}'>
				window.location="<c:url value='/page/${uri}?id=${postalAddress_edit.party.id}'/>";
			</c:if>
		});
	});
</script>