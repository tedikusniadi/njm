<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/salesmanFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
            <td width="60%">${breadcrumb}</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>

						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/salesmanpreadd.htm' />"><span><spring:message code="new"/></span></a>
											<a class="item-button-new upload-salesman"><span>Import</span></a>
							   			</c:if>
							  			<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span><spring:message code="sirius.paging.filter"/></span></a>
										</div>
										<a class="item-button-export" href="<c:url value='/page/unitsalesfile.udsf' />" title="Export To UDSF"><span>UDSF</span></a>
									</div>
								</td>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
								</tr>
							</table>
					  	</div>

                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                          	<th width="1%"><div style="width:20px"></div></th>
                            <th width="10%"><spring:message code="code"/></th>
                          	<th width="12%"><spring:message code="name"/></th>
                          	<th width="18%">Cabang</th>
                          	<th width="12%">Jabatan</th>
                          	<th width="15%">Atasan</th>
                          	<th width="5%">Aktif</th>
                          	<th width="30%"><spring:message code="note"/></th>
                        </tr>
                        <c:forEach items="${salesmans}" var="salesman">
                        <tr>
                            <td class="tools">
                            	<c:if test='${access.edit}'>
                                	<a class="item-button-edit" href="<c:url value='/page/salesmanpreedit.htm?id=${salesman.id}'/>" title="Edit"><span>Edit</span></a>
                                </c:if>
                            </td>
                            <td nowrap="nowrap"><c:out value="${salesman.code}"/></td>
                            <td nowrap="nowrap"><c:out value="${salesman.name}"/></td>
                            <td nowrap="nowrap"><c:out value="${salesman.organization.name}"/></td>
                            <td nowrap="nowrap">
	  					  		<c:if test="${salesman.personInformation.subPosition == 'SALESTRAINING'}">
									<c:out value="SALES TRAINING"/>
								</c:if>
	  					  		<c:if test="${salesman.personInformation.subPosition == 'SALESJUNIOR'}">
									<c:out value="SALES JUNIOR"/>
								</c:if>
	  					  		<c:if test="${salesman.personInformation.subPosition == 'SALESSENIOR'}">
									<c:out value="SALES SENIOR"/>
								</c:if>
	  					  		<c:if test="${salesman.personInformation.subPosition == 'COUNTERJUNIOR'}">
									<c:out value="COUNTER JUNIOR"/>
								</c:if>
	  					  		<c:if test="${salesman.personInformation.subPosition == 'COUNTERSENIOR'}">
									<c:out value="COUNTER SENIOR"/>
								</c:if>
                            </td>
                            <td nowrap="nowrap"><c:out value="${salesman.personInformation.supervisor.name}"/></td>
                            <td>
                            	<c:forEach items="${salesman.partyRoles}" var="role" varStatus="status">
								<c:if test="${role.partyRoleType.name == 'SALES PERSON'}">
									<c:if test="${role.active}">Y</c:if>
									<c:if test="${!role.active}">N</c:if>
                                </c:if>
								</c:forEach>
                            </td>
                            <td><c:out value="${salesman.note}"/></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <tr>
                        	<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
                        </tr>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	$(".upload-salesman").click(function(){
		var url="<c:url value='/page/salesmanupload.htm'/>";
		$dialog.html('<div class="upload-dialog"><form id="uploadForm" action="'+url+'" method="post"  enctype="multipart/form-data">File:<input type="file" name="file"/></form></div>');
		$dialog.dialog('option','title','Import UDSF File');
		$dialog.dialog('option','buttons',{
			'Import':function(){
					$("#uploadForm").submit();
			},
			'Close':function(){
				$(this).dialog('close');
			}
		});
		$dialog.dialog("open");
	});
});
</script>
</body>

</html>
