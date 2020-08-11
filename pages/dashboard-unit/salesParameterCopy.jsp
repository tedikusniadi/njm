<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
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
	<!-- /main menu -->

	<!-- tips & page navigator -->
	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
			<td width="60%">${breadcrumb}</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/salesparameterview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesParameter_copy">
			 				<table width="100%" style="border:none" class="space">
	                            <tr>
	                                <td width="27%" nowrap="nowrap" align="right">ID :</td>
	                              	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
	                            </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                            <c:if test='${not empty salesParameter_copy.organization}'>
                                                <form:option value='${salesParameter_copy.organization.id}' label='${salesParameter_copy.organization.name}' />
                                            </c:if>
                                        </form:select>
                                        <!-- <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" /> -->
                                    </td>
                                </tr>
				 				<tr>
	                                <td align="right">Periode Follow Up</td>
	                                <td>
	                                	<select id="month" name="month">
	                                    	<option value="JANUARY" selected>JANUARY</option>
	                                        <option value="FEBRUARY">FEBRUARY</option>
	                                        <option value="MARCH">MARCH</option>
	                                        <option value="APRIL">APRIL</option>
	                                        <option value="MAY">MAY</option>
	                                        <option value="JUNE">JUNE</option>
	                                        <option value="JULY">JULY</option>
	                                        <option value="AUGUST">AUGUST</option>
	                                        <option value="SEPTEMBER">SEPTEMBER</option>
	                                        <option value="OCTOBER">OCTOBER</option>
	                                        <option value="NOVEMBER">NOVEMBER</option>
	                                        <option value="DECEMBER">DECEMBER</option>
	                                    </select>
	                                    &nbsp;
	                                    <select id="year" name="year">
	                                    	<c:forEach items='${years}' var='year'>
	                                        	<option value="${year}">${year}</option>
	                                        </c:forEach>
	                                    </select>
	                                </td>
	                            </tr>
                          		<tr>
									<td align="right">Target Unit :</td>
									<td><form:input id="targetUnit" path="targetUnit" value="0" size="20" onkeyup="separator('targetUnit');"/></td>
								</tr>
                          		<tr>
									<td align="right">Target MS (%) :</td>
									<td><form:input id="targetMS" path="targetMS" value="0" size="20"/></td>
								</tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sales Parameter',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/salesparametercopy.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Sales Parameter data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/salesparameterview.htm?'/>";
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason:<br/>'+json.message);
					}
				}
			}
		});
	});
});

function separator(id)
{
	var amount = document.getElementById(id);

	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
	}
}
</script>