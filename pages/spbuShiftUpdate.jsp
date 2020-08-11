<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SPBU Shift Report >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onLoad="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">SPBU > Shift Report > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">B30 - Shift Report</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/spbushiftview.htm'/>"><span>List</span></a>
                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form name="editForm" method="post" modelAttribute="shift_edit">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="14%" nowrap="nowrap" align="right">ID :</td>
                               	  	<td width="45%"><input value="${shift_edit.code}" class='input-disabled' size='25'/></td>
                               		<td width="41%" rowspan="6" valign="top">
                           	    		<fieldset>
                                        	<legend>Volume Recapitulation</legend>
                                            <table style="border:none;" width="100%">
                                            <tr>
                                            	<td width="54%" align="right">Total Tank Sales :</td>
                                              	<td width="46%"><input id='t_tank' size="15" style="text-align:right;" value="<fmt:formatNumber value='${t_tank_sales}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Nozzle Sales :</td>
                                                <td><input id='t_nozzle' size="15" style="text-align:right;" value="<fmt:formatNumber value='${t_nozzle_sales}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Opname Gain/Loss :</td>
                                                <td><input id='t_opname' size="15" style="text-align:right;" value="<fmt:formatNumber value='${t_opname_gain_loss}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Grand Total Gain/Loss :</td>
                                                <td><input id='t_grand' size="15" style="text-align:right;" value="<fmt:formatNumber value='${t_grand_gain_loss}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty shift_edit.organization}'>
                                                <form:option value='${shift_edit.organization.id}' label='${shift_edit.organization.firstName} ${shift_edit.organization.lastName} ${shift_edit.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input disabled class='input-disabled' size="12" value="<fmt:formatDate value='${shift_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Shift No :</td>
                                    <td>
                                        <form:select id="no" path="shift" disabled='true'>
                                            <form:option value='1' label='1'/>
                                            <form:option value='2' label='2'/>
                                            <form:option value='3' label='3'/>
                                            <form:option value='4' label='4'/>
                                            <form:option value='5' label='5'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 500px;">
                                	<c:forEach items='${shift_edit.details}' var='detail' varStatus='detailStatus'>
              						<div id="tank[detail.tank.id][${detailStatus.index}]" dojoType="ContentPane" label="${detail.tank.name}" class="tab-pages" refreshOnShow="true">
                                        <table width="100%" style="border:none">
                                        <tr>
                                            <td width="14%" nowrap="nowrap" align="right">Product :</td>
                                            <td width="45%"><input value="${detail.tank.product.code} ${detail.tank.product.name}" class='input-disabled' size='35' disabled/></td>
                                            <td width="41%" rowspan="10" valign="top">
                                                <fieldset>
                                                    <legend>Volume Recapitulation</legend>
                                                    <table style="border:none;" width="100%">
                                                    <tr>
                                                        <td width="54%" align="right">Begin Tank Volume :</td>
                                                      	<td width="46%"><input id='t_tank_volume[${detailStatus.index}]' value="<fmt:formatNumber value='${detail.tank.position}' pattern=',##0.00'/>" size="15" style="text-align:right;" class="input-disabled" disabled /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Receive :</td>
                                                        <td><input id='t_receive[${detailStatus.index}]' size="15" style="text-align:right;" value="<fmt:formatNumber value='${detail.receive}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">End Tank Volume :</td>
                                                        <td><input size="15" style="text-align:right;" value="<fmt:formatNumber value='${detail.endVolume}' pattern='##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Receive Gain/Loss :</td>
                                                        <td><input size="15" style="text-align:right;" value="<fmt:formatNumber value='${detail.receiveGainLoss}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tank Sales :</td>
                                                        <td><input size="15" style="text-align:right;" value="<fmt:formatNumber value='${detail.endVolume-detail.startVolume}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nozzle Sales :</td>
                                                        <td>
                                                        	<c:set var='n_sales' value='${0}'/>
                                                            <c:forEach items='${detail.nozzles}' var='nozzle'>
                                                            	<c:set var='n_sales' value='${n_sales+(nozzle.reset-nozzle.start+nozzle.ending-(nozzle.endTera-nozzle.startTera))}'/>
                                                            </c:forEach>
                                                        	<input size="15" style="text-align:right;" value="<fmt:formatNumber value='${n_sales}' pattern=',##0.00'/>" class="input-disabled" disabled/>
                                                            <c:remove var='n_sales'/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Opname Gain/Loss :</td>
                                                        <td><input size="15" style="text-align:right;" value="<fmt:formatNumber value='${(detail.endVolume-detail.startVolume)-n_sales}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Gain/Loss :</td>
                                                        <td><input size="15" style="text-align:right;" value="<fmt:formatNumber value='${((detail.endVolume-detail.startVolume)-n_sales)-detail.receiveGainLoss}' pattern=',##0.00'/>" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Beginning Level :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${detail.startLevel}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Beginning Volume :</td>
                                            <td><input id='startVolume[${detailStatus.index}]' disabled class="input-disabled" value="<fmt:formatNumber value='${detail.startVolume}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Ending Level :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${detail.endLevel}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Ending Volume :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatNumber value='${detail.endVolume}' pattern=',##0.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path='details[${detailStatus.index}].note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                        <div class="clears">&nbsp;</div>
                                        <table class="table-list" id="table[${detailStatus.index}]" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="10%">Nozzle</th>
                                   	  	  	<th width="8%">Begin</th>
                                       	  	<th width="8%">End</th>
                                       	  	<th width="8%">Reset</th>                                    
                                       	  	<th width="8%">Begin Tera</th>
                                       	  	<th width="8%">End Tera</th>
                                       	  	<th width="8%">Tot. Tera</th>
                                       	  	<th width="8%">Total</th>
                                   	  	  	<th width="8%">Tot. Sales</th>
                                   	  	  	<th width="7%">Tot. Cash</th>
                                   	  	  	<th width="10%">Tot. Non Cash</th>                                                                                       
                                   	  	  	<th width="9%">Operator</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${detail.nozzles}' var='nozzle' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${nozzle.nozzle.name}'/></td>
                                            <td><fmt:formatNumber value='${nozzle.start}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.ending}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.reset}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.startTera}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.endTera}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.endTera-nozzle.startTera}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.reset-nozzle.start+nozzle.ending-(nozzle.endTera-nozzle.startTera)}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${(nozzle.reset-nozzle.start+nozzle.ending-(nozzle.endTera-nozzle.startTera))*detail.price}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.cash}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${nozzle.nonCash}' pattern=',##0.00'/></td>
                                            <td><c:out value='${nozzle.operator.firstName} ${nozzle.operator.middleName} ${nozzle.operator.lastName}'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="12">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    </c:forEach>
                            	</div>
                            </form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/TankLevelDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save()
	{		
		document.editForm.action = "<c:url value='/page/spbushiftedit.htm'/>";
		document.editForm.submit();
	}
	
	function openoperator(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppartyrelationview.htm?fromRoleType=32&organization=${shift_edit.organization.id}&target='/>"+target);
	}
	
	function setVolume(level,tank,index)
	{
		if(level && level != '')
		{
			var _event = function(rate)
			{
				var _target = document.getElementById('endVolume['+index+']');
				if(_target)
					_target.value = parseFloat(rate).numberFormat('#,#.00');
				
				var t_end_volume = document.getElementById('t_end_volume['+index+']');
				if(t_end_volume)
					t_end_volume.value = parseFloat(rate).numberFormat('#,#.00');

				display();
			};
		
			TankLevelDWRRemote.convert(tank,level,_event);
		}
	}
	
	function display()
	{
		<c:forEach items='${shift_edit.details}' var='detail' varStatus='status'>
			
			var t_nozzle = 0.0;
			
			var _table = document.getElementById("table[${status.index}]");
			if(_table)
			{
				var t_section = _table.tBodies[0];
				var len = t_section.rows.length;
				
				for(var idx=len-1;idx>=0;idx--)
				{
					var start_position = parseFloat(t_section.rows[idx].cells[1].firstChild.value);
					var end_position = parseFloat(t_section.rows[idx].cells[2].firstChild.value);
					var reset_position = parseFloat(t_section.rows[idx].cells[3].firstChild.value);	
					var start_tera = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
					var end_tera = parseFloat(t_section.rows[idx].cells[5].firstChild.value);
					
					t_nozzle += reset_position-start_position+end_position-(end_tera-start_tera);
					
					t_section.rows[idx].cells[6].firstChild.value = (end_tera-start_tera).numberFormat('#,#.00');
					t_section.rows[idx].cells[7].firstChild.value = (reset_position-start_position+end_position-(end_tera-start_tera)).numberFormat('#,#.00');
				}
			}
			
			document.getElementById('t_nozzle_sales[${status.index}]').value = t_nozzle.numberFormat('#,#.00');
			
			var startVolume = document.getElementById('startVolume[${status.index}]');
			var endVolume = document.getElementById('endVolume[${status.index}]');
			
			var t_sales = (parseFloat(endVolume.value.replace(/,/gi,''))-parseFloat(startVolume.value.replace(/,/gi,'')));
			var t_opname_gainloss = t_sales-t_nozzle;
			
			document.getElementById('t_sales[${status.index}]').value = t_sales.numberFormat('#,#.00');
			document.getElementById('t_opname_gainloss[${status.index}]').value = t_opname_gainloss.numberFormat('#,#.00');
			document.getElementById('t_grand_gainloss[${status.index}]').value = (t_opname_gainloss+parseFloat('${detail.receiveGainLoss}')).numberFormat('#,#.00');
			
		</c:forEach>
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>