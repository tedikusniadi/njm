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
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

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
						
					  	<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/bpkbreceiptview.htm'/>"><span>Back</span></a>
							<a class="item-button-cancel" href="javascript:document.reportForm.reset();"><span>Reset</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-generate-report" style="cursor:pointer;"><span>Generate</span></a>
							</c:if>
					  	</div>
					
                    	<div class="main-box">
							<form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                    <td><div align="right">Leasing :</div></td>
                                    <td>
                                        <select id="leasing" name="leasing" class="combobox-ext">
                                        </select>
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/paymentleasingpopupview.htm?target=leasing&organization=${profile.organization.id}'/>');" style="CURSOR:pointer;" title="Leasing" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date To :</td>
                                    <td>
                                        <!-- <input name="dateFrom" inputId='from' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp; -->
                                        <input name="dateTo" inputId='to' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
				  				</table>
							</form>
						</div>
				  	</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$('.item-button-generate-report').click(function(){
			if(!$('#leasing').val())
			{
				alert('Please select Leasing first !!!');
				return
			}
		
			/* if(!$('#from').val() || !$('#to').val())
			{
				alert('Date from or to cannot be empty!');
				return
			} */
		
			if(!$('#to').val())
			{
				alert('Date To cannot be empty!');
				return
			}
		
			document.reportForm.action = "<c:url value='/page/bpkbreceiptpreadd2.htm'/>";
			document.reportForm.submit();
		});
	});
</script>