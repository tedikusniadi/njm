<%@ include file="/common/tld-common.jsp"%>


<h1 class="page-title">U50 - Production Order Realization</h1>
<div class="toolbar">
    <a class="item-button-list" href="<c:url value='/page/productionorderrealizationview.htm'/>"><span>List</span></a>
</div>
<div class="main-box">
    <strong>List of Production Order :</strong>
    <div class="clears">&nbsp;</div>
    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
    <tr>
        <th width="4%"><div style="width:40px"></div></th>
        <th width="24%">ID</th>
        <th width="12%">Date</th>
        <th width="35%">Company</th>
        <th width="25%">Work Unit</th>
    </tr>
    <c:forEach items="${orders}" var="po">
    <tr>
        <td class="tools">
            <a class="item-button-edit" id="${po.id}" style="cursor:pointer;"><span>Edit</span></a>
        </td>
        <td><c:out value='${po.code}'/></td>
        <td><fmt:formatDate value='${po.date}' pattern='dd-MM-yyyy'/></td>
        <td><a href="<c:url value='/page/partypreedit.htm?id=${po.organization.id}'/>"><c:out value='${po.organization.firstName} ${po.organization.middleName} ${po.organization.lastName}'/></a></td>
        <td><a href="<c:url value='/page/productionworkunitpreedit.htm?id=${po.workUnit.id}'/>"><c:out value='${po.workUnit.code}'/></a></td>
    </tr>
    </c:forEach>
    <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
    </table>
</div>

<script src="<c:url value='/js/jquery.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.item-button-edit').click(function(e){
			$('#se-contents').load("<c:url value='/page/productionorderrealizationpreadd2.htm?id='/>"+e.target.id)
		});
	});
</script>