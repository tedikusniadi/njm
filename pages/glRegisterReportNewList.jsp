<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%@ include file="/common/tld-spring.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/assets/goodsReceipt.css'/>");
    </style>
    
    <style type="text/css" media="print">
		@import url("<c:url value='/assets/goodsReceipt.css'/>");
    </style>
	<script type="text/javascript">	
		function printPage(){print();}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
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
				<td width="60%">${breadcrumb }</td>
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
							<a class="item-button-back" href="<c:url value='/page/glregisterreportnewpre.htm'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							<a class="item-button-export-xls" download="glregisterreportexcelview.xls" href="#" onclick="return ExcellentExport.excel(this, 'size', 'GL Register');"><span>Export</span></a>
						</div>
					</div>
					<div id="progressbar" style="display:none;"><div class="progress-label"></div></div>
						<div class="main-box">
							<div class="main_container">
								<%@ include file="glRegisterReportNewPrint.jsp" %>
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
<script src="<c:url value='/js/loading.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" language="javascript">
	$(function(){

		$(window).load(function() {
			$('.glbody').each(function() {
				$id = $(this).attr('id');

				if($id)
				{
					$.ajax({
						url:"<c:url value='/page/glregisterreportjson.htm'/>",
						data:{account:$id},
						type : 'POST',
						async: true,
						beforeSend : function() {
							// should place loading bar but not accurately loading? strange behaviour
						},
						success : function(json) {
							$tbody = $(document.getElementById(json.id));

							if(!jQuery.isEmptyObject(json.register))
							{
								var opening = '<tr><td colspan="7"><strong>{{account}}</strong></td></tr><tr>'+
								    '<td>&nbsp;</td>'+
								    '<td colspan="4"><strong>Opening Balance</strong></td>'+
								    '<td align="right"><strong>{{debet}}</strong></td>'+
								    '<td align="right"><strong>{{credit}}</strong></td>'+
								    '<td align="right"><strong>{{balance}}</strong></td>'+
								'</tr>';
								
								var detail = '<tr valign="top">'+
								    '<td align="left" nowrap="nowrap">{{date}}</td>'+
								    '<td colspan="2"><a href="<c:url value='/page/journalentrypreview.htm?id={{id}}'/>">{{code}}</a></td>'+
								    '<td width="33%">{{note}}</td>'+
								    '<td width="5%" nowrap="nowrap">{{department}}</td>'+
								    '<td align="right">{{debet}}</td>'+
								    '<td align="right">{{credit}}</td>'+
								    '<td align="right">{{balance}}</td>'+
								'</tr>';

								var closing = '<tr>'+
								    '<td>&nbsp;</td>'+
								    '<td colspan="4"><strong>Closing Balance</strong></td>'+
								    '<td align="right" class="border-top"><strong>{{debet}}</strong></td>'+
								    '<td align="right" class="border-top"><strong>{{credit}}</strong></td>'+
								    '<td align="right" class="border-top"><strong>{{balance}}</strong></td>'+
								'</tr>'+
								'<tr colspan="7"><td>&nbsp;</td></tr>';
	
								$balance = json.register.balance;
								$debet = json.register.debet;
								$credit = json.register.credit;
			
								$tbody.append(opening.compose({
									'account': json.register.account,
									'debet': $debet.numberFormat('#,#.00'),
									'credit': $credit.numberFormat('#,#.00'),
									'balance': $balance < 0 ? '('+($balance*-1).numberFormat('#,#.00')+')'  : $balance.numberFormat('#,#.00')
								}));
								
								$.each(json.register.details,function(idx,obj){
									$balance = $balance + obj.debet - obj.credit;
									$debet = $debet + obj.debet;
									$credit = $credit + obj.credit;
									//$deptIndex = $('#departmentTable tbody tr td div a:contains("' + obj.indexName + '")').closest("tr").index();
									//$deptCode = $("#departmentTable tr:eq(" + $deptIndex + ") td:eq(0)").text();
									$deptCode = $('#'+obj.indexName).html();
									
									$tbody.append(detail.compose({
									    'id': obj.id,
									    'date': obj.date,
									    'code': obj.code,
									    'note': obj.note,
									    'department': $deptCode ? $deptCode:'',
									    'debet': obj.debet > 0 ? obj.debet.numberFormat('#,#.00') : '',
									    'credit': obj.credit > 0 ? obj.credit.numberFormat('#,#.00') : '',
									    'balance': $balance < 0 ? '('+($balance*-1).numberFormat('#,#.00')+')'  : $balance.numberFormat('#,#.00')
									}));
								});
								
								$tbody.append(closing.compose({
									'debet': $debet.numberFormat('#,#.00'),
									'credit': $credit.numberFormat('#,#.00'),
									'balance': $balance < 0 ? '('+($balance*-1).numberFormat('#,#.00')+')'  : $balance.numberFormat('#,#.00')
								}));
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
