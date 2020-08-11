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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var from = dojo.widget.byId('from');
			var to = dojo.widget.byId('to');
			var org = document.getElementById('org');
			var ref = document.getElementById('referenceFrom');
			var refdetail = document.getElementById('referenceDetail');
			
			if(org.value == null || org.value == '')
			{
				alert('Please select company first!');
				return;
			}
			else if(from.getValue() == '' || to.getValue() == '')
			{
				alert('Date from/to cannot be empty!');
				return;
			}
			
			if(ref.value=='0')
				refdetail.value=='00';
		
			document.reportForm.action = "<c:url value='/page/receiptrecapotherreport.htm'/>";
			document.reportForm.submit();
		}
		
		function resetform()
		{
			var url = "<c:url value='/page/receiptrecapotherreportprepare.htm'/>";
			window.location = url;
		}
		
		$(function(){
			$("#referenceFrom").change(function()
					{
						if($("#referenceFrom").val() == 'CUSTOMER')
						{
							$("#referenceDetail option").remove();
							$("<option></option>").text("ASURANSI").val("INSURANCE").appendTo("#referenceDetail");
							$("<option></option>").text("NOMOR CANTIK").val("SPECIAL_NUMBER").appendTo("#referenceDetail");
							$("<option></option>").text("OMPANG").val("TEMPORARY").appendTo("#referenceDetail");
							$("<option></option>").text("PAJAK PROGRESIF").val("PROGRESSIVE_TAX").appendTo("#referenceDetail");
							$("<option></option>").text("PENAMBAHAN OTR").val("ADDITIONAL_OTR").appendTo("#referenceDetail");
							
							$("#referenceDetail").removeAttr("disabled");
							$("#referenceDetail").attr("class","combobox-medium");
						}
						else if($("#referenceFrom").val() == 'LEASING')
						{
							$("#referenceDetail option").remove();
							$("<option></option>").text("SHARING BUDGET").val("SHARING_BUDGET").appendTo("#referenceDetail");
							
							$("#referenceDetail").removeAttr("disabled");
							$("#referenceDetail").attr("class","combobox-medium");
						}
						else
						{
							$("#referenceDetail option").remove();
							$("<option></option>").text("---All---").val("0").appendTo("#referenceDetail");
						}
					});
		});
	</script>
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
						`
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
							<form:form name="reportForm" id="reportForm" method="post">
								<table width="100%" style="border:none">
								<tr>
                                	<td align="right">Reference Type :</td>
                                    <td>
                                    	<select id="referenceFrom" name="referenceFrom">
                                        	<option value='0'>---All---</option>
                                        	<option value='CUSTOMER'>CUSTOMER</option>
                                        	<option value='LEASING'>LEASING</option>
                                        </select>
                                    </td>
                                </tr>
								<tr>
                                	<td align="right">Reference Type Detail :</td>
                                    <td>
                                    	<select id="referenceDetail" name='referenceDetail' >
                                    		<option value="0">----All----</option>
                                        </select>
                                    </td>
                                </tr>
								<tr>
                                    <td><div align="right">Organization :</div></td>
                                    <td>
                                        <select id="org" name="org" class="combobox-ext">
                                        	<c:if test='${not empty organization}'>
                                            	<option value="${organization.id}"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></option>
                                            </c:if>
                                        </select>
                                        &nbsp;
                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Date From :</td>
                                    <td>
                                        <input id="from" name="from" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                        &nbsp;Date To &nbsp;:&nbsp;
                                        <input id="to" name="to" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                    </td>
                                </tr>
				  				</table>
							</form:form>
						</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
    
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
