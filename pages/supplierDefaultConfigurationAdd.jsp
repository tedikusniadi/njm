<%@ include file="/common/tld-common.jsp"%>



<div class="toolbar">
	<a class="item-button-back" href="javascript:displayContent('page/configurationassistanceprocurementsupplierview.htm');"><span>Back</span></a>
	<a class="item-button-save" href="javascript:document.addForm.submit();"><span>Save</span></a>
</div>

<div class="main-box" style="height:370px">
	<form:form id="addForm" name="addForm" action="page/configurationassistanceprocurementadd.htm" method="post" modelAttribute="supplierConfiguration">
		<table style="border:none">
        <tr>
			<td><div align="right">Type :</div></td>
			<td>
				<form:select path="type" cssClass="combobox">
                	<form:option value='PURCHASE_ORDER' label='PURCHASE ORDER'/>
                    <form:option value='DIRECT_PURCHASE_ORDER' label='DIRECT PURCHASE ORDER'/>
                    <form:option value='EXT1_PURCHASE_ORDER' label='PERTAMINA PURCHASE ORDER'/>
				</form:select>
			</td>
		</tr>
		<tr>
			<td><div align="right">Organization :</div></td>
			<td>
				<form:select id="org" path="organization" cssClass="combobox-ext">
				</form:select>
				&nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			</td>
		</tr>
		<tr>
			<td><div align="right">Supplier :</div></td>
			<td>
				<form:select id="supplier" path="supplier" cssClass="combobox-ext">
                    <c:if test='${not empty supplierConfiguration.supplier}'>
                        <form:option value='${supplierConfiguration.supplier.id}' label='${supplierConfiguration.supplier.firstName} ${supplierConfiguration.supplier.lastName} ${supplierConfiguration.supplier.middleName}' />
                    </c:if>
                </form:select>
                &nbsp;
				<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opensupplier();" style="CURSOR:pointer;" title="Supplier" />
			</td>
		</tr>
		</table>
	</form:form>
</div>