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

<body onload="addItem();">

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

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/noticeandserviceview.htm?service=true'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="otherPrice">
			 				<table width="100%" style="border:none" class="space">
			 				<tr>
			 					<td align="right">Date</td>
			 					<td>: <input inputId="dateId" id="dateFrom" name="dateFrom" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
			 				</tr>
			 				<%-- <tr>
                                <td align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty otherPrice.organization}'>
                                            <form:option value='${otherPrice.organization.id}' label='${otherPrice.organization.name}' />
                                        </c:if>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                </td>
                            </tr> --%>
		 					<%-- <tr>
								<td align="right">Tipe Unit</td>
								<td>:
									<select id="unitType" name="unitType" class="combobox">
									</select>
									<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=unitType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
								</td>
							</tr> --%>
							<tr>
						  		<td align="right">Tipe Jasa</td>
						  		<td>:
						  			<form:select id="type" path="type">
						  				<option value="pilih">---PILIH---</option>
										<%-- <form:option value="NOTICE" label="NOTICE"/>
										<form:option value="NOTICEASTRA" label="BBN ASTRA"/> --%>
										<form:option value="CITY" label="JASA KOTA"/>
										<form:option value="REGION" label="JASA KABUPATEN"/>
									</form:select>
									<select id="unitType" name="unitType" class="combobox" style="visibility: hidden;">
									</select>
                          		</td>
					  		</tr>
					  		<tr>
						  		<td align="right">Currency </td>
						  		<td>:
						  			<form:select path="money.currency">
										<form:options items="${currencies}" itemLabel="symbol" itemValue="id"/>
									</form:select>
									<form:select path="money.exchangeType">
										<form:options items="${exchangeTypes}"/>
									</form:select>
                          		</td>
					  		</tr>
					  		<tr>
								<td align="right">Amount</td>
								<td>: <form:input id="amount" path="money.amount" size="21" onkeyup="separator('amount');"/></td>
							</tr>
							</table>
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                                <!-- <a class="item-button-new" href="javascript:addItem();"><span>New Row</span></a>
                                <a class="item-button-delete" href="javascript:deleteRow('lineItemTable');"><span>Delete Row</span></a> -->
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                           	  	<th width="1%"><input type="checkbox" name="checkMaster" id="check_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                <th width="99%">Company</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
                            </tfoot>
                            </table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">

	function separator(id)
	{
		var amount = document.getElementById(id);
	
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}
	
	$(function(){
		$('.item-button-save').click(function(){
			if(validation())
			{
				$('.item-button-save').hide();
				$.ajax({
					url:"<c:url value='/page/noticeandserviceadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Notice And Service data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/noticeandserviceview.htm'/>";
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
		if($("#dateId").val() == '' || $("#dateId").val() == null)
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		/* if($("#unitType").val() == '' || $("#unitType").val() == null)
		{
			alert('Product Type cannot be empty !!!');
			return;
		} */
		
		if($("#type").val() == 'pilih')
		{
			alert('Please select Service Type first !!!');
			return;
		}
		
		if($("#amount").val() == '' || $("#amount").val() <= 0)
		{
			alert("Budget cannot be empty and must be greater than zero !!!");
			return;
		}
		
		var totalEmpty = 0;
		var $facilities=$("input[name=check]");
		$.each($facilities,function(idx,elem)
		{
			if(!$("#facility\\["+idx+"\\]").val())
				totalEmpty++;
		});
		
		if(totalEmpty > 0)
		{
			alert("Please select Company first !!!");
			return;
		}
		
		return true;
	}

	var index = 0;
	function addItem()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genFacility(index));

				index++;
			}
		}
	}
	
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";

		return check;
	}
	
	function genFacility(index)
	{
		var elem=document.createElement("div");

		var facility = document.createElement("select");
		facility.name="facilities";
		facility.id="facility["+index+"]";
		facility.setAttribute('class','combobox-medium');

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function() {openOrg("facility["+index+"]");}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Company';

		elem.appendChild(facility);
		elem.appendChild(document.createTextNode(" "));
		elem.appendChild(_popup);

		return elem;
	}
</script>