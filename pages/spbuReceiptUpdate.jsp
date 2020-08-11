<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SPBU Receipt >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">SPBU > Receipt > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">B40 - Receipt</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/spbureceiptview.htm'/>"><span>List</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="SPBUReceipt_edit">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="16%" nowrap="nowrap" align="right">ID :</td>
 	                                <td width="44%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty SPBUReceipt_edit.organization}'>
                                                <form:option value='${SPBUReceipt_edit.organization.id}' label='${SPBUReceipt_edit.organization.firstName} ${SPBUReceipt_edit.organization.lastName} ${SPBUReceipt_edit.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                    </td>
                                  	<td width="40%"><form:errors path='organization' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${SPBUReceipt_edit.date}' pattern='MM/dd/yyyy'/>"/></td>
                                    <td><form:errors path='date' cssClass='errors'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Tank :</td>
                                    <td>
                                        <form:select id="tank" path="tank" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty SPBUReceipt_edit.tank}'>
                                                <form:option value='${SPBUReceipt_edit.tank.id}' label='${SPBUReceipt_edit.tank.name}' />
                                            </c:if>
                                        </form:select>
                                    </td>
                                    <td><form:errors path='tank' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Receive Date :</td>
                                    <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${SPBUReceipt_edit.receiveDate}' pattern='MM/dd/yyyy'/>"/></td>
                                    <td><form:errors path='receiveDate' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Shift :</td>
                                    <td>
                                        <form:select id="shift" path="shift" disabled='true'>
                                        	<form:option value='1' label='1'/>
                                            <form:option value='2' label='2'/>
                                            <form:option value='3' label='3'/>
                                            <form:option value='4' label='4'/>
                                            <form:option value='5' label='5'/>
                                        </form:select>
                                    </td>
                                    <td><form:errors path='shift' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
                                </table>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
              						<div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="9%">Time</th>
                                          	<th width="15%">DO No</th>
                                            <th width="14%">SO Pertamina</th>
                                            <th width="9%">Rec Volume</th>                                    
                                            <th width="10%">Begin Level</th>
                                            <th width="10%">Begin Volume</th>
                                            <th width="11%">End Level</th>
                                            <th width="10%">End Volume</th>
                                          	<th width="10%">Gain/Loss</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${SPBUReceipt_edit.items}' var='item' varStatus='status'>
                                        <tr>
                                            <td><form:input path='items[${status.index}].time' disabled='true' size='8'/></td>
                                            <td><form:input path='items[${status.index}].doNo' disabled='true' size='15'/></td>
                                            <td><form:input path='items[${status.index}].soNo' disabled='true' size='15'/></td>
                                            <td><form:input path='items[${status.index}].receive' cssStyle='text-align:right;' disabled='true' size='10'/></td>
                                            <td><form:input path='items[${status.index}].startLevel' cssStyle='text-align:right;' disabled='true' size='10'/></td>
                                            <td><form:input path='items[${status.index}].startVolume' cssStyle='text-align:right;' disabled='true' size='10'/></td>
                                            <td><form:input path='items[${status.index}].endLevel' cssStyle='text-align:right;' disabled='true' size='10'/></td>
                                            <td><form:input path='items[${status.index}].endVolume' disabled='true' cssStyle='text-align:right;' size='10'/></td>
                                            <td><input readonly="readonly" style="text-align:right;" value="<fmt:formatNumber value='${item.endVolume-item.startVolume-item.receive}' pattern='##0.00'/>" size='10' disabled/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="10">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
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

<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/TankLevelDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save(_forward)
	{		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			
			if(len == 0)
			{
				alert('You need to provide Line Item first before saving the transaction!');
				return;
			}

			document.addForm.action = "<c:url value='/page/spbureceiptadd.htm?new='/>"+_forward;
			document.addForm.submit();
		}
	}

	function opentank()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupspbutankview.htm?target=tank&organization='/>"+org.value);
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
	
	function begin(level,index)
	{
		var tank = document.getElementById('tank');
		if(tank.value == '')
		{
			alert('Please select Tank first!');
			return;
		}
	
		var _event = function(rate)
		{
			var _target = document.getElementById('beginVol['+index+']');
			if(_target)
				_target.value = rate;
				
			showGainLoss(index)
		};
	
		TankLevelDWRRemote.convert(tank.value,level,_event);
	}
	
	function end(level,index)
	{
		var tank = document.getElementById('tank');
		if(tank.value == '')
		{
			alert('Please select Tank first!');
			return;
		}
	
		var _event = function(rate)
		{
			var _target = document.getElementById('endVol['+index+']');
			if(_target)
				_target.value = rate;
				
			showGainLoss(index)
		};
	
		TankLevelDWRRemote.convert(tank.value,level,_event);
	}
	
	function showGainLoss(index)
	{
		var _vol = document.getElementById('vol['+index+']');
		var _begin = document.getElementById('beginVol['+index+']');
		var _end = document.getElementById('endVol['+index+']');
		
		if(_vol.value != '' && _begin.value != '' && _end.value != '')
			document.getElementById('gainLoss['+index+']').value = parseFloat(_end.value)-parseFloat(_begin.value)-parseFloat(_vol.value);
	}

	var index = 0;
	
	function addLineItem()
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
	
				row.insertCell(0).appendChild(genCheck(index));
				row.insertCell(1).appendChild(genTime(index));
				row.insertCell(2).appendChild(genDO(index));
				row.insertCell(3).appendChild(genSO(index));
				row.insertCell(4).appendChild(genVol(index));
				row.insertCell(5).appendChild(genBeginLevel(index));
				row.insertCell(6).appendChild(genBeginVol(index));
				row.insertCell(7).appendChild(genEndLevel(index));
				row.insertCell(8).appendChild(genEndVol(index));
				row.insertCell(9).appendChild(genGainLoss(index));				
				
				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genTime(index)
	{
		var time = document.createElement("input");
		time.name="times";
		time.setAttribute('size','8');
					
		return time;
	}
	
	function genDO(index)
	{
		var time = document.createElement("input");
		time.name="dos";
		time.setAttribute('size','13');
					
		return time;
	}
	
	function genSO(index)
	{
		var time = document.createElement("input");
		time.name="sos";
		time.setAttribute('size','13');
					
		return time;
	}	
	
	function genVol(index)
	{
		var vol = document.createElement("input");
		vol.id = 'vol['+index+']';
		vol.name = "vols";
		vol.setAttribute('size',"8");
		vol.setAttribute('value',"1");
		vol.setAttribute('onchange','showGainLoss('+index+')');
		vol.setAttribute('style','text-align:right;');
		
		return vol;
	}
	
	function genBeginLevel(index)
	{
		var level = document.createElement("input");
		level.id = 'beginLevel['+index+']';
		level.name = "beginLevels";
		level.setAttribute('size',"8");
		level.setAttribute('value','0');
		level.setAttribute('onchange','begin(this.value,'+index+')');
		level.setAttribute('style','text-align:right;');
		
		return level;
	}
	
	function genBeginVol(index)
	{
		var vol = document.createElement("input");
		vol.id = 'beginVol['+index+']';
		vol.name = "beginVols";
		vol.setAttribute('size',"8");
		vol.setAttribute('value','0');
		vol.setAttribute('readonly',"readonly");
		vol.setAttribute('style','text-align:right;');
		
		return vol;
	}
	
	function genEndLevel(index)
	{
		var level = document.createElement("input");
		level.id = 'endLevel['+index+']';
		level.name = "endLevels";
		level.setAttribute('size',"8");
		level.setAttribute('value','0');
		level.setAttribute('onchange','end(this.value,'+index+')');
		level.setAttribute('style','text-align:right;');
		
		return level;
	}
	
	function genEndVol(index)
	{
		var vol = document.createElement("input");
		vol.id = 'endVol['+index+']';
		vol.name = "endVols";
		vol.setAttribute('size',"8");
		vol.setAttribute('value','0');
		vol.setAttribute('readonly',"readonly");
		vol.setAttribute('style','text-align:right;');
		
		return vol;
	}
	
	function genGainLoss(index)
	{
		var gainLoss = document.createElement("input");
		gainLoss.id = 'gainLoss['+index+']';
		gainLoss.name = "gainLosses";
		gainLoss.setAttribute('size',"8");
		gainLoss.setAttribute('value','0');
		gainLoss.setAttribute('readonly',"readonly");
		gainLoss.setAttribute('style','text-align:right;');
		
		return gainLoss;
	}
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
				t_section.rows[idx].cells[0].firstChild.setAttribute('checked',true);
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}
			
	function deleteRow()
	{
		var tbl = document.getElementById("lineItemTable");
			
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
	}
</script>