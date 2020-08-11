<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title }</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
			<td width="60%">${breadcrumb }</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">${pageTitle }</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/accessoriesstockadjustmentview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_add_detail">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="<spring:message code='autonumber'/>" disabled class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="10" class="input-disabled" disabled value="<fmt:formatDate value='${adjustment_add_detail.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" class='input-disabled' disabled='true'>
                                            <c:if test='${not empty adjustment_add_detail.organization}'>
                                                <form:option value='${adjustment_add_detail.organization.id}' label='${adjustment_add_detail.organization.firstName} ${adjustment_add_detail.organization.middleName} ${adjustment_add_detail.organization.lastName}' />
                                            </c:if>
                                        </form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext" disabled='true'>
											<c:if test='${not empty adjustment_add_detail.facility}'>
                                                <form:option value='${adjustment_add_detail.facility.id}' label='${adjustment_add_detail.facility.name}' />
	                                        </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea value="${adjustment_add_detail.reason}" path='reason' cols='45' rows='5' class="input-disabled" disabled='true' /></td>
								</tr>
							</table>
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                                <div>&nbsp;</div>
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                              	<th width="2%">&nbsp;</th>
                                <th width="15%">Serial</th>
                                <th width="8%">Tahun</th>
                                <th width="12%">Adjustment</th>
                                <th width="8%">Uom</th>
                            </tr>
                            </thead>
                            <tbody>
                            	<c:set var="value" value="0" />
	                            <c:forEach items='${adjustment_add_detail.items}' var='item' varStatus='status'>
		                            <tr>
		                            	<td colspan="3">
		                            		<input type="hidden" name="product" id="product[${value}]" value="${item.product.id}" />
		                            		<strong><c:out value='${item.product.code} - ${item.product.name}'/></strong>
		                            	</td>
		                            	<td><fmt:formatNumber value='${item.quantity}'/></td>
		                            	<td>${item.product.unitOfMeasure.measureId}</td>
		                            </tr>
		                            <c:if test="${item.product.serial}">
			                            <c:forEach items='${item.details}' var='detail' varStatus='detailStatus'>
			                            <c:if test="${item.product.productCategory.id=='3'}">
				                            <tr>
				                            	<td>&nbsp;</td>
				                            	<td><input type="text" size='20' id='serial[${value}]' value='Serial' name="items[${status.index}].details[${detailStatus.index}].serial" onclick="emptyValue(this);" title="Mesin"/>&nbsp;</td>
				                                <td><input type="text" size='20' id='year[${value}]' value='Tahun' name="items[${status.index}].details[${detailStatus.index}].year" onclick="emptyValue(this);" title="Tahun"/>&nbsp;</td>
				                                <td><input type="text" class="input-disabled" size='10' id='quantity[${value}]' value='${detail.quantity}' disabled/>&nbsp;</td>
				                              	<td><input class="input-disabled" size="15" id="nameUom[${value}]" value='${detail.stockAdjustmentItem.product.unitOfMeasure.measureId}' disabled/></td>
				                            </tr>
			                            </c:if>
			                            <c:set var="value" value="${value + 1}" />
		                            	</c:forEach>
	                            	</c:if>
	                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                            </tfoot>
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
	function validation()
	{
		var tblResult = document.getElementById("lineItemTable");
		if(tblResult)
		{
			var i = 1;
			var t_section = tblResult.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Detail Item first before saving the transaction!');
				return;
			}

			while(i != len) {
				var mesin = document.getElementById("serial["+i+"]");
				var rangka = document.getElementById("serial2["+i+"]");
				var tahun = document.getElementById("year["+i+"]");
				if(mesin != null && rangka!=null && tahun != null) {
					if(mesin.value == '') {
						alert('Mesin cannot be empty !!!');
						return;
					}

					if(rangka.value == '') {
						alert('Rangka cannot be empty !!!');
						return;
					}

					if(tahun.value == '') {
						alert('Tahun cannot be empty !!!');
						return;
					} else if(tahun.value.length != 4){
						alert('Tahun must be 4 character !!!');
						return;
					}
				}
				i++;
			}
		}

		return true;
	}

	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Stock Adjustment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			if(validation()) {
				$target = $(e.target);

				$.ajax({
					url:"<c:url value='/page/accessoriesstockadjustmentadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Stock Adjustment data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/accessoriesstockadjustmentview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
</script>