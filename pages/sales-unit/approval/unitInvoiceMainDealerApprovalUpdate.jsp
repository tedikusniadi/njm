<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>${title}</title>
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

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/unitinvoicemaindealerapprovalview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save"><span>Save</span></a>
							<c:if test="${canExport and !dealer_edit.dealer}">
								<a class="item-button-export cddb"><span>CDDB</span></a>
								<a class="item-button-export udsls"><span>UDSLS</span></a>
								<a class="item-button-export udstk"><span>UDSTK</span></a>
							</c:if>
							<a class="item-button-print print"><span>Print</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="dealer_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Approval Code :</td>
                                          	<td width="73%">
                                          		<input value="${dealer_edit.code}" disabled class='input-disabled' size='25'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input id="date" value="<fmt:formatDate value='${dealer_edit.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td nowrap="nowrap" align="right">Note :</td>
                                            <td>
                                            	<textarea id="note" name="note" cols="29" rows="5">${dealer_edit.note}</textarea>
                                            </td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
									<thead>
									<tr>
		                                <th width="1%"><div style="width:65px"></div></th>
									  	<th width="15%">ID</th>
									  	<th width="9%">Date</th>
									  	<th width="20%">Nama Pemesan</th>
									  	<th width="20%">Nama STNK</th>
									  	<th width="10%">Distribusi</th>
									  	<th width="10%">Survey</th>
									  	<th width="10%">Always Honda</th>
									</tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${dealer_edit.details}" var="order">
									<tr>
										<td class="tools">
											<c:if test='${access.edit}'>
												<a class="item-button-edit" href="<c:url value='/page/unitinvoicemaindealerapprovaldetailpreedit.htm?id=${order.id}'/>" title="Edit"><span>Edit</span></a>
											</c:if>
											<c:if test='${access.print and not empty order.unitCondition and not empty order.approvalSurvey.personPosition and not empty order.approvalMember.name}'>
												<a class="item-button-print" href="<c:url value='/page/unitinvoicemaindealerapprovaldetailprintlabel.htm?id=${order.id}'/>" title="Print"><span>Print Label</span></a>
											</c:if>
											<c:if test="${empty order.unitSalesOrder.bbnDetail and order.unitSalesOrder.invoiced != 'INVOICED'}">
											<c:if test='${access.delete}'>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/unitinvoicemaindealerapprovaldetaildelete.htm?id=${order.id}'/>')" title="Delete"><span>Delete</span></a>
											</c:if>
											</c:if>
										</td>
										<td><c:out value='${order.unitSalesOrder.code}'/></td>
										<td><fmt:formatDate value="${order.unitSalesOrder.date}" pattern='dd-MM-yyyy'/></td>
										<td><c:out value="${order.unitSalesOrder.customer.name}"/></td>
										<td><c:out value="${order.unitSalesOrder.customerUnit.name}"/></td>
										<td><c:out value="${order.unitCondition != null ? 'YES':'NO'}"/></td>
										<td><c:out value="${order.approvalSurvey.personPosition != null ? 'YES':'NO'}"/></td>
										<td><c:out value="${order.approvalMember.name != null ? 'YES':'NO'}"/></td>
									</tr>
									</c:forEach>
		                            </tbody>
		                            <tfoot>
		                            	<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
		                            </tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${dealer_edit.createdBy.firstName} ${dealer_edit.createdBy.middleName} ${dealer_edit.createdBy.lastName}'/> (<fmt:formatDate value='${dealer_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${dealer_edit.updatedBy.firstName} ${dealer_edit.updatedBy.middleName} ${dealer_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${dealer_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Faktur Main Dealer Approval',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/unitinvoicemaindealerapprovaledit.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/unitinvoicemaindealerapprovalview.htm'/>";
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
	$(".udstk").click(function(){
		window.location="<c:url value='/page/unitsalesfile.udstk?id=${param.id}'/>";
	});
	$(".cddb").click(function(){
		window.location="<c:url value='/page/unitsalesfile.cddb?id=${param.id}'/>";
	});
	$(".udsls").click(function(){
		window.location="<c:url value='/page/unitsalesfile.udsls?id=${param.id}'/>";
	});
	$(".print").click(function(){
		window.location="<c:url value='/page/unitinvoicemaindealerapprovalprint.htm?id=${param.id}&begin=0&end=1'/>";
	});
});
</script>