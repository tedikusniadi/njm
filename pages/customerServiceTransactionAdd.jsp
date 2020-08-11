<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
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
							<a class="item-button-list" href="<c:url value='/page/customertransactionview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="customer">
 								<table style="border:none" width="100%">
 								<tr>
                                    <td nowrap="nowrap" align="right">Organisasi</td>
                                    <td align="right">:</td>
                                    <td>
                                        <form:select path="organization" id="org" class="combobox-ext">
                                        	<c:if test='${not empty customer.organization}'>
                                               	<form:option value='${customer.organization.id}' label='${customer.organization.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Nama Pelanggan</td>
                                    <td width="1%" align="right">:</td>
                                    <td>
                                        <form:select path="customer" id="customerName" class="combobox-ext">
                                        	<c:if test='${not empty customer.customer}'>
                                               	<form:option value='${customer.customer.id}' label='${customer.customer.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrg('customerName');" style="CURSOR:pointer;" title="Pelanggan" />
                                    </td>
                                </tr>
 								<tr>
 									<td align="right">No Kendaraan</td>
                                    <td align="center">:</td>
									<td><input id="plate" name="plateNo"/></td>
 								</tr>
			 					<tr>
									<td align="right">Tipe Unit</td>
                                    <td align="right">:</td>
									<td>
										<select id="unitType" name="unitType" class="combobox-medium">
										</select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
									</td>
								</tr>
 								<tr>
 									<td align="right">No Rangka</td>
                                    <td align="center">:</td>
									<td><input id="serialExt1" name="serialExt1" value=""/></td>
 								</tr>
 								<tr>
 									<td align="right">Tahun</td>
                                    <td align="center">:</td>
									<td><input id="year" name="year"/></td>
 								</tr>
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
<script type="text/javascript">

	function validation()
	{
		if($("#org").val() == null || $("#org").val() == '')
		{
			alert('Mohon pilih Organisasi terlebih dahulu !!!');
			return;
		}
		
		if($("#customerName").val() == null || $("#customerName").val() == '')
		{
			alert('Mohon pilih Nama Pelanggan terlebih dahulu !!!');
			return;
		}

		if($("#plate").val() == '')
		{
			alert('Nomor Plat tidak boleh kosong !!!');
			return;
		}

		if($("#unitType").val() == null || $("#unitType").val() == '')
		{
			alert('Tipe Unit tidak boleh kosong !!!');
			return;
		}

		if($("#serialExt1").val() == '')
		{
			alert('No Rangka tidak boleh kosong !!!');
			return;
		}

		if($("#year").val() == '')
		{
			alert('Tahun tidak boleh kosong !!!');
			return;
		}

		return true;
	}

	$(function()
	{
		$('.item-button-save').click(function()
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/customertransactionadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Customer data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/customertransactionview.htm?'/>";
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

		$("#year").keydown(function(event)
		{
	        numberOnly(event);
	    });
	});

	function numberOnly(event)
	{
		if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 ))
		{
		    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || (event.keyCode >= 37 && event.keyCode <= 40))
		    {
		    }
		    else
		   	{
		    	event.preventDefault();
		   	}
		}
	}
</script>
</html>