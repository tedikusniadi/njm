<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->

<!-- /top menu -->

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
							<a class="item-button-list" href="<c:url value='/page/paymentleasingview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="application">
							<table width="100%" >
								<tr>
									<td>
										<table width="100%" style="borde:none">
											<tr>
												<td width="18%" align="right">No SPK :</td>
												<td width="40%"><input class="input-disabled" disabled value='${application.unitSalesOrder.code}'/></td>
											</tr>
											<tr>
			 									<td align="right">Pemesan :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${application.unitSalesOrder.customer.name}"/></td>
				 							</tr>
											<tr>
			 									<td align="right">Nama STNK :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${application.unitSalesOrder.customerUnit.name}"/></td>
				 							</tr>
											<tr>
			 									<td align="right">Alamat STNK :</td>
												<td><input id="license-address" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Provinsi :</td>
												<td><input id="license-province" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Kota/Kabupaten :</td>
												<td><input id="license-city" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Kecamatan :</td>
												<td><input id="license-subdistrict" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Kelurahan/Desa :</td>
												<td><input id="license-village" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Fasilitas :</td>
												<td><input disabled class='input-disabled inputbox-ext' value='${application.unitSalesOrder.organization.name}'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tanggal :</td>
												<td><input disabled class='input-disabled' size="10" value='<fmt:formatDate value='${application.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>'/></td>
				 							</tr>
				 							<%-- <tr>
			 									<td align="right">Product :</td>
												<td><input disabled class='input-disabled inputbox' value='${orderItem.product.name}'/></td>
				 							</tr> --%>
				 							<tr>
			 									<td align="right">Warna :</td>
												<td><input disabled class='input-disabled inputbox' value='${orderItem.product.colors}'/></td>
				 							</tr>
				 							<tr>
				 								<td align="right"><h1>PO Leasing</h1></td><td></td>
				 							</tr>
											<%-- <tr>
			 									<td align="right">Refund Dealer :</td>
												<td>
													<select name="refundDealer" id="refundDealer">
														<option value=""></option>
														<c:forEach items="${refundDealers}" var="ref">
															<option value="${ref.id}"><fmt:formatDate value='${ref.dateFrom}' pattern='dd-MM-yyyy'/> / <fmt:formatNumber value='${ref.amount}' pattern=',##0.00'/> / ${ref.leasing.name}</option>
														</c:forEach>
													</select>
												</td>
				 							</tr> --%>
				 							<tr>
			 									<td align="right">Tipe Motor :</td>
												<td>
													<input type="text" id="tipe-motor" name="producttypes" disabled class='input-disabled'/>
													<img id="browse" hidden="true" src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=tipe-motor&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
												</td>
				 							</tr>
				 							<tr>
			 									<td align="right">Uang Muka PO :</td>
												<td><input id="uang-muka" name="prepayment" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Angsuran :</td>
												<td><input id="angsuran" name="installment" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tenor :</td>
												<td><input id="tenor" name="tenor" disabled maxlength="2" class='input-disabled' size="10"/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Harga OTR :</td>
												<td><input id="harga-otr" name="otrPrice" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Leasing :</td>
												<td>
													<select id='leasing' name=leasing  disabled class='combobox-medium input-disabled'><option value="0"></option></select>
													<img id='leasing-browse' hidden="true" src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Payment Leasing" />
												</td>
				 							</tr>
				 							<tr>
			 									<td align="right">Subsidi Leasing :</td>
												<td><input id="subsidi-leasing" name="subdiction" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Subsidi Main Dealer :</td>
												<td><input id="subsidi-maindealer" name="subdictionMainDealer" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Disc Program :</td>
												<td><input id="disc-program" name="discProgram" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">No PO :</td>
												<td><input id="no-po" name="poLeasing" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right" valign="top">Keterangan :</td>
												<td valign="top"><textarea id="note" name="ponote" cols="30" rows="3" class="input-disabled" disabled></textarea></td>
				 							</tr>
										</table>
									</td>
									<td valign="top" width="35%">
										<fieldset>
											<legend>Status Leasing</legend>
											<table>
											<tr>
			 									<td align="right">Keputusan Leasing :</td>
												<td>
													<select name="status" id="status" onchange="checkStatus();">
														<option value="PILIH"></option>
														<option value="APPROVED">APPROVED</option>
														<option value="REJECTED">REJECTED</option>
													</select>
												</td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tanggal Keputusan :</td>
												<td><input id="date" name="date" formatLength="long" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
				 							</tr>
				 							<tr>
			 									<td align="right" valign="top">Keterangan Tambahan :</td>
												<td valign="top"><textarea cols="30" rows="3" name="note"></textarea></td>
				 							</tr>
										</table>
										</fieldset>
									</td>
								</tr>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<script type="text/javascript">
function setCustomerInfo(id,cust)
{
	$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:cust},function(json){
		$("#"+id+"-address").val(json.address);
		$("#"+id+"-province").val(json.province);
		$("#"+id+"-city").val(json.city);
		$("#"+id+"-subdistrict").val(json.subdistrict);
		$("#"+id+"-village").val(json.village);
	});
}

setCustomerInfo("license","${application.unitSalesOrder.customerUnit.id}");

function checkStatus()
{
	var status = $("#status").val();
	if(status == 'PILIH' || status == 'REJECTED')
	{
		$("#tipe-motor").attr("disabled", "true");
		$("#tipe-motor").attr("class","input-disabled");
		$("#browse").attr("hidden", "true");
		$("#uang-muka").attr("disabled", "true");
		$("#uang-muka").attr("class","input-disabled");
		$("#angsuran").attr("disabled", "true");
		$("#angsuran").attr("class","input-disabled");
		$("#tenor").attr("disabled", "true");
		$("#tenor").attr("class","input-disabled");
		$("#harga-otr").attr("disabled", "true");
		$("#harga-otr").attr("class","input-disabled");
		$("#leasing").attr("disabled", "true");
		$("#leasing").attr("class","combobox-medium input-disabled");
		$("#leasing-browse").attr("hidden", "true");
		$("#subsidi-leasing").attr("disabled", "true");
		$("#subsidi-leasing").attr("class","input-disabled");
		$("#subsidi-maindealer").attr("disabled", "true");
		$("#subsidi-maindealer").attr("class","input-disabled");
		$("#disc-program").attr("disabled", "true");
		$("#disc-program").attr("class","input-disabled");
		$("#no-po").attr("disabled", "true");
		$("#no-po").attr("class","input-disabled");
		$("#note").attr("disabled", "true");
		$("#note").attr("class","input-disabled");
	}
	else
	{
		$("#tipe-motor").removeAttr("disabled");
		$("#tipe-motor").attr("class","");
		$("#browse").removeAttr("hidden");
		$("#uang-muka").removeAttr("disabled");
		$("#uang-muka").attr("class","");
		$("#angsuran").removeAttr("disabled");
		$("#angsuran").attr("class","");
		$("#tenor").removeAttr("disabled");
		$("#tenor").attr("class","");
		$("#harga-otr").removeAttr("disabled");
		$("#harga-otr").attr("class","");
		$("#leasing").removeAttr("disabled");
		$("#leasing").attr("class","combobox-medium");
		$("#leasing-browse").removeAttr("hidden");
		$("#subsidi-leasing").removeAttr("disabled");
		$("#subsidi-leasing").attr("class","");
		$("#subsidi-maindealer").removeAttr("disabled");
		$("#subsidi-maindealer").attr("class","");
		$("#disc-program").removeAttr("disabled");
		$("#disc-program").attr("class","");
		$("#no-po").removeAttr("disabled");
		$("#no-po").attr("class","");
		$("#note").removeAttr("disabled");
		$("#note").attr("class","");
	}
}

function validation()
{
	if($("#status").val() == 'PILIH')
	{
		alert('Please select Leasing Status first !!!');
		return;
	}
	
	if($("#status").val() == 'APPROVED')
	{
		if($("#tipe-motor").val() == '')
		{
			alert('Tipe Motor tidak boleh kosong !!!');
			return;
		}
		
		if($("#uang-muka").val() == '')
		{
			alert('Uang Muka tidak boleh kosong !!!');
			return;
		}
		
		if($("#angsuran").val() == '')
		{
			alert('Angsuran tidak boleh kosong !!!');
			return;
		}
		
		if($("#tenor").val() == '')
		{
			alert('Tenor tidak boleh kosong !!!');
			return;
		}
		
		if($("#harga-otr").val() == '')
		{
			alert('Harga OTR tidak boleh kosong !!!');
			return;
		}
		
		if($("#leasing").val() == '' || $("#leasing").val() == '0')
		{
			alert('Mohon pilih Leasing terlebih dahulu !!!');
			return;
		}
		
		if($("#subsidi-leasing").val() == '')
		{
			alert('Subsidi Leasing tidak boleh kosong !!!');
			return;
		}
		
		if($("#subsidi-maindealer").val() == '')
		{
			alert('Subsidi Maindealer tidak boleh kosong !!!');
			return;
		}
		
		if($("#disc-program").val() == '')
		{
			alert('Disc Program tidak boleh kosong !!!');
			return;
		}
		
		if($("#no-po").val() == '')
		{
			alert('No PO tidak boleh kosong !!!');
			return;
		}
	}
	
	return true;
}

function openLeasing(target)
{
	/* var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Company first !!!');
		return;
	} */
	
	openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization="+${application.unitSalesOrder.organization.id}+"'/>");
}

$(document).ready(function()
{
	$(".item-button-save").click(function()
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/paymentleasingprocess.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Payment Leasing data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/paymentleasingview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		}
	});
	
	$("#uang-muka").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("uang-muka");
    });
	
	$("#angsuran").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("angsuran");
    });
	
	$("#tenor").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
    {
        limit();
    });
	
	$("#harga-otr").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("harga-otr");
    });
	
	$("#subsidi-leasing").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("subsidi-leasing");
    });
	
	$("#subsidi-maindealer").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("subsidi-maindealer");
    });
	
	$("#disc-program").keydown(function(event)
	{
		numberOnly(event);
    }).keyup(function(event)
	{
		separator("disc-program");
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

function limit()
{
	var limit = parseInt($(this).attr('maxlength'));
    var text = $(this).val();
    var chars = text.length;

    if(chars > limit){
        var new_text = text.substr(0, limit);
        $(this).val(new_text);
    }
}

function separator(id)
{
	var amount = document.getElementById(id);

	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
	}
}
</script>
<!-- END OF BODY -->
</html>
