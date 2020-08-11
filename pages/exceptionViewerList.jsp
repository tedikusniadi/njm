<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Exception Viewer >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
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
				<td width="60%">Tools > Exception Viewer</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents" style="overflow:auto;">

						<h1 class="page-title"></h1>
						<h1 class="page-title">T50 - Exception Viewer</h1>
						
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">&nbsp;</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
					  	</div>
					  
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
			  	  	  	  	<th width="10%">Date</th>
  	  	  	  	  	  	  <th width="9%">Code</th>
       	  	  	  	  	  <th width="10%">Type</th>
   	  	  	  	  	  	  <th width="27%">Location</th>
  	  	  	  	  	  	  <th width="22%">Description</th>
                   	  	  <th width="22%">Message</th>
						</tr>
						<c:forEach items="${events}" var="event">
						<tr>
							<td><fmt:formatDate value='${event.errorTime}' pattern='dd-MM-yyyy hh:mm:ss'/></td>
							<td><c:out value='${event.errorCode}'/></td>
							<td><c:out value='${event.exceptionType}'/></td> 
							<td><c:out value='${event.location}'/></td>
							<td><c:out value='${event.dictionary.description}'/></td>
                            <td><c:out value='${event.errorMessage}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
	
 	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
