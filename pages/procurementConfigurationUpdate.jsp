<%@ include file="/common/tld-common.jsp"%>


<div class="toolbar">
	<a class="item-button-save" href="javascript:document.editForm.submit();"><span>Save</span></a>
</div>
<div class="main-box" style="height:370px">
	<form:form id="editForm" name="editForm" action="page/configurationassistanceprocurementeditconfig.htm" method="post" modelAttribute="procurementConfiguration">
		<table style="border:none">
		<tr>
			<td width="159"><div align="right">Default Supplier Setting :</div></td>
	  		<td width="97">
            	<form:radiobutton path="enabled" value="true" label="On"/>
            	&nbsp;
				<form:radiobutton path="enabled" value="false" label="Off"/>
            </td>
		  	<td>
				<c:if test='${procurementConfiguration.enabled}'>
					<a href="javascript:displayContent('page/configurationassistanceprocurementsupplierview.htm');"><font color="#FF0000"><u>Supplier Setting</u></font></a>
				</c:if>
			</td>
		</tr>
		</table>
	</form:form>
</div>