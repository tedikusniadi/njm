<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-back" href="<c:url value='/page/bankreconciliationpreadd1.htm'/>"><span><spring:message code='back'/></span></a>
                            <c:if test='${access.add}'>
								<a id="save" class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="reconciliation_add">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">Code :</td>
                                       	  	<td width="71%"><input value="Auto Generated" class='input-disabled' size='25' disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Organization :</td>
                                            <td>
                                                <select id="org" class="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${reconciliation_add.organization.id}'>${reconciliation_add.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatDate value='${reconciliation_add.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Account :</td>
                                            <td>
                                                <select id="org" class="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${reconciliation_add.bankAccount.id}'>${reconciliation_add.bankAccount.bankName}</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                <div id="line" dojoType="ContentPane" label="Detail" class="tab-pages" refreshOnShow="true">
                                    <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                                        <th width="8%">Date</th>
                                        <th width="15%">Description</th>
                                      	<th width="8%" align="right">Debet</th>
                                      	<th width="8%" align="right">Credit</th>
                                      	<th width="12%" align="right">Ref No</th>
                                      	<th width="50%" align="right">Journal Entry No</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${reconciliation_add.details}" var="det" varStatus="status">
                                    <tr>
                                    	<td><input value="<fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/>" disabled size="10" class='input-disabled'/></td>
                                    	<td><input value="${det.description}" size="50" disabled class='input-disabled'/></td>
                                    	<td><input value="<fmt:formatNumber value="${det.postingType eq 'DEBET' ? det.amount : 0}" pattern='#,###'/>" size="15" disabled class='input-disabled'/></td>
                                    	<td><input value="<fmt:formatNumber value="${det.postingType eq 'CREDIT' ? det.amount : 0}" pattern='#,###'/>" size="15" disabled class='input-disabled'/></td>
                                    	<td><input value="${det.reference}" size="20" disabled class='input-disabled'/></td>
                                    	<td>
                                    		<select id="journalEntry${status.index}" name="details[${status.index}].journalEntry" class="combobox-medium entries">
                                            	<option value='${det.journalEntry.id}'>${det.journalEntry.code}</option>
											</select>
	                                        <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openJournalEntry('journalEntry${status.index}', '${status.index}');" style="CURSOR:pointer;" title="Organization" />
                                    	</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                    </table>
                                </div>
                            	</div>
							</form:form>
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
<script type="text/javascript">
	$(function(){
		$('#save').click(function(){
			if(validation())
			{
				$('#save').hide();
				$.ajax({
					url:"<c:url value='/page/bankreconciliationadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Bank Reconciliation data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/bankreconciliationview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	function validation()
	{
		return true;
	}
	
	function openJournalEntry(target, index)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/bankreconciliationjournalpopup.htm?organization='/>"+org.value+"&target="+target+"&index="+index+"&date=<fmt:formatDate value='${reconciliation_add.date}' pattern='dd-MM-yyyy'/>&accountId=${reconciliation_add.bankAccount.account.id}");
	}
</script>