<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Serials >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/serialsFilter.jsp"%>
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
				<td width="60%">Inventory > Warehouse Management > Product Serials</td>
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
						<h1 class="page-title">I35 - Product Serials</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
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
							<th width="1%"><div style="width:40px"></div> No</th>
			  	  	  	  	<th width="20%">No Mesin</th>
			  	  	  	  	<th width="20%">No Rangka</th>
			  	  	  	  	<th width="59%">Year</th>
						</tr>
						<c:forEach items="${serials}" var="serial">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/serialspreedit.htm?id=${serial.id}'/>"  title="Edit"><span>Edit</span></a>
							</td>
							<td><c:out value='${serial.serial}'/></td>
							<td><c:out value='${serial.serialExt1}'/></td>
							<td><c:out value='${serial.year}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
						</table>
						<div class="item-navigator">
							  <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
								<tr>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
								</tr>
							</table>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

 	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>
</html>
