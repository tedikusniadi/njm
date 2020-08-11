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
    <%@ include file="/common/popup.jsp"%>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
    <script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/page/dwrService/interface/AccountingPeriodDWRRemote.js'/>"></script>
	<script type="text/javascript" src="js/list.js"></script>
	<script type="text/javascript" language="javascript">
		function displayContent(url)
		{
			var listPane = dojo.widget.getWidgetById("listPane");
			listPane.setUrl(url);
		}

		function redirectTo(url)
		{
			window.location = url;
		}
		
		function popup(target)
		{
			var coa = document.getElementById('coax');
			if(!coa && !coa.value)
			{
				alert('Please select valid Chart of Account first!');
				return;
			}
		
			openpopup("<c:url value='/page/popupglaccountview.htm?coa='/>"+coa.value+"&target="+target);
		}
		
		function openpopopup(id)
		{
			openpopup("<c:url value='/page/popupstandardpurchaseorder4assetview.htm?organization='/>"+id);
		}

		function save()
		{
			document.editForm.action = "<c:url value='/page/fixedAssetGroupUpdate.htm'/>";
			document.editForm.submit();
		}
	</script>
	<script language="javascript" type="text/javascript">
	function populates()
	{
		<c:forEach items='${data.companyFacilitys}' var='companyFacility'>
			var assets = document.getElementById('${companyFacility.id}-assets');
			if(assets != null)
			{
				HTMLUtil.add(assets,'--- Asset ---','0-0-0-0',true);
			
				<c:forEach items='${data.schemas}' var='schema'>
					if('${schema.id}' == document.getElementById("accountingSetting").value)
					{
						<c:forEach items='${schema.chartOfAccount.glAccounts}' var='account'>
							<c:if test='${account.level.id == 1}'>
								HTMLUtil.add(assets,'${account.accountNumber} - ${account.name}','4-${companyFacility.id}-${account.id}-${schema.id}',false);
							</c:if>
						</c:forEach>
					}
				</c:forEach>
			}
			
			var depreciations = document.getElementById('${companyFacility.id}-depreciations');
			if(depreciations != null)
			{
				HTMLUtil.add(depreciations,'--- Asset Depreciation ---','0-0-0-0',true);
				<c:forEach items='${data.schemas}' var='schema'>
					if('${schema.id}' == document.getElementById("accountingSetting").value)
					{
						<c:forEach items='${schema.chartOfAccount.glAccounts}' var='account'>
							<c:if test='${account.level.id == 1}'>
								HTMLUtil.add(depreciations,'${account.accountNumber} - ${account.name}','5-${companyFacility.id}-${account.id}-${schema.id}',false);
							</c:if>
						</c:forEach>
					}
				</c:forEach>
			}
			
			var accumulatives = document.getElementById('${companyFacility.id}-accumulatives');
			if(accumulatives != null)
			{
				HTMLUtil.add(accumulatives,'--- Accumulative Depreciation ---','0-0-0-0',true);
			
				<c:forEach items='${data.schemas}' var='schema'>
					if('${schema.id}' == document.getElementById("accountingSetting").value)
					{
						<c:forEach items='${schema.chartOfAccount.glAccounts}' var='account'>
							<c:if test='${account.level.id == 1}'>
								HTMLUtil.add(accumulatives,'${account.accountNumber} - ${account.name}','6-${companyFacility.id}-${account.id}-${schema.id}',false);
							</c:if>
						</c:forEach>
					}
				</c:forEach>
			}
			
			var disposals = document.getElementById('${companyFacility.id}-disposals');
			if(disposals != null)
			{
				HTMLUtil.add(disposals,'--- Gain Loss on Disposal ---','0-0-0-0',true);
				
				<c:forEach items='${data.schemas}' var='schema'>
					if('${schema.id}' == document.getElementById("accountingSetting").value)
					{
						<c:forEach items='${schema.chartOfAccount.glAccounts}' var='account'>
							<c:if test='${account.level.id == 1}'>
								HTMLUtil.add(disposals,'${account.accountNumber} - ${account.name}','7-${companyFacility.id}-${account.id}-${schema.id}',false);
							</c:if>
						</c:forEach>
					}
				</c:forEach>
			}
		</c:forEach>
	}
	</script>
	<script language="javascript" type="text/javascript">
	function activate(id)
	{
		if(id == 1)
		{
			document.getElementById("usefulLife").disabled = false;
			document.getElementById("decliningBalanceRate").disabled = true;
		}
		else if(id == 2)
		{
			document.getElementById("usefulLife").disabled = true;
			document.getElementById("decliningBalanceRate").disabled = false;
		}
		else
		{
			document.getElementById("usefulLife").disabled = true;
			document.getElementById("decliningBalanceRate").disabled = true;
		}
	}
	
	function dispose(id)
	{
		var date = dojo.widget.byId('disposeDate');
		if(date.getValue() == null || date.getValue() == '')
		{
			alert("Dispose Date can not be empty!");
			return;
		}
		
		var _event = function(data)
		{
			if(data.id != null)
			{
				var period = document.getElementById('period');
				if(period)
					period.value = data.id;

				document.editForm.action = "<c:url value='/page/fixedAssetUpdate.htm'/>";
				document.editForm.submit();
			}
			else
				alert('Accounting Period doesnot exist or already closed!');
		}
		
		AccountingPeriodDWRRemote.load(date.getValue(),id,_event);
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
			<td width="60%">${breadcrumb}</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>


	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents" style="height:460px;">
							<div dojoType="SplitContainer" style="width: 100%; height: 460px;" orientation="horizontal" sizerWidth="5" activeSizing="0"	layoutAlign="client">
								<div id="treePane" dojoType="Tree" toggle="wipe" toggleDuration="500" sizeMin="20" sizeShare="2">
									<div dojoType="TreeNode" title="Fixed Asset" expandLevel="2"  onTitleClick='redirectTo("page/fixedAssetGroupView.htm");' childIconSrc="assets/icons/coa-parent.gif">
										<c:forEach items="${groups}" var="parent">
											<div dojoType="TreeNode" onTitleClick='displayContent("page/fixedAssetGroupPrepareUpdate.htm?id=${parent.id}");' title="${parent.name}" childIconSrc="assets/icons/group.gif">
												<c:forEach items='${parent.assets}' var='asset'>				
													<div dojoType="TreeNode" onTitleClick='displayContent("page/fixedAssetPrepareUpdate.htm?id=${asset.id}");' title="${asset.code} - ${asset.name}" childIconSrc="assets/icons/child.png">
													</div>
												</c:forEach>
											</div>											
										</c:forEach>
									</div>
								</div>
								<div id="listPane" dojoType="ContentPane" style="padding:5px;width:100%;height:430px;" refreshOnShow="true" doLayout="true" overFlow="true">
									<div class="toolbar">
											<a class="item-button-add-gl-child" href="javascript:displayContent('page/fixedAssetGroupPrepareAdd.htm');"><span>New Category</span></a>
										</div>					  
										<div class="main-box" style="height: 400px; overflow:auto">
											<form id="accPGForm" name="accPGForm" method="post">  
											<table width="968" cellpadding="0" cellspacing="0" class="table-list" align="center">
											<tr>
												<th width="259">Category Name</th>
												<th width="372">Note</th>
												<th width="335">Accounting Schema</th>	
											</tr>
											<c:forEach items="${groups}" var="group">
											<tr>
												<td>${group.name}</td>
												<td>${group.note}</td>
												<td>${group.accountingSchema.name}</td>
											</tr>
											</c:forEach>
											<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
				  							</table>
				  							</form>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>

</body>
</html>
