<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Standard Price >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{
			var date = document.getElementById('dateFrom').value;
			var amount = document.getElementById('amount').value;

			if(date == '')
			{
				alert('Date cannot be empty !!!');
				return;
			}

			if(amount == '' || parseFloat(amount.replace(/,/g,'')) <= 0)
			{
				alert('Amount cannot be empty and must be greater than zero !!!');
				return;
			}

			document.addForm.action = "<c:url value='/page/productstandardpriceadd.htm'/>";
			document.addForm.submit();
		}

		function separator()
		{
			var amount = document.getElementById('amount');

			if(amount.value != '')
			{
				amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
			}
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Inventory > Item Management > Product > Standard Price > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I05 - Standard Price</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productpreedit.htm?id=${price.product.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="price">
								<table width="100%" style="border:none">
                                <tr>
                                    <td><div align="right">Date From :</div></td>
                                    <td><input inputId="dateFrom" name="dateFrom" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/></td>
                                </tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Price :</td>
								  	<td width="80%"><form:input id="amount" path='money.amount' size="20" onkeyup="separator();"/></td>
								</tr>
								<c:if test="${type == 'SELLING'}">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Tipe :</td>
								  	<td width="80%">
                                       	<form:radiobutton path="unitPriceType" value='ON_THE_ROAD' label='On The Road'/>
                                       	<form:radiobutton path="unitPriceType" value='OFF_THE_ROAD' label='Off The Road' />
								  	</td>
								</tr>
								</c:if>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Currency :</td>
								  	<td width="80%">
                                    	<form:select path='money.currency'>
                                        	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path='money.exchangeType'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>