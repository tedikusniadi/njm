<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Printout</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		@import url("css/print-normal.css");
    </style>
    
    <style type="text/css" media="print">
		@import url("css/print-normal.css");
    </style>
	
	<script type="text/javascript">
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
				<td width="60%">Inventory > Product Management > Product > Print</td>
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
							<h1 class="page-title">I03 - Product<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/productprintoption.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/productprintexcell.xls?status=${status}&type=${type}&productCategory=${productCategory}'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report" align="center"><strong>MASTER PRODUCT</strong></div>
                                <div class="report">
                                    <table width="498">
                                    <tr><td>&nbsp;</td></tr>
                                    <tr>
                                    	<td><c:out value="${fn:toUpperCase(organization.name)}"/></td>
                                    </tr>
                                    <tr>
                                    <c:forEach items="${organization.postalAddresses}" var="address">
                                    	<td><c:out value="${address.address}"/>,&nbsp;<c:out value="${address.city.name}"/></td>
                                    </c:forEach>
                                    	
                                    </tr>
                                    <tr>
                                   
									<c:set var="phone" value=""/>
									<c:set var="fax" value=""/>
                                    <c:forEach items="${organization.contactMechanisms}" var="con">
                                    	<c:if test="${con.contactMechanismType=='PHONE'}">
                                    		<c:set var="phone" value="${con.contact},${phone}"/>
                                    	</c:if>
                                    	<c:if test="${con.contactMechanismType=='FAX'}">
                                    		<c:set var="fax" value="${con.contact},${fax}"/>
                                    	</c:if>
                                    </c:forEach>
                                    
                                    <td>Tlp.   <c:out value="${fn:substring(phone, 0,fn:length(phone)-1)}"/></td>
                                    </tr>
                                    <tr>
                                    	<td>Fax. <c:out value="${fn:substring(fax, 0,fn:length(fax)-1)}"/></td>
                                    </tr>

                                    <tr>
                                    <table width="100%">
                                        <td align="right">Tanggal : <fmt:formatDate value='${date}' pattern='dd MMM yyyy' /></td>
                                    </table>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th align="left" nowrap="nowrap" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">ID</th>
                                  	<th align="left" nowrap="nowrap" width="15%" style="border-bottom:1px solid black;border-top:1px solid black;">Product</th>
                                  	<th align="left" nowrap="nowrap" width="5%" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
                                  	<th align="left" nowrap="nowrap" width="5%" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Tipe</th>
                               	  	<th align="left" nowrap="nowrap" width="5%" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
                               	  	<th align="left" nowrap="nowrap" width="40%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Goods/Service</th>
                               	  	<!-- <th align="left" nowrap="nowrap" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;">On The Road</th>
                               	  	<th align="left" nowrap="nowrap" width="35%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Off The Road</th> -->
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${products}' var='prod'>
                                <tr>
                               		<td nowrap="nowrap" style="border-bottom:1px solid black;border-left:1px solid black;"><c:out value='${prod.code}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prod.name}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prod.types}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prod.typeNames}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;"><c:out value='${prod.colors}'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${prod.type}'/></td>
                                    <%-- <td nowrap="nowrap" style="border-bottom:1px solid black;"><fmt:formatNumber value='${prod.sellingPrice.money.amount}' pattern=',##0.00'/></td>
                                    <td nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${prod.buyingPrice.money.amount}' pattern=',##0.00'/></td> --%> 
                                </tr>
                                </c:forEach>
                                </tbody>
                                </table>
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
