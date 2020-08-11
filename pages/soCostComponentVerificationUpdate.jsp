<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SO Cost Component Invoice Verification >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/socostcomponentverificationedit.htm'/>";
			document.addForm.submit();
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Account Payable > SO Cost Component Verification > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F60 - SO Cost Component Verification </h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/socostcomponentverificationview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="${verification_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.organization}'>
                                                        <form:option value='${verification_edit.organization.id}' label='${verification_edit.organization.firstName} ${verification_edit.organization.lastName} ${verification_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${verification_edit.date}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled size="15"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Bill From :</td>
                                       	  	<td width="74%">
                                   	  			<form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.supplier}'>
                                                        <form:option value='${verification_edit.supplier.id}' label='${verification_edit.supplier.firstName} ${verification_edit.supplier.lastName} ${verification_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                       	  </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Component :</td>
                                          	<td width="74%">
                                            	<form:select id="component" path="component" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.component}'>
                                                        <form:option value='${verification_edit.component.id}' label='${verification_edit.component.code}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Amount :</td>
                                          	<td width="74%"><input disabled value="<fmt:formatNumber value='${verification_edit.amount}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Amount :</td>
                                          	<td width="74%"><input disabled value="<fmt:formatNumber value='${verification_edit.taxAmount}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax :</td>
                                          	<td width="74%">
                                            	<select disabled>
                                                    <option><c:out value='${verification_edit.component.tax.taxName}'/></option>
                                                </select>
                                                &nbsp;
                                                <input size="5" disabled class="input-disabled" value="<fmt:formatNumber value='${verification_edit.component.tax.taxRate}' pattern=',##0'/> %"/>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Invoice Tax No :</td>
                                          	<td width="74%"><form:input path='taxNo' size="25"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input name='taxDate' value="<fmt:formatDate value='${verification_edit.taxDate}' pattern='MM/dd/yyyy'/>" size="15" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                           		  		<tr>
                                            <td width="26%" nowrap="nowrap" align="right">Note :</td>
                                       	<td width="74%"><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                  	<td width="47%" align="left" valign="top">
                                   	  	<table style="border:none" width="100%">
                                        <tr>
                                        	<td width="49%" align="left" valign="top">
    											<fieldset>
                                                	<legend><strong>Payment</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td colspan="2" align="right"><h2><c:out value='${verification_edit.status}'/></h2></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Unpaid Amount :</td>
                                                        <td align="right"><input size="12" style="text-align:right" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.unpaid}' pattern=',##0.00'/>"/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Payment :</td>
                                                        <td align="right">
                                                        	<c:forEach items='${verification_edit.applications}' var='application'>
                                                    			<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a><br/>
                                                    		</c:forEach>
                                                        </td>
                                                    </tr>
                                                    </table>
                                              </fieldset>
                                            </td>
                                		</tr>
                                        <tr>
                                        	<td colspan="2" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Recapitulation</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                        <th width="43%">&nbsp;</th>
                                                        <th width="31%" align="center">Amount (<c:out value='${verification_edit.component.currency.symbol}'/>)</th>
                                                        <th width="26%" align="center">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Transaction :</td>
                                                        <td><input id="trx" value="<fmt:formatNumber value='${verification_edit.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" value="<fmt:formatNumber value='${verification_edit.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax :</td>
                                                        <td><input id="tax" value="<fmt:formatNumber value='${verification_edit.taxAmount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" value="<fmt:formatNumber value='${verification_edit.taxAmount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Adjustment :</td>
                                                        <td><input id="trx" value="<fmt:formatNumber value='${verification_edit.amount-verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" value="<fmt:formatNumber value='${verification_edit.amount-verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total :</strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${verification_edit.amount+verification_edit.taxAmount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftotal" value="<fmt:formatNumber value='${verification_edit.amount+verification_edit.taxAmount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>                                                
                                            </td>
                                        </tr>
                                        </table>
                                  	</td>
                                </tr>
                                </table>
                                <br/>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>