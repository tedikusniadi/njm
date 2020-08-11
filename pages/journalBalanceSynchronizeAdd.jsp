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
                                    <a class="item-button-cancel" href="javascript:resetform();"><span>Reset</span></a>
                                    <a class="item-button-generate-report" href="javascript:generate();"><span>Generate</span></a>
                                </div>
                            	<div class="main-box">
                                	<form id='_form' name='_form' action="<c:url value='/page/journalbalancesynchronizeview.htm'/>">
                                        <table width="100%" style="border:none" align="center">
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select id="org" name="organization" class="combobox-ext">
                                                </select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Period :</td>
                                            <td>
                                                <select id="period" name="period" class="combobox-ext">
                                                </select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openperiod();" style="CURSOR:pointer;" title="Period" />
                                            </td>
                                        </tr>
                                        </table>
                                    </form>
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
	</body>
</html>
<script type="text/javascript">
	function openperiod()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupaccountingperiodreport.htm?target=period&openonly=false&organization='/>"+org.value);
	}
	
	function generate()
	{
		var org = dojo.byId('org').value;
		var period = dojo.byId('period').value;
	
		if(org == '' || period == '')
		{
			alert('Organization or Period cannot be empty!');
			return;
		}
		
		document._form.submit();
	}
</script>