<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Standard Purchase Order Popup >> Popup</title>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code)
		{
			if(id && code)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = code;
					
					_client.appendChild(_opt);
				}
			}
			
			if(self.opener.loadReferences)
				self.opener.loadReferences(id);
			
			window.close();
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
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
			  		  	  	<th width="4%"><div style="width:10px"></div></th>
		  		  	  	  	<th width="22%">PO</th>
                          	<th width="12%">Date</th>
                       	  	<th width="35%">Supplier</th>
                          	<th width="15%">Price</th>
                          	<th width="12%">Currency</th>
				  		</tr>
						<c:forEach items="${orders}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.requisition.purchaseOrder.id}','${com.requisition.purchaseOrder.code}')" title="Edit"><span>Edit</span></a>
					  		</td>
							<td><c:out value='${com.requisition.purchaseOrder.code}'/></td>
                            <td><fmt:formatDate value='${com.requisition.purchaseOrder.date}' pattern='dd-MM-yyyy'/></td>
                            <td><c:out value='${com.requisition.purchaseOrder.supplier.name}'/></td>
					  		<td><fmt:formatNumber value='${com.purchase}' pattern=',##0.00'/></td>
                            <td><c:out value='${com.requisition.purchaseOrder.currency.symbol}'/></td>
                        </tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
					  	</table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>

</html>