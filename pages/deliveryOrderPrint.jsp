<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Delivery Order >> Print</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/deliveryOrderReport.css"); -->
	</style>
	<style type="text/css" media="print">
		<!-- @import url("assets/deliveryOrderReport.css"); -->
	</style>
</head>
<!-- BEGIN OF BODY -->
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
					<!-- main contents goes here -->
						
					<div class="area" dojoType="Container" id="quick_link_container">
                        <div class="toolbar">
                            <a class="item-button-back" href="<c:url value='/page/deliveryorderpreedit.htm?id=${order_edit.id}'/>"><span>Back</span></a>
                            <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                        </div>
					</div>

					<div class="main-box">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr>
					  	<td width="96">&nbsp;</td>
					  	<td width="21">&nbsp;</td>
					  	<td width="451">&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right" class="CSS3"><strong>SURAT JALAN</strong></td>
				  	</tr>
					<tr>
						<td colspan="3">
                        	<c:forEach items='${order_edit.organization.postalAddresses}' var='address'>
                            	<c:if test='${address.selected}'>
                                	<c:out value='${address.address}'/>
                                    <c:forEach items='${address.geographics}' var='geo'>
                                    	<c:if test='${geo.geographic.geographicType.id == 3}'>
                                        	,<c:out value='${geo.geographic.name}'/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items='${address.geographics}' var='geo'>
                                    	<c:if test='${geo.geographic.geographicType.id == 2}'>
                                        	- <c:out value='${geo.geographic.name}'/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items='${address.geographics}' var='geo'>
                                    	<c:if test='${geo.geographic.geographicType.id == 1}'>
                                        	,<c:out value='${geo.geographic.name}'/>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </td>
						<td width="205">&nbsp;</td>
					    <td width="472" align="right" class="CSS3"><strong>DELIVERY ORDER (DO)</strong></td>
					</tr>
					<tr>
						<td colspan="3">
                        	<c:forEach items='${order_edit.organization.contactMechanisms}' var='contact'>
                                Telp.<c:if test="${contact.contactMechanismType == 'PHONE'}"><c:out value='${contact.contact}'/></c:if>
                                Fax.<c:if test="${contact.contactMechanismType == 'FAX'}"><c:out value='${contact.contact}'/></c:if>
                            </c:forEach>
                        </td>
						<td>&nbsp;</td>
					    <td align="right">&nbsp;</td>
					</tr>
					<tr>
					  	<td colspan="3">&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>Kepada </td>
					  	<td>:</td>
					  	<td>&nbsp;<c:out value='${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.salutation} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_edit.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}'/></td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;<c:out value='${order_edit.deliveryPlanningSequence.postalAddress.address}'/></td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					</table>
                    
					<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black; border-right:none; border-left:none; border-bottom:none;">
					<tr class="CSS" style="height:28px;">
						<td width="5%" align="center" valign="middle" class="bottom_left_right">No</td>
						<td width="45%" align="center" valign="middle" class="bottom_right">Nama Barang </td>
					    <td width="23%" align="center" valign="middle" class="bottom_right">Kemasan</td>
						<td width="27%" align="center" valign="middle" class="bottom_right2">Jumlah</td>
					</tr>
					<c:forEach items="${order_edit.items}" var="line" varStatus='status'>
					<tr>
						<td align="center" valign="top" class="bottom_left_right"><c:out value='${status.index+1}'/></td>
						<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${line.item.sequenceable.product.code}'/>-${line.item.sequenceable.product.name}</td>
						<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${line.item.sequenceable.product.unitOfMeasure.measureId}'/>&nbsp;</td>
						<td align="right" valign="top" class="bottom_right">&nbsp;<fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/>&nbsp;</td>
					</tr>
					 </c:forEach>
					<tr class="CSS">
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="right" valign="top" style="border-right:none;"></td>
					</tr>
					</table>

					<table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
					<tr>
						<td>Barang telah diterima dalam keadaan baik dan sesuai jumlahnya</td>
					</tr>
					<tr>
						<td>Keluhan setelah barang diterima tidak dilayani</td>
					</tr>
					</table>
					<div class="clears">&nbsp;</div>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" class="CSS1">
					<tr>
					  <td width="25%" align="left" valign="top">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Penerima Barang </td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="left" nowrap>&nbsp;&nbsp;paraf, nama jelas &amp; stempel perusahaan </td>
								  </tr>
					  </table>					  </td>
						<td width="25%">						
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr  class="CSS">
										<td align="center">Supir</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<c:if test='${not empty order_edit.driver}'>
											<td align="center">(&nbsp;${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}&nbsp;)</td>
										</c:if>			
										<c:if test='${empty order_edit.driver}'>
											<td align="center">(.........................................)</td>
										</c:if>			
							
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No. Pol - 
									   <c:if test='${not empty order_edit.vehicle}'>
                                           ${order_edit.vehicle.name}                                                
										</c:if>
									  </td>
								  </tr>
						</table>						
						</td>
						<td width="25%">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Gudang</td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
								</table>												
						</td>
						<td width="25%" align="left" valign="top">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Hormat Kami </td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
						</table>						
					</td>
					</tr>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
