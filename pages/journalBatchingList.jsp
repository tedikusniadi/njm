<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Journal Entry Batching List</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/journalEntryBatchingFilter.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
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
			<td width="60%">Financial Accounting > Journal Entry Batching</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">F60 - Journal Entry Batching</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<c:if test='${access.add}'>
											<a class="item-button-new" href="javascript:post();"><span>Post Selected</span></a>
										</c:if>
										<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
										<a class="item-button-print" href="<c:url value='/page/journalBatchingPrint.htm'/>"><span>Print</span></a>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
						<form id="addForm" name="addForm" method="post">
							<table class="table-list" cellspacing="0" cellpadding="0" width="100%" id="lineItemTable">
							<thead>
							<tr>
                              	<th width="1%" align="center"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></th>
                              	<th align="center">Date</th>
                                <th align="center">Period</th>
                                <th align="center">Organization</th>
                              	<th width="10%" align="center">Department</th>
                              	<th align="center">Name/Journal</th>
                              	<th align="center">Debet</th>
                                <th align="center">Credit</th>
                                <th align="center">Currency</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${journalEntrys}" var="journalBatching" varStatus="status">
							<c:set var="department" value="-"/>
							<c:forEach items="${journalBatching.indexes}" var="index">
								<c:if test="${index.indexType.id == '9'}">
									<c:set var="department" value="${index.content}"/>
								</c:if>
							</c:forEach>
							<tr>
							  	<td align="center"><input type="checkbox" id="cek[${status.index}]" name="ids" value="${journalBatching.id}"/></td>
								<td nowrap="nowrap" valign="middle"><fmt:formatDate value='${journalBatching.entryDate}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;</td>
						  	  	<td nowrap="nowrap" valign="middle"><c:out value='${journalBatching.accountingPeriod.code}'/>&nbsp;&nbsp;</td>
						  	 	<td nowrap="nowrap" align="left"><c:out value='${journalBatching.organization.firstName}'/> <c:out value='${journalBatching.organization.middleName}'/> <c:out value='${journalBatching.organization.lastName}'/>&nbsp;&nbsp;</td>
						  	 	<td align="left"><c:out value='${department}'/>&nbsp;&nbsp;</td>
								<td align="left" colspan="4"><c:out value='${journalBatching.code} - ${journalBatching.name}'/>&nbsp;&nbsp;</td>
							</tr>
							<c:forEach items='${journalBatching.details}' var='item'>
							<tr>
								<div class="area" dojoType="Container" id="quick_link_container">
									<td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								</div>
								<td nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${item.account.code}'/>-<c:out value='${item.account.name}'/>&nbsp;&nbsp;-&nbsp;&nbsp;<c:out value='${item.note}'/></td>
						  		<td width="3%">
						  		<c:if test="${item.postingType == 'DEBET'}">
						  			<fmt:formatNumber value='${item.amount}' pattern=',#00.00'/>
						  		</c:if>
						  		</td>
						  		<td width="3%">
						  			<c:if test="${item.postingType == 'CREDIT'}">
                                    	<fmt:formatNumber value='${item.amount}' pattern=',#00.00'/>
                                    </c:if>
                                </td>
							  	<td width="5%"><c:out value='${journalBatching.currency.symbol}'/></td>
							</tr>
							</c:forEach>
							</c:forEach>
							</tbody>
							<tfoot>
							<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
							</tfoot>
							</table>
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                            <tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
                            </table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script language="javascript" type="text/javascript">
	function post()
	{
		document.addForm.action = "<c:url value='/page/journalBatchingUpdate.htm'/>";
		document.addForm.submit();
	}

	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			for(var idx=len-1;idx>=0;idx--){
				var cname="cek\\["+idx+"\\]";
				var $chk=$("#"+cname);
				if(!$chk.attr("disabled"))
				{
					if(checked)
						$chk.attr("checked",true);
					else
						$chk.removeAttr("checked");
				}
			}
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}
</script>
</body>
</html>
