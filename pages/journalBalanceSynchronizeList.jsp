<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
    <head>
        <title>Journal Balance</title>
            <%@ include file="/common/sirius-header.jsp"%>
            <%@ include file="/common/popup.jsp"%>
            <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
                    <td width="60%">Tools > Journal Balance</td>
                    <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
                </tr>
                </table>
            </div>
        
            <div id="r11">
                <div id="r12">
                    <div id="r13">
                        <div id="r14">
                            <div id="se-contents">
                            	<h1 class="page-title">T51 - Journal Balance</h1>
                            	<div class="clears">&nbsp;</div>
                                <div class="toolbar">
                                    <a class="item-button-back" href="<c:url value='/page/journalbalancesynchronizepre.htm'/>"><span>Back</span></a>
                                </div>
                            	<div class="main-box">
                                	<table width="100%" cellpadding="5" style="border:none">
                                    <thead>
                                    <tr>
                                    	<th width="19%" align="left">Company</th>
                                        <th width="1%">:</th>
                                   	  	<th width="80%" align="left"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></th>
                                    </tr>
                                    <tr>
                                    	<th align="left">Accounting Period</th>
                                        <th>:</th>
                                        <th align="left"><c:out value='${accountingPeriod.name}'/></th>
                                    </tr>
                                    <tr>
                                    	<th align="left">Accounting Period Status</th>
                                        <th>:</th>
                                        <th align="left"><c:out value='${accountingPeriod.status}'/></th>
                                    </tr>
                                    </thead>
                                    </table>
                                    <div class="clears">&nbsp;</div>
                                	<table class="t_cont" id="lineItemTable" cellspacing="0" cellpadding="5" align="center" width="100%">
                                    <thead>
                                    <tr>
                                    	<th width="36%" rowspan="2">GL Account</th>
                                        <th colspan="2">Balance Amount</th>
                                        <th colspan="2">Journal Amount</th>
                                        <th width="10%" rowspan="2">Currency</th>
                                        <th width="8%" rowspan="2">Action</th>
                                    </tr>
                                    <tr>
                                        <th width="12%">DEBET</th>
                                        <th width="11%">CREDIT</th>
                                        <th width="12%">DEBET</th>
                                        <th width="11%">CREDIT</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${balances}' var='bal'>
                                    <tr bgcolor="${bal.color}" id="tr_${bal.id}">
                                    	<td><c:out value='${bal.account.code} - ${bal.account.name}'/></td>
                                       	<td align="right" id='_ut_debit_${bal.id}'><fmt:formatNumber value='${bal.userTransaction.debet}' pattern=',##0.00'/></td>
                                        <td align="right" id='_ut_credit_${bal.id}'><fmt:formatNumber value='${bal.userTransaction.credit}' pattern=',##0.00'/></td>
                                    	<td align="right" id='_trx_debet_${bal.id}'><fmt:formatNumber value='${bal.trxDebit}' pattern=',##0.00'/></td>
                                        <td align="right" id='_trx_debet_${bal.id}'><fmt:formatNumber value='${bal.trxCredit}' pattern=',##0.00'/></td>
                                        <td align="center"><c:out value='${bal.currency.symbol}'/></td>
                                    	<td align="center"><button id='btn_${bal.id}'>Synchronize</button></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear:both;height:0px">&nbsp;</div>
            <div id="footer">
                <div>
                    <span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </div>
            </div>
            <div style="clear:both;height:20px">&nbsp;</div>
        </div>
        <div id="_html" style="display:none">aaaa</div>
	</body>
</html>
<style type="text/css">
	.t_cont{
		border:1px solid black;
		border-bottom:none;
		border-right:none;
	}
	.t_cont thead tr th{
		border-bottom:1px solid black;
		border-right:1px solid black;
	}
	.t_cont tbody tr td{
		border-bottom:1px solid black;
		border-right:1px solid black;
	}
	
	button{
		width:100px;
		height:25px;
	}
</style>
<link type="text/css" href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		<c:if test="${accountingPeriod.status != 'OPEN'}">
			$('button').attr('disabled','true');
		</c:if>
		
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Synchronize status',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		<c:if test="${accountingPeriod.status == 'OPEN' and access.edit}">
			<c:forEach items='${balances}' var='bal'>
				var _btn = $('#btn_${bal.id}');
				if(_btn)
				{
					_btn.bind('click',function(){
						$.ajax({
							url:"<c:url value='/page/journalbalancesynchronizeedit.htm'/>",
							data:{id:'${bal.id}',debet:'${bal.trxDebit}',credit:'${bal.trxCredit}'},
							method : 'GET',
							dataType : 'html',
							beforeSend:function()
							{
								$dialog.empty();
								$dialog.html('start synchronizing......');
								$dialog.dialog('open');
							},
							success : function(html) {
								if(html)
								{
									if(html.search('success') != -1)
									{
										var $ut_element = $('#_ut_debit_${bal.id}');
										
										$ut_element.empty();
										$ut_element.html($('#_trx_debet_${bal.id}').html());
										
										$('table.t_cont').find('tbody').find('tr').css('background-color','#FFFFFF');
										$('#tr_${bal.id}').css('background-color','#B6E9E7');
										
										$dialog.empty();
										$dialog.html('Synchronize proccess for Account Balance ${bal.account.code} - ${bal.account.name},success.');
									}
									else
									{
										$dialog.empty();
										$dialog.html('Synchronize proccess for Account Balance ${bal.account.code} - ${bal.account.name}, fail,reason :'+html);
									}
								}
							},
							error : function(xhr) {
								alert('Updating fail '+xhr.responseText);
							},
						});
					});
				}
			</c:forEach>
		</c:if>
	});
</script>