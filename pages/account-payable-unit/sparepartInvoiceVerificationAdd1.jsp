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
							<a class="item-button-list" href="<c:url value='/page/sparepartinvoiceverificationview.htm'/>"><span><spring:message code='list'/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save();"><span><spring:message code='next'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Fasilitas :</td>
									<td>
										<select id="org" class="combobox-ext">
                                             <option value='${verification.organization.id}'>${verification.organization.name}</option>
										</select>
									</td>
								</tr>
                                <tr>
                                  	<td align="right">Tanggal Tagihan :</td>
                                  	<td>
                                  		<input id="date" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>" name="date" class="datepicker"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Pemasok :</td>
                                    <td>
                                        <form:select id="supplier" path="supplier" class="combobox-ext">
                                            <c:if test='${not empty verification.supplier}'>
                                                <form:option value='${verification.supplier.id}' label='${verification.supplier.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Pemasok" />
                                    </td
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">No. Referensi :</td>
                                    <td>
                                        <select id="purchaseOrder" name="purchaseOrder" class="combobox-ext">
                                        </select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openPurchaseOrder();" style="CURSOR:pointer;" title="Purchase Order" />
                                    </td
                                </tr>
								<tr>
									<td nowrap="nowrap" align="right" valign="top">Referensi Tagihan :</td>
									<td><ul id="reference-list"></ul></td>
								</tr>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">

function save()
{
  	if($('#date').val() == '') {
		alert('Date can not be empty !!!');
		return;
	}
  	
  	if($("#purchaseOrder").val() == '')
	{
  		alert('Please select Purchase Reference first !!!');
  		return;
	}
  	
	var total = 0;
	var $cek=$("input[name=cekIdx]");
	$.each($cek,function(idx,elem)
	{
		var i=elem.value;
		if($("#receipt\\["+i+"\\]").attr("checked"))
		{
			total++;
		}
	});

	if(total == 0)
	{
		alert('Mohon pilih Referensi Goods Receipt terlebih dahulu !!!');
		return;
	}
	
	document.addForm.action = "<c:url value='/page/sparepartinvoiceverificationpreadd2.htm'/>";
	document.addForm.submit();
}

function opensupplier()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Organization first!');
		return;
	}

	openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&personal=yes&organization='/>"+org.value);
}

function openPurchaseOrder()
{
	var supplier = document.getElementById('supplier');
	if(supplier.value == '')
	{
		alert('Please select Supplier first!');
		return;
	}

	openpopup("<c:url value='/page/popupstandardpurchaseorderview.htm?target=purchaseOrder&available=true&supplier='/>"+supplier.value);
}

function loadReferences(poId)
{
	$.get("<c:url value='/page/purchaseorderremote.getall.json'/>",{id:poId},
	function(json)
	{
		$("#reference-list").empty();
		$.each(json.purchaseOrder.receipts,function(idx,val)
		{
			if(!val.verificated)
			{
				$("<li style='list-style:none;'></li>").html("<input id='receipt["+idx+"]' type='checkbox' name='receipts' value='"+val.id+"'/>"+val.code+"<input style='visibility:hidden;' name='cekIdx' value='"+idx+"'/>").appendTo("#reference-list");
			}
		});
	});
}
</script>
</body>
</html>