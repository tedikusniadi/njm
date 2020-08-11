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
		function save()
		{
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;

				for(var idx=0;idx<=len-1;idx++){
					var name = document.getElementById('productName['+idx+']');
					var onhand = document.getElementById('onhand['+idx+']');
					var opnamed = document.getElementById('opnamed['+idx+']');
					
					if(parseFloat(opnamed.value) < 0)
					{
						alert('Untuk product '+name.value+', jumlah opname_add tidak boleh minus (-) !!!');
						return;
						break;
					}
				}
			}
			
			document.addForm.action = "<c:url value='/page/stockopnamepreadd3.htm'/>";
			document.addForm.submit();
		}

		function descri(index)
		{
			var onhand = document.getElementById('onhand['+index+']');
			var opnamed = document.getElementById('opnamed['+index+']');
			var descri = document.getElementById('descri['+index+']');
			var note = document.getElementById('note['+index+']');

			if(opnamed.value == '')
			{
				alert('Re-Count cannot be empty!');
				return;
			}

			descri.value = (parseFloat(opnamed.value) - parseFloat(onhand.value)).numberFormat('#,#.00');
			
			if(descri.value < 0)
				note.value = "Missing";
			else if(descri.value > 0)
				note.value = "Found";
			else
				note.value = "";
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
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
							<a class="item-button-list" href="<c:url value='/page/stockopnameview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-next" href="javascript:save();"><span><spring:message code="next"/></span></a>
							<%-- <a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a> --%>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="opname_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right"><spring:message code="id"/> :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="date"/> :</td>
									<td><input class="input-disbaled" disabled size="10" value="<fmt:formatDate value='${opname_add.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="company"/> :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_add.organization}'>
                                               	<form:option value='${opname_add.organization.id}' label='${opname_add.organization.firstName} ${opname_add.organization.lastName} ${opname_add.organization.middleName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><spring:message code="facility"/> :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty opname_add.facility}'>
                                               	<form:option value='${opname_add.facility.id}' label='${opname_add.facility.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
 									<td align="right"><spring:message code="productcategory.htmltitle"/> :</td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty opname_add.productCategory}'>
                                                <form:option value='${opname_add.productCategory.id}' label='${opname_add.productCategory.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="reason"/> :</td>
									<td><form:textarea path="reason" cols="55" rows="7"/></td>
								</tr>
							</table>
                            <br/>
                            <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                            <thead>
                            <tr>
                                <th width="14%">Container</th>
                                <th width="25%">Barang</th>
                                <th width="7%">Tersedia</th>
                              	<th width="10%">Jumlah Opname</th>
                                <th width="5%"><spring:message code="uom"/></th>
                                <th width="5%">Selisih</th>
                                <!-- <th width="5%">Amount</th> -->
                                <th width="21%"><spring:message code="note"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${opname_add.items}' var='item' varStatus='status'>
                            <tr>
                                <td><c:out value='${item.inventoryItem.grid.name}'/></td>
                                <td>
                                	<c:out value='${item.inventoryItem.product.name}'/>
                                	<input type="hidden" id="productName[${status.index}]" value='${item.inventoryItem.product.name}'/>
                                </td>
                                <td>
                                	<fmt:formatNumber value='${item.onHand}' pattern=',##0.00'/>
                                	<input type="hidden" id="onhand[${status.index}]" value="${item.onHand}"/>
                                </td>
                                <td><form:input id='opnamed[${status.index}]' path='items[${status.index}].opnamed' size='8' onchange='descri(${status.index})' onblur='descri(${status.index})'/></td>
                                <td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
                                <td><input id="descri[${status.index}]" value="0" size="8" class="input-disabled" disabled/></td>
                                <%-- <td><form:input id='amt[${status.index}]' path='items[${status.index}].amount' size='8' class="input-disabled" disabled="true"/></td> --%>
                              	<td><form:input id="note[${status.index}]" path='items[${status.index}].note' size='25'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot><tr class="end-table"><td colspan="8">&nbsp;</td></tr></tfoot>
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