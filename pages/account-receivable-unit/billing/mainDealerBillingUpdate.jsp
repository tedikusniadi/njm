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
	<%@ include file="/common/sirius-header.jsp"%>
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
                            <a class="item-button-list" href="<c:url value='/page/maindealerbillingview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
			    			<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/maindealerbillingprint.htm?id=${billing_edit.id}'/>"><span>Print</span></a>
			    			</c:if>
                        </div>
                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='billing_edit'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${billing_edit.code}" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${billing_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext input-disabled" disabled='true'>
                                                    <c:if test='${not empty billing_edit.organization}'>
                                                        <form:option value='${billing_edit.organization.id}' label='${billing_edit.organization.firstName} ${billing_edit.organization.lastName} ${billing_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Amount :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${billing_edit.amount}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Unpaid Amount :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${billing_edit.unpaid}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          	<td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="unitBilling" dojoType="ContentPane" label="Unit Billing" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="15%">No Billing</th>
                                            <th width="8%">Date</th>
                                            <th width="15%">No SPK</th>
                                            <th width="20%">Customer</th>
                                            <th width="10%">Amount</th>
                                            <th width="32%">Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${billing_edit.billingDetails}' var='billing'>
                                        <tr>
                                        	<td><c:out value='${billing.code}'/></td>
                                            <td><fmt:formatDate value='${billing.date}' pattern='dd-MM-yyyy'/></td>
                                        	<td><c:out value='${billing.unitSalesOrder.code}'/></td>
                                        	<td><c:out value='${billing.unitSalesOrder.customer.name}'/></td>
                                            <td><fmt:formatNumber value='${billing.amount}' pattern=',##0.00'/></td>
                                        	<td><c:out value='${billing.status}'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                	</div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${billing_edit.createdBy.firstName} ${billing_edit.createdBy.middleName} ${billing_edit.createdBy.lastName}'/> (<fmt:formatDate value='${billing_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${billing_edit.updatedBy.firstName} ${billing_edit.updatedBy.middleName} ${billing_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${billing_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Main Dealer Billing',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/maindealerbillingedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Main Dealer data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/maindealerbillingview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>
