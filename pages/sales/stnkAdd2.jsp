<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
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
							<a class="item-button-list" href="<c:url value='/page/stnkview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="stnk_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">No SPK :</td>
                                          	<td width="73%"><input value="${orderItem.unitSalesOrder.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                         <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Nama Pemesan :</td>
                                          	<td width="73%">
                                          		<input class="inputbox input-disabled" disabled value="${orderItem.unitSalesOrder.customer.name}"/>
                                          	</td>
                                        </tr>
                                         <tr>
                                            <td nowrap="nowrap" align="right">Nama STNK :</td>
                                          	<td>
                                          		<input class="inputbox input-disabled" disabled value="${orderItem.unitSalesOrder.customerUnit.name}"/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input id="date" value="<fmt:formatDate value='${orderItem.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tipe :</td>
                                            <td>
                                            	<input value='${orderItem.price.product.types}' disabled class='inputbox input-disabled'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Nama Tipe :</td>
                                            <td>
                                            	<input value='${orderItem.price.product.typeNames}' disabled class='inputbox input-disabled'/>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Warna :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.product.colors}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No Mesin :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.serial}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No Rangka :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.serialExt1}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Status STNK</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="40%"align="right">Tanggal Terima STNK :</td>
                                                        <td width="60%"><input inputId="stnkDateId" id="stnkDate" name="receivedDate" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nomor STNK :</td>
                                                        <td><input id="stnkNo" name="referenceNo" size="30""/></td>
                                                        <input type="hidden" id="salesId" name="salesId" value="${orderItem.unitSalesOrder.id}"></input>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nomor Plat :</td>
                                                        <td><input id="platNo" name="referenceNoExt" size="30"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nomor BPKB :</td>
                                                        <td><input id="bpkbNo" name="referenceNoExt2" size="30"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Notice Pokok :</td>
                                                        <td><input id="noticePokok" name="noticeAmount" size="20" onkeyup="separator('noticePokok');"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Keterangan Tambahan :</td>
                                                        <td><textarea id="note" name="note1" cols="32" rows="5"></textarea></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                		</table>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'STNK',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if($("#stnkDateId").val() == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if($("#stnkNo").val() == '')
		{
			alert('No STNK cannot be empty !!!');
			return;
		}
		
		if($("#platNo").val() == '')
		{
			alert('No Plat cannot be empty !!!');
			return;
		}
		
		if($("#noticePokok").val() <= 0)
		{
			alert('Notice Pokok cannot be empty n must be greater than zero !!!');
			return;
		}
		
		$('.b_save').hide();
		$.ajax({
			url:"<c:url value='/page/stnkadd.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving STNK data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/stnkview.htm'/>";
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

	$("#stnkNo").keydown(function(event)
	{
		noSpace(event);
	});

	$("#platNo").keydown(function(event)
	{
		noSpace(event);
	});
	
	$("#noticePokok").keydown(function(event)
	{
        numberOnly(event);
    });
});

function noSpace(event)
{
	if (event.keyCode == 0 || event.keyCode == 32)
	{
    	event.preventDefault();
	}
}

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

function separator(id)
{
	var amount = document.getElementById(id);
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
	}
}
</script>