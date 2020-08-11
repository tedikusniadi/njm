<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter AP >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/requestableintertransactionrequisitionadd.htm'/>";
			document.addForm.submit();
		}
		
		function openapprover()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupintertransactionrequisitionapproverview.htm?target=approver&organization='/>"+org.value);
		}
		
		function showerror()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter AP > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F41 - Inter AP</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/requestableintertransactionrequisitionview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="transaction_add">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="21%" align="right">ID :</td>
                                    <td width="79%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Requisition ID :</td>
                                    <td width="79%"><input disabled size="30" class="input-disabled" value="${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.code}"/></td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Acknowledgement ID :</td>
                                    <td width="79%"><input disabled size="30" class="input-disabled" value="${transaction_add.acknowledgementDetail.acknowledgement.code}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">From Company :</td>
                      				<td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                        	<c:if test='${not empty transaction_add.from}'>
                                            	<option value="${transaction_add.from.id}"><c:out value='${transaction_add.from.firstName} ${transaction_add.from.middleName} ${transaction_add.from.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">To Company :</td>
                      				<td>
                                        <form:select id="to" path="to" cssClass="combobox-ext" disabled='true'>
                                        	<c:if test='${not empty transaction_add.to}'>
                                            	<option value="${transaction_add.to.id}"><c:out value='${transaction_add.to.firstName} ${transaction_add.to.middleName} ${transaction_add.to.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Person in Charge :</td>
                                    <td>
                                        <select class="combobox-ext" disabled>
                                            <c:if test='${not empty transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner}'>
                                                <option><c:out value='${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.firstName} ${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.lastName} ${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.requisitioner.middleName}'/></option>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Name :</td>
                                    <td width="79%"><form:input path='name' size='50'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Approver :</td>
                                    <td>
                                        <form:select id="approver" path="approver" cssClass="combobox-ext">
                                            <c:if test='${not empty transaction_add.approver}'>
                                                <form:option value='${transaction_add.approver.id}' label='${transaction_add.approver.firstName} ${transaction_add.approver.lastName} ${transaction_add.approver.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                    </td>
                                </tr>
                                <tr>
									<td width="21%" align="right">Max Transaction Amount :</td>
									<td width="79%"><input size="20" class="input-disabled" disabled value="<fmt:formatNumber value='${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.maxAmount}' pattern=',##0.00'/>"/></td>
								</tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                    <td>
                                        <form:select id='currency' path='currency' disabled='true'>
                                            <form:option value='${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.currency.id}' label='${transaction_add.acknowledgementDetail.acknowledgement.acknowledgable.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType' disabled='true'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                    </td>
                                </tr>
								<tr>
									<td width="21%" align="right">Note :</td>
									<td width="79%"><form:textarea path='note' cols='45' rows='6'/></td>
								</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>
