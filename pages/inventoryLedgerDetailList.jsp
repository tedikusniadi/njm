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
                                <a class="item-button-back" href="<c:url value='/page/inventoryledgerdetailpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/inventoryledgeredetailxcell.xls'/>"><span>Export</span></a>
                            </div>
                        </div>

                        <div class="main-box">
                            <div id="main_container">
                                <div class="report"><strong>INVENTORY LEDGER DETAIL</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="109">Company </td>
                                        <td width="10">&nbsp;:</td>
                                      	<td width="1110"><c:out value='${organization.name}'/></td>
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
                                    <th width="9%" align="left">Product</th>
                                  	<th width="1%">&nbsp;:</th>
                                  	<th width="90%" align="left"><c:out value='${report.product.code} ${report.product.name}'/></th>
                                </tr>
                                <tr>
                                	<th align="left">Tipe</th>
                                	<th>&nbsp;:</th>
                                	<th align="left"><c:out value='${report.product.types}'/></th>
                                </tr>
                                <tr>
                                	<th align="left">Name Tipe</th>
                                	<th>&nbsp;:</th>
                                	<th align="left"><c:out value='${report.product.typeNames}'/></th>
                                </tr>
                                <tr>
                                	<th align="left">Warna</th>
                                	<th>&nbsp;:</th>
                                	<th align="left"><c:out value='${report.product.colors}'/></th>
                                </tr>
                                <tr>
                                	<td>&nbsp;</td>
                                </tr>
                                </thead>
                                </table>
                                <c:forEach items='${report.containers}' var='container'>
								<table border="0" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                     <th align="left"><strong><c:out value='${container.container.facility.code} ${container.container.facility.name}'/></strong></th>
                                  	 <th><strong><c:out value='${container.container.code} ${container.container.name}'/></strong></th> 
                                  	<th align="left"><strong><c:out value='${container.container.code} ${container.container.name}'/></strong></th>
                                </tr>
                                </thead>
                                </table>
                                <table style="border-left:solid 1px #000000;border-top:solid 1px black;" cellpadding="3" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="11%" align="left" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Date</th>
                       	  	  	  	<th width="17%" align="left" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" >Description</th>
               	  	  	  	  	  	<th width="30%" align="left" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;">Ref No</th>
                   	  	  	  	  	<th width="14%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">In</th>
                       	  	  	  	<th width="14%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">Out</th>
                               	  	<th width="14%" style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"  align="right">Amount</th>
                                </tr>                   
                                </thead>
                                <tbody>
								<tr>
                                	<td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" colspan='4'>Opening Balance</td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${container.opening}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='sum' value='${container.opening}'/>
                                <c:forEach items='${container.transactions}' var='trx'>
                                <c:set var='sum' value='${sum+trx.in-trx.out}'/>
                                <tr>
                                	<td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="left"><fmt:formatDate value='${trx.date}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="left"><c:out value='${trx.referenceType}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="left"><c:out value='${trx.referenceCode}'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${trx.in}' pattern=',##0.00'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${trx.out}' pattern=',##0.00'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${sum}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
								<tr>
                                	<td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatDate value='${criteria.dateTo}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" colspan='4'>Closing Balance</td>
                                    <td style="border-bottom:solid 1px #000000;border-right:solid 1px #000000;" align="right"><fmt:formatNumber value='${sum}' pattern=',##0.00'/></td>
                                </tr>
                                </tbody>
                                </table>
								</c:forEach>
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
