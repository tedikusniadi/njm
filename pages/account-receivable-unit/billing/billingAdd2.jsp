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
							<a class="item-button-back" href="javascript:history.back();"><span><spring:message code='back'/></span></a>
                            <c:if test='${access.add}'>
								<a id="save" class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adapter">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">No.Tagihan :</td>
                                       	  <td width="71%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <select id="org" cssClass="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${adapter.unitBillingGroup.organization.id}'>${adapter.unitBillingGroup.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td nowrap="nowrap" align="right">Tipe Kwitansi :</td>
                                            <td>
                                            	<select disabled class="combobox-ext input-disabled">
                                            		<option>${adapter.unitBillingGroup.billingType.name}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatDate value='${adapter.unitBillingGroup.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Termin Kredit:</td>
                                            <td><input size="7" value="0" name="dayTerm"/> Hari</td>
                                        </tr>
                                        <%-- <tr>
                                            <td nowrap="nowrap" align="right">No.Faktur Pajak :</td>
                                            <td>
                                            	<input value="${adapter.billing.taxNumber.code}" class="input-disabled inputbox-medium" disabled/>
                                           	</td>
                                        </tr> --%>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="unitBillingGroup.note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                    <td width="25%" colspan="2" align="left" valign="top">
                                		<fieldset>
                                            <legend><strong>Jumlah Transaksi</strong></legend>
                                            <table width="" style="border:none"  align="right">
                                             <tr>
                                                <td align="right"><strong>Total :</strong></td>
                                                <td><input id="totalAmount" value="<fmt:formatNumber value='${adapter.totalAmount}' pattern='#,###.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;" selectedTab='address'>
                                <div id="address" dojoType="ContentPane" label="Detail Penagihan" class="tab-pages" refreshOnShow="true">
                                    <table width="100%" align="right">
                                     <tr>
                                    	<td width="11%" align="right">Pelanggan </td>
                                      	<td width="40%">
                                        	<input type="text" name="customer" value="${adapter.unitBillingGroup.customer.name}" class="input-disabled"/>
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td width="11%" align="right">Alamat Penagihan : </td>
                                      	<td width="40%">
                                        	<select id='billAddress' name='customerBillingAddress' cssClass='combobox-ext'>
                                            	<c:forEach items='${adapter.unitBillingGroup.customer.postalAddresses}' var='address'>
                                            		<c:set var="customerAddress" value="${address}"/>
                                                	<option value='${address.id}'>${address.address}</option>
                                            	</c:forEach>
                                            </select>
                                            &nbsp;
                                       	 	<img src="assets/icons/list_extensions.gif" onclick="openPostal('billAddress');" style="CURSOR:pointer;" title="Address" />
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td align="right">Kota/Kabupaten : </td>
                                        <td>
                                        	<input name="city" value="${customerAddress.city.name}" disabled class="input-disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="9%" align="right">Kecamatan : </td>
                                  		<td width="40%">
						  					<input name="city" value="${customerAddress.subdistrict.name}" disabled class="input-disabled"/>
                                      </td>
                                    </tr>
                                      <tr>
                                    	<td width="9%" align="right">Kelurahan : </td>
                                  		<td width="40%">
						  					<input name="city" value="${customerAddress.village}" disabled class="input-disabled"/>
                                      </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Kode Pos : </td>
                                        <td>
                                            <input name="city" value="${customerAddress.postalCode}" disabled class="input-disabled"/>
                                        </td>
                                    </tr>
                                    </table>
                                </div>
                                <div id="line" dojoType="ContentPane" label="Barang" class="tab-pages" refreshOnShow="true">
                                    <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                                        <th width="80%">Name</th>
                                      	<th width="20%" align="right">Total Tagihan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${adapter.billingAdapters}" var="billingAdapter" varStatus="status">
	                                    <c:forEach items="${billingAdapter.salesOrders}" var="line" varStatus='statusOrder'>
	                                    <tr>
	                                        <td><c:out value='${line.unitSalesOrder.code}'/></td>
	                                        <c:if test="${billingAdapter.billing.billingType.id==6}">
	                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='${line.leasing}' pattern=',##0.00'/>" disabled/></td>
	                                        </c:if>
	                                        <c:if test="${billingAdapter.billing.billingType.id==7 or billingAdapter.billing.billingType.id==10}">
	                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='${line.totalAfterPrepayment}' pattern=',##0.00'/>" disabled/></td>
	                                        </c:if>
	                                        <c:if test="${billingAdapter.billing.billingType.id==8}">
	                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='${line.subdictionLeasing}' pattern=',##0.00'/>" disabled/></td>
	                                        </c:if>
	                                        <c:if test="${billingAdapter.billing.billingType.id==9}">
	                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='${line.mainDealer}' pattern=',##0.00'/>" disabled/></td>
	                                        </c:if>
	                                        <c:if test="${billingAdapter.billing.billingType.id==11}">
	                                        	<td><input id="progressiveTax${statusOrder.index}" name="billingAdapters[${status.index}].salesOrders[${statusOrder.index}].unitSalesOrder.paidProgressiveTax" style="text-align:right;" size="25" value="0" onchange="calculateAmount(${statusOrder.index})"/></td>
	                                        </c:if>
	                                    </tr>
	                                    </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot><tr class="end-table"><td colspan="2">&nbsp;</td></tr></tfoot>
                                    </table>
                                </div>
                            </div>
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
		$('#save').click(function(){
			if(validation())
			{
				$('#save').hide();
				$.ajax({
					url:"<c:url value='/page/unitbillingadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Billing data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitbillingview.htm'/>";
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
	
	function validation()
	{
		if(new Number($('#totalAmount').val().replace(/,/g,'')) <= 0) {
			alert('Total tagihan tidak valid !!!');
			return;
		}
		
		return true;
	}
	
	function calculateAmount(index)
	{
		$('#totalAmount').val($('#progressiveTax'+index).val());
	}
</script>