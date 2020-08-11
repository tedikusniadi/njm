<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PDI Motor >> Update</title>
	<%@ include file="/common/sirius-header.jsp" %>
		<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
			@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
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
			<td width="60%">Inventory > Warehouse Management > PDI Motor > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I25 - PDI Motor</h1>

							<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptitemverificationview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
							<a class="item-button-print" href="<c:url value='/page/goodsreceiptitemverificationprint.htm?id=${verification.id}'/>"><span>Print</span></a>
							</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification">
								<table width="100%" style="border:none">
								<tr>
									<td width="53%">
											<table width="100%" style="border:none">
												<tr>
													<td width="26%" nowrap="nowrap" align="right">ID :</td>
													<td width="74%"><input value="${verification.code}" class='input-disabled' size='25' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">No.PDI :</td>
													<td><input value="Auto" class='input-disabled' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">Tipe :</td>
													<td><input value="${verification.goodsReceiptItemDetail.goodsReceiptItem.product.types}" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">Name Tipe :</td>
													<td><input value="${verification.goodsReceiptItemDetail.goodsReceiptItem.product.typeNames}" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">Warna :</td>
													<td><input value="${verification.goodsReceiptItemDetail.goodsReceiptItem.product.colors}" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">No.Mesin :</td>
													<td><input value="${verification.goodsReceiptItemDetail.serial}" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">No.Rangka :</td>
													<td><input value="${verification.goodsReceiptItemDetail.serialExt1 }" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">Tanggal PDI :</td>
													<td><input value="<fmt:formatDate value='${verification.date}' pattern='dd-MM-yyyy'/>" disabled class="input-disabled"/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right">PDI Man :</td>
													<td><input value="${activerole.name}" class='input-disabled' size='30' disabled/></td>
												</tr>
												<tr>
													<td nowrap="nowrap" align="right" valign="top">Keterangan :</td>
													<td><textarea path="note" cols="30" rows="4" class='input-disabled'>${verification.note}</textarea></td>
												</tr>
											</table>
										</td>
								</tr>
								</table>
								<br/>
								<div>
								<table width="80%">
									<c:forEach items="${terms}" var="term" varStatus="status">
										<c:if test="${status.index%2==0}"><tr></c:if>
											<td>
												<c:if test="${term.name!=' '}"><input type="checkbox" disabled ${term.status}/><span>${term.name}</span></c:if>
											</td>
										<c:if test="${status.index%2==1}"></tr></c:if>
									</c:forEach>
								</table>
								</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${verification.createdBy.firstName} ${verification.createdBy.middleName} ${verification.createdBy.lastName}'/> (<fmt:formatDate value='${verification.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${verification.updatedBy.firstName} ${verification.updatedBy.middleName} ${verification.updatedBy.lastName}'/> (<fmt:formatDate value='${verification.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>

</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptitemverificationadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptitemverificationview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>
