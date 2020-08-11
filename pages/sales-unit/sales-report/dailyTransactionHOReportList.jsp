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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	
	<script type="text/javascript">
		function printPage()
		{
			print();
		}
	</script>
</head>
<body>

<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
			</table>
    	</div>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<div class="area" dojoType="Container" id="quick_link_container">
							<h1 class="page-title">${pageTitle}<br></h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/dailytransactionreporthopre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/dailytransactionreporthoexcelview.xls?organization=${organization.id}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy' />&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy' />"><span>Export</span></a>
					  		</div>
					  	</div>
						
						<div class="main-box">
						<div class="main_container">
						<br>
							<div class="report"><strong>${title}</strong></div>
                    		<br>
							<div class="report">
	    					<table width="498">	
		   						<tr>	
		    						<td width="100">Company</td>
									<td width="11">:&nbsp;&nbsp;</td>
									<td width="344"><c:out value='${organization.name}'/></td>			  
		   						</tr>
		   						<tr>	
		    						<td width="100">Period</td>
									<td width="11">:&nbsp;&nbsp;</td>
									<td width="344"><fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
		   						</tr>								
	    					</table>
							</div>
							<br>
								<table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="8%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tanggal</th>
                                  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
                                  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Surat Jalan</th>
                                  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
                               	  	<th width="20%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat Pemesan</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kelurahan</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kecamatan</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Kota/Kabupaten</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Wilayah Samsat</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tlp Pemesan</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No Buku Service</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pengirim</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lokasi</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Cara Bayar</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Cash</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Credit</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Credit</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Disc Program</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi MD</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi DM</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Murni</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">DP PO</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Harga Beli</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tenor/TOP</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Mediator</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Ambil Mdt</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No PO Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl PO Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Tagih Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Tagih Sub Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl Bayar Subsidi Leasing</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Notice BBN</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Jasa BBN</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Biaya Lain-lain</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Leasing</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Pencairan Subsidi Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl BBN</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'>
                                	<tr>
                                		<td colspan="50" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
                                	</tr>
	                                <c:forEach items='${report.datas}' var='data'>
	                                <tr>
	                           		  <td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.code}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.code}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customer.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customerUnit.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.address}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.village}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.subdistrict.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.address.city.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	                                    <c:if test="${data.address.city.availableRegion}">
	                                    	<c:out value='${data.address.subdistrict.parent.name}'/>
	                                    </c:if>
	                                    <c:if test="${!data.address.city.availableRegion}">
	                                    	<c:out value=''/>
	                                    </c:if>
	                                    </td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	                                    <c:if test="${data.phone.contact != '01234'}">
	                                    	<c:out value='${data.phone.contact}'/>
	                                    </c:if>
	                                    <c:if test="${data.phone.contact == '01234'}">
	                                    	<c:out value=''/>
	                                    </c:if>
	                                   	</td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.types}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.typeNames}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.product.colors}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.serial}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.serialExt1}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.year}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailAcc.serial}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.itemDetailUnit.deliveryOrderItem.deliveryOrder.driver.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.OTR}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.addressUnit.city.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.unitPayment}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	                                    	<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
	                                   	</c:if>
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	                                    	<fmt:formatNumber value='0' pattern='#,###'/>
	                                   	</c:if>
	                                   	</td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	                                    	<fmt:formatNumber value='0' pattern='#,###'/>
	                                   	</c:if>
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	                                    	<fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/>
	                                    </c:if>
	                                    </td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;">
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	                                    	<fmt:formatNumber value='0' pattern='#,###'/>
	                                   	</c:if>
	                                    <c:if test="${data.salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	                                    	<fmt:formatNumber value='${data.salesAdapter.discDealerCustomer}' pattern='#,###'/>
	                                   	</c:if>
	                                   	</td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.programCustomer}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.mainDealerCustomer}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.subdictionLeasingCustomer}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.pureSubdiction}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.prepayment}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.purchasePrice}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.partyLeasing.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leasing.tenor}' pattern='#,###'/> / <fmt:formatNumber value='${data.leasing.installment}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.secondarySales.name}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.mediatorDate}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.poLeasing}'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.leasing.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.unitLeasing.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.unitSubdictionLeasing.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.receiptLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.receiptSubdictionLeasing.receipt.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.noticeAmount}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.serviceAmount}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.unitSalesOrder.bbnDetail.otherAmount}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.receiptLeasing.paidAmount}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.receiptSubdictionLeasing.paidAmount}' pattern='#,###'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatDate  value='${data.salesAdapter.unitSalesOrder.bbnDetail.bbn.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.leasing.note}'/></td>
	                                </tr>
	                                </c:forEach>
	                                <tr>
	                                	<td colspan="20" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Sub Total'/></strong></td>
	                                	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.HJOtr}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCash}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.umCredit}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discCredit}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.discProgram}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiMD}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiLeasing}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.subsidiDM}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.UM}' pattern='#,###'/></strong></td>
	                                	<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.DPPO}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.noticeBBN}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.serviceBBN}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.otherBBN}' pattern='#,###'/></strong></td>
	                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${report.paidBBN}' pattern='#,###'/></strong></td>
	                                	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${report.pencairanSubsidi}' pattern='#,###'/></strong></td>
	                                </tr>
	                            </c:forEach>
                                <tr>
                                	<td colspan="20" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><strong><c:out value='Total'/></strong></td>
                                	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${HJOtrTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCashTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${umCreditTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discCreditTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${discProgramTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiMDTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiLeasingTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${subsidiDMTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${UMTotal}' pattern='#,###'/></strong></td>
                                	<td colspan="12" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${DPPOTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${noticeBBNTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${serviceBBNTotal}' pattern='#,###'/></strong></td>
                                	<td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${otherBBNTotal}' pattern='#,###'/></strong></td>
	                                <td nowrap="nowrap" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${paidBBNTotal}' pattern='#,###'/></strong></td>
                                	<td colspan="3" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><strong><fmt:formatNumber value='${pencairanSubsidiTotal}' pattern='#,###'/></strong></td>
                                </tr>
                                <tr>
                                	<td cospan="50">&nbsp;</td>
                                </tr>
                                <tr>
                                	<th colspan="2" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Summary</th>
                                </tr>
                                <tr>
                                	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">Tipe</th>
                                	<th align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">Jumlah</th>
                                </tr>
                                <c:forEach items="${summaries}" var="sum">
                                <tr>
                                	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">
                                		<c:if test="${not empty sum.unitType}">
                                			<c:out value='${sum.unitType}'/>
                                		</c:if>
                                		<c:if test="${empty sum.unitType}">
                                			<strong><c:out value='Total'/></strong>
                                		</c:if>
                                	</td>
                                	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;">
                                		<c:if test="${empty sum.unitType}">
                                			<strong><c:out value='${sum.total}'/></strong>
                                		</c:if>
                                		<c:if test="${not empty sum.unitType}">
                                			<c:out value='${sum.total}'/>
                                		</c:if>
                                	</td>
                                </tr>
                                </c:forEach>
                                <tr>
                                	<td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Cash'/></strong></td>
	                                <td align="left" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${cash}'/></td>
                                </tr>
                                <tr>
                                	<td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><strong><c:out value='Credit'/></strong></td>
	                                <td align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${credit}'/></td>
                                </tr>
                                </tbody>
                          		</table>
							<br>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
