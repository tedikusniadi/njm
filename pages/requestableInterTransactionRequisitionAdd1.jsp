<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter Facility Transaction > Inter AP >> Add</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/vehicleFilter.jsp"%>
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
				<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Inter AP > Add</td>
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
						<h1 class="page-title">F41 - Inter AP</h1>
						<br/>
                        
						<strong>Reference :</strong>
						<table class="table-list" width="100%" cellpadding="0" cellspacing="0">
						<tr>
				  		  <th width="4%"><div style="width:20px"></div></th>
	  	  	  	  	  	  <th width="14%">Acknowledgement</th>
                          <th width="24%">Name</th>
  	  	  	  	  	  	  <th width="31%">From</th>
  	  	  	  	  	  	  <th width="27%">To</th>
						</tr>
						<c:forEach items="${payables}" var="payable">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/requestableintertransactionrequisitionpreadd2.htm?id=${payable.id}'/>"  title="Edit"><span>Edit</span></a>
							</td>
							<td><c:out value='${payable.acknowledgement.code}'/></td>
                            <td><c:out value='${payable.acknowledgement.acknowledgable.name}'/></td>
                            <td><c:out value='${payable.acknowledgement.acknowledgable.from.firstName} ${payable.acknowledgement.acknowledgable.from.middleName} ${payable.acknowledgement.acknowledgable.from.lastName}'/></td>
                            <td><c:out value='${payable.acknowledgement.acknowledgable.to.firstName} ${payable.acknowledgement.acknowledgable.to.middleName} ${payable.acknowledgement.acknowledgable.to.lastName}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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
