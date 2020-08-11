<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Destination Recapitulation Report</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function generate()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			var customer = document.getElementById('customer');
			if(customer.value == '')
			{
				alert('Please select Customer first!');
				return;
			}
			
			/**			
			var destination = document.getElementById('destination');
			if(destination.value == '')
			{
				alert('Please select Destination first!');
				return;
			}*/
		
			document.reportForm.action = "<c:url value='/page/destinationrecapitulationview.htm'/>";
			document.reportForm.submit();
		}
		
		function resetform()
		{
			var org = document.getElementById('org');
			
			for(var idx=org.options.length;idx>=0;idx--)
				org.remove(org.selectedIndex);
				
			var route = document.getElementById('route');
			
			for(var idx=route.options.length;idx>=0;idx--)
				route.remove(route.selectedIndex);
			
			document.reportForm.reset();
		}
		
		function opencustomer()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
		}
		
		function showdestination()
		{
			var customer = document.getElementById('customer');
			if(customer.value == '')
			{
				alert('Please select Customer first!');
				return;
			}
		
			openpopup("<c:url value='/page/popuptransportoutsourcedestinationview.htm?target=destination&customer='/>"+customer.value);
		}
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
			<td width="60%">Transport Outsource > Transport Outsource Reports > Destination Recapitulation Report</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D19 - Destination Recapitulation Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
							<a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
					  	</div>
					
                    	<div class="main-box">
                        	<form:form id="reportForm" name="reportForm" method="post" modelAttribute="criteria">
								<table width="100%" style="border:none">
								<tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="29%" align="right">Customer : </td>
                                    <td width="71%">
                                        <form:select id='customer' path='customer' cssClass='combobox-ext'>
                                            <c:if test='${not empty criteria.customer}'>
                                                <form:option value='${criteria.customer.id}' label='${criteria.customer.firstName} ${criteria.customer.middleName} ${criteria.customer.lastName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
                                    </td>                                            
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Destination :</td>
                                    <td>
                                        <form:select id="destination" path="destination" cssClass="combobox-ext">
                                            <c:if test='${not empty criteria.destination}'>
                                                <form:option value='${criteria.destination.id}' label='${criteria.destination.name}' />
                                            </c:if>
                                        </form:select>
                                        <input type="hidden" id="destination-cost" value="0"/>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:showdestination()" style="CURSOR:pointer;" title="Destination" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Month:</td>
                                    <td>
                                    	<form:select id="month" path="month">
                                        	<option value="JANUARY" selected>JANUARY</option>
                                            <option value="FEBRUARY">FEBRUARY</option>
                                            <option value="MARCH">MARCH</option>
                                            <option value="APRIL">APRIL</option>
                                            <option value="MAY">MAY</option>
                                            <option value="JUNE">JUNE</option>
                                            <option value="JULY">JULY</option>
                                            <option value="AUGUST">AUGUST</option>
                                            <option value="SEPTEMBER">SEPTEMBER</option>
                                            <option value="OCTOBER">OCTOBER</option>
                                            <option value="NOVEMBER">NOVEMBER</option>
                                            <option value="DECEMBER">DECEMBER</option>
                                        </form:select>
                                        &nbsp;
                                        <form:select id="year" path="year">
                                        	<c:forEach items='${years}' var='year'>
                                            	<option value="${year}">${year}</option>
                                            </c:forEach>
                                        </form:select>
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
