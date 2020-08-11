<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Tank >> Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
    <script type="text/javascript" src="assets/dialog.js"></script>
	
	<script type="text/javascript">
		function save()
		{			
			document.addForm.action = "<c:url value='/page/spbutankedit.htm'/>";
			document.addForm.submit();
		}
	</script>
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
			<td width="60%">SPBU > Tank > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
	</table>

	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->
						
						<h1 class="page-title">B10 - Tank</h1>
						
						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/spbutankview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					 	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="tank_edit">
                                <table  width="100%" style="border:none">
                                <tr>
                                  	<td width="19%" align="right">Name</td>
                                  	<td width="1%">:</td>
                                  	<td width="41%"><form:input path="name" id="name" cssClass="inputbox" maxlength="20" disabled='true'/></td>
                                  	<td width="39%" rowspan="4" valign="top">
                                    	<fieldset>
                                        	<legend>Tank Position</legend>
                                            <center>
                                            	<strong>Tank Meter : </strong>
                                                <input disabled style="text-align:right;" size="15" value="<fmt:formatNumber value='${tank_edit.position}' pattern=',##0.00'/>"/>
                                            </center>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                    	<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                        	<option><c:out value='${tank_edit.organization.firstName} ${tank_edit.organization.middleName} ${tank_edit.organization.lastName}'/></option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Product</td>
                                    <td>:</td>
                                    <td>
                                    	<form:select id="product" path="product" cssClass="combobox-ext" disabled='true'>
                                        	<option><c:out value='${tank_edit.product.code} ${tank_edit.product.name}'/></option>
                                        </form:select>
                                    </td>
                                </tr>
		 						<tr>
									<td align="right">Status</td>
									<td>:</td>
									<td>
										<form:radiobutton path="active" value="true" label="Active"/>
										<form:radiobutton path="active" value="false" label="Inactive"/>
									</td>
								</tr>
                                <tr>
                                    <td align="right">Note</td>
                                    <td>:</td>
                                    <td><form:textarea path="note" cols="40" rows="5" cssClass="inputbox"/></td>
                                </tr>
                                </table>
 							</form:form>
                            <div class="clears">&nbsp;</div>
                            <div class="toolbar-clean">
                                <a class="item-button-new" href="<c:url value='/page/spbutanklevelpreadd.htm?id=${tank_edit.id}'/>"><span>New Tank Level</span></a>
                            </div>
                            <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                            <thead>
                            <tr>
                                <th width="6%"><div style="width:40px"></div></th>
                                <th width="15%">Level</th>
                                <th width="27%">Volume</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${tank_edit.levels}" var="level">
                            <tr>
                                <td class="tools">
                                    <a class="item-button-edit" href="<c:url value='/page/spbutanklevelpreedit.htm?id=${level.id}'/>" title="Edit"><span>Edit</span></a>
                                    <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/spbutankleveldelete.htm?id=${level.id}'/>')" title="Delete"><span>Delete</span></a>
                                </td>
                               	<td><fmt:formatNumber value="${level.level}" pattern=',##0.00'/></td>
                                <td><fmt:formatNumber value="${level.volume}" pattern=',##0.00'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
                            </tfoot>
                            </table>
 						</div>
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
<!-- END OF BODY -->
</html>
<%@ include file="/common/dialog.jsp"%>