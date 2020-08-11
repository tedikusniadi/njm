<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Contract Recapitulation</title>
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
        <div id="se-navigator">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="60%"></td>
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
						<h1 class="page-title">D15 - Contract Recapitulation Report</h1>

						<div class="toolbar">
                            <a class="item-button-back" href="<c:url value='/page/contractreportpre.htm'/>"><span>Back</span></a>
                            <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            <a class="item-button-export-xls" href="<c:url value='/page/contractreportexport.xls?organization=${organization.id}&customer=${customer.id}'/>"><span>Export</span></a>
                        </div>
					</div>

					<div class="main-box">
						<div id="main_container">
							<div class="report"><strong>CONTRACT RECAPITULATION</strong></div>
                    		<br/>
                        	<div class="report">
                                <table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
                                <tr>
                                    <td width="109">Company </td>
                                    <td width="19">&nbsp;:</td>
                                    <td width="1099"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                </tr>
                                <tr>
                                    <td width="109">Vehicle Type </td>
                                    <td width="19">&nbsp;:</td>
                                    <td width="1099"><c:out value='${type.name}'/></td>
                                </tr>
                                </table>
                                </div>
                                <br/>
                        
                                <table width="1165" border="0" cellpadding="2" cellspacing="0" class="CSS1" style="border:1px solid black;width:1500px;">
                              	<tr class="CSS">
                                    <td align="center" valign="middle" class="bottom_right" width="21%" rowspan="2">CUSTOMER</td>
                               		<td width="2%" align="center" valign="middle" class="bottom_right" rowspan="2">NO.</td>
                               		<td width="8%" align="center" valign="middle" class="bottom_right" rowspan="2">ORIGIN</td>
                                	<td width="10%" align="center" valign="middle" class="bottom_right" rowspan="2">DESTINATION</td>
                                	<td width="2%" align="center" valign="middle" class="bottom_right" rowspan="2">KM</td>
                           		  	<td align="center" valign="middle" class="bottom_right2" colspan="5">FREIGHT</td>
                                    <td width="8%" align="center" valign="middle" class="bottom_right2" rowspan="2">Fee</td>
                                    <td width="8%" align="center" valign="middle" class="bottom_right2" rowspan="2">TOTAL</td>
                                	<td width="5%" align="center" valign="middle" class="bottom_right2" rowspan="2">REMARK</td>
                                </tr>
                                <tr class="CSS">
                                  	<td width="8%" align="center" valign="middle" class="bottom_right2">FUEL</td>
                                  	<td width="9%" align="center" valign="middle" class="bottom_right2">HIGHWAY</td>
                                  	<td width="9%" align="center" valign="middle" class="bottom_right2">MEL</td>
                               	  	<td width="9%" align="center" valign="middle" class="bottom_right2">DRIVER</td>
                                  	<td width="9%" align="center" valign="middle" class="bottom_right2">OTHER</td>
                                </tr>
                                <c:forEach items='${reports}' var='report'>
                                <c:forEach items='${report.details}' var='route' varStatus='status'>
                                <tr>
                                    <td align="left" class="bottom_right" ><c:out value='${report.customer.firstName} ${report.customer.middleName} ${report.customer.lastName}'/></td>
                                    <td align="center" class="bottom_right" ><c:out value='${status.index+1}'/></td>
                                    <td align="left" class="bottom_right" ><c:out value='${route.contract.origin}'/></td>
                                    <td align="left" class="bottom_right" ><c:out value='${route.name}'/></td>
                                    <td align="center" class="bottom_right" ><fmt:formatNumber value='${route.kilometer}'/></td>
                                    <c:set var='ttl' value='${0}'/>
                                    <td align="right" class="bottom_right" >
                                        <c:forEach items='${route.costs}' var='cost'>
                                        <c:if test='${cost.cost.id == 1}'>
                                            &nbsp;<fmt:formatNumber value='${cost.active.money.amount}' pattern=',##0.00'/>
                                            <c:set var='ttl' value='${ttl+cost.active.money.amount}'/>
                                        </c:if>
                                        </c:forEach>
                                    </td>                                    
                                    <td align="right" class="bottom_right" >
                                        <c:forEach items='${route.costs}' var='cost'>
                                        <c:if test='${cost.cost.id == 2}'>
                                            &nbsp;<fmt:formatNumber value='${cost.active.money.amount}' pattern=',##0.00'/>&nbsp;
                                            <c:set var='ttl' value='${ttl+cost.active.money.amount}'/>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                    <td align="right" class="bottom_right" >
                                        <c:forEach items='${route.costs}' var='cost'>
                                        <c:if test='${cost.cost.id == 3}'>
                                           &nbsp;<fmt:formatNumber value='${cost.active.money.amount}' pattern=',##0.00'/>&nbsp;
                                            <c:set var='ttl' value='${ttl+cost.active.money.amount}'/>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                    <td align="right" class="bottom_right" >
                                        <c:forEach items='${route.costs}' var='cost'>
                                        <c:if test='${cost.cost.id == 4}'>
                                           	&nbsp;<fmt:formatNumber value='${cost.active.money.amount}' pattern=',##0.00'/>
                                            <c:set var='ttl' value='${ttl+cost.active.money.amount}'/>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                    <td align="right" class="bottom_right" >-</td>
                                    <td align="right" class="bottom_right" >
                                       &nbsp;<fmt:formatNumber value='${route.price.money.amount}' pattern=',##0.00'/>
                                    </td>
                                    <td align="right" class="bottom_right" >
                                    	&nbsp;<fmt:formatNumber value='${ttl+route.price.money.amount}' pattern=',##0.00'/>
                                    	<c:remove var='ttl'/>
                                    </td>
                                    <td align="left" class="bottom_right" ><c:out value='${route.note}'/></td>
                                </tr>
                                </c:forEach>
                                </c:forEach>
                                </table>
               		    		<br/><br/>
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
