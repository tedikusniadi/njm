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
							<a class="item-button-list" href="<c:url value='/page/unitdeliveryorderview.htm'/>"><span><spring:message code='list'/></span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span><spring:message code='save'/></span></a>
                            	<c:if test='${empty order_edit.deliveryOrderRealization}'>
                                	<a class="item-button-process" href="javascript:realization();"><span>Realization</span></a>
                                </c:if>
                                <c:if test='${!order_edit.realizationStatus}'>
                                	<a class="item-button-process" href="<c:url value='/page/unitdeliveryorderrealizationpreedit.htm?id=${order_edit.deliveryOrderRealization.id}'/>"><span>Realization</span></a>
                                </c:if>
								<a class="item-button-print" href="<c:url value='/page/unitdeliveryorderprint.htm?id=${order_edit.id}'/>"><span>Print</span></a>
								<%-- <a class="item-button-print" href="<c:url value='/page/unitdeliveryorderlabelprint.htm?id=${order_edit.id}'/>"><span>Print Label</span></a> --%>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
								<table style="border:none" width="100%">
                                <tr>
                                	<td width="60%" valign="top">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="30%" nowrap="nowrap" align="right">No. SJ :</td>
                                          <td width="70%"><input value="${order_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.organization}'>
                                                    <form:option value='${order_edit.organization.id}' label='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}' />
                                                </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled value="<fmt:formatDate value='${order_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" nowrap="nowrap" align="right">Customer :</td>
                                          <td width="70%"><input value="${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="30%" nowrap="nowrap" align="right">Reference :</td>
                                          <td width="70%"><a href="<c:url value='/page/deliveryplanningpreedit.htm?id=${order_edit.deliveryPlanningSequence.deliveryPlanning.id}'/>">
                                          <c:out value='${order_edit.deliveryPlanningSequence.deliveryPlanning.code}.${order_edit.deliveryPlanningSequence.no}'/></a></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                    <option><c:out value='${order_edit.deliveryPlanningSequence.facility.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note : </td>
                                            <td><form:textarea path='note' rows='6' cols='55'/></td>
                                        </tr>
                                      	</table>
                                  	</td>
                           	  		<td width="40%" valign="top">
               							<fieldset>
                                        	<legend>Reference</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<td align="right">Sales Order :</td>
                                                <td>
                                                	<c:if test="${unitSalesOrder.unitSalesType == 'UNIT'}">
                                                		<a href="<c:url value='/page/unitsalesorderpreedit.htm?id=${unitSalesOrder.id}'/>"><c:out value='${unitSalesOrder.code}'/></a>
                                                	</c:if>
                                                	<c:if test="${unitSalesOrder.unitSalesType == 'COMPANY'}">
                                                		<a href="<c:url value='/page/unitsalesordercrosscompanypreedit.htm?id=${unitSalesOrder.id}'/>"><c:out value='${unitSalesOrder.code}'/></a>
                                                	</c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Delivery Planning Sequence :</td>
                                                <td><a href="<c:url value='/page/deliveryplanningpreedit.htm?id=${order_edit.deliveryPlanningSequence.deliveryPlanning.id}'/>"><c:out value='${order_edit.deliveryPlanningSequence.deliveryPlanning.code}'/></a></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">DO Realization :</td>
                                                <td>
                                                	<c:if test="${order_edit.realizationStatus}">
                                                		<a href="<c:url value='/page/unitdeliveryorderrealizationpreedit.htm?id=${order_edit.deliveryOrderRealization.id}'/>"><c:out value='${order_edit.deliveryOrderRealization.code}'/></a>
                                                	</c:if>
                                                </td>
                                            </tr>
                               				<tr>
                               					<td align="right">Journal :</td>
	                               				<td>
	                                          		<a href="<c:url value='/page/journalentrypreview.htm?id=${order_edit.deliveryOrderRealization.journalEntry.id}'/>">
	                                          			<c:out value='${order_edit.deliveryOrderRealization.journalEntry.code}'/>
	                                          		</a>
	                                            </td>
                               				</tr>
                                            </table>
                                        </fieldset>
                                  	</td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Product" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Tipe</th>
                                            <th width="15%">Nama Tipe</th>
                                            <th width="15%">Warna</th>
                                            <th width="13%">No.Mesin</th>
                                            <th width="13%">No.Rangka</th>
                                            <th width="40%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_edit.items}" var="line" varStatus='status'>
	                                        <c:forEach items="${line.details}" var="detail">
	                                        <c:if test="${line.sequenced}">
	                                        <tr>
	                                        	<td></td>
	                                            <td><c:out value='${line.item.sequenceable.product.types}'/></td>
	                                            <td><c:out value='${line.item.sequenceable.product.typeNames}'/></td>
	                                            <td><c:out value='${line.item.sequenceable.product.colors}'/></td>
	                                            <td><c:out value='${detail.serial}'/></td>
	                                            <td><c:out value='${detail.serialExt1}'/></td>
	                                            <td><c:out value='${line.note}'/></td>
	                                        </tr>
	                                        </c:if>
	                                        </c:forEach>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                     <div id="accessories" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
                                    	<table id="accTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    		<thead>
                                    		<tr>
                                    			<th>Barang</th>
                                    			<th>Serial</th>
                                    			<th>Jumlah</th>
                                    			<th>Satuan</th>
                                    			<th>Catatan</th>
                                    		</tr>
                                    		</thead>
                                    		<tbody>
                                    			<c:forEach items="${order_edit.items}" var="item">
                                    			<c:if test="${not empty item.details}">
                                    				<c:forEach items="${item.details}" var="detail">
                                    				<c:if test="${not item.sequenced}">
                                    					<tr>
                                    						<td>${item.product.name}</td>
                                    						<td>${detail.serial}</td>
                                    						<td><fmt:formatNumber value="${item.quantity}"/></td>
                                    						<td>${item.uom.measureId}</td>
                                    						<td>${item.note}</td>
                                    					</tr>
                                    				</c:if>
                                    				</c:forEach>
                                    			</c:if>
                                    			<c:if test="${empty item.details}">
                                    				<c:if test="${not item.sequenced}">
                                    					<tr>
                                    						<td>${item.product.name}</td>
                                    						<td>&nbsp;</td>
                                    						<td><fmt:formatNumber value="${item.quantity}"/></td>
                                    						<td>${item.uom.measureId}</td>
                                    						<td>${item.note}</td>
                                    					</tr>
                                    				</c:if>
                                    			</c:if>
                                    			</c:forEach>
                                    		</tbody>
                                    		<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    	</table>
                                    </div>
                                    <div id="exp" dojoType="ContentPane" label="Pengiriman & Ekspedisi" class="tab-pages" refreshOnShow="true">
                                 		<table width="100%">
                                    	<tr>
                                    		<td valign="top">
                                    			<table style="border:none" width="100%">
			                                    	<tr>
			                                            <td width="20%" align="right">Alamat Kirim : </td>
			                                            <td width="80%">
			                                            	 <input value="${order_edit.deliveryPlanningSequence.postalAddress.address}" disabled class="inputbox-ext input-disabled"/>
			                                          	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Provinsi:</td>
			                                        	<td>
			                                        		<input value="${order_edit.deliveryPlanningSequence.postalAddress.province.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kota/Kabupaten:</td>
			                                        	<td>
			                                        		<input value="${order_edit.deliveryPlanningSequence.postalAddress.city.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kecamatan:</td>
			                                        	<td>
			                                        		<input value="${order_edit.deliveryPlanningSequence.postalAddress.subdistrict.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kodepos:</td>
			                                        	<td>
			                                        		<input value="${order_edit.deliveryPlanningSequence.postalAddress.postalCode}" disabled class="input-disabled"/>
			                                        	</td>
			                                        </tr>
		                                        </table>
                                    		</td>
                                    		<td valign="top">
                                    			<table>
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Vehicle :</td>
			                                            <td>
			                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext input-disabled" disabled="disabled">
			                                                    <c:if test='${not empty order_edit.vehicle}'>
			                                                        <form:option value='${order_edit.vehicle.id}' label='${order_edit.vehicle.name}' />
			                                                    </c:if>
			                                            	</form:select>
			                                                &nbsp;
			                                            </td>
			                                        </tr>
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Driver :</td>
			                                            <td>
			                                                <form:select id="driver" path="driver" cssClass="combobox-ext input-disabled" disabled="disabled">
			                                                    <c:if test='${not empty order_edit.driver}'>
			                                                        <form:option value='${order_edit.driver.id}' label='${order_edit.driver.name}' />
			                                                    </c:if>
			                                                </form:select>
			                                                &nbsp;
			                                            </td>
			                                        </tr>
                                    			</table>
                                    		</td>
                                    	</tr>
                                    </table>
                                    </div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName}'/> (<fmt:formatDate value='${order_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript">
	function save()
	{
		document.addForm.action = "<c:url value='/page/unitdeliveryorderedit.htm'/>";
		document.addForm.submit();
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}

	function showexpedition()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}

		openpopup('<c:url value='/page/popupexpeditionview.htm?target=expedition&organization='/>'+org.value);
	}

	function openvehicle()
	{
		var expedition = dojo.byId('expedition').value;
		if(!expedition || expedition == '')
		{
			alert('Please select Expedition first!');
			return;
		}

		openpopup("<c:url value='/page/popupvehicleview.htm?target=vehicle&organization='/>"+expedition);
	}

	function opendriver()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		openpopup('<c:url value='/page/popupdriverview.htm?target=driver&organization='/>'+org.value);
	}

	function realization()
	{
		<c:if test='${empty order_edit.vehicle or empty order_edit.driver or order_edit.rit < 1}'>
			alert('Delivery Order Realization cannot be created,Vehicle,Driver or Rit empty!');
			return;
		</c:if>

		window.location = "<c:url value='/page/unitdeliveryorderrealizationpreadd.htm?id=${order_edit.id}'/>";
	}
</script>