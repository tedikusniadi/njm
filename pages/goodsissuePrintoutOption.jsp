<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Issue Printout Option</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("css/deliveryRecapitulationReport.css"); -->
	</style>
    <script type="text/javascript">	

		function printPage(id){
			var ttk = document.getElementById('rb1');
			var ttk2 = document.getElementById('rb2');
			if(!ttk.checked && !ttk2.checked){
				alert('Mohon Pilih Salah Satu ');
			}
			if(ttk.checked){
				document.printForm.action = "<c:url value='/page/goodsissuepreeditprintoutsj.htm?id='/>"+id;
				document.printForm.submit();
			}
			if(ttk2.checked){
				document.printForm.action = "<c:url value='/page/goodsissuepreeditprintoutTtk.htm?id='/>"+id;
				document.printForm.submit();
			}
		}
		

	</script>
	<style type="text/css">
	<!--
	.style1 {
		font-family: Arial, Helvetica, sans-serif;
		font-weight: bold;
		font-size: 12px;
	}
	.style2 {
		font-size: 11px;
		font-family: Arial, Helvetica, sans-serif;
	}
	-->
	</style>
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
                            <h1 class="page-title">I25 - Goods Issue</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='page/goodsissuepreedit.htm?id=${goodsIssue_edit.id}'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:printPage(${goodsIssue_edit.id});"><span>Print</span></a>
                            </div>
                        </div>

                        <div class="main-box">
                            <div id="main_container">
                                <div class="report" style="text-align: center;"><strong>PRINT OUT DOCUMENT</strong></div>
                                 <div class="clears">&nbsp;</div> 
                                <div class="report">
                                <form:form id="printForm" name="printForm" method="post">
                                <table width="100%" border="0">
								  <tr>
								    <td colspan="6"><span class="style1">Please select print out document :</span></td>
								  </tr>
								  <tr>
								    <td width="21%"><label>
								      <input type="radio" name="radio" id="rb1" value="0"/>
								      <span class="style2">Surat Jalan</span></label></td>
								    <td width="15%">&nbsp;</td>
								    <td width="16%">&nbsp;</td>
								    <td width="16%">&nbsp;</td>
								    <td width="16%">&nbsp;</td>
								    <td width="16%">&nbsp;</td>
								  </tr>
								  <tr>
								    <td><input type="radio" name="radio" id="rb2" value="0"/> 
								      <span class="style2">Surat Terima Kendaraan</span></td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								</table>
								</form:form>
								</div>
                                <div class="clears">&nbsp;</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</body>
<!-- END OF BODY -->
</html>
