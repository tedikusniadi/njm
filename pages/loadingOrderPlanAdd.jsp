<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loading Order Sequence >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
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
			<td width="60%">Procurement > Pertamina Procurement > Loading Order > Loading Order Sequence > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P24 - Loading Order Sequence</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/loadingorderpreedit.htm?id=${plan.loadingOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plan">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="16%" nowrap="nowrap" align="right">LO Doc No :</td>
                                  	<td width="35%"><form:input id='no' path='no' size='35'/></td>
                                	<td width="10%" align="right" nowrap="nowrap">Vehicle No :</td>
                                  	<td width="39%"><form:input path='vehicleNo'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <td nowrap="nowrap" align="right">Driver Name :</td>
                                    <td><form:input path='driverName'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Shipping :</td>
                                    <td><form:input path='shipping'/></td>
                                    <td nowrap="nowrap" align="right">Filling Point :</td>
                                    <td><form:input path='fillingPoint'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Delivery :</td>
                                    <td><form:input path='delivery'/></td>
                                    <td nowrap="nowrap" align="right">Seal No :</td>
                                    <td><form:input path='seal'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Ship To :</td>
                                    <td><input class="input-disabled" disabled size="30" value="${plan.loadingOrder.purchaseOrder.shipTo.code} - ${plan.loadingOrder.purchaseOrder.shipTo.name}"/></td>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td rowspan="2"><form:textarea path='note' cols='40' rows='3'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Valid From :</td>
                                    <td><input id="validFrom" name="validFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>&nbsp;&nbsp;To&nbsp;&nbsp;<input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Collection Order No :</td>
                                    <td>&nbsp;</td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="34%">Product</th>
                                    <th width="13%">Quantity</th>
                                    <th width="7%">UoM</th>
                                    <th width="46%">Note</th>
                                    <th width="1%">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody id="gridbody">
                                <c:forEach items="${plan.items}" var="line" varStatus='status'>
                                <tr>
                                    <td><c:out value='${line.item.product.code} ${line.item.product.name}'/></td>
                                    <td><input name='items[${status.index}].quantity' size='10' value="<fmt:formatNumber value='${line.quantity}' pattern='##0.00'/>"/></td>
                                    <td><c:out value='${line.item.product.unitOfMeasure.measureId}'/></td>
                                    <td><form:input path='items[${status.index}].note' size='60'/></td> 
                                	<td><input type="hidden" value="${line.quantity}"/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/LoadingOrderPlanDWRRemote.js'/>"></script>
<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
<script type="text/javascript">
	function save()
	{		
		if(!dojo.byId('no').value)
		{
			alert('LO Doc No cannot be empty!');
			return;
		}
	
		var tbody = document.getElementById("lineItemTable").tBodies[0];
		if(tbody.rows.length == 0)
		{
			alert('No Item to be planned,u cant make any new sequence!');
			return;
		}

		var date = dojo.widget.byId('date').getValue();

		if( date == null ||  date == '')
		{
			alert("Date cant be empty!");
			return;
		}
	
		//var x = new Date("<fmt:formatDate value='${plan.loadingOrder.validTo}' pattern='yyyy'/>","<fmt:formatDate value='${plan.loadingOrder.validTo}' pattern='MM'/>","<fmt:formatDate value='${plan.loadingOrder.validTo}' pattern='dd'/>");
		//var y = new Date(date.substring(6,10),date.substring(3,5),date.substring(0,2));
		//
		//if(y.getTime() > x.getTime())
		//{
		//	alert("Date can not greater than <fmt:formatDate value='${plan.loadingOrder.validTo}' pattern='dd-MM-yyyy'/>");
		//	return;
		//}
		
		var tbl = document.getElementById("lineItemTable");
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
			
		for(var idx=len-1;idx>=0;idx--)
		{
			var quan = t_section.rows[idx].cells[1].firstChild.value;
			var hid = t_section.rows[idx].cells[4].firstChild.value;

			if(quan && hid && parseFloat(quan) > parseFloat(hid))
			{
				alert("Quantity cant greater than "+hid);
				return;
			}
		}
		
		LoadingOrderPlanDWRRemote.exist(dojo.byId('no').value,function(data)
		{
			if(data == false || data == 'false')
			{
				document.addForm.action = "<c:url value='/page/loadingorderplanadd.htm'/>";
				document.addForm.submit();
			}
			else
			{
				alert('Loading Order Doc No '+dojo.byId('no').value+" already exist!");
				return;
			}
		});
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>