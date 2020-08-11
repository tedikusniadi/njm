<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Postal Address >> Add</title>
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
			<td width="60%">Company Administration > Party > Postal Address > Add</td>
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
						<form:form id='addForm' name="addForm" method="post" modelAttribute="postalAddress_add" cssClass="edit-form">
						<table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                        	<td width="59%" valign="top">
                           	  	<table width="100%" cellpadding="0" cellspacing="0">
                                <tr><td colspan="3">&nbsp;</td></tr>
                                <tr>
                                    <td width="287" align="right">Party</td>
                                    <td width="443">:&nbsp;<input class="input-disabled" size="50" disabled value="${postalAddress_add.party.firstName} ${postalAddress_add.party.middleName} ${postalAddress_add.party.lastName}"/></td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top">Address</td>
                                    <td valign="top">:&nbsp;<form:textarea id='address' path="address" cols="55" rows="6"/></td>
                                </tr>
                                <tr>
	 							  	<td align="right">Provinsi</td>
	 							  	<td>:
	 							  		<select name="province" id="province" onchange="javascript:getcity('province')" class="combobox-medium">
	 							  			<option value="0">--Provinsi--</option>
	 							  			<c:forEach items="${provinces}" var="province">
	 							  				<option value="${province.id}">${province.name}</option>
	 							  			</c:forEach>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kota/Kabupaten</td>
	 							  	<td>:&nbsp;<select name="city" id='city' onchange="javascript:checkavailableregion('city')" class="combobox-medium"><option value="0">--Kabupaten--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 								<!-- <td align="right">Wilayah Samsat</td>
	 							  	<td>:&nbsp;<input name="region" size="34"/></td>
	 							  	<td></td> -->
	 							  	<td align="right">Wilayah Samsat</td>
	 							  	<td>:&nbsp;<select id='region' onchange="javascript:getsubdistrict('region')" class="combobox-medium"><option value="0">--Wilayah Samsat--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kecamatan</td>
	 							  	<td>:&nbsp;<select name="subdistrict" id='subdistrict' class="combobox-medium"><option value="0">--Kecamatan--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kelurahan</td>
	 							  	<td>:&nbsp;<input name="village"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kodepos</td>
	 							  	<td>:&nbsp;<input name="postalCode"/></td>
	 							  	<td></td>
	 							</tr>
                                <tr>
                                    <td align="right" valign="top">Note</td>
                                    <td valign="top">:&nbsp;<form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Status :</td>
                                    <td>
                                    	<form:radiobutton path="enabled" value='true' label='Active'/>
                                        <form:radiobutton path="enabled" value='false' label='Inactive'/>
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
                                        <c:forEach items='${postalAddress_add.addressTypes}' var='type' varStatus='status'>
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
			$("<option></option>").	text(val.name).val(val.id).appendTo("#city");
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
			$("<option></option>").	text(val.name).val(val.id).appendTo("#subdistrict");
		});
	});
}
	$(function(){
		$('.item-button-save').click(function(){
			if(!$('#address').val())
			{
				alert('Address cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/postaladdressadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Postal Address data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							<c:if test='${empty uri}'>
								window.location="<c:url value='/page/partypreedit.htm?id=${postalAddress_add.party.id}'/>";
							</c:if>
							<c:if test='${not empty uri}'>
								window.location="<c:url value='/page/${uri}?id=${postalAddress_add.party.id}'/>";
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
				window.location="<c:url value='/page/partypreedit.htm?id=${postalAddress_add.party.id}'/>";
			</c:if>
			<c:if test='${not empty uri}'>
				window.location="<c:url value='/page/${uri}?id=${postalAddress_add.party.id}'/>";
			</c:if>
		});
	});
</script>