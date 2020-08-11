<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SPBU Shift Report >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onLoad="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">SPBU > Shift Report > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">B30 - Shift Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/spbushiftview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save();"><span>Next</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="shift_add">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="18%" nowrap="nowrap" align="right">ID :</td>
                                    <td width="39%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                  <td width="43%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                            <c:if test='${not empty shift_add.organization}'>
                                                <form:option value='${shift_add.organization.id}' label='${shift_add.organization.firstName} ${shift_add.organization.lastName} ${shift_add.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onClick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                    <td><form:errors path='organization' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" value="<fmt:formatDate value='${shift_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                	<td><form:errors path='date' cssClass='errors'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Shift No :</td>
                                    <td>
                                        <form:select id="no" path="shift">
                                            <form:option value='1' label='1'/>
                                            <form:option value='2' label='2'/>
                                            <form:option value='3' label='3'/>
                                            <form:option value='4' label='4'/>
                                            <form:option value='5' label='5'/>
                                        </form:select>
                                    </td>
                                    <td><form:errors path='shift' cssClass='errors'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                    <td>&nbsp;</td>
                                </tr>
                                </table>
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
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/SPBUShiftValidatorDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save()
	{		
		var date = dojo.widget.byId('date').value;			
		if(date == '')
		{
			alert("Please select date first!");
			return;
		}
		
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert("Please select Organization first!");
			return;
		}
		
		var _shift = document.getElementById('no');
		if(_shift.value == '')
		{
			alert("Shift cannot be empty!");
			return;
		}
		
		SPBUShiftValidatorDWRRemote.valid(org.value,date,_shift.value,{
			callback:function(response){

				if(response != null && (response == 'true' || response == true))
				{
					document.addForm.action = "<c:url value='/page/spbushiftpreadd2.htm'/>";
					document.addForm.submit();
				}
				else
				{
					alert('Data for organization '+org.text+", Tanggal: "+date+", Shift: "+_shift.value+" Already exist!");
					return;
				}
			},
  			errorHandler:function(message) { alert(message); }
		});
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>