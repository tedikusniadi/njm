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
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/bbnPrintoutFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
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
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
									<c:if test='${access.add}'>
										<a class="item-button-new" href="<c:url value='/page/bbnprintoutpreadd.htm'/>"><span>New BBN</span></a>
                                    </c:if>
									<div dojoType="Toggler" targetId="filter">
										<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
									</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
							</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:45px"></div></th>
						  	<th width="15%">No Pengurusan</th>
						  	<th width="10%">Date</th>
						  	<th width="20%">Biro Jasa</th>
						  	<th width="15%">Kota</th>
						  	<th width="15%">Samsat</th>
						  	<th width="10%">Total Notice</th>
						  	<th width="14%">Note</th>
						</tr>
						<c:forEach items="${bbns}" var="bbnAdapter">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/bbnprintoutpreedit.htm?id=${bbnAdapter.bbn.id}'/>" title="Edit"><span>Edit</span></a>
								<c:if test='${access.delete and bbnAdapter.deleteAble}'>
									<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/bbnprintoutdelete.htm?id=${bbnAdapter.bbn.id}'/>')" title="Delete"><span>Delete</span></a>
								</c:if>
							</td>
							<td><c:out value='${bbnAdapter.bbn.code}'/></td>
							<td><fmt:formatDate value="${bbnAdapter.bbn.date}" pattern='dd-MM-yyyy'/></td>
							<td><c:out value="${bbnAdapter.bbn.bbnService.name}"/></td>
							<td><c:out value='${bbnAdapter.bbn.city.name}'/></td>
							<td><c:out value='${bbnAdapter.bbn.region.name}'/></td>
							<td><fmt:formatNumber value='${bbnAdapter.total}' pattern=',##0.00'/></td>
							<td><c:out value='${bbnAdapter.bbn.note}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
							<tr>
								<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
