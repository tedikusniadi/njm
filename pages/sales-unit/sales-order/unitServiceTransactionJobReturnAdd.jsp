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
							<a class="item-button-list" href="<c:url value='/page/unitservicetransactionjobreturnview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="jobReturn">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='30'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" class="combobox-ext">
                                                    <c:if test='${not empty jobReturn.organization}'>
                                                        <form:option value='${jobReturn.organization.id}' label='${jobReturn.organization.name}'/>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" inputId="dateId" name="date" value="<fmt:formatDate value='${jobReturn.date}' pattern='dd/MM/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
										<tr>
											<td align="right">No Transaksi Service :</td>
											<td>
                                                <form:select id="unitServiceTransaction" path="unitServiceTransaction" class="combobox-ext">
                                                    <c:if test='${not empty jobReturn.unitServiceTransaction}'>
                                                        <form:option value='${jobReturn.unitServiceTransaction.id}' label='${jobReturn.unitServiceTransaction.code}'/>
                                                    </c:if>
                                                    <c:if test='${empty jobReturn.unitServiceTransaction}'>
                                                    	<option value="0">---Pilih No Transaksi Service---</option>
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              	<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/unitservicetransactionpopup.htm?target=unitServiceTransaction&organization=${jobReturn.organization.id}'/>');" style="CURSOR:pointer;" title="Unit Service Transaction" />
											</td>
										</tr>
										<tr>
											<td align="right">Tanggal Service Sebelumnya :</td>
											<td><input id="serviceDate" value="" disabled class='input-disabled' size='15'/></td>
										</tr>
										<tr>
											<td align="right">No Kendaraan :</td>
											<td><input id="plateNo" value="" disabled class='input-disabled' size='15'/></td>
										</tr>
										<tr>
											<td align="right">Mekanik Lama :</td>
											<td><input id="serviceByBefore" value="" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Mekanik Baru :</td>
                                            <td>
                                                <form:select id="serviceBy" path="serviceBy" class="combobox-ext">
                                                    <c:if test='${not empty jobReturn.serviceBy}'>
                                                        <form:option value='${jobReturn.serviceBy.id}' label='${jobReturn.serviceBy.name}' />
                                                    </c:if>
                                                    <c:if test='${empty jobReturn.serviceBy}'>
                                                    	<option value="0">---Pilih Mekanik Baru---</option>
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              	<img src="assets/icons/list_extensions.gif" onclick="javascript:openMechanicByOrg('serviceBy');" style="CURSOR:pointer;" title="Mechanic" />
                                            </td>
                                        </tr>
										<tr>
											<td align="right">KM Kembali :</td>
											<td><input id="distance" name="distance"/></td>
										</tr>
										<tr>
											<td align="right">Jam Masuk :</td>
											<td><input type="text" name="serviceStart" id="serviceStart" inputId="serviceStartId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
										</tr>
										<tr>
											<td align="right">Jam Keluar :</td>
											<td><input type="text" name="serviceEnd" id="serviceEnd" inputId="serviceEndId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
										</tr>
                                      </table>
                                  </td>
                                  <td>
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Keluhan :</td>
                                          	<td width="73%"><form:textarea id="complaint" path='complaint' cols='45' rows='5'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Sebab Keluhan :</td>
                                            <td><form:textarea id="reason" path='reason' cols='45' rows='5'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Perbaikan :</td>
                                            <td><form:textarea id="enhancement" path='enhancement' cols='45' rows='5'/></td>
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Job Return',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/unitservicetransactionjobreturnadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Job Return data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitservicetransactionjobreturnview.htm'/>";
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
	});
	
	function validation()
	{
		if($('#unitServiceTransaction').val() == '0')
		{
			alert('Mohon pilih No Transaksi Service terlebih dahulu !!!');
			return;
		}
		
		if($('#serviceBy').val() == '0')
		{
			alert('Mohon pilih Mekanik Baru terlebih dahulu !!!');
			return;
		}
		
		if($('#distance').val() == '')
		{
			alert('KM kembali tidak boleh kosong !!!');
			return;
		}
		
		if($('#serviceStartId').val() == '')
		{
			alert('Jam Masuk tidak boleh kosong !!!');
			return;
		}
		
		if($('#serviceEndId').val() == '')
		{
			alert('Jam Keluar tidak boleh kosong !!!');
			return;
		}
		
		if($('#complaint').val() == '')
		{
			alert('Keluhan tidak boleh kosong !!!');
			return;
		}
		
		if($('#reason').val() == '')
		{
			alert('Sebab Keluhan tidak boleh kosong !!!');
			return;
		}
		
		if($('#enhancement').val() == '')
		{
			alert('Perbaikan tidak boleh kosong !!!');
			return;
		}

		return true;
	}
</script>