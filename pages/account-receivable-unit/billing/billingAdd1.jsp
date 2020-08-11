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
							<a class="item-button-list" href="<c:url value='/page/unitbillingview.htm'/>"><span><spring:message code='list'/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save();"><span><spring:message code='next'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="billing">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">No.Tagihan :</td>
								  	<td width="80%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Fasilitas :</td>
									<td>
										<select id="org" class="combobox-ext input-disabled" disabled>
                                             <option value='${billing.organization.id}'>${billing.organization.name}</option>
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
                                    <td align="right">Tipe Kwitansi : </td>
                                    <td>
                                        <select id='billingType' name='billingType' cssClass='combobox-ext'>
                                        	<option value="" selected>--Tipe--</option>
                                            <c:forEach items="${billingTypes}" var="billType">
                                                <option value='${billType.id}'>${billType.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
							    <tr>
									<td nowrap="nowrap" align="right">Tagihan ke :</td>
									<td>
										<select id="customer" name="customer" cssClass="combobox-ext">
                                        </select>
                                        <img src="assets/icons/list_extensions.gif" onclick="billedTo('customer')" style="CURSOR:pointer;" title="Pelanggan" />
									</td>
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
$(function(){
	$("#billingType").change(function(){
		$("#customer").empty();
	});
	$("#customer").focus(function(){
		loadReferences();
	})
});

function save()
{
	var customer = document.getElementById('customer');
  	if($('#date').val()=="") {
		alert('Date can not be empty!');
		return;
	}
  	if(customer.value == "") {
		alert('Customer does not exist!');
		return;
	}
	document.addForm.action = "<c:url value='/page/unitbillingpreadd2.htm'/>";
	document.addForm.submit();
}

function billedTo(target){
	var org = document.getElementById('org').value;
	
	switch($("#billingType").val()){
		case "11":
			openCustomerByOrgInstant(target, 'false');
			break;
		case "10":
			openCustomerFacilityByOrg(target);
			break;
		case "9":
			opensupplierpersonal(target);
			break;
		case "8":
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
			break;
		case "7":
			openCustomerByOrgInstant(target, 'false');
			break;
		case "6":
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
			break;
		default:
			alert("Silahkan pilih tipe kwitansi");
			break;
	}
}

/**
*	6 = Leasing
*	7 = Customer
*  	8 = Subdiction
*  	9 = Subdiction Holder
*  	10 = Customer Dealer
*  	11 = Progressive Tax
*/
function loadReferences()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'References',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$dialog.empty();
	$dialog.html('Loading data......');
	$dialog.dialog('open');
	
	var count = 0;
	var data={customer:$("#customer").val()};
	var _orders=function (json){
		$("#reference-list").empty();
		$.each(json.orders,function(idx,val){
			$("<li style='list-style:none;'></li>").html("<input id='referenceDOR["+idx+"]' type='radio' name='referencesDOR' value='"+val.id+"' onclick='cekSO("+idx+");'/>"+val.planableCode+" / "+val.customer+" / "+val.customerUnit+" / "+val.salesman+"<input id='referenceSO["+idx+"]' type='checkbox' style='visibility:hidden;' name='referencesSO' value='"+val.planableId+"'/>").appendTo("#reference-list");
			count++;
		});
		
		if(json.status == 'OK')
		{
			if(count == 0) {
				$dialog.empty();
				$dialog.html('Data referensi tidak ada !!!');
			}
			else
			{
				$dialog.dialog('close');
			}
		}
	};
	if($("#customer").val()!="0"){
		if($("#billingType").val()=="7"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadall.json'/>",data,_orders);
		}else if($("#billingType").val()=="8"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadbysubdiction.json'/>",data,_orders);
		}else if($("#billingType").val()=="9"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadbyholder.json'/>",data,_orders);
		}else if($("#billingType").val()=="10"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadbydealer.json'/>",data,_orders);
		}else if($("#billingType").val()=="6"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadbyleasing.json'/>",data,_orders);
		}else if($("#billingType").val()=="11"){
			$.get("<c:url value='/page/deliveryorderrealizationremote.loadbyprogressivetax.json'/>",data,_orders);
		}
		$("#reference-list").focus();
	}
}

function cekSO(index)
{
	if($("#referenceDOR\\["+index+"\\]").attr("checked")){
		$("#referenceSO\\["+index+"\\]").attr('checked','true');
	} else {
		$("#referenceSO\\["+index+"\\]").removeAttr('checked');
	}
}
</script>
</body>
</html>