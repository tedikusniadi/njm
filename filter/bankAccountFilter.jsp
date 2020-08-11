<script type="text/javascript" language="javascript">
			function searchs()
			{
				var url = "<c:url value='/page/bankaccountview.htm'/>";
				document.filterForm.action = url;
				document.filterForm.submit();
			}
			
			function resets()
			{
 			    window.location = "<c:url value='/page/bankaccountview.htm'/>";
			}
			
			function step(action)
			{
				var page="1";
				
				if(action == "next")
					page="<c:out value='${filterCriteria.nextPage}'/>";
				else if(action == "prev")
					page="<c:out value='${filterCriteria.prevPage}'/>";
				else if(action == "last")
					page="<c:out value='${filterCriteria.totalPage}'/>";					
				
				var url = "<c:url value='/page/bankaccountview.htm?page='/>"+page;
				document.filterForm.action = url;
				document.filterForm.submit();
			}
		</script>
	<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true"
						 	 style="width: 45%; height: 250px; left: 350px; display:none;" toggle="explode" bg>
		<form id="filterForm" name="filterForm" method="post">
					<table width="100%" cellspacing="0" cellpadding="0" align="right">
					<tr>
										<td align="right" style="WIDTH:130px;">ID &nbsp;</td>
										<td width="4">:&nbsp;</td>
										<td width="310" height="28">
										<input type="text" id="code" name="code" value="${filterCriteria.code}" size="50" class="inputbox" /></td>
									</tr>
									<tr>
										<td align="right" style="WIDTH:130px;">Account Name &nbsp;</td>
										<td>:</td>
										<td width="310" height="28">
										<input type="text" id="name" name="name" value="${filterCriteria.name}" size="50" class="inputbox" /></td>
									</tr>
									<tr>
										<td align="right" style="WIDTH:130px;">Bank Name &nbsp;</td>
										<td width="4">:</td>
										<td width="310" height="28"><input type="text" id="bank" name="bank" value="${filterCriteria.bank}" class="inputbox" /></td>
									</tr>
									<tr>
										<td align="right" style="WIDTH:130px;">Holder &nbsp;</td>
										<td width="4">:</td>
										<td width="310" height="28"><input type="text" id="holder" name="holder" value="${filterCriteria.holder}" class="inputbox" /></td>
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
