<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Order >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("assets/sirius.css");
		
		#day td{
			vertical-align:top;
			cursor:pointer;
		}
		
		.content{
			cursor:pointer;
			text-align:right;
			padding-right:3px;
			vertical-align:top;
		}
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
			<td width="60%">Production > Production Planning > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U30 - Production Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionorderview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" id='save'><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
                        	<table width="100%" cellpadding="3" cellspacing="0">
                            <tr>
                                <td width="38%" align="right" nowrap="nowrap">Work Unit</td>
                                <td width="1%">:</td>
                                <td width="61%">
                               	  	<select id='unit' class="combobox" readonly>
                                    	<c:if test='${not empty unit}'>
                                        	<option value="${unit.id}"><c:out value='${unit.code} ${unit.name}'/></option>
                                        </c:if>
                                    </select>
                                    &nbsp;
                                  	<img id="img" src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupproductionworkunitview.htm?target=unit'/>');" style="CURSOR:pointer;" title="Work Unit" />
                              </td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div style="text-align:right;padding:5px;"><a id="prev" style="cursor:pointer" class="anim">Prev</a> | <span id="mName"><fmt:formatDate value='${date}' pattern='MMM'/></span> <span id="mYear"><fmt:formatDate value='${date}' pattern='yyyy'/></span> | <a id="next" style="cursor:pointer" class="anim">Next</a></div>
                            <div id="mContent">
                                <table width="100%" id="day" style="border:none" cellpadding="0" cellspacing="0">
                                <tbody>
                                <tr>
                                    <td width="16%" height="100" style="border:solid 1px black;">
                                   	  <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="20%" align="left"><a id='01' class="new">New</a></td>
                                       	  	<td width="80%" align="right" id="M1">1 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con1"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                  	</td>
                              		<td width="13%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='02' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M2">2 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con2"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                              	<td width="14%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                       	  		<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='03' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M3">3 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con3"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                              <td width="14%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                       	  <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='04' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M4">4 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con4"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                              <td width="14%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                       	  <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='05' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M5">5 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con5"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                              <td width="14%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                       	  <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='06' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M6">6 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con6"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                              <td width="15%" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                       	  <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='07' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M7">7 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con7"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="100" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='08' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M8">8 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con8"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='09' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M9">9 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con9"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='10' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M10">10 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con10"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='11' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M11">11 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con11"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='12' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M12">12 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con12"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='13' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M13">13 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con13"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='14' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M14">14 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con14"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="100" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='15' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M15">15 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con15"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='16' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M16">16 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con16"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='17' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M17">17 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con17"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='18' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M18">18 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con18"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='19' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M19">19 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con19"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='20' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M20">20 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con20"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='21' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M21">21 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con21"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="100" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='22' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M22">22 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con22"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='23' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M23">23 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con23"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='24' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M24">24 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con24"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='25' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M25">25 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con25"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='26' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M26">26 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con26"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='27' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M27">27 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con27"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='28' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M28">28 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con28"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="100" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">
                                    	<c:if test='${dMax >= 29}'>
                                        <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='29' class="new">New</a></td>
                                        	<td width="70%" align="right" id="M29">29 ${sMonth}</td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con29"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                        </c:if>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<c:if test='${dMax >= 30}'>
                                        <table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left"><a id='30' class="new">New</a></td>
                                        	<td width="70%" align="right"><div id="M30">30 ${sMonth}</div></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right"><div id="con30"></div></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                        </c:if>
                                    </td>
                                    <td style="border-bottom:solid 1px black;border-right:solid 1px black;">
                                    	<table style="border:none" width="100%">
                                        <tbody>
                                        <tr>
                                        	<td width="30%" align="left">
                                            	<a id='31' class="new">
                                                	<c:if test='${dMax >= 31}'>New</c:if>
                                               	</a>
                                            </td>
                                        	<td width="70%" align="right">
                                            	<div id="M31">
                                                	<c:if test='${dMax >= 31}'>31 ${sMonth}</c:if>
                                                </div>
                                           </td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" align="right">
                                            	<div id="con31"></div>
                                            </td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                                </tbody>
                                </table>
                            </div>
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
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$date = "<fmt:formatDate value='${date}' pattern='dd-MM-yyyy'/>";
	$iMonth = "<fmt:formatDate value='${date}' pattern='MM'/>";
	$iYear = "<fmt:formatDate value='${date}' pattern='yyyy'/>";
	
	$(function(){
		$unit = $('#unit');
		
		$('.anim').click(function(e){
			if(!$unit.val())
			{
				alert('Please select Work Unit first!');
				return;
			}
			
			option = {};
			if(e.target.id == 'prev')
				option = {direction:'left'};
			else
				option = {direction:'right'};
			
			$.ajax({
				url:"<c:url value='/page/productionorderdirectionpreadd.htm'/>",
				data:{direction:e.target.id,date:$date},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					$date = json.sDate;
					$iMonth = json.iMonth;
					$iYear = json.iYear;
					
					$('#mName').html(json.sMonth);
					$('#mYear').html(json.iYear);
					
					$iMax = parseInt(json.dMax);
					
					for(var idx=1;idx<=31;idx++)
					{
						$_con = $('#con'+idx);
						if($_con)
							$_con.empty();
						
						if(idx <= $iMax)
						{
							$('#'+idx).html('New');
							$('#M'+idx).html(idx+' '+json.sMonth);
						}
						else
						{
							$('#'+idx).empty();
							$('#M'+idx).empty();
						}
					}
					
					$('#mContent').effect('slide',option,1000,null);
					
					$.ajax({
						url:"<c:url value='/page/productionorderjsonview.htm'/>",
						data:{unit:$unit.val(),month:$iMonth,year:$iYear},
						method : 'GET',
						dataType : 'json',
						success : function(json) {
							for(var day=1;day<=parseInt('${dMax}');day++)
							{
								$_target = $('#con'+day).empty();
								
								if($_target)
								{
									for(var idx=0;idx<json.orders.length;idx++)
									{
										$obj = json.orders[idx];
										if(day == parseInt($obj.day))
										{
											$link = $('<a></a>');
											$link.attr('href',"<c:url value='/page/productionorderpreedit.htm?id='/>"+$obj.id);
											$link.html($obj.code);
											
											$link.appendTo($_target);
											$('<br/>').appendTo($_target);
										}
									}
								}
							}
						},
						error : function(xhr) {
							alert('Proccess fail '+xhr.responseText);
						},
					});
				},
				error : function(xhr) {
					alert('Proccess fail '+xhr.responseText);
				},
			});
		});
		
		$('.new').click(function(e){
			if(!$unit.val())
			{
				alert('Please select Work Unit first!');
				return;
			}
			
			$_date = e.target.id+'-'+$iMonth+'-'+$iYear;
			
			$('#se-contents').load("<c:url value='/page/productionorderpreadd1.htm?unit='/>"+$unit.val()+'&date='+$_date);
		});
		
		$('#unit').focus(function(e){
			e.target.blur();
			
			$.ajax({
				url:"<c:url value='/page/productionorderjsonview.htm'/>",
				data:{unit:e.target.value,month:$iMonth,year:$iYear},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					for(var day=1;day<=parseInt('${dMax}');day++)
					{
						$_target = $('#con'+day).empty();
						
						if($_target)
						{
							for(var idx=0;idx<json.orders.length;idx++)
							{
								$obj = json.orders[idx];
								if(day == parseInt($obj.day))
								{
									$link = $('<a></a>');
									$link.attr('href',"<c:url value='/page/productionorderpreedit.htm?id='/>"+$obj.id);
									$link.html($obj.code);
									
									$link.appendTo($_target);
									$('<br/>').appendTo($_target);
								}
							}
						}
					}
				},
				error : function(xhr) {
					alert('Proccess fail '+xhr.responseText);
				},
			});
		});
	});
</script>