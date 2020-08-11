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
								<a class="item-button-back" href="<c:url value='/page/poleasingreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/poleasingreportexcelview.xls?organization=${organization.id}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy' />&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy' />"><span>Export</span></a>
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
                                  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Leasing</th>
                                  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No PO Leasing</th>
                                  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">HJOTR</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Discount</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi MD</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Subsidi Leasing</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">UM Murni</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">DP PO</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Tenor/TOP</th>
                               	  	<th width="15%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;">Lengkap</th>
                               	  	<th width="10%" align="left" nowrap="nowrap" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Keterangan</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${datas}' var='data'>
                                <tr>
                           		  	<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${data.leasing.date}' pattern='dd-MM-yyyy'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.partyLeasing.name}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.leasing.poLeasing}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.code}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.salesPerson.name}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesAdapter.unitSalesOrder.customer.name}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesItem.product.types}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${data.salesItem.product.colors}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.OTR}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.discount}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.mainDealerCustomer}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.subdictionLeasingCustomer}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.prepayment}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.salesAdapter.poPrepayment}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${data.leasing.tenor}' pattern='#,###'/> / <fmt:formatNumber value='${data.leasing.installment}' pattern='#,###'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value="${not empty data.leasing.note ? 'Tidak Lengkap' : 'Lengkap'}"/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${data.leasing.note}'/></td>
                                </tr>
                                </c:forEach>
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
