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
							<a class="item-button-back" href="<c:url value='/page/prepaymentpreedit.htm?id=${application.prepayment.id}'/>"><span><spring:message code='back'/></span></a>
							<c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/prepaymentapplicationprint.htm?id=${application.id}'/>"><span>Print</span></a>
			    			</c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="application">
			 				<table width="100%" style="border:none" class="space">
			 				<tr>
                                	<td width="59%">
                                		<table width="100%" style="border:none">
										<tr>
											<td width="29%" align="right">Kode </td>
							  		  	  	<td width="1%">:</td>
								 		  	<td width="70%"><input class="inputbox input-disabled" value="${application.code}" disabled/>
										</tr>
										<tr>
											<td align="right">Prepayment</td>
											<td>:</td>
											<td><input class="inputbox input-disabled" value="${application.prepayment.code}" disabled/></td>
										</tr>
			                            <tr>
											<td align="right">Tanggal </td>
											<td>:</td>
											<td><input class="inputbox input-disabled" value="<fmt:formatDate value='${application.date}' pattern='dd-MM-yyyy'/>" disabled/></td>
										</tr>
			                            <tr>
											<td width="29%" align="right">Jumlah</td>
							  				<td width="1%">:</td>
							  				<td width="70%"><input name="amount" value="<fmt:formatNumber value='${application.amount}' pattern='#,###.00'/>" maxlength="50" class="inputbox input-disabled" disabled/></td>
										</tr>
										</table>
									</td>
									<c:if test="${not empty application.journalEntry}">
									<td width="35%" align="center" valign="top">
                   						<table style="border:none" width="100%">
                                        <tr>
                                        	<td align="left" valign="top">
												<fieldset>
                                                	<legend><strong>Journal Reference</strong></legend>
                                                    <table style="border:none" width="100%">
 													<tr>
                                                        <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${application.journalEntry.id}'/>">${application.journalEntry.code}</td>
                                                      </tr>
                                                    </table>
                                                </fieldset>
                                        	</td>
                                        </tr>
                                		</table>
                            		</td>
                            		</c:if>
								</tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file='/common/sirius-footer.jsp' %>
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>