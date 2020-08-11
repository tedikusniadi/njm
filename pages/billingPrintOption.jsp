<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Billing Print Option</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
		<script type="text/javascript">
			function printMode()
			{
				document.bilingPrintOptionForm.action="<c:url value='/page/billingprint.htm?id=${billing.id}'/>";
				document.bilingPrintOptionForm.submit();
			}				
		</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
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
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Account Receivables > Billing > Print </td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F11 - Billing</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/${billing.url}?id=${billing.id}'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:printMode();"><span>Print</span></a>
					  	</div>
                        <div class="main-box">
                            <form name="bilingPrintOptionForm" method="POST">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="4%"></td>
                                  	<td width="3%"></td>
                                  	<td width="92%">&nbsp;</td>
                                </tr>
                                <tr>
                                  	<td colspan="3">&nbsp;&nbsp;&nbsp;Please select print out document : </td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="1" checked></td>
                                  	<td valign="middle" align="left">Invoice</td>
                                  	<td width="1%" align="left">&nbsp;</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="2"></td>
                                  	<td align="left" valign="middle">Invoice Tax</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="5"></td>
                                  	<td align="left" valign="middle">Simple Invoice Tax</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="3"></td>
                                  	<td align="left" valign="middle">Invoice Summary</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="4"></td>
                                  	<td align="left" valign="middle">Invoice Tax Summary</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="6"></td>
                                  	<td align="left" valign="middle">Simple Invoice Tax Summary</td>
                                </tr>
                                <tr>
                                  	<td></td>
                                  	<td valign="middle"><input name="invType" type="radio" value="7"></td>
                                  	<td align="left" valign="middle">Grouped</td>
                                </tr>
                                <tr>
                                    <td width="4%">					  
                                    </td>
                                    <td width="3%"></td>
                                    <td width="92%">&nbsp;
                                    </td>
                                </tr>
                                </table>				
                            </form>
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
