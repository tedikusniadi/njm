<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="editForm" name="editForm" action="page/configurationassistancejournalentryconfigedit.htm" method="post" modelAttribute="journalEntryConfiguration">
		<table style="border:none">
		<tr>
			<td width="159"><div align="right">Journal Entry Index :</div></td>
	  		<td width="97">
            	<input type="checkbox" <c:if test='${journalEntryConfiguration.journalEntryIndex}'>checked</c:if> >On</input>
				&nbsp;
				<input type="checkbox" <c:if test='${!journalEntryConfiguration.journalEntryIndex}'>checked</c:if> >Off</input>
            </td>
		  	<td width="399">&nbsp;</td>
		</tr>
		<tr>
			<td><div align="right">Journal Entry Distribution :</div></td>
			<td>
				<input type="checkbox" <c:if test='${journalEntryConfiguration.journalDistribution}'>checked</c:if> >On</input>
				&nbsp;
				<input type="checkbox" <c:if test='${!journalEntryConfiguration.journalDistribution}'>checked</c:if> >Off</input>
			</td>
			<td>
				<c:if test='${journalEntryConfiguration.journalDistribution}'>
					<a href="javascript:displayContent('page/configurationassistancedistributionedit.htm');"><font color="#FF0000">Distribution Setting</font></a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td><div align="right">Journal Entry Batching :</div></td>
			<td>
				<form:select path="batchingType">
					<form:option value="NONE">NONE</form:option>
					<form:option value="ALL">ALL</form:option>
					<form:option value="CUSTOM">CUSTOM</form:option>
				</form:select>
			</td>
			<td>
				<c:if test="${journalEntryConfiguration.batchingType == 'CUSTOM'}">
					<a href="javascript:displayContent('page/configurationassistancebatchedit.htm');"><font color="#FF0000">Bathing Setting</font></a>
				</c:if>
			</td>
		</tr>
		</table>
	</form:form>
</div>