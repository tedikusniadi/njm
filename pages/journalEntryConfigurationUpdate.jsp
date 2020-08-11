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
            	<form:radiobutton path="journalEntryIndex" value="true" label="On"/>
            	&nbsp;
				<form:radiobutton path="journalEntryIndex" value="false" label="Off"/>
            </td>
		  	<td width="399">&nbsp;</td>
		</tr>
		<tr>
			<td><div align="right">Journal Entry Distribution :</div></td>
			<td>
            	<form:radiobutton path="journalDistribution" value="true" label="On"/>
            	&nbsp;
				<form:radiobutton path="journalDistribution" value="false" label="Off"/>
			</td>
			<td>
				<c:if test='${journalEntryConfiguration.journalDistribution}'>
					<a href="javascript:displayContent('page/configurationassistancedistributionview.htm');"><font color="#FF0000"><u>Distribution Setting</u></font></a>
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
					<a href="javascript:displayContent('page/configurationassistancebatchedit.htm');"><font color="#FF0000"><u>Bathing Setting</u></font></a>
				</c:if>
			</td>
		</tr>
		</table>
	</form:form>
</div>