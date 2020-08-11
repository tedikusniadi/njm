<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%@ include file="/common/tld-spring.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
</head>

<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">

	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
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
								<a class="item-button-back" href="<c:url value='/page/receiptrecapreportpreparenew.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" download="receiptrecapreport.xls" href="#" onclick="return ExcellentExport.excel(this, 'size', ' Pelunasan Kwitansi');"><span>Export</span></a>
					  		</div>
						</div>
						<div id="progressbar" style="display:none;"><div class="progress-label"></div></div>
						<div id="progress-start" class="progress-start"><img class="progress-start-content"/></div>
						<div class="main-box">
							<div class="main_container">
								<%@ include file="unitReceiptReportPrintNew.jsp" %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>
<script src="<c:url value='/js/loading.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" language="javascript">
$(function()
{
	$(window).load(function()
	{
		$('.detailBody').each(function()
		{
			$organizationId = $(this).attr('id');
			$type = '${receiptType}';
			$from = "<fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>";
			$to = "<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>";
			$gTotal = 0.00;

			if($organizationId)
			{
				progressstart();
				$.ajax({
					url:"<c:url value='/page/receiptrecapreportjson.htm'/>",
					data:{organizationReceipt:$organizationId,receiptType:$type,dateFrom:$from,dateTo:$to},
					type : 'POST',
					async: true,
					beforeSend : function() {
						// should place loading bar but not accurately loading? strange behaviour
					},
					success : function(json) {
						$tbody = $(document.getElementById(json.id));
						if(!jQuery.isEmptyObject(json.detail.details))
						{
							var org = '<tr valign="middle" style="height: 25px">'+
						    	'<td align="left" nowrap="nowrap" colspan="10" style="border-bottom:1px solid black;font-weight: bold;">{{org}}</td>'+
							'</tr>';
							
							var detail = '<tr valign="top">'+
							    '<td align="left" nowrap="nowrap"><a href="<c:url value='/page/receiptpreedit.htm?id={{receiptId}}'/>">{{code}}</a></td>'+
							    '<td align="left" nowrap="nowrap">{{date}}</td>'+
							    '<td align="left" nowrap="nowrap">{{type}}</td>'+
							    '<td align="left" nowrap="nowrap">{{sales}}</td>'+
							    '<td align="left" nowrap="nowrap">{{customer}}</td>'+
							    '<td align="left" nowrap="nowrap">{{address}}</td>'+
							    '<td align="left" nowrap="nowrap">{{phone}}</td>'+
							    '<td align="left" nowrap="nowrap">{{productType}}</td>'+
							    '<td align="left" nowrap="nowrap">{{leasing}}</td>'+
							    '<td align="right" nowrap="nowrap">{{amount}}</td>'+
							'</tr>';
							
							/* var subTotal = '<tr valign="top">'+
						    	'<td align="right" nowrap="nowrap" colspan="9" style="border-top:1px solid black;font-weight: bold;">Total</td>'+
						    	'<td align="right" nowrap="nowrap" style="border-top:1px solid black;font-weight: bold;">{{subTotal}}</td>'+
							'</tr>'; */
	
							$tTotal = 0.00;
							$receiptCode = '';

							$('.progress-start').remove();
							$tbody.append(org.compose({'org': json.detail.organization.name.toUpperCase()}));
							$.each(json.detail.details,function(idx,obj)
							{
								Loading.det = Loading.det+1;
								$tTotal = $tTotal + obj.paidAmount;
								$code = '';
								$date = '';
								$receiptType = '';
								
								if($receiptCode == '' || $receiptCode != obj.code)
								{
									$code = obj.code;
									$date = obj.date;
									$receiptType = obj.receiptType;
									$receiptCode = $code;
								}
								
								$tbody.append(detail.compose({
								    'receiptId': obj.receiptId,
								    'code': $code,
								    'date': $date,
								    'type': $receiptType,
								    'sales': obj.salesPersonName,
								    'customer': obj.customerName,
								    'address': obj.address,
								    'phone': obj.phone,
								    'productType': obj.productType,
								    'leasing': obj.leasingName,
								    'amount': obj.paidAmount.numberFormat('#,#')
								}));
							});
							
							$gTotal = $gTotal + $tTotal;
							
							$("#gTotal").text($gTotal.numberFormat('#,#'));
						}
						else
						{
							$tbody.remove();
						}
					},
					complete : function() {
						// should place loading bar but not accurately loading? strange behaviour
						Loading.init();
					}
				});
			}
		});
	});
});
</script>