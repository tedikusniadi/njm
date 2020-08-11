<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Popup > Inventory Item Detail</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		
		function resets()
		{
			window.location = "<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}'/>";
		}
		
		function setclient(serial,serial2,year)
		{
			if(serial)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
					_client.value=serial;

				var _client2 = self.opener.document.getElementById('${target}2');
				if(_client2)
					_client2.value=serial2;

				var _client3 = self.opener.document.getElementById('${target}3');
				if(_client3)
					_client3.value=year;
			}

			window.close();
		}
		
		$(function()
		{
			$("#year").keydown(function(event)
			{
		        numberOnly(event);
		    });
		});

		function numberOnly(event)
		{
			if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 ))
			{
			    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || (event.keyCode >= 37 && event.keyCode <= 40))
			    {
			    }
			    else
			   	{
			    	event.preventDefault();
			   	}
			}
		}
	</script>
</head>

<body>
<div id="se-containers_pick">
	<div id="se-r00">
		<div id="se-r01a">&nbsp;</div>
		<div id="se-r03">&nbsp;</div>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<form id="filterForm" name="filterForm" method="post">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">No Mesin&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="serial" name="serial" value="${filterCriteria.serial}" size="35" class="inputbox"/></td>
										</tr>
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">No Rangka&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="serialExt1" name="serialExt1" value="${filterCriteria.serialExt1}" size="35" class="inputbox"/></td>
										</tr>
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">Tahun&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="year" name="year" value="${filterCriteria.year}" size="35" class="inputbox"/></td>
										</tr>
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">&nbsp;</td>
											<td width="7">&nbsp;</td>
											<td align="left">
												<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');" class="btn" />
												<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resetPopup();" class="btn"/>
											</td>
											<td width="295" height="28" align="left">&nbsp;</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Last</a></td>
						</tr>
						</table>

						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
				  		  	<th width="34%">No.Mesin</th>
				  		  	<th width="14%">No.Rangka</th>
				  		  	<th width="14%">Tahun</th>
				  		</tr>
						<c:forEach items="${serials}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-ok" href="javascript:setclient('${com.serial}','${com.serialExt1}', '${com.year}')"  title="Ok"><span>Ok</span></a>
					  		</td>
							<td><c:out value='${com.serial}'/></td>
							<td><c:out value='${com.serialExt1}'/></td>
							<td><c:out value='${com.year}'/></td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/onhandquantitypopupserialview.htm?id=${id}&target=${target}&organization=${filterCriteria.organization}&facility=${filterCriteria.facility}&pdi=${filterCriteria.pdi}'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<%-- <%@include file="/common/sirius-footer.jsp" %> --%>
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>