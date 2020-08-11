<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
							<a class="item-button-list" href="<c:url value='/page/productsparepartdiscountview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer"><span><spring:message code="save"/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="discount_add">
								<table width="100%" style="border:none">
			 					<tr>
									<td align="right">Tipe Unit :</td>
									<td>
										<select id="category" name="categoryType">
											<option value="AGP">AGP</option>
											<option value="HGP">HGP</option>
											<option value="NON_HGP">NON HGP</option>
											<option value="OLI">OLI</option>
										</select>
									</td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Amount :</td>
								  	<td width="80%"><form:input id="amount" path='amount' size="20"/>%</td>
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
<script type="text/javascript">
	$(function(){
		$('.item-button-save').click(function(){
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/productsparepartdiscountadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/productsparepartdiscountview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	function validation()
	{
		var amount = document.getElementById('amount').value;
	
		if(amount == '' || parseFloat(amount) <= 0)
		{
			alert('Amount cannot be empty and must be greater than zero !!!');
			return;
		}
		
		return true;
	}
</script>
</body>
</html>