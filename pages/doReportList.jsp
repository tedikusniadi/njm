<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Order</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
    </style>
	
	<script type="text/javascript">
	function generate()
	{
		var from = document.getElementById('from');
		var to = document.getElementById('to');
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		else if(from.value == '' || to.value == '')
		{
			alert('Date from/to cannot be empty!');
			return;
		}
	
		document.reportForm.action = "<c:url value='/page/deliveryorderreportexcell.xls'/>";
		document.reportForm.submit();
	}
	
			function printPage()
			{
	   			print();
			}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Sales > Report > Delivery Order </td>
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
							<h1 class="page-title">SR06 - Delivery Order<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/deliveryorderreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="javascript:generate();"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
						<form:form name="reportForm" id="reportForm" method="post">
                            <div class="main_container">
                            <input type="hidden" id="org" name="org" value="${organization.id}"/>
							<input type="hidden" id="from" name="from" value="<fmt:formatDate value='${from}' pattern='dd-MM-yyyy' />"/>
							<input type="hidden" id="to" name="to" value="<fmt:formatDate value='${to}' pattern='dd-MM-yyyy' />"/>
                            	<div class="report"><strong>REPORT DELIVERY ORDER</strong></div>
                                <div class="report">
                                    <table width="498">	
                                    <tr>	
                                        <td width="100" >Company</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" >Period</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                  <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                                  <th width="19%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">DO No/Item</th>
                                  <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Qty</th>
                                  <th width="12%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Customer</th>
                               	  <th width="15%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">SO</th>
                               	  <th width="13%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Driver</th>
                               	  <th width="10%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Vehicle</th>
                               	  <th width="15%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Note</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${report.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${report.doNo}'/></td>
                                    <td></td>
                                    <td align="left"><c:out value='${report.cFirst} ${report.cMiddle} ${report.cLast}'/></td>
                                    <td align="left"><c:out value='${report.soNo}'/></td>
                                    <td align="left"><c:out value='${report.dFirst} ${report.dMiddle} ${report.dLast}'/></td>
                                    <td align="left"><c:out value='${report.vehicle}'/></td>
                                    <td align="left"><c:out value='${report.note}'/></td>
                                	<c:forEach items='${report.deliveryOrder.items}' var='product'>
                                	<tr>
                                		<td></td>
	                                    <td align="left">&nbsp;&nbsp;<c:out value='${product.item.sequenceable.product.name}'/></td>
	                                    <td align="left"><fmt:formatNumber value='${product.item.quantity}' pattern=',##0.00'/></td>
                                    </tr>
                                    </c:forEach>                         
                                </tr>
                                </c:forEach>
                                </tbody>
                                </table>
                            </div>
                            </form:form>
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
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
