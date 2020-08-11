<script type="text/javascript">
		function searchs()
		{
			var url = "<c:url value='/page/salesmanview.htm'/>";
			document.filterFormSalesman.action = url;
			document.filterFormSalesman.submit();
		}

		function resets()
		{
			var url = "<c:url value='/page/salesmanview.htm'/>";
			window.location = url;
		}

		function step(action)
		{
			var page="1";

			if(action == "next")
				page="${filterCriteria.nextPage}";
			else if(action == "prev")
				page="${filterCriteria.prevPage}";
			else if(action == "last")
				page="${filterCriteria.totalPage}";

			var url = "<c:url value='/page/salesmanview.htm?&page='/>"+page;
			document.filterFormSalesman.action = url;
			document.filterFormSalesman.submit();
		}
</script>
<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 35%; height: 300px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterFormSalesman" name="filterFormSalesman" method="post">
		<table width="100%" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<td align="right">ID</td>
			<td>:</td>
			<td><input id="code" name="code" value="${filterCriteria.code}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Nama</td>
			<td>:</td>
			<td width="304" height="28"><input id="name" name="name" value="${filterCriteria.name}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Cabang</td>
			<td>:</td>
			<td width="304" height="28"><input id="cabang" name="cabang" value="${filterCriteria.cabang}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Jabatan</td>
			<td>:</td>
			<td width="304" height="28"><input id="jabatan" name="jabatan" value="${filterCriteria.jabatan}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Atasan</td>
			<td>:</td>
			<td width="304" height="28"><input id="atasan" name="atasan" value="${filterCriteria.atasan}" size="35" /></td>
		</tr>
		<tr>
			<td align="right">Aktif</td>
			<td>:</td>
			<td width="304" height="28">
				<c:if test="${empty filterCriteria.active}">
					<c:set var="aktDef" value="selected"/>
					<c:set var="aktTrue" value=""/>
					<c:set var="aktFalse" value=""/>
				</c:if>
				<c:if test="${not empty filterCriteria.active}">
					<c:if test="${filterCriteria.active}">
						<c:set var="aktDef" value=""/>
						<c:set var="aktTrue" value="selected"/>
						<c:set var="aktFalse" value=""/>
					</c:if>
					<c:if test="${!filterCriteria.active}">
						<c:set var="aktDef" value=""/>
						<c:set var="aktTrue" value=""/>
						<c:set var="aktFalse" value="selected"/>
					</c:if>
				</c:if>
           		
	           	<select id='aktif' name='active'>
	           		<option value="" ${aktDef}></option>
	           		<option value="true" ${aktTrue}>Ya</option>
	           		<option value="false" ${aktFalse}>Tidak</option>
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
