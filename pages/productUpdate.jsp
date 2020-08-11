<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product >> Edit</title>
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
			<td width="60%">Inventory > Item Management > Product > Add</td>
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
                        	<a class="item-button-list" href="<c:url value='/page/productview.htm?categoryId=${categoryId}'/>"><span>List</span></a>
                        	<c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
								<a class="item-button-copy" onclick="copyProduct('${product_edit.id}');"><span>Copy</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="product_edit" enctype="multipart/form-data">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
 								<tr>
 									<td width="24%" align="right">Product Code :</td>
							  	  	<td width="56%"><form:input path='code' disabled='true' cssClass='input-disabled'/></td>
						  	  	  	<td width="20%"><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Product Name :</td>
									<td><form:input path="name" disabled='true' cssClass='input-disabled' size='45' /></td>
									<td><form:errors path="name"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Product Type :</td>
									<td>
                                    	<form:select path='type' disabled='true'>
                                            <form:option value='GOODS' label='GOODS' />
                                            <form:option value='SERVICE' label='SERVICE' />
                                        </form:select>
                                    </td>
									<td><form:errors path="type"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Product Category :</td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty product_edit.productCategory}'>
                                                <form:option value='${product_edit.productCategory.id}' label='${product_edit.productCategory.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
	 							<c:if test="${categoryId == 2}">
	 							<tr>
 									<td align="right">Sparepart Category Type :</td>
									<td>
                                    	<form:select path='categoryType'>
                                            <form:option value='UNIT' label='' />
                                            <form:option value='AGP' label='AGP' />
                                            <form:option value='HGP' label='HGP' />
                                            <form:option value='NON_HGP' label='NON HGP' />
                                            <form:option value='OLI' label='OLI' />
                                        </form:select>
                                    </td>
									<td><form:errors path="categoryType"/></td>
	 							</tr>
	 							</c:if>
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
                                    	<form:select id="unitOfMeasure" path="unitOfMeasure" cssClass="combobox-ext" disabled='true'>
                                        	<form:option value='${product_edit.unitOfMeasure.id}' label='${product_edit.unitOfMeasure.measureId}'/>
                                        </form:select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <!--
                                <tr>
 									<td align="right">COGS :</td>
									<td colspan="2"><img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupproductinoutaveragepriceview.htm?product=${product_edit.id}'/>');" style="CURSOR:pointer;" title="Product" /></td>
	 							</tr>
                                -->
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
									<td>
                                    	<input name="file" type="file"/>
                                    	<c:if test='${product_edit.picture != null}'>
                                        &nbsp;&nbsp;&nbsp;<a href="javascript:openpopup('<c:url value='/page/productshowimage.htm?id=${product_edit.id}'/>');">Show</a>
                                        </c:if>
                                    </td>
									<td><form:errors path="enabled"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Note :</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
 								</tr>
 								</table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
									<div id="feature" dojoType="ContentPane" label="Product Feature" class="tab-pages" refreshOnShow="true">
										<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
                                        <tr>
						  	  	  	  	  	<th width="25%">Feature</th>
								  	  	  	<th width="30%">Content</th>
                                          	<!--th width="45%">UoM</th-->
										</tr>
                                        <c:forEach items='${product_edit.featureApplicability.details}' var='detail' varStatus='status'>
                                        <tr>
										  	<td><c:out value='${detail.feature.type.name}'/></td>
                                            <td><form:input path='featureApplicability.details[${status.index}].content' size='50'/></td>
                                            <!--td>
                                            	<form:select path="featureApplicability.details[${status.index}].unitOfMeasure" cssClass="combobox">
                                                	<option value='0' selected></option>
                                                    <form:options items='${uoms}' itemValue='id' itemLabel='measureId'/>
                                                </form:select>
                                            </td-->
										</tr>
                                        </c:forEach>
                                        <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="cost" dojoType="ContentPane" label="Product Cost" class="tab-pages" refreshOnShow="true">
										<c:if test='${access.add}'>
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productcostpreadd.htm?id=${product_edit.id}'/>"><span>New Cost</span></a>
                                                <div class="item-navigator">&nbsp;</div>
                                            </div>
                                        </c:if>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
						  	  	  	  	  	<th width="6%" height="19"><div style="width:10px"></div></th>
											<th width="11%">From Date</th>
								  	  	  	<th width="13%">To Date</th>
                                          	<th width="24%">Geographic</th>
								  	  	  	<th width="22%">Type</th>
                                       	  	<th width="10%">Cost</th>
                                          	<th width="7%">Curr</th>
                                          	<th width="7%">Exc</th>
										</tr>
										<c:forEach items="${product_edit.costs}" var="cost">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/productcostpreedit.htm?id=${cost.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                                <c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productcostdelete.htm?id=${cost.id}'/>');" title="Del"><span>Del</span></a>
                                                </c:if>
											</td>
											<td><fmt:formatDate value="${cost.validFrom}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${cost.validTo}" pattern="dd-MM-yyyy"/></td>
											<td><c:out value='${cost.geographic.name}'/></td>
                                            <td><c:out value='${cost.costType.name}'/></td>
                                            <td><fmt:formatNumber value='${cost.money.amount}' pattern=',##0.00'/></td>
                                            <td><c:out value='${cost.money.currency.symbol}'/></td>
                                            <td><c:out value='${cost.money.exchangeType}'/></td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="association" dojoType="ContentPane" label="Product Association" class="tab-pages" refreshOnShow="true">
										<c:if test='${access.add}'>
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productassociationpreadd.htm?id=${product_edit.id}'/>"><span>New Association</span></a>
                                                <div class="item-navigator">&nbsp;</div>
                                            </div>
                                        </c:if>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
										  	<th width="6%"><div style="width:10px"></div></th>
										  	<th width="11%">From Date</th>
									  	  	<th width="13%">To Date</th>
                                          	<th width="41%">Name</th>
									  	  	<th width="12%">Quantity</th>
                                            <th width="17%">Type</th>
										</tr>
										<c:forEach items="${product_edit.associations}" var="ass">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/productassociationpreedit.htm?id=${ass.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                                <c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productassociationdelete.htm?id=${ass.id}'/>');" title="Del"><span>Del</span></a>
                                                </c:if>
											</td>
											<td><fmt:formatDate value="${ass.from}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${ass.to}" pattern="dd-MM-yyyy"/></td>
											<td><c:out value='${ass.product.code} - ${ass.product.name}'/></td>
                                            <td><fmt:formatNumber value='${ass.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${ass.associationType.name}'/></td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="salePrices" dojoType="ContentPane" label="Standard Sales Price" class="tab-pages" refreshOnShow="true">
										<%-- <c:if test='${access.add}'>
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productstandardpricepreadd.htm?id=${product_edit.id}&type=SELLING'/>"><span>New Price</span></a>
                                                <div class="item-navigator">&nbsp;</div>
                                            </div>
                                        </c:if> --%>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
									  	 	<th width="1%"><div style="width:10px"></div></th>
									  	  	<th width="12%">From Date</th>
								  	  	  	<th width="12%">To Date</th>
								  	  	  	<th width="12%">Price</th>
								  	  	  	<th width="15%">Unit Price Type</th>
                                          	<th width="40%">Curr</th>
                                        </tr>
                                        <c:set var="orgSales" value="0"/>
										<c:forEach items="${product_edit.salePrices}" var="price">
										<c:if test="${price.organization.id != orgSales}">
										<tr>
											<td>&nbsp;</td>
											<td colspan="5"><c:out value='${price.organization.name}'/></td>
				    						<c:set var="orgSales" value="${price.organization.id}"/>
										</tr>
										</c:if>
										<tr>
											<%-- <td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/productstandardpricepreedit.htm?id=${price.id}&type=SELLING'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
											</td> --%>
											<td>&nbsp;</td>
											<td><fmt:formatDate value="${price.dateFrom}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${price.dateTo}" pattern="dd-MM-yyyy"/></td>
                                            <td><fmt:formatNumber value='${price.money.amount}' pattern=',##0.00'/></td>
                                            <td>
                                            	<c:if test="${price.unitPriceType == 'ON_THE_ROAD'}">
                                            		<c:out value='ON THE ROAD'/>
                                            	</c:if>
                                            	<c:if test="${price.unitPriceType == 'OFF_THE_ROAD'}">
                                            		<c:out value='OFF THE ROAD'/>
                                            	</c:if>
                                            </td>
                                            <td><c:out value='${price.money.currency.symbol}'/></td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="buyPrices" dojoType="ContentPane" label="Standard Purchase Price" class="tab-pages" refreshOnShow="true">
										<%-- <c:if test='${access.add}'>
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productstandardpricepreadd.htm?id=${product_edit.id}&type=BUYING'/>"><span>New Price</span></a>
                                                <div class="item-navigator">&nbsp;</div>
                                            </div>
                                        </c:if> --%>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
									  	  	<th width="1%"><div style="width:10px"></div></th>
									  	  	<th width="18%">From Date</th>
								  	  	  	<th width="19%">To Date</th>
								  	  	  	<th width="18%">Price</th>
                                          	<th width="40%">Curr</th>
										</tr>
			    						<c:set var="orgBuying" value="0"/>
										<c:forEach items="${product_edit.buyPrices}" var="price">
										<c:if test="${price.organization.id != orgBuying}">
										<tr>
											<td>&nbsp;</td>
											<td colspan="4"><c:out value='${price.organization.name}'/></td>
				    						<c:set var="orgBuying" value="${price.organization.id}"/>
										</tr>
										</c:if>
										<tr>
											<%-- <td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/productstandardpricepreedit.htm?id=${price.id}&type=BUYING'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
											</td> --%>
											<td>&nbsp;</td>
											<td><fmt:formatDate value="${price.dateFrom}" pattern="dd-MM-yyyy"/></td>
											<td><fmt:formatDate value="${price.dateTo}" pattern="dd-MM-yyyy"/></td>
                                            <td><fmt:formatNumber value='${price.money.amount}' pattern=',##0.00'/></td>
                                            <td><c:out value='${price.money.currency.symbol}'/></td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
									<div id="subsidi" dojoType="ContentPane" label="Subsidi" class="tab-pages" refreshOnShow="true">
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
									  	 	<th width="1%"><div style="width:10px"></div></th>
									  	  	<th width="8%">From Date</th>
									  	  	<th width="8%">To Date</th>
									  	  	<th width="20%">Company</th>
									  	  	<th width="15%">Subdiction Type</th>
									  	  	<th width="10%">Leasing</th>
								  	  	  	<th width="12%">Budget</th>
									  	  	<th width="7%">Tipe</th>
									  	  	<th width="25%">Note</th>
                                        </tr>
										<c:forEach items="${product_edit.subdictions}" var="sub">
										<tr>
											<%-- <td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/unitsalesordersubdictionpreedit.htm?id=${subdiction.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
											</td> --%>
											<td>&nbsp;</td>
                                            <td><fmt:formatDate value='${sub.dateFrom}' pattern='dd-MM-yyyy'/></td>
											<td><fmt:formatDate value='${sub.dateTo}' pattern='dd-MM-yyyy'/></td>
                            				<td>${sub.organization.name}</td>
											<td>
												<c:if test="${sub.type == 'DISC_DEALER'}">
													<c:out value='DISCOUNT DEALER'/>
												</c:if>
												<c:if test="${sub.type == 'DISC_PROGRAM'}">
													<c:out value='DISCOUNT PROGRAM'/>
												</c:if>
												<c:if test="${sub.type == 'LEASING'}">
													<c:out value='LEASING'/>
												</c:if>
												<c:if test="${sub.type == 'MAIN_DEALER'}">
													<c:out value='MAIN DEALER'/>
												</c:if>
											</td>
                            				<td>${sub.leasing.firstName} ${sub.leasing.middleName} ${sub.leasing.lastName}</td>
				                            <td><fmt:formatNumber value='${sub.money.amount}' pattern='#,###.00'/></td>
				                            <td align="center">${sub.unitPayment}</td>
				                            <td>${sub.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
										</table>
									</div>
									<div id="noticeAndService" dojoType="ContentPane" label="Notice & Jasa" class="tab-pages" refreshOnShow="true">
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
									  	 	<th width="1%"><div style="width:10px"></div></th>
									  	  	<th width="8%">Date From</th>
									  	  	<th width="8%">Date To</th>
									  	  	<th width="25%">Company</th>
									  	  	<th width="15%">Tipe BBN</th>
									  	  	<th width="12%">Amount</th>
									  	  	<th width="39%">Currency</th>
                                        </tr>
										<c:forEach items="${product_edit.otherPrices}" var="price">
										<tr>
											<td>&nbsp;</td>
                                            <td><fmt:formatDate value='${price.dateFrom}' pattern='dd-MM-yyyy'/></td>
                                            <td><fmt:formatDate value='${price.dateTo}' pattern='dd-MM-yyyy'/></td>
                            				<td>${price.organization.name}</td>
											<td>
												<c:if test="${price.type == 'NOTICE'}">
													<c:out value='NOTICE'/>
												</c:if>
												<c:if test="${price.type == 'CITY'}">
													<c:out value='JASA KOTA'/>
												</c:if>
												<c:if test="${price.type == 'REGION'}">
													<c:out value='JASA KABUPATEN'/>
												</c:if>
												<c:if test="${price.type == 'NOTICEASTRA'}">
													<c:out value='BBN ASTRA'/>
												</c:if>
											</td>
				                            <td><fmt:formatNumber value='${price.money.amount}' pattern='#,###.00'/></td>
				                            <td align="center">${price.money.currency.symbol}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
										</table>
									</div>
									<c:if test="${categoryId == 2}">
                                    <div id="defaultGrid" dojoType="ContentPane" label="Default Grid" class="tab-pages" refreshOnShow="true">
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
						  	  	  	  	  	<th width="1%" height="19"><div style="width:45px"></div></th>
                                          	<th width="13%">Facility</th>
								  	  	  	<th width="96%">Grid</th>
										</tr>
										<c:forEach items="${product_edit.productDefaultGrids}" var="def">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/productdefaultgridpreedit.htm?id=${def.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                                <c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productdefaultgriddelete.htm?id=${def.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
											<td nowrap="nowrap"><c:out value='${def.grid.facility.name}'/></td>
                                            <td><c:out value='${def.grid.name}'/></td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
										</table>
									</div>
									</c:if>
								</div>
 							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${product_edit.createdBy.firstName} ${product_edit.createdBy.middleName} ${product_edit.createdBy.lastName}'/> (<fmt:formatDate value='${product_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${product_edit.updatedBy.firstName} ${product_edit.updatedBy.middleName} ${product_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${product_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
			if(!$('#name').val())
			{
				alert('Name cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/productedit.htm'/>",
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
							window.location="<c:url value='/page/productview.htm?categoryId='/>"+${product_edit.productCategory.id};
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
	
	function copyProduct(id)
	{
		document.addForm.action = "<c:url value='/page/productcopypreadd.htm?id='/>"+id;
		document.addForm.submit();
	}
</script>