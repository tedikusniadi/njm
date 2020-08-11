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
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptfromfileview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt_add.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt_add.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Grid :</td>
                                          	<td width="74%">
                                          		<select id='allgrid' class="combobox-ext input-disabled" disabled>
                                                	<option value="${grid.id}"><c:out value='${grid.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${goodsReceipt_add.date}' pattern="dd-MM-yyyy"/>" class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7" disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
                                          		<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'UNIT_PURCHASE_ORDER'}">
                                                	<input value="Unit Purchase Order" class='input-disabled' size='45'/>
                                                </c:if>
												<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'PURCHASE_ORDER'}">
                                                	<input value="Purchase Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45'/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${goodsReceipt_add.warehouseTransaction.receiptables}' var='rec'>
                                            <c:if test="${rec.product.productCategory.id == 1}">
                                            <tr>
                                            	<td>${rec.product.name}</td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="pro-${rec.product.id}" value="${rec.quantity}"/>
                                                </td>
                                                <td>
                                                	<input id="rec" value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="rec-${rec.product.id}" value="${rec.receipted}"/>
                                                    </td>
                                                <td><input id="unrec-${rec.product.id}" value="0.00" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:if>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>

                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <!-- <th width="20%">Product</th> -->
	  	  	  	  	  	  			<th width="18%">Tipe</th>
	  	  	  	  	  	  			<th width="18%">Nama Tipe</th>
                                    <th width="18%">Warna</th>
	  	  	  	  	  	  			<th width="15%">Grid</th>
                                  	<th width="10%">Jumlah</th>
                                    <th width="18%">No.Mesin</th>
                                    <th width="18%">No.Rangka</th>
                                    <th width="10%">Tahun</th>
                                    <th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable" onclick="checkAll('lineItemTable');"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="value" value="0" />
                                <c:forEach items='${goodsReceipt_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<%-- <td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.name}" disabled/></td> --%>
                                	<td><input class="input-disabled" size="28" value="${item.warehouseTransactionItem.product.types}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.warehouseTransactionItem.product.typeNames}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.warehouseTransactionItem.product.colors}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='8' value="<fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/>"/></td>
                                    <%-- <td><input class="input-disabled" size="5" value="${item.warehouseTransactionItem.measureName}" disabled/></td> --%>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                </tr>
	                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
	                                	<tr>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                    <td><input class="input-disabled" disabled size='8' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
		                                    <td><form:input class="" size="20" id="serial[${value}]" path="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serial}"/>
		                                    <td><form:input class="" size="20" id="serial2[${value}]" path="items[${status.index}].details[${detailstatus.index}].serialExt1" value="${detail.serialExt1}"/></td>
		                                    <td><form:input class="" size="5" id="year[${value}]" path="items[${status.index}].details[${detailstatus.index}].year" value="${detail.year}"/></td>
		                                    <td><form:checkbox path="items[${status.index}].details[${detailstatus.index}].checked" value="true" id="check[${value}]" onclick="pilih('${value}');"/></td>
		                                </tr>
		                                <c:set var="value" value="${value + 1}" />
	                                </c:forEach>
                                </c:forEach>
                                <input hidden="true" id="itemSize" value="${value}"/>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function()
	{
		var len = document.getElementById('itemSize').value;
		for(var i = 0;i < len; i++)
		{
			$("#serial\\["+i+"\\]").keydown(function(event)
			{
		        noSpace(event);
		    });

			$("#serial2\\["+i+"\\]").keydown(function(event)
			{
		        noSpace(event);
		    });
		}
		
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function()
		{
			if(validation()) 
			{
				$.ajax({
					url:"<c:url value='/page/goodsreceiptfromfileadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Goods Receipt data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/goodsreceiptfromfileview.htm'/>";
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
		var tbl = document.getElementById('lineItemTable');
		if(tbl)
		{
			var ada = false;
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			var i = 0;
			while(i < len-1)
			{
				var cname=document.getElementById('check['+i+']');
				if(cname)
				{
					if(cname.checked)
						ada = true;
				}
				i++;
			}
			
			if(ada == false)
			{
				alert('Anda tidak memilih item yang akan di simpan !!!');
				return;
			}
			
			var end = false;
			var x = 0;
			var y = 0;
			var sama = false;
			while(x < len-1)
			{
				var sama = false;
				y = x+1;
				
				var cek = document.getElementById('check['+x+']');
				var mesin=document.getElementById('serial['+x+']');
				var rangka=document.getElementById('serial2['+x+']');
				if(cek && mesin && rangka)
				{
					if(cek.checked)
					{
						while(y < len-1)
						{
							var cek2 = document.getElementById('check['+y+']');
							if(cek2)
							{
								if(cek2.checked)
								{
									var serial1=document.getElementById('serial['+y+']');
									var serial2=document.getElementById('serial2['+y+']');
									
									if(mesin.value == serial1.value)
									{
										alert('No Mesin '+mesin.value+' tidak boleh sama !!!');
										sama = true;
										break;
									}
									if(rangka.value == serial2.value)
									{
										alert('No Rangka '+rangka.value+' tidak boleh sama !!!');
										sama = true;
										break;
									}
								}
							}
							y++;
						}
					}
				}
				if(sama == true)
					break;
				
				x++;
			}
			if(sama == true)
				return;
		}
		else
		{
			alert('Table doesnot exsist!');
			return;
		}
		
		return true;
	}
	
	function checkAll(id)
	{
		var checked = document.getElementById("checkMaster_"+id).checked ;
		var tbl = document.getElementById(id);
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			var i = 0;
			while(i < len-1)
			{
				var cname=document.getElementById('check['+i+']');
				if(cname)
				{
					var serial = document.getElementById('serial['+i+']');
					var serial2 = document.getElementById('serial2['+i+']');
					var year = document.getElementById('year['+i+']');
					
					cname=cname.id;
					cname=cname.replace("[","\\[");
					cname=cname.replace("]","\\]");
					var $chk=$("#"+cname);
					if(checked)
					{
						/* if(serial.value == '')
						{
							alert('Mohon masukkan No. Mesin terlebih dahulu !!!');
							$chk.removeAttr("checked");
							return;
						}
						
						if(serial2.value == '')
						{
							alert('Mohon masukkan No. Rangka terlebih dahulu !!!');
							$chk.removeAttr("checked");
							return;
						}
						
						if(year.value == '')
						{
							alert('Mohon masukkan Tahun terlebih dahulu !!!');
							$chk.removeAttr("checked");
							return;
						} */
						
						if(serial.value == '' || serial2.value == '' || year.value == '')
							$chk.removeAttr("checked");
						else
							$chk.attr("checked",true);
						
						/* serial.disabled = true;
						serial2.disabled = true;
						year.disabled = true; */
					}
					else
					{
						$chk.removeAttr("checked");
						/* serial.disabled = false;
						serial2.disabled = false;
						year.disabled = false; */
					}
				}
				i++;
			}
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}
	
	function pilih(index)
	{
		var check = document.getElementById('check['+index+']');
		
		var serial = document.getElementById('serial['+index+']');
		var serial2 = document.getElementById('serial2['+index+']');
		var year = document.getElementById('year['+index+']');
		
		/* if(check.checked == false)
		{
			serial.disabled = false;
			serial2.disabled = false;
			year.disabled = false;
		}
		else
		{ */
			if(serial.value == '')
			{
				alert('Mohon masukkan No. Mesin terlebih dahulu !!!');
				check.checked = false;
				return;
			}
			
			if(serial2.value == '')
			{
				alert('Mohon masukkan No. Rangka terlebih dahulu !!!');
				check.checked = false;
				return;
			}
			
			if(year.value == '')
			{
				alert('Mohon masukkan Tahun terlebih dahulu !!!');
				check.checked = false;
				return;
			}
			/* serial.disabled = true;
			serial2.disabled = true;
			year.disabled = true; */
		//}
	}
	
	/* function checkSpace(target)
	{
		$(target).keydown(function(event)
		{
	        noSpace(event);
	    });
	} */

	function noSpace(event)
	{
		if (event.keyCode == 0 || event.keyCode == 32)
		{
		    event.preventDefault();
		}
	}
</script>