<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/bbnview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
							<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/bbnprint.htm?id=${bbn_edit.id}'/>"><span>Print</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="bbn_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                       	  	<td width="73%"><input value="${bbn_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select id="org" disabled class="input-disabled combobox-ext">
                                                    <c:if test='${not empty bbn_edit.organization}'>
                                                        <option>${bbn_edit.organization.firstName} ${bbn_edit.organization.middleName} ${bbn_edit.organization.lastName}</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input value="<fmt:formatDate value='${bbn_edit.date}' pattern='MM/dd/yyyy'/>" size="10" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Pengurus BBN :</td>
		                                    <td>
		                                        <select id="bbnService" disabled class="input-disabled combobox-ext">
		                                        	<option>${bbn_edit.bbnService.name}</option>
		                                        </select>
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Provinsi :</td>
                                          	<td>
                                          		<input value="${bbn_edit.city.parent.name}" disabled class='input-disabled' size='25'/>
                                          	</td>
                                        </tr>
			 							<tr>
			 							  	<td align="right">Kota/Kabupaten :</td>
			 							  	<td>
			 							  		<input value="${bbn_edit.city.name}" disabled class='input-disabled' size='25'/>
			 							  	</td>
			 							</tr>
			 							<tr>
			 							  	<td align="right">Wilayah Samsat :</td>
			 							  	<td>
			 							  		<input value="${bbn_edit.region.name}" disabled class='input-disabled' size='25'/>
			 							  	</td>
			 							</tr>
		                                <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><textarea name="note" cols="55" rows="7">${bbn_edit.note}</textarea></td>
                                        </tr>
                                      	</table>
                                  	</td>
                              		<td width="44%" valign="top">
		  							  	<table width="100%" style="border:none">
		  							  	<tr>
	                                        <td valign="top">
		                                    	<fieldset>
		                                    		<legend><strong>Referensi</strong></legend>
		                                    			Journal Entry : <a href="<c:url value='/page/journalentrypreview.htm?id=${bbn_edit.journalEntry.id}'/>">${bbn_edit.journalEntry.code}</a>&nbsp;&nbsp;&nbsp;
		                                    	</fieldset>
		                                    </td>
		                                </tr>
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Rekap Transaksi</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="40%"align="right">Total Notice :</td>
                                                        <td width="60%"><input id="notice" value="<fmt:formatNumber value='${bbnAdapter.totalNotice}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Jasa :</td>
                                                        <td><input id="service" value="<fmt:formatNumber value='${bbnAdapter.totalService}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya Lain-lain 1 :</td>
                                                        <td><input id="others" value="<fmt:formatNumber value='${bbnAdapter.otherAmount}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya Lain-lain 2 :</td>
                                                        <td><input id="others" value="<fmt:formatNumber value='${bbnAdapter.otherAmountTwo}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Acc Tahun :</td>
                                                        <td><input id="others" value="<fmt:formatNumber value='${bbnAdapter.accAmount}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya STCK :</td>
                                                        <td><input id="others" value="<fmt:formatNumber value='${bbnAdapter.stckAmount}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Biaya :</td>
                                                        <td><input id="cost" value="<fmt:formatNumber value='${bbnAdapter.subTotal}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total :</td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${bbnAdapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                		</table>
                           	  		</td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                            <thead>
	                            <tr>
	                              	<th width="1%">&nbsp;</th>
	                                <th width="12%" nowrap="nowrap">No SPK</th>
	                                <th width="12%" nowrap="nowrap">Nama STNK</th>
	                                <th width="15%" nowrap="nowrap">Alamat</th>
	                                <th width="10%" nowrap="nowrap">Tipe</th>
	                                <th width="10%" nowrap="nowrap">Nama Tipe</th>
	                                <th width="7%" nowrap="nowrap">Notice</th>
	                                <th width="7%" nowrap="nowrap">Jasa</th>
	                                <th width="7%" nowrap="nowrap">Acc Thn</th>
	                                <th width="7%" nowrap="nowrap">Stck</th>
	                                <th width="12%" nowrap="nowrap">No Mesin</th>
	                                <th width="12%" nowrap="nowrap">No Rangka</th>
	                                <th width="5%" nowrap="nowrap">Tahun</th>
	                                <th width="8%" nowrap="nowrap">Lain-lain 1</th>
	                                <th width="8%" nowrap="nowrap">Lain-lain 2</th>
	                            </tr>
	                            <c:forEach items="${bbn_edit.details}" var="detail" varStatus="status">
	                            	<c:forEach items="${detail.unitSalesOrder.items}" var="item">
									<tr>
		                        		<td nowrap="nowrap">&nbsp;</td>
										<td nowrap="nowrap"><c:out value='${item.unitSalesOrder.code}'/></td>
										<td nowrap="nowrap"><c:out value="${item.unitSalesOrder.customerUnit.name}"/></td>
										<td nowrap="nowrap"><c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
										<td nowrap="nowrap"><c:out value='${item.product.types}'/></td>
										<td nowrap="nowrap"><c:out value='${item.product.typeNames}'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.noticeAmount}' pattern=',##0.00'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.serviceAmount}' pattern=',##0.00'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.accAmount}' pattern=',##0.00'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.stckAmount}' pattern=',##0.00'/></td>
										<td nowrap="nowrap"><c:out value='${item.price.serial}'/></td>
										<td nowrap="nowrap"><c:out value='${item.price.serialExt1}'/></td>
										<td nowrap="nowrap"><c:out value='${item.price.year}'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.otherAmount}' pattern=',##0.00'/></td>
										<td nowrap="nowrap"><fmt:formatNumber value='${detail.otherAmountTwo}' pattern=',##0.00'/></td>
									</tr>
									</c:forEach>
								</c:forEach>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="15">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${bbn_edit.createdBy.firstName} ${bbn_edit.createdBy.middleName} ${bbn_edit.createdBy.lastName}'/> (<fmt:formatDate value='${bbn_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${bbn_edit.updatedBy.firstName} ${bbn_edit.updatedBy.middleName} ${bbn_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${bbn_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'BBN',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/bbnedit.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving BBN data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/bbnview.htm?'/>";
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