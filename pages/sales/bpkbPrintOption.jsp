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
    <script type="text/javascript">	

		function printPage()
		{
			var status = '';
			if(!$("#delivered").attr("checked")&&!$("#received").attr("checked")) {
				alert('Please select BPKB Status first !!!');
				return;
			}
			
			document.printForm.action = "<c:url value='/page/bpkbprint.htm'/>";
			document.printForm.submit();
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
                    <td width="60%">
    
                    </td>
                    <td width="40%" align="right">
                        <%@ include file="/common/welcome.jsp"%>
                    </td>
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
                            <h1 class="page-title">${pageTitle}</h1>
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='page/start.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
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
								    <td colspan="7"><span>Mohon pilih tipe printout :</span></td>
								  </tr>
								  <tr>
								  	<td colspan="7">&nbsp;</td>
								  </tr>
								  <tr>
								  	<td colspan="7"><span>Status BPKB :</span></td>
							      </tr>
								  <tr>
								    <td colspan="7">
								    	<input id="delivered" type="radio" name="status" value="1"/> 
								      	<span>Sudah diserahkan kekonsumen</span>
								    </td>
							      </tr>
								  <tr>
								    <td colspan="7">
								    	<input id="received" type="radio" name="status" value="2"/> 
								      	<span>Belum diserahkan kekonsumen</span>
								    </td>
							      </tr>
								  <tr>
								    <td colspan="2">&nbsp;</td>
							      </tr>
								  <tr>
								  	<td width="5%">Date From </td>
								    <td width="95%">: 
								      <input name="dateFrom" id="dateFrom" lang="en-us" inputid="dateFromId" formatlength="long" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveformat="dd-MM-yyyy" xml:lang="en-us"/></td>
								  </tr>
								  <tr>
								  	<td>Date To</td>
								    <td>: <input id="dateTo" name="dateTo" inputid="dateToId" formatlength="long" dojotype="dropdowndatepicker" lang="en-us" displayformat="dd-MM-yyyy" saveformat="dd-MM-yyyy"/></td>
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
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
