<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Credit Term >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function edit()
		{
			document.editForm.action = "<c:url value='${edit}'/>";
			document.editForm.submit();
		}
	</script>
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
			<td width="60%">Company Administration > Credit Term > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
                    						
						<h1 class="page-title">A09 - Credit Term</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='${list}'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:edit();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>
							<form:form id="editForm" name="editForm" method="post" modelAttribute="creditTerm">
								<table width="100%" style="border:none">
								<tr>
 									<td align="right">For Company :</td>
									<td>
                                    	<form:select id="relation" path="partyRelationship" cssClass="combobox-ext" disabled='true'>
                                        	<form:option value='${creditTerm.partyRelationship.id}' label='${creditTerm.partyRelationship.toRole.party.firstName} ${creditTerm.partyRelationship.toRole.party.middleName} ${creditTerm.partyRelationship.toRole.party.lastName}' />

                                        </form:select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
									<td width="18%" align="right">Term (days) :</td>
								  <td width="36%"><form:input path="term" size="10" cssClass='input-disabled' disabled='true'/></td>							
	    							<td width="46%">&nbsp;</td>
								</tr>
								<tr>
									<td align="right">Valid From :</td>
									<td colspan="2"><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${creditTerm.validFrom}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td align="right">Valid To :</td>
									<td colspan="2"><input readonly name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" value="<fmt:formatDate value='${creditTerm.validTo}' pattern='MM/dd/yyyy'/>"/></td>
								</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>
