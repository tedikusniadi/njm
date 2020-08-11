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
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function validation()
		{
			var count = document.getElementById('count').value;
			var cat = "${opname.productCategory.id}";
			
			for(var idx=0;idx<count;idx++) {
				
				var serial = document.getElementById('serial['+idx+']').value;
				var serial2 = document.getElementById('serialExt1['+idx+']').value;
				var year = document.getElementById('year['+idx+']').value;
				var opnamed = document.getElementById('opnamed['+idx+']').value;
				
				if(serial == '') {
					alert('No Mesin cannot be empty !!!');
					return;
				}
				
				if(cat == '1')
				{
					if(serial2 == '') {
						alert('No Rangka cannot be empty !!!');
						return;
					}
				}
				
				if(year == '') {
					alert('Year cannot be empty !!!');
					return;
				}
				
				if(opnamed > 1 || opnamed < -1 || opnamed == 0) {
					alert('Please input a valid number for Opname, either 1 or -1 !!!');
					return;
				}
			}
			
			return true;
			/* document.addForm.action = "<c:url value='/page/stockopnameadd.htm'/>";
			document.addForm.submit(); */
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
		
		$(function()
		{
			var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'BBN',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
			$('.b_save').click(function(e)
			{
				if(validation())
				{
					$.ajax({
						url:"<c:url value='/page/stockopnameadd.htm'/>",
						data:$('#addForm').serialize(),
						type : 'POST',
						dataType : 'json',
						beforeSend:function()
						{
							$dialog.empty();
							$dialog.html('Saving Stock Opname data......');
							$dialog.dialog('open');
						},
						success : function(json)
						{
							if(json)
							{
								if(json.status == 'OK')
								{
									$dialog.dialog('close');
									window.location="<c:url value='/page/stockopnameview.htm?'/>";
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
	</script>
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
							<a class="item-button-back" href="<c:url value='/page/stockopnamepreadd2.htm'/>"><span><spring:message code="back"/></span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="opname_detail">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right"><spring:message code="id"/></td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="date"/></td>
									<td><input class="input-disbaled" disabled size="10" value="<fmt:formatDate value='${opname_detail.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="company"/></td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_detail.organization}'>
                                               	<form:option value='${opname_detail.organization.id}' label='${opname_detail.organization.firstName} ${opname_detail.organization.middleName} ${opname_detail.organization.lastName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><spring:message code="facility"/></td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_detail.facility}'>
                                               	<form:option value='${opname_detail.facility.id}' label='${opname_detail.facility.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
 									<td align="right"><spring:message code="productcategory.htmltitle"/></td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty opname_detail.productCategory}'>
                                                <form:option value='${opname_detail.productCategory.id}' label='${opname_detail.productCategory.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="reason"/></td>
									<td><form:textarea path="reason" cols="55" value="${opname_detail.reason}" rows="7" disabled="true"/></td>
								</tr>
							</table>
                            <br/>
                            <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" align="center" class="table-list">
                            <thead>
                            <tr>
                                <th width="12%">Container</th>
                                <th width="20%">Barang</th>
                                <th width="12%">No Mesin</th>
                                <th width="12%">No Rangka</th>
                                <th width="8%">Tahun</th>
                                <th width="8%">Tersedia</th>
                              	<th width="8%">Opname</th>
                                <th width="5%"><spring:message code="uom"/></th>
                                <th width="5%">Selisih</th>
                                <th width="5%%">Harga</th>
                                <th width="10%"><spring:message code="note"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="value" value="0" />
                            <c:forEach items='${opname_detail.items}' var='item' varStatus='status'>
                            <tr>
                                <td><c:out value='${item.inventoryItem.grid.name}'/></td>
                                <td colspan="4"><c:out value='${item.inventoryItem.product.name}'/></td>
                                <td><input type="text" class="input-disabled" size='10' value="<fmt:formatNumber value='${item.onHand}' pattern=',##0'/>" disabled/></td>
                                <td><input type="text" class="input-disabled" size='10' value="<fmt:formatNumber value='${item.opnamed}' pattern=',##0'/>" disabled/></td>
                                <td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
                                <td><input type="text" class="input-disabled" size="5" value="<fmt:formatNumber value='${item.opnamed-item.onHand}' pattern=',##0'/>"/></td>
                                <td><input type="text" class="input-disabled" size="15" name="items[${status.index}].amount" value='<fmt:formatNumber value='${item.amount}' pattern=',##0'/>' disabled/></td>
                                <td><input type="text" size="15" name="items[${status.index}].note" value='${item.note}'/></td>
	                            <c:forEach items='${item.details}' var='detail' varStatus='statusDetail'>
	                            <tr>
	                            	<td colspan="2"></td>
	                                <c:if test="${item.opnamed > item.onHand}">
	                                	<c:if test="${detail.serial != ''}">
		                                	<td><input type="text" class="input-disabled" size='20' id='serial[${value}]' name="items[${status.index}].details[${statusDetail.index}].serial" value="${detail.serial}" disabled/>&nbsp;</td>
		                            		<td><input type="text" class="input-disabled" size='20' id='serialExt1[${value}]' name="items[${status.index}].details[${statusDetail.index}].serialExt1" value="${detail.serialExt1}" disabled/>&nbsp;</td>
		                                	<td><input type="text" class="input-disabled" size='8' id='year[${value}]' name="items[${status.index}].details[${statusDetail.index}].year" value="${detail.year}" disabled/>&nbsp;</td>
	                                		<td><input type="text" class="input-disabled" size='10' id='onHand[${value}]' name="items[${status.index}].details[${statusDetail.index}].quantity" value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0'/>" disabled/>&nbsp;</td>
		                                	<td><input type="text" class="input-disabled" size='10' id='opnamed[${value}]' name="items[${status.index}].details[${statusDetail.index}].opnamed" value="<fmt:formatNumber value='${detail.opnamed}' pattern=',##0'/>" disabled/>&nbsp;</td>
	                                	</c:if>
	                                	<c:if test="${detail.serial == ''}">
		                                	<td><input type="text" size='20' id='serial[${value}]' name="items[${status.index}].details[${statusDetail.index}].serial" value="${detail.serial}"/>&nbsp;</td>
		                            		<td><input type="text" size='20' id='serialExt1[${value}]' name="items[${status.index}].details[${statusDetail.index}].serialExt1" value="${detail.serialExt1}"/>&nbsp;</td>
		                                	<td><input type="text" size='8' id='year[${value}]' name="items[${status.index}].details[${statusDetail.index}].year" value="${detail.year}"/>&nbsp;</td>
	                                		<td><input type="text" class="input-disabled" size='10' id='onHand[${value}]' name="items[${status.index}].details[${statusDetail.index}].quantity" value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0'/>" disabled/>&nbsp;</td>
		                                	<td><input type="text" class="input-disabled" size='10' id='opnamed[${value}]' name="items[${status.index}].details[${statusDetail.index}].opnamed" value="<fmt:formatNumber value='${detail.opnamed}' pattern=',##0'/>" disabled/>&nbsp;</td>
	                                	</c:if>
	                                </c:if>
	                                <c:if test="${item.opnamed<item.onHand}">
	                                	<td><input type="text" class="input-disabled" size='20' id='serial[${value}]' name="items[${status.index}].details[${statusDetail.index}].serial" value="${detail.serial}" disabled/>&nbsp;</td>
	                            		<td><input type="text" class="input-disabled" size='20' id='serialExt1[${value}]' name="items[${status.index}].details[${statusDetail.index}].serialExt1" value="${detail.serialExt1}" disabled/>&nbsp;</td>
	                                	<td><input type="text" class="input-disabled" size='8' id='year[${value}]' name="items[${status.index}].details[${statusDetail.index}].year" value="${detail.year}" disabled/>&nbsp;</td>
	                                	<td><input type="text" class="input-disabled" size='10' id='onHand[${value}]' name="items[${status.index}].details[${statusDetail.index}].quantity" value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0'/>" disabled/>&nbsp;</td>
	                                	<td><input type="text" size='10' id='opnamed[${value}]' name="items[${status.index}].details[${statusDetail.index}].opnamed" value="<fmt:formatNumber value='${detail.opnamed}' pattern=',##0'/>"/>&nbsp;</td>
	                                </c:if>
	                                <c:if test="${item.opnamed==item.onHand}">
	                                	<td><input type="text" class="input-disabled" size='20' id='serial[${value}]' name="items[${status.index}].details[${statusDetail.index}].serial" value="${detail.serial}" disabled/>&nbsp;</td>
	                            		<td><input type="text" class="input-disabled" size='20' id='serialExt1[${value}]' name="items[${status.index}].details[${statusDetail.index}].serialExt1" value="${detail.serialExt1}" disabled/>&nbsp;</td>
	                                	<td><input type="text" class="input-disabled" size='8' id='year[${value}]' name="items[${status.index}].details[${statusDetail.index}].year" value="${detail.year}" disabled/>&nbsp;</td>
	                                	<td><input type="text" class="input-disabled" size='10' id='onHand[${value}]' name="items[${status.index}].details[${statusDetail.index}].quantity" value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0'/>" disabled/>&nbsp;</td>
	                                	<td><input type="text" class="input-disabled" size='10' id='opnamed[${value}]' name="items[${status.index}].details[${statusDetail.index}].opnamed" value="<fmt:formatNumber value='${detail.opnamed}' pattern=',##0'/>" disabled/>&nbsp;</td>
	                                </c:if>
	                              	<td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
	                              	<c:if test="${detail.opnamed >= 1}">
                        				<td><input type="text" class="input-disabled" size="5" value="<fmt:formatNumber value='${detail.quantity-detail.opnamed}' pattern=',##0'/>" disabled/></td>
	                              	</c:if>
	                              	<c:if test="${detail.opnamed < 1}">
                          				<td><input type="text" class="input-disabled" size="5" value="<fmt:formatNumber value='${detail.quantity+detail.opnamed}' pattern=',##0'/>" disabled/></td>
	                              	</c:if>
	                              	<td><input type="text" size="15" id='note[${statusDetail.index}]' name="items[${status.index}].details[${statusDetail.index}].note" value="${detail.note}"/></td>
	                              	<td></td>
	                              	<td></td>
	                            </tr>
	                            <c:set var="value" value="${value + 1}" />
	                            </c:forEach>
	                            <tr><td colspan="10">&nbsp;</td></tr>
                            </tr>
                            </c:forEach>
                           	<input type="hidden" name="count" id="count" value="${value}" />
                           	<c:remove var="value" />
                            </tbody>
                            <tfoot><tr class="end-table"><td colspan="11">&nbsp;</td></tr></tfoot>
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