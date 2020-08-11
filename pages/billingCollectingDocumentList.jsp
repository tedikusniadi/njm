<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Collecting >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/filter/billingCollectingDocumentFilter.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
            <td width="60%">Financial Accounting > Accounting Setting > Collecting</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">F90 - Collecting</h1>						
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
                        	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                            <tr>
                                <td width="30%" height="30" align="left" valign="middle">															
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/billingcollectingdocumentpreadd.htm' />"><span>New Collecting</span></a>
                                        <div dojoType="Toggler" targetId="filter">
                                            <a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
                                        </div>
                                    </div>
                                </td>
                                <td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
                            </tr>
                        	</table>
					  	</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <th width="4%"><div style="width:44px;"></div></th>
                       	  	<th width="16%">Date</th>
                       	  	<th width="32%">Company</th>
                       	  	<th width="33%">Collector</th>
                       	  	<th width="15%">Status</th>
                        </tr>
                        <c:forEach items="${statuses}" var="stat">
                        <tr>
                            <td class="tools">
                                <a class="item-button-edit"  href="<c:url value='/page/billingcollectingdocumentpreedit.htm?id=${stat.id}'/>"><span>Edit</span></a>
                            </td>
                            <td><fmt:formatDate value="${stat.date}" pattern='dd-MM-yyyy'/></td> 
                            <td><c:out value="${stat.organization.firstName}" /></td>  
                            <td><c:out value="${stat.collector.firstName}" /></td>       
                            <td><c:out value="${stat.status}" /></td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr><td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td></tr>
						</table>
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
</div><!-- /main containers -->


</body>
</html>
<script type="text/javascript" src="assets/dialog.js"></script>
<%@ include file="/common/dialog.jsp"%>