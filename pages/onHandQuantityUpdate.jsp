<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->

	<!-- tips & page navigator -->
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

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/onhandquantityview.htm?cat=${param.cat}&headOffice=${param.headOffice}'/>"><span>List</span></a>
					  	</div>

						<div class="main-box">
                        	<table style="border:none" width="100%">
                            <tbody>
							<tr>
                            	<td width="11%" align="left">ID</td>
                              	<td width="1%" align="center">:</td>
                              	<td width="38%" align="left"><c:out value='${product.code}'/></td>
                              	<td width="16%" align="left">On Hand</td>
                              	<td width="1%" align="center">:</td>
                              	<td width="33%" align="left"><fmt:formatNumber value='${onhand}' pattern=',##0.00'/></td>
                            </tr>
                            <tr>
                            	<td align="left">Name</td>
                                <td align="center">:</td>
                                <td align="left"><c:out value='${product.name}'/></td>
                                <td align="left">Available for Sales</td>
                                <td align="center">:</td>
                                <td align="left"><fmt:formatNumber value='${onhand+ontransfer-product.reservedStock}' pattern=',##0.00'/></td>
                            </tr>
                            <tr>
                            	<td align="left">Tipe</td>
                                <td align="center">:</td>
                                <td align="left"><c:out value='${product.types}'/></td>
                                <td align="left">Reserved</td>
                                <td align="center">:</td>
                                <td align="left"><fmt:formatNumber value='${product.reservedStock}' pattern=',##0.00'/></td>
                            </tr>
                            <tr>
				  	  	  	  	<c:if test="${param.cat == '1'}">
	                            	<td align="left">Nama Tipe</td>
	                           	</c:if>
				  	  	  	  	<c:if test="${param.cat == '2'}">
	                            	<td align="left">Kualitas</td>
	                           	</c:if>
				  	  	  	  	<c:if test="${param.cat == '3'}">
	                            	<td align="left">Merek</td>
	                           	</c:if>
                                <td align="center">:</td>
				  	  	  	  	<c:if test="${param.cat == '1'}">
                                	<td align="left"><c:out value='${product.typeNames}'/></td>
                               	</c:if>
				  	  	  	  	<c:if test="${param.cat == '2' or param.cat == '3'}">
                                	<td align="left"><c:out value='${product.brand}'/></td>
                               	</c:if>
                                <td align="left">&nbsp;</td>
                                <td align="center">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                            </tr>
                            <tr>
                            	<td align="left">Warna</td>
                                <td align="center">:</td>
                                <c:if test="${param.cat != '2'}">
                                	<td align="left"><c:out value='${product.colors}'/></td>
                                </c:if>
                                <c:if test="${param.cat == '2'}">
                                	<td align="left"><c:out value='${product.primaryColors}'/></td>
                                </c:if>
                                <td align="left">&nbsp;</td>
                                <td align="center">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                            </tr>
                            <tr>
                            	<td align="left">Category</td>
                                <td align="center">:</td>
                                <td align="left"><c:out value='${product.productCategory.name}'/></td>
                                <td align="left">&nbsp;</td>
                                <td align="center">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr><td colspan="6">&nbsp;</td></tr>
                            </tfoot>
                            </table>
                            <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
							<thead>
							<tr>
                                <th width="10%">Facility</th>
                                <th width="22%">Company</th>
                       			<th width="11%">Grid Container</th>
				  	  	  	  	<c:if test="${param.cat == '1'}">
	                       			<th width="12%">No.Mesin</th>
	                       			<th width="12%">No.Rangka</th>
	                       			<th width="8%">Thn Rakit</th>
                       			</c:if>
				  	  	  	  	<c:if test="${param.cat == '3'}">
	                       			<th colspan="3" width="32%">Serial</th>
                       			</c:if>
                       			<!-- <th width="10%">UoM</th> -->
                                <th width="10%">On Hand</th>
                                <th width="10%">On Transfer</th>
	  	  	  	  				<c:if test="${param.cat == '1'}">
	                                <th width="8%">Total</th>
	                                <th width="5%">PDI</th>
                                </c:if>
	  	  	  	  				<c:if test="${param.cat == '2'}">
	                                <th width="8%">Total</th>
	                                <th width="8%">HET</th>
                                </c:if>
	  	  	  	  				<c:if test="${param.cat == '3'}">
	                                <th colspan="2" width="13%">Total</th>
                                </c:if>
                                <c
							</tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${products}' var='prod'>
	                            <c:forEach items='${prod.inventorys}' var='inv'>
	                            	<c:if test="${inv.onHand > 0}">
		                            <tr>
		                            	<td colspan="10">${prod.facility.name}</td>
		                            </tr>
		                            <tr>
		                            	<td></td>
		                                <td>
		                                	&nbsp;&nbsp;&nbsp;
		                                    <c:out value='${inv.organization.name}'/>
		                                </td>
		                                <c:if test="${param.cat != '2'}">
		                                	<td colspan="4"><c:out value='${inv.grid.name}'/></td>
		                                </c:if>
		                                <c:if test="${param.cat == '2'}">
		                                	<td><c:out value='${inv.grid.name}'/></td>
		                                </c:if>
		                                <td><fmt:formatNumber value='${inv.onHand}' pattern=',##0.00'/></td>
		                                <td><fmt:formatNumber value='${inv.onTransfer}' pattern=',##0.00'/></td>
		                                <td><fmt:formatNumber value='${inv.onHand+inv.onTransfer}' pattern=',##0.00'/></td>
	                                 	<c:if test="${param.cat == '2'}">
	                                 		<c:set var="ada" value="false"/>
	                                 		<c:set var="amt" value="0"/>	
	                                 		<c:choose>
	                                 		<c:when test="${!ada}">
	                                 			<c:forEach items="${product.salePrices}" var="price">
	                                 				<c:if test="${price.organization.id eq inv.organization.id}">
				                                 		<c:set var="ada" value="true"/>
				                                 		<c:set var="amt" value="${price.money.amount}"/>	
	                                 				</c:if>
	                                 			</c:forEach>
	                                 		</c:when>
	                                 		</c:choose>
	                                		<td><fmt:formatNumber value='${amt}' pattern=',##0.00'/></td>
	                                 	</c:if>
	                                 	<c:if test="${param.cat != '2'}">
		                                	<td>&nbsp;</td>
		                                </c:if>
		                            </tr>
		                            <c:if test="${product.serial}">
			                           	<c:forEach items='${inv.details}' var='detail'>
				                           	<c:if test="${detail.onHand > 0}">
				                           	<tr>
				                           		<td>&nbsp;</td>
				                           		<td>&nbsp;</td>
				                           		<td>&nbsp;</td>
					  	  	  	  				<c:if test="${param.cat == '1'}">
					                           		<td>${detail.serial}</td>
					                           		<td>${detail.serialExt1}</td>
					                           		<td>${detail.year}</td>
				                           		</c:if>
					  	  	  	  				<c:if test="${param.cat != '1'}">
					                           		<td colspan="3">${detail.serial}</td>
				                           		</c:if>
				                           		<%-- <td>${detail.inventoryItem.product.unitOfMeasure.measureId}</td> --%>
				                               	<td><fmt:formatNumber value='${detail.onHand}' pattern=',##0.00'/></td>
				                               	<td><fmt:formatNumber value='${detail.onTransfer}' pattern=',##0.00'/></td>
				                               	<td><fmt:formatNumber value='${detail.onHand+detail.onTransfer}' pattern=',##0.00'/></td>
		  	  	  	  							<c:if test="${param.cat == '1'}">
					                               	<c:if test="${detail.verificated}">
					                               		<td>YES</td>
					                               	</c:if>
					                               	<c:if test="${!detail.verificated}">
					                               		<td>NO</td>
					                               	</c:if>
				                               	</c:if>
		  	  	  	  							<c:if test="${param.cat != '1'}">
					                               	<td>&nbsp;</td>
				                               	</c:if>
				                           	</tr>
				                           	</c:if>
			                           	</c:forEach>
		                           	</c:if>
		                           	<tr>
		                           		<td colspan="10">&nbsp;</td>
		                           	</tr>
		                           	</c:if>
	                            </c:forEach>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                            </tfoot>
                            </table>
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
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
