<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Company >> Edit</title>
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
            <td width="60%">Company Administration > Comapny > Edit</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A06 - Company</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/companyview.htm'/>"><span>List</span></a>
					  	</div>

                        <div class="main-box">
                            <table width="100%" style="border:none">
                            <tr>
                                <td width="20%" align="right">ID :</td>
                                <td width="80%"><input type="text" value="${party.code}" class="input-disabled" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Dealer Code :</td>
                                <td><input type="text" value="${party.organizationCode}" class="input-disabled" disabled/></td>
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
                            </tr>
                                <tr>
                                  <td align="right">Tax Code :</td>
                                  <td><input type="text" value="${party.taxCode}" size="30" disabled/></td>
                                </tr>
                            	</tr>
                                <tr>
                                  <td align="right">Salutation :</td>
                                  <td><input type="text" value="${party.salutation}" size="30" disabled/></td>
                                </tr>
                            <tr>
                                <td align="right" valign="top">Note :</td>
                                <td><textarea  cols="55" rows="6">${party.note}</textarea></td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages" refreshOnShow="true">
                                	<div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/postaladdresspreadd.htm?party=${party.id}&uri=customerpreedit.htm'/>"><span>New Address</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                    	<th width="7%"><div style="width:10px"></div></th>
                                        <th width="48%">Address</th>
                                      	<th width="37%">Type</th>
                                      	<th width="8%">Status</th>
                                      	<th width="7%">Default</th>
                                    </tr>
                                    <c:forEach items="${party.postalAddresses}" var="postal">
                                    <tr>
                                    	<td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/postaladdresspreedit.htm?id=${postal.id}&uri=customerpreedit.htm'/>" title="Edit"><span>Edit</span></a>
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/postaladdressdelete.htm?id=${postal.id}&party=${postal.party.id}&uri=customerpreedit.htm'/>');"><span>Del</span></a>
                                        </td>
                                        <td><c:out value='${postal.address}'/></td>
                                        <td>
                                            <c:forEach items='${postal.addressTypes}' var='type'>
                                                <c:if test='${type.enabled}'><c:out value='${type.type}'/>,</c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:if test='${postal.enabled}'>Active</c:if>
                                            <c:if test='${!postal.enabled}'>Inactive</c:if>
                                        </td>
                                        <td>
                                            <c:if test='${postal.selected}'>Yes</c:if>
                                            <c:if test='${!postal.selected}'>No</c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="contactPerson" class="tab-pages" dojoType="ContentPane" label="Contact Mechanism">
                                <div class="toolbar-clean">
                                        <c:if test='${access.add}'>
                                            <a class="item-button-new" href="<c:url value='/page/contactmechanismpreadd.htm?party=${party.id}'/>"><span>New Contact Mechanism</span></a>
                                        </c:if>
                                    </div>
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
                                            <a class="item-button-new" href="<c:url value='/page/productpricepreaddcustomer.htm?id=${party.id}'/>"><span>New Active Product</span></a>
                                        </c:if>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <thead>
                                    <tr>
                                      	<th width="3%"><div style="width:40px"></div></th>
                                      	<th width="13%">Valid From</th>
                                      	<th width="16%">Valid To</th>
                                      	<th width="25%">Product</th>
                                      	<th width="10%">Price</th>
                                      	<th width="10%">Type</th>
                                      	<th width="12%">Geograpich</th>
                                      	<th width="11%">Order Val</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${party.partyRoles}" var="role">
                                    <c:if test='${role.partyRoleType.id == 1}'>
                                    <c:forEach items='${role.relationfroms}' var='from'>
                                    <c:forEach items='${from.prices}' var='price'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/productpricepreeditcustomer.htm?id=${price.id}'/>" title="Edit"><span>Edit</span></a>
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
                                    </tbody>
                                    <tfoot>
                                    	<tr class="end-table"><td colspan="11">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
                                <div id="term" class="tab-pages" dojoType="ContentPane" label="Credit Term">
                                    <div class="toolbar-clean">
                                        <c:if test='${access.add}'>
                                            <a class="item-button-new" href="<c:url value='/page/credittermpreaddcustomer.htm?parent=${party.id}'/>"><span>New Credit Term</span></a>
                                        </c:if>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="5%"><div style="width:40px"></div></th>
                                        <th width="12%">Term</th>
                                        <th width="14%">Valid From</th>
                                        <th width="14%">Valid To</th>
                                        <th width="55%">Company</th>
                                    </tr>
                                    <c:forEach items="${party.partyRoles}" var="role">
                                    <c:if test='${role.partyRoleType.id == 1}'>
                                    <c:forEach items='${role.relationfroms}' var='from'>
                                    <c:forEach items='${from.creditTerms}' var='term'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/credittermpreeditcustomer.htm?id=${term.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><c:out value='${term.term}'/></td>
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
                                <div id="plafon" class="tab-pages" dojoType="ContentPane" label="Plafon">
                                    <div class="toolbar-clean">
                                        <c:if test='${access.add}'>
                                            <a class="item-button-new" href="<c:url value='/page/plafonpreadd.htm?id=${party.id}'/>"><span>New Plafon</span></a>
                                        </c:if>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="5%"><div style="width:40px"></div></th>
                                        <th width="12%">Plafon</th>
                                        <th width="14%">Valid From</th>
                                        <th width="14%">Valid To</th>
                                        <th width="55%">Company</th>
                                    </tr>
                                    <c:forEach items="${party.partyRoles}" var="role">
                                    <c:if test='${role.partyRoleType.id == 1}'>
                                    <c:forEach items='${role.relationfroms}' var='from'>
                                    <c:forEach items='${from.plafons}' var='plafon'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/plafonpreedit.htm?id=${plafon.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><fmt:formatNumber value='${plafon.plafon}' pattern=',##0.00'/></td>
                                        <td><fmt:formatDate value='${plafon.validFrom}' pattern='dd-MM-yyyy'/></td>
                                        <td><fmt:formatDate value='${plafon.validTo}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${plafon.partyRelationship.toRole.party.firstName} ${plafon.partyRelationship.toRole.party.middleName} ${plafon.partyRelationship.toRole.party.lastName}'/></td>
                                    </tr>
                                    </c:forEach>
                                    </c:forEach>
                                    </c:if>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="facility" dojoType="ContentPane" label="Facility" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/facilityrolepreadd.htm?id=${party.id}'/>"><span>New Facility</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                                       	  	<th width="7%"><div style="width:10px"></div></th>
											<th width="29%">Name</th>
								  	  	 	<th width="17%">Type</th>
								  	  	 	<th width="47%">Note</th>
										</tr>
										<c:forEach items="${party.facilitys}" var="fac">
										<tr>
                                        	<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/facilityrolepreedit.htm?id=${fac.id}'/>" title="Edit"><span>Edit</span></a>
												<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/facilityroledelete.htm?id=${fac.id}'/>');" title="Del"><span>Del</span></a>
											</td>
											<td>${fac.facility.name}</td>
											<td>${fac.facilityRoleType.name}<c:if test="${fac.selected}">(default)</c:if></td>
											<td>${fac.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
									<div id="account" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/partybankaccountpreadd.htm?id=${party.id}'/>"><span>New Account</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                               	  	  	  	<th width="4%" height="21"><div style="width:10px"></div></th>
										  	<th width="16%">Account No</th>
                                            <th width="20%">Account Name</th>
                                            <th width="23%">Cash/Bank Name</th>
                                            <th width="24%">Cash/Bank Branch</th>
								  	  	  	<th width="13%">Status</th>
										</tr>
										<c:forEach items="${party.accounts}" var="account">
										<tr>
                                        	<td class="tools">
												<a class="item-button-edit" href="<c:url value='/page/partybankaccountpreedit.htm?id=${account.id}'/>" title="Edit"><span>Edit</span></a>
											</td>
											<td><c:out value='${account.bankAccount.accountNo}'/></td>
                                            <td><c:out value='${account.bankAccount.accountName}'/></td>
                                            <td><c:out value='${account.bankAccount.bankName}'/></td>
											<td><c:out value='${account.bankAccount.bankBranch}'/></td>
											<td>
                                            	<c:if test='${account.enabled}'>Active</c:if>
                                                <c:if test='${!account.enabled}'>Inactive</c:if>
                                                <c:if test='${account.used}'>[Default]</c:if>
                                            </td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
							</div>
						</div>
							<div class="info">Created by : <c:out value='${party.createdBy.firstName} ${party.createdBy.middleName} ${party.createdBy.lastName}'/> (<fmt:formatDate value='${party.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${party.updatedBy.firstName} ${party.updatedBy.middleName} ${party.updatedBy.lastName}'/> (<fmt:formatDate value='${party.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
</body>
</html>
<%@ include file="/common/dialog.jsp"%>
<script type="text/javascript" src="assets/dialog.js"></script>