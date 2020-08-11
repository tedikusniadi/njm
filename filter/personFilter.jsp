<script type="text/javascript" language="javascript">
	function searchs()
	{
		var url = "<c:url value='/page/personListView.htm?mode=search'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}
			
	function resets()
	{
	    document.getElementById("employeeId").value = "";
		document.getElementById("firstName").value = "";
		document.getElementById("gender").value = "0";
		document.getElementById("officeCode").value = "0";
		document.getElementById("employmentStatus").value = "0";
								
		var url = "<c:url value='/page/personListView.htm'/>";
		document.filterForm.action = url;
		document.filterForm.submit();
	}			
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 50%; height: 250px; left: 300px; display:none;" toggle="explode" bg>
<form id="filterForm" name="filterForm" method="post">
<table width="100%" cellspacing="0" cellpadding="0" align="right">
<tr>
	<td width="143" align="right">Employee ID</td>
	<td width="4">:</td>
	<td width="345"><input type="text" id="employeeId" name="employeeId" size="50" /></td>
</tr>
<tr>
	<td align="right">Employee Name</td>
	<td>:</td>
	<td width="345" height="28"><input name="text" type="text" id="firstName" name="firstName"  size="50"/></td>
</tr>
<tr>
	<td align="right">Gender</td>
	<td>:</td>
	<td valign="top" height="28">
		<select name="gender" id="gender">
			<option value="0" selected>-- Gender --</option>
			<option value="M">Male</option>
			<option value="F">Female</option>
		</select>
	</td>
</tr>
<tr>
	<td align="right">Office Code</td>
	<td>:</td>
	<td width="345">
		<select id="officeCode" name="officeCode" height="28">
			<option value="0" selected>-- Office Code --</option>
			<c:forEach items="${data.officeList}" var="cF">
				<option value="<c:out value='${cF.id}'/>"><c:out value='${cF.code}'/> - <c:out value='${cF.name}'/></option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td align="right">Employment Status</td>
	<td>:</td>
	<td width="345">
		<select id="employmentStatus" name="employmentStatus" height="28">
			<option value="0" selected>-- Employment Status --</option>
			<option value="A">Active</option>
			<option value="I">Inactive</option>
		</select>
	</td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
	<td colspan="2">&nbsp;</td>
	<td align="left">
		<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchs();" class="btn"/>
		<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resets();" class="btn"/>
	</td>
</tr>
</table>
</form>
</div>
