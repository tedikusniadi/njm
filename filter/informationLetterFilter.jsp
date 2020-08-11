<script type="text/javascript">
			function searchs()
			{
				var comFasCode = document.getElementById("companyCode").value;
				var cstId = document.getElementById("customerId").value;
				var salesPersonId = document.getElementById("salesPersonId").value;				
				var letterNo = document.getElementById("letterNo").value;
				var dateFrom = document.getElementById("dateFrom").value;
				var dateTo = document.getElementById("dateTo").value;
						
				var param = "mode=search";
				param = param+"&comFas="+comFasCode;
				param = param+"&cutsomerId="+cstId;
				param = param+"&salesPersonId="+salesPersonId;
				param = param+"&letterNo="+letterNo;
				param = param+"&dateFrom="+dateFrom;				
				param = param+"&dateTo="+dateTo;
				var url = "<c:url value='/page/informationLetterView.htm?'/>"+param;
				document.filterForm.action = url;
				document.filterForm.submit();
			}
			
			function resets()
			{
 			    document.getElementById("companyCode").value = "0";
				document.getElementById("customerId").value = "";
				document.getElementById("salesPersonId").value = "";				
				document.getElementById("letterNo").value = "";
				document.getElementById("dateFrom").value = "";
				document.getElementById("dateTo").value = "";
				
				var url = "<c:url value='/page/informationLetterView.htm'/>";
				
				document.filterForm.action = url;
				document.filterForm.submit();
			}
			
			function step(action)
			{
				var comFasCode = document.getElementById("companyCode").value;
				var cstId = document.getElementById("customerId").value;
				var salesPersonId = document.getElementById("salesPersonId").value;				
				var letterNo = document.getElementById("letterNo").value;
				var dateFrom = document.getElementById("dateFrom").value;
				var dateTo = document.getElementById("dateTo").value;
				
				var page="1";
				
				if(action == "next")
					page="<c:out value='${data.filterCriteria.nextPage}'/>";
				else if(action == "prev")
					page="<c:out value='${data.filterCriteria.prevPage}'/>";
				else if(action == "last")
					page="<c:out value='${data.filterCriteria.totalPage}'/>";					
				
				var mode = "<c:out value='${data.mode}'/>";
				var param = "mode="+mode;
				param = param+"&page="+page;
				param = param+"&comFas="+comFasCode;
				param = param+"&cutsomerId="+cstId;
				param = param+"&salesPersonId="+salesPersonId;
				param = param+"&letterNo="+letterNo;
				param = param+"&dateFrom="+dateFrom;				
				param = param+"&dateTo="+dateTo;
				
				var url = "<c:url value='/page/informationLetterView.htm?'/>"+param;
				
				document.filterForm.action = url;
				document.filterForm.submit();
			}
	</script>	
	<div dojoType="FloatingPane" id="filter" title="Filter" constrainToContainer="true" style="width: 55%; height: 250px; left: 300px; display:none;" toggle="explode" bg>
	<form id="filterForm" name="filterForm" method="post">
					<table width="100%" cellspacing="0" cellpadding="0" align="right" border="0">
					<tr>
						<td width="168" align="right">Company Code&nbsp;&nbsp;</td>
									<td width="4">:&nbsp;</td>
									<td width="413" height="28">
									<select id="companyCode" name="companyCode" style="WIDTH:275px;" class="combobox">
									<option value="0" selected>-- Company Code --</option>
									<c:forEach items="${data.companyfacilitys}" var="cf">
										<option <c:if test="${cf.id == data.filterCriteria.facilityId}">selected</c:if> value="<c:out value='${cf.id}'/>"><c:out value="${cf.code}"/> - <c:out value="${cf.name}"/></option>
									</c:forEach>
									</select>
									</td>
								</tr>		
								<tr>
									<td align="right">Customer/Prospect&nbsp;&nbsp;</td>
									<td width="4">:&nbsp;</td>
									<td width="413" height="28"><input type="text" id="customerId" name="customerId" value="<c:out value='${data.filterCriteria.customerId}'/>" size="30" class="inputbox"/></td>
								</tr>
								<tr>
									<td align="right">Sales Person&nbsp;&nbsp;</td>
									<td>:&nbsp;</td>
									<td width="413" height="28"><input type="text" id="salesPersonId" name="salesPersonId" value="<c:out value='${data.filterCriteria.salesPersonId}'/>" size="30" class="inputbox"/></td>
								</tr>
								<tr>
									<td align="right">Letter No&nbsp;&nbsp;</td>
									<td width="4">:&nbsp;</td>
									<td width="413" height="28"><input type="text" id="letterNo" name="letterNo" maxlength="50" value="<c:out value='${data.filterCriteria.code}'/>" size="25" class="inputbox"/></td>
								</tr>
								<tr>
									<td align="right">Date&nbsp;&nbsp;</td>
									<td width="4">:&nbsp;</td>
									<td width="413" height="28">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
									            <input name="dateFrom" id="dateFrom" dojotype="dropdowndatepicker" saveformat="dd-MM-yyyy" displayformat="dd-MM-yyyy" value="<fmt:formatDate value='${data.filterCriteria.dateFrom}' pattern='MM/dd/yyyy'/>" lang="de" class="inputbox"/>												
											</td>
											<td>&nbsp;To&nbsp;</td>
											<td><input id="dateTo" name="dateTo" formatLength="long" lang="nl" saveformat="dd-MM-yyyy" value="<fmt:formatDate value='${data.filterCriteria.dateTo}' pattern='MM/dd/yyyy'/>" displayFormat="dd-MM-yyyy" dojoType="dropdowndatepicker" class="inputbox"/>
											</td>
										</tr>
									</table>
									</td>
									<td width="11"></td>
								</tr>
					<tr><td colspan="3">&nbsp;</td></tr>
					<tr>
						<td colspan="2">&nbsp;</td>
						<td align="left">
							<input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onClick="searchs();" class="btn"/>
							<input type="button" value="Reset"  style="WIDTH:60px; HEIGHT:25px" alt="Reset" onClick="resets();" class="btn"/>
						<br><br><br><br>
						</td>
					</tr>
					</table>
					</form>

</div>
