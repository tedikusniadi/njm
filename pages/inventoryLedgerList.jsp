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
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>
    <script type="text/javascript">	
		function printPage(){
	   		print();
		}
		
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
        <div id="se-navigator">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="60%">
    
                    </td>
                    <td width="40%" align="right">
                        <%@ include file="/common/welcome.jsp"%>
                    </td>
                </tr>
            </table>
        </div>
	</div>	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
                        <div class="area" dojoType="Container" id="quick_link_container">
                            <h1 class="page-title">${pageTitle}</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/inventoryledgerpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/inventoryledgerexcell.xls'/>"><span>Export</span></a>
                            </div>
                        </div>

                        <div class="main-box">
                            <div id="main_container">
                                <div class="report"><strong>INVENTORY LEDGER SUMMARY</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="10">&nbsp;:</td>
                                      	<td width="1110"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td>Period </td>
                                        <td>&nbsp;:</td>
                                        <td><c:out value='${criteria.month}'/>&nbsp;&nbsp;<c:out value='${criteria.year}'/></td>
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <c:forEach items='${reports}' var='report'>
                                <table border="0" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="9%" align="left">Warehouse</th>
                                  	<th width="1%">&nbsp;:</th>
                                  	<th width="90%" align="left"><c:out value='${report.warehouse.code} ${report.warehouse.name}'/></th>
                                </tr>
                                </thead>
                                </table>
                                <table style="border-left:solid 1px #000000;border-top:solid 1px black;" cellpadding="3" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="10%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">ID</th>
                               	  	<th width="23%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" >Product</th>
                               	  	<th width="12%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" >Tipe</th>
                               	  	<th width="12%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" >Nama Tipe</th>
                               	  	<th width="10%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" >Warna</th>
                       	  	  	  	<th width="5%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">UoM</th>
                           	  	  	<th width="7%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">Opening</th>
                           	  	  	<th width="7%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">In</th>
                                  	<th width="7%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">Out</th>
                                    <th width="7%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">Closing</th>
                                </tr>                   
                                </thead>
                                <tbody>
                                <c:forEach items='${report.products}' var='prod'>
                                <tr>
                                	<td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${prod.product.code}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${prod.product.name}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${prod.product.types}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${prod.product.typeNames}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value='${prod.product.colors}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="center"><c:out value='${prod.product.unitOfMeasure.measureId}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${prod.opening}' pattern=',##0.00'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${prod.in}' pattern=',##0.00'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${prod.out}' pattern=',##0.00'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${prod.closing}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                </c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
