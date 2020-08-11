<%@ include file="/common/tld-common.jsp"%>


<h1 class="page-title">U30 - Production Order</h1>
						
<div class="toolbar">
	<a class="item-button-list" href="<c:url value='/page/productionorderview.htm'/>"><span>List</span></a>
	<c:if test='${access.add}'>
	    <a class="item-button-back" href="<c:url value='/page/productionorderunitpreadd.htm?unit=${unit.id}&date=${sDate}'/>"><span>Back</span></a>
    </c:if>
</div>

<div class="main-box">
    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
    <thead>
    <tr>
      <th width="3%"><div style="width:20px"></div></th>
        <th width="23%">Plan</th>
        <th width="42%">Company</th>
        <th width="6%">Seq</th>
        <th width="26%">Work Unit</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${sequences}" var="sequence" varStatus='status'>
    <tr>
        <td class="tools">
            <a class="item-button-edit" id='${sequence.id}' title="Edit"><span>Edit</span></a>
        </td>
        <td><c:out value='${sequence.planning.code} ${sequence.planning.name}'/></td>
        <td><c:out value='${sequence.planning.organization.firstName} ${sequence.planning.organization.middleName} ${sequence.planning.organization.lastName}'/></td>
        <td><c:out value='${status.index+1}'/></td>
        <td><c:out value='${sequence.workUnit.code} ${sequence.workUnit.name}'/></td>
    </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
    </tfoot>
    </table>
</div>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.item-button-edit').click(function(e){
			$('#se-contents').load("<c:url value='/page/productionorderpreadd2.htm?date=${sDate}&id='/>"+e.target.id);			
		});
	});
</script>