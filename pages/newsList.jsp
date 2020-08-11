<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP - News</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
	<%@ include file="/common/dialog.jsp"%>
	<%@ include file="/filter/newsFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<!-- meta tags here -->
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">
			Tools > News 
			</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
	</table>
	
	</div>

	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						<h1 class="page-title"></h1>
						<h1 class="page-title">T40 - News </h1>
						
						<div class="item-navigator">
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="30%" height="30" align="left" valign="middle">															
								<div class="toolbar-clean">
									<a class="item-button-new" href="<c:url value='/page/newsPrepareAdd.htm'/>"><span>New News</span></a>
							  		<div dojoType="Toggler" targetId="filter">
										<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
									</div>
								</div>
							</td>
							<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${data.filterCriteria.page}"/> of <c:out value="${data.filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
						</tr>
						</table>
					  </div>
					  <!-- TABLE LIST -->
									<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
									<tr>
										<th><div style="width:80px"></div></th>
										<th width="15%">Date</th>
										<th width="50%">Title</th>
										<th width="35%">Post By</th>
									  </tr>
									<c:forEach items="${data.newsList}" var="news">
									<tr>
										<td class="tools">
										 	<a class="item-button-edit"   href="<c:url value='/page/newsPrepareUpdate.htm?id=${news.id}'/>" title="Edit"><span>Edit</span></a>
											<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/newsDelete.htm?id=${news.id}'/>')" title="Delete"><span>Delete</span></a>
										</td>
										<td><fmt:formatDate value='${news.date}' pattern='dd-MMM-yyyy'/></td> 
										<td><c:out value='${news.title}'/></td>          
										<td><c:out value='${news.createdBy.firstName} ${news.createdBy.middleName} ${news.createdBy.lastName}'/></td>
									</tr>
									</c:forEach> 
									<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
									</table>

					  <!-- /TABLE LIST -->
									<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
											<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${data.filterCriteria.page}"/> of <c:out value="${data.filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
									</table>

					<!-- / end of main contents -->
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div>
<!-- /main containers -->

</body>
<!-- END OF BODY -->
</html>
