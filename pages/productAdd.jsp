<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product >> Add</title>
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
			<td width="60%">Inventory > Product Management > Product > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I03 - Product</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productview.htm?categoryId=${category}'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="product_add" enctype="multipart/form-data">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
 									<td width="24%" align="right">Product Code :</td>
							  	  	<td width="40%">
                                  		<%-- <c:if test='${auto}'>
                                        	<input name='code' class='input-disabled' value="Auto Generated" disabled/>
                                        </c:if>
                                        <c:if test='${not auto}'>
                                        	<input name='code' size="35"/>
                                        </c:if> --%>
                                        <c:if test="${category == 2}">
											<form:input id='code' path="code" size="25"/>
                                        </c:if>
                                        <c:if test='${category != 2}'>
                                        	<input id="code" name='code' class='input-disabled' value="Auto Generated" disabled/>
                                        </c:if>
                                  	</td>
							  	  <td width="36%"><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Product Name :</td>
									<td><form:input id='name' path="name" cssClass="inputbox" /></td>
									<td><form:errors path="name"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Product Type :</td>
									<td>
                                    	<form:select path='type'>
                                            <form:option value='GOODS' label='GOODS' />
                                            <form:option value='SERVICE' label='SERVICE' />
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Product Category :</td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext">
                                            <c:if test='${not empty product_add.productCategory}'>
                                                <form:option value='${product_add.productCategory.id}' label='${product_add.productCategory.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=cat'/>');" style="CURSOR:pointer;" title="Product Category" />
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Min Stock :</td>
									<td><form:input path="minStock" cssClass="inputbox" /></td>
									<td><form:errors path="minStock"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Max Stock :</td>
									<td><form:input path="maxStock" cssClass="inputbox" /></td>
									<td><form:errors path="maxStock"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Unit of Measure :</td>
									<td>
                                    	<form:select id="unitOfMeasure" path="unitOfMeasure" cssClass="combobox">
                                    	<%-- <form:options items='${uoms}' var="uom" itemValue='id' itemLabel='measureId'/> --%>
                                    	<c:forEach items="${uoms}" var="uom">
                                    		<c:if test="${category == '1'}">
                                    			<c:if test="${uom.id == '16'}">
                                    				<form:option value="${uom.id}" label='${uom.measureId}' selected="true"/>
                                    			</c:if>
                                    			<c:if test="${uom.id != '16'}">
                                    				<form:option value="${uom.id}" label='${uom.measureId}'/>
                                    			</c:if>
                                    		</c:if>
                                    		<c:if test="${category == '2'}">
                                    			<form:option value="${uom.id}" label='${uom.measureId}'/>
                                    		</c:if>
                                    		<c:if test="${category == '3'}">
                                    			<c:if test="${uom.id == '17'}">
                                    				<form:option value="${uom.id}" label='${uom.measureId}' selected="true"/>
                                    			</c:if>
                                    			<c:if test="${uom.id != '17'}">
                                    				<form:option value="${uom.id}" label='${uom.measureId}'/>
                                    			</c:if>
                                    		</c:if>
                                    	</c:forEach>
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Product Feature :</td>
									<td>
                                    	<form:select id="feature" path="featureApplicability.productFeature" cssClass="combobox">
                                            <c:if test='${not empty product_add.featureApplicability.productFeature}'>
                                                <form:option value='${product_add.featureApplicability.productFeature.id}' label='${product_add.featureApplicability.productFeature.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductfeatureview.htm?target=feature'/>');" style="CURSOR:pointer;" title="Product Feature" />
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
	 							  <tr>
 									<td align="right">Serial :</td>
									<td>
										<form:radiobutton path="serial" value="true" label="Yes"/>
										<form:radiobutton path="serial" value="false" label="No"/>
                                    </td>
									<td><form:errors path="enabled"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Status :</td>
									<td>
										<form:radiobutton path="enabled" value="true" label="Active"/>
										<form:radiobutton path="enabled" value="false" label="Inactive"/>
                                    </td>
									<td><form:errors path="enabled"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Picture :</td>
									<td><input id="picture" type="file" name="picture"/></td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Note :</td>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$('#code').focus();

		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(){
			if(!$('#code').val())
			{
				alert('Code cannot be empty!');
				return;
			}
			
			if(!$('#name').val())
			{
				alert('Name cannot be empty!');
				return;
			}

			if(!$('#cat').val())
			{
				alert('Product Category cannot be empty!');
				return;
			}

			if(!$('#feature').val())
			{
				alert('Product Feature cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/productadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Product data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productpreedit.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
						}
					}
				},
				error : function(xhr) {
					console.log(xhr.responseText);
				},
			});
		});
	});
</script>