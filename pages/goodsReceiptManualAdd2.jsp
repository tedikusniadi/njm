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
							<a class="item-button-back" href="javascript:history.back();"><span>Back</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="<spring:message code='auto'/>" class='input-disabled' size='25'/></td>
                                        </tr>
                                         <tr>
											<td nowrap="nowrap" align="right">Organization :</td>
											<td>
												<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option><c:out value='${goodsReceipt.organization.name}'/></option>
                                                </select>
											</td>
										</tr>
										<tr>
											<td nowrap="nowrap" align="right">Facility :</td>
											<td>
												<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option><c:out value='${goodsReceipt.facility.name}'/></option>
                                                </select>
											</td>
										</tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${goodsReceipt.date}' pattern="dd-MM-yyyy"/>" class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7" disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                    	</table>
                                  	</td>
                                </tr>
                                </table>

                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="20%">Product</th>
	  	  	  	  	  	  			<th width="12%">Tipe</th>
	  	  	  	  	  	  			<th width="15%">Merk</th>
                                    <th width="12%">Warna</th>
	  	  	  	  	  	  			<th width="12%">Grid</th>
                                  	<th width="10%">Jumlah</th>
                                    <th width="15%">Satuan/No.Serial</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsReceipt.items}' var='item' varStatus='status'>
                                <c:set var="enabled" value=""/>
                                <c:set var="att" value=""/>
                                <c:if test="${!item.product.serial}">
                                	<c:set var="enabled" value="disabled='true'"/>
                                	<c:set var="att" value="input-disabled"/>
                                </c:if>
                                <tr>
                                	<td><input class="input-disabled" size="35" value="${item.product.name}" disabled/></td>
                                	<td><input class="input-disabled" size="15" value="${item.product.types}" disabled/></td>
                                	<td><input class="input-disabled" size="18" value="${item.product.brand}" disabled/></td>
                                	<td><input class="input-disabled" size="15" value="${item.product.colors}" disabled/></td>
                                	<td><input class="input-disabled" size="12" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/>"/></td>
                                    <td><input class="input-disabled" size="7" value="${item.product.unitOfMeasure.measureId}" disabled/></td>
                                </tr>
	                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
	                                	<tr>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
		                                    <td><input class="${att}" ${enabled} size="18" name="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serialExt1}" id="serial[${status.index}-${detailstatus.index}]"/>
		                                </tr>
	                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
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
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptmanualadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Goods Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptmanualview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>