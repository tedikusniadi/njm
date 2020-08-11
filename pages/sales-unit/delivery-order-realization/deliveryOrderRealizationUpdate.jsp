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
</head>

<body onload="error();">

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
							<a class="item-button-list" href="<c:url value='/page/unitdeliveryorderrealizationview.htm'/>"><span><spring:message code='list'/></span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="54%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="74%"><input value="${order_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select id="org" cssClass="combobox-ext input-disabled" disabled="disabled">
                                                    <option><c:out value='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">DO Date :</td>
                                            <td><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.deliveryOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Customer :</td>
                                          <td width="74%"><input value="${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_edit.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Reference :</td>
                                          	<td width="74%">
                                          		<a href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${order_edit.deliveryOrder.id}'/>">
                                          			<c:out value='${order_edit.deliveryOrder.code}'/>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                                <select class="combobox-ext input-disabled" disabled>
                                                    <option><c:out value='${order_edit.deliveryOrder.deliveryPlanningSequence.facility.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="46%" valign="top">
   	    		    					<fieldset>
                                        	<legend>DO Realization</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<td width="34%" align="right">Delivery Acceptance Date</td>
                                                <td width="1%">:</td>
                                              	<td width="65%"><input class="input-disabled" disablead size="15" value="<fmt:formatDate value='${order_edit.acceptanceDate}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Document Return Date</td>
                                                <td>:</td>
                                                <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${order_edit.docDate}' pattern='dd-MM-yyyy'/>"/></td>
                                            </tr>
                                            <c:if test="${not empty order_edit.phoneFirst and order_edit.phoneFirst != '01234'}">
                                              <tr>
                                            	<td align="right">Konfirmasi No Telepon</td>
                                                <td>:</td>
                                           	  	<td>
	                                           	  	<input id="phoneCode" maxlength="4" size="5" hidden="true"/>
				 							  		<input id="phoneNumber" hidden="true"/>
                                           	  		<form:input path="phoneFirst" disabled="disabled" cssClass="input-disabled"/>
                                           	  		<input id="editTlp" type='radio' value='no' onclick="editTelepon('no')"/>Edit
                                           	  	</td>
                                        	</tr>
                                        	</c:if>
                                        	<c:if test="${not empty order_edit.phoneSecond and order_edit.phoneSecond != '01234'}">
                                        	 <tr>
                                            	<td align="right">Konfirmasi No Handphone</td>
                                                <td>:</td>
                                           	  	<td>
	                                           	  	<input id="mobileCode" maxlength="4" size="5" hidden="true"/>
				 							  		<input id="mobileNumber" hidden="true"/>
                                           	  		<form:input path="phoneSecond" disabled="disabled" cssClass="input-disabled"/>
                                           	  		<input id="editHp" type='radio' value='no' onclick="editHandphone('no')"/>Edit
                                           	  	</td>
                                        	</tr>
                                        	</c:if>
                                        	<c:if test="${empty order_edit.phoneFirst or order_edit.phoneFirst == '01234'}">
                                            <tr>
                                            	<td align="right">Konfirmasi No Telepon</td>
                                                <td>:</td>
                                           	  	<td>
	                                           	  	<input id="phoneCode" maxlength="4" size="5"/>
				 							  		<input id="phoneNumber"/>
				 							  		<input id="editTlp" type='radio' value='yes' hidden="true"/>
                                           	  		<form:input type="hidden" path="phoneFirst"/>
                                           	  	</td>
                                        	</tr>
                                        	</c:if>
                                        	<c:if test="${empty order_edit.phoneSecond or order_edit.phoneFirst == '01234'}">
                                        	<tr>
                                            	<td align="right">Konfirmasi No Handphone</td>
                                                <td>:</td>
                                           	  	<td>
	                                           	  	<input id="mobileCode" maxlength="4" size="5"/>
				 							  		<input id="mobileNumber"/>
				 							  		<input id="editHp" type='radio' value='yes' hidden="true"/>
                                           	  		<form:input type="hidden" path="phoneSecond"/>
                                           	  	</td>
                                        	</tr>
                                        	</c:if>
                                            <tr>
                                            	<td align="right">Note</td>
                                                <td>:</td>
                                           	  <td><form:textarea path='note' rows='4' cols='30'/></td>
                                        	</tr>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                        	<legend>Reference</legend>
                                            <table style="border:none" width="100%">
                                            <tr>
                                            	<td align="right">Journal Entry:</td>
                                                <td><a href="<c:url value='/page/journalentrypreview.htm?id=${order_edit.journalEntry.id}'/>"><c:out value='${order_edit.journalEntry.code}'/></a></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Product" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="30%">Product</th>
                                          	<th width="9%">Quantity</th>
                                          	<th width="7%">Accepted</th>
                                          	<th width="8%">Canceled</th>
                                          	<th width="8%">Resend</th>
                                          	<th width="6%">UoM</th>
                                          	<th width="32%">Billing</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_edit.items}" var="line" varStatus='status'>
                                        <c:if test="${line.item.product.productCategory.id == '1'}">
	                                        <tr>
	                                            <td><c:out value='${line.item.product.code} - ${line.product.name}'/></td>
	                                            <td><fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.accepted}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.returned}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.item.quantity - line.item.quantity}' pattern=',##0.00'/></td>
	                                            <td><c:out value='${line.item.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
	                                            <td>
	                                            	<c:forEach items='${line.lineItems}' var='lineItem'>
	                                                	<a href="<c:url value='/page/unitbillingpreedit.htm?id=${lineItem.billing.id}'/>"><c:out value='${lineItem.billing.code}'/></a>,
	                                                </c:forEach>
	                                            </td>
	                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="cost" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
                                    <table id="lineItemTableAccessories" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="30%">Product</th>
                                          	<th width="9%">Quantity</th>
                                          	<th width="7%">Accepted</th>
                                          	<th width="8%">Canceled</th>
                                          	<th width="8%">Resend</th>
                                          	<th width="6%">UoM</th>
                                          	<th width="32%">Billing</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_edit.items}" var="line" varStatus='status'>
                                        <c:if test="${line.item.product.productCategory.id == '3'}">
	                                        <tr>
	                                            <td><c:out value='${line.item.product.code} - ${line.product.name}'/></td>
	                                            <td><fmt:formatNumber value='${line.item.quantity}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.accepted}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.returned}' pattern=',##0.00'/></td>
	                                            <td><fmt:formatNumber value='${line.item.quantity - line.item.quantity}' pattern=',##0.00'/></td>
	                                            <td><c:out value='${line.item.item.sequenceable.product.unitOfMeasure.measureId}'/></td>
	                                            <td>
	                                            	<c:forEach items='${line.lineItems}' var='lineItem'>
	                                                	<a href="<c:url value='/page/billingpreedit.htm?id=${lineItem.billing.id}'/>"><c:out value='${lineItem.billing.code}'/></a>,
	                                                </c:forEach>
	                                            </td>
	                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="exp" dojoType="ContentPane" label="Shipping & Expedition" class="tab-pages" refreshOnShow="true">
                                    	<table style="border:none" width="100%">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Expedition :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
                                                	<option><c:out value='${order_edit.expedition.firstName} ${order_edit.expedition.lastName} ${order_edit.deliveryOrder.expedition.middleName}'/></option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Vehicle :</td>
                                            <td>
                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.vehicle}'>
                                                    <form:option value='${order_edit.vehicle.id}' label='${order_edit.vehicle.name}' />
                                                </c:if>
                                            </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Driver :</td>
                                            <td>
                                                <form:select id="driver" path="driver" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.driver}'>
                                                    <form:option value='${order_edit.driver.id}' label='${order_edit.driver.firstName} ${order_edit.driver.lastName} ${order_edit.driver.middleName}' />
                                                </c:if>
                                            </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rit :</td>
                                            <td><input size="5" disabled class="input-disabled" value="${order_edit.deliveryOrder.rit}"/></td>
                                        </tr>
                                        </table>
                                    </div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}

	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'DO Realization',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(){
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/unitdeliveryorderrealizationedit.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving DO Realization data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitdeliveryorderrealizationview.htm'/>";
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

		$("#phoneCode").keydown(function(event)
		{
	        numberOnly(event);
	    }).change(function()
   		{
	    	var phoneCode = ''+$("#phoneCode").val();
	    	var phoneNumber = ''+$("#phoneNumber").val();
	    	$("#phoneFirst").val(phoneCode+phoneNumber);
   		});

		$("#phoneNumber").keydown(function(event)
		{
	        numberOnly(event);
	    }).change(function()
   		{
	    	var phoneCode = ''+$("#phoneCode").val();
	    	var phoneNumber = ''+$("#phoneNumber").val();
	    	$("#phoneFirst").val(phoneCode+phoneNumber);
   		});

		$("#mobileCode").keydown(function(event)
		{
	        numberOnly(event);
	    }).change(function()
   		{
	    	var mobileCode = ''+$("#mobileCode").val();
	    	var mobileNumber = ''+$("#mobileNumber").val();
	    	$("#phoneSecond").val(mobileCode+mobileNumber);
   		});

		$("#mobileNumber").keydown(function(event)
		{
	        numberOnly(event);
	    }).change(function()
   		{
	    	var mobileCode = ''+$("#mobileCode").val();
	    	var mobileNumber = ''+$("#mobileNumber").val();
	    	$("#phoneSecond").val(mobileCode+mobileNumber);
   		});
	});

	function validation()
	{
		if($("#editTlp").val() == 'yes')
		{
			if($("#phoneCode").val() != '')
			{
				if($("#phoneCode").val().length < 3 || $("#phoneCode").val().length > 4)
				{
					alert('Kode Area minimal 3 digit dan maksimal 4 digit !!!');
					return;
				}
			}
			else
			{
				if($("#phoneNumber").val() != '01234')
				{
					alert('Please input 01234 in Phone Number field !!!');
					return;
				}
			}

			if($("#phoneNumber").val() != '')
			{
				if($("#phoneNumber").val().length < 5)
				{
					alert('Phone Number cannot less than 5 characters !!!');
					return;
				}
			}
			else
			{
				alert('Phone Number cannot be empty, please at least input 01234 !!!');
				return;
			}
		}

		if($("#editHp").val() == 'yes')
		{
			if($("#mobileCode").val() != '')
			{
				if($("#mobileCode").val().length < 3 || $("#mobileCode").val().length > 4)
				{
					alert('Kode Operator minimal 3 digit dan maksimal 4 digit !!!');
					return;
				}
			}
			else
			{
				if($("#mobileNumber").val() != '01234')
				{
					alert('Mobile Number cannot be empty, please at least input 01234 !!!');
					return;
				}
			}
	
			if($("#mobileNumber").val() != '')
			{
				if($("#mobileNumber").val().length < 5)
				{
					alert('Mobile Number cannot less than 5 characters !!!');
					return;
				}
			}
			else
			{
				alert('Mobile Number cannot be empty, please at least input 01234 !!!');
				return;
			}
		}

		return true;
	}
	
	function editTelepon(val)
	{
		$("#editTlp").attr("hidden", "true");
		$("#editTlp").val("yes");
		$("#phoneFirst").removeAttr("disabled");
		$("#phoneFirst").attr("hidden", "true");
		
		$("#phoneCode").removeAttr("hidden");
		$("#phoneNumber").removeAttr("hidden");
	}
	
	function editHandphone(val)
	{
		$("#editHp").attr("hidden", "true");
		$("#editHp").val("yes");
		$("#phoneSecond").removeAttr("disabled");
		$("#phoneSecond").attr("hidden", "true");
		
		$("#mobileCode").removeAttr("hidden");
		$("#mobileNumber").removeAttr("hidden");
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
</script>
<%@ include file="/common/dialog.jsp"%>