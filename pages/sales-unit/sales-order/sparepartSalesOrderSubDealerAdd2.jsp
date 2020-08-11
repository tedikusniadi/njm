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
							<a class="item-button-list" href="<c:url value='/page/sparepartsalesordersubdealerview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="sparepartSOSubdealer_add">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="61%" valign="top">
                                	<table width="100%" style="border:none">
                                    <tr>
                                      <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                      <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Company :</td>
                                        <td>
                                            <select id="org" name="organization" class="combobox-ext">
                                                <c:if test='${not empty sparepartSOSubdealer_add.organization}'>
                                                    <option value='${sparepartSOSubdealer_add.organization.id}'>${sparepartSOSubdealer_add.organization.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Sub Dealer :</td>
                                        <td>
                                            <select id="subDealer" name="subDealer" class="combobox-ext">
                                                <c:if test='${not empty sparepartSOSubdealer_add.subDealer}'>
                                                    <option value='${sparepartSOSubdealer_add.subDealer.id}'>${sparepartSOSubdealer_add.subDealer.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Date :</td>
                                        <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${sparepartSOSubdealer_add.date}' pattern='dd-MM-yyyy'/>"/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Transfer Source :</td>
                                        <td>
                                            <select id="source" name="source" class="combobox-ext">
                                                <c:if test='${not empty sparepartSOSubdealer_add.source}'>
                                                    <option value='${sparepartSOSubdealer_add.source.id}'>${sparepartSOSubdealer_add.source.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Transfer Destination :</td>
                                        <td>
                                            <select id="destination" name="destination" class="combobox-ext">
                                                <c:if test='${not empty sparepartSOSubdealer_add.destination}'>
                                                    <option value='${sparepartSOSubdealer_add.destination.id}'>${sparepartSOSubdealer_add.destination.name}</option>
                                                </c:if>
                                            </select>
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Grid :</td>
                                        <td>
                                            <select id="grid" name="grid" class="combobox">
                                            </select>
                                            <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('grid');" style="CURSOR:pointer;" title="Grid" />
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path="note" cols="55" rows="7"/></td>
                                    </tr>
                                	</table>
                              	</td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                            <div id="unit" dojoType="ContentPane" label="Produk" class="tab-pages" refreshOnShow="true">
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="width:100%" align="center">
	                            <thead>
	                            <tr>
	                                <th align="left">Product</th>
	                              	<th width="20%">Tipe</th>
	                              	<th width="20%">Nama Tipe</th>
	                              	<th width="20%">Warna</th>
	                              	<th width="10%">Quantity</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${sparepartSOSubdealer_add.items}' var='item' varStatus="status">
	                            <c:if test="${item.product.productCategory.id == 2}">
	                            <tr>
	                            	<td>${item.product.name}</td>
	                            	<td>${item.product.types}</td>
	                            	<td>${item.product.typeNames}</td>
	                            	<td>${item.product.colors}</td>
	                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
	                            </tr>
	                            </c:if>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            </div>
							</form:form>
						</div>
						<div class="info">Created by : ${sparepartSOSubdealer_add.createdBy.firstName} ${sparepartSOSubdealer_add.createdBy.middleName} ${sparepartSOSubdealer_add.createdBy.lastName} (<fmt:formatDate value='${sparepartSOSubdealer_add.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${sparepartSOSubdealer_add.updatedBy.firstName} ${sparepartSOSubdealer_add.updatedBy.middleName} ${sparepartSOSubdealer_add.updatedBy.lastName} (<fmt:formatDate value='${sparepartSOSubdealer_add.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script type="text/javascript">
	
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sparepart Sales Order Sub Dealer',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/sparepartsalesordersubdealeradd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Sales Order data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/sparepartsalesordersubdealerview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason:<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	function validation()
	{
		var grid = document.getElementById('grid');
		if(grid.value == '')
		{
			alert('Please select Grid first !!!');
			return;
		}
		
		return true;
	}
	
	function opengrid(target)
	{
		var fac = document.getElementById('source');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>