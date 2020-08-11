<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Sales Approver > Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function updateSupplier()
		{
			document.addForm.submit();
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
            <td width="60%">Supplier > Edit</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A03 - Supplier</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/supplierview.htm'/>"><span>List</span></a>
					  	</div>

                        <div class="main-box">
                            <table width="100%" style="border:none">
                            <tr>
                                <td width="20%" align="right">ID :</td>
                                <td width="80%"><input type="text" value="${party.code}" class="input-disabled"/></td>
                            </tr>
                            <tr>
                                <td align="right">First Name :</td>
                                <td><input type="text" value="${party.firstName}" size="50" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Middle Name :</td>
                                <td><input type="text" value="${party.middleName}" size="30" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Last Name :</td>
                                <td><input type="text" value="${party.lastName}" size="30" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">Note :</td>
                                <td><textarea  cols="55" rows="6">${party.note}</textarea></td>
                            </tr>
                            </table>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages" refreshOnShow="true">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <th width="32%">Address</th>
                                        <th width="30%">Geographic</th>
                                        <th width="22%">Type</th>
                                        <th width="9%">Status</th>
                                    </tr>
                                    <c:forEach items="${party.postalAddresses}" var="address">
                                    <tr>
                                         <td><c:out value="${address.address}" /></td>
                                         <td>
                                            <c:forEach items='${address.geographics}' var='geo'>
                                                <c:out value='${geo.geographic.geographicType.name}:${geo.geographic.name}'/>
                                            </c:forEach>
                                         </td>
                                         <td>
                                            <c:forEach items='${address.addressTypes}' var='type'>
                                                <c:out value='${type.type}'/>
                                            </c:forEach>
                                         </td>
                                         <td>
                                            <c:if test='${address.enabled}'>Active</c:if>
                                            <c:if test='${not address.enabled}'>Inactive</c:if>
                                         </td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="contactPerson" class="tab-pages" dojoType="ContentPane" label="Contact Mechanism">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <th width="32%">Contact</th>
                                      	<th width="15%">Type</th>
                                      	<th width="8%">Status</th>
                                      	<th width="38%">Note</th>
                                    </tr>
                                    <c:forEach items="${party.contactMechanisms}" var="con">
                                    <tr>
                                        <td><c:out value="${con.contact}"/></td>
                                        <td><c:out value="${con.contactMechanismType}"/></td>
                                        <td>
                                            <c:if test='${con.active}'>Active</c:if>
                                            <c:if test='${not con.active}'>Inactive</c:if>
                                        </td>
                                        <td><c:out value="${con.note}"/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="activeProduct" class="tab-pages" dojoType="ContentPane" label="Active Product">
                                    <div class="toolbar-clean">
                                        <c:if test='${access.add}'>
                                            <a class="item-button-new" href="<c:url value='/page/productpricepreaddsupplier.htm?id=${party.id}'/>"><span>New Active Product</span></a>
                                        </c:if>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="4%"><div style="width:40px"></div></th>
                                      	<th width="13%">Valid From</th>
                                      	<th width="15%">Valid To</th>
                                      	<th width="25%">Product</th>
                                      	<th width="10%">Price</th>
                                      	<th width="10%">Type</th>
                                      	<th width="12%">Geograpich</th>
                                      	<th width="11%">Order Val</th>
                                    </tr>
                                    <c:forEach items="${party.partyRoles}" var="role">
                                    <c:if test='${role.partyRoleType.id == 2}'>
                                    <c:forEach items='${role.relationfroms}' var='from'>
                                    <c:forEach items='${from.prices}' var='price'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/productpricepreeditsupplier.htm?id=${price.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><fmt:formatDate value='${price.validFrom}' pattern='dd-MM-yyyy'/></td>
                                        <td><fmt:formatDate value='${price.validTo}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value="${price.product.code} ${price.product.name}" /></td>
                                        <td><fmt:formatNumber value="${price.money.amount}" pattern=',##0.00'/></td>
                                        <td><c:out value="${price.type.name}" /></td>
                                        <td><c:out value="${price.geographic.name}" /></td>
                                        <td><fmt:formatNumber value="${price.orderValue.fromAmount}" pattern=',##0.00'/>-<fmt:formatNumber value="${price.orderValue.toAmount}" pattern=',##0.00'/></td>
                                    </tr>
                                    </c:forEach>
                                    </c:forEach>
                                    </c:if>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="11">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="term" class="tab-pages" dojoType="ContentPane" label="Credit Term">
                                    <div class="toolbar-clean">
                                        <c:if test='${access.add}'>
                                            <a class="item-button-new" href="<c:url value='/page/credittermpreaddsupplier.htm?parent=${party.id}'/>"><span>New Credit Term</span></a>
                                        </c:if>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="5%"><div style="width:40px"></div></th>
                                        <th width="12%">Term</th>
                                        <th width="13%">Valid From</th>
                                      	<th width="14%">Valid To</th>
                                        <th width="56%">Company</th>
                                    </tr>
                                    <c:forEach items="${party.partyRoles}" var="role">
                                    <c:if test='${role.partyRoleType.id == 2}'>
                                    <c:forEach items='${role.relationfroms}' var='from'>
                                    <c:forEach items='${from.creditTerms}' var='term'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/credittermpreeditsupplier.htm?id=${term.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td>${term.term}</td>
                                        <td><fmt:formatDate value='${term.validFrom}' pattern='dd-MM-yyyy'/></td>
                                        <td><fmt:formatDate value='${term.validTo}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${term.partyRelationship.toRole.party.firstName} ${term.partyRelationship.toRole.party.middleName} ${term.partyRelationship.toRole.party.lastName}'/></td>
                                    </tr>
                                    </c:forEach>
                                    </c:forEach>
                                    </c:if>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
							</div>
						</div>
							<div class="info">Created by : ${party.createdBy.firstName} ${party.createdBy.middleName} ${party.createdBy.lastName} (<fmt:formatDate value='${party.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${party.updatedBy.firstName} ${party.updatedBy.middleName} ${party.updatedBy.lastName} (<fmt:formatDate value='${party.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
<!-- /main containers -->

</body>
<!-- END OF BODY -->
</html>
