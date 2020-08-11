<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-back" href="javascript:displayContent('page/configurationassistancejournalentryconfig.htm');"><span>Back</span></a>
	<a class="item-button-add-gl-child" href="javascript:displayContent('page/configurationassistancedistributionpreadd.htm?id=${journalEntryConfiguration.id}');"><span>New Distribution Source</span></a>
</div>
<div class="main-box" style="height: 370px;">
	<table width="968" cellpadding="0" cellspacing="0" class="table-list" align="center">
	<tr>
		<th width="45">&nbsp;</th>
		<th width="373">Organization</th>
		<th width="548">Note</th>
	</tr>
	<c:forEach items="${journalEntryConfiguration.distributionSources}" var="distribution">
	<tr>
		<td><a href="<c:url value='/page/configurationassistancedistributiondelete.htm?id=${distribution.id}'/>"><img src="<c:url value='/images/delete.gif'/>" width="16" height="16" align="left" border="0"></a></td>
		<td>${distribution.organization.firstName} ${distribution.organization.middleName} ${distribution.organization.lastName}</td>
		<td>${distribution.note}</td>
	</tr>
	</c:forEach>
	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
	</table>
</div>