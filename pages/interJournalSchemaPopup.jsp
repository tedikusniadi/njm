<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Inter Journal Schema >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
	<script type="text/javascript">
		function setclient(id,code,name)
		{
			if(id && code && name)
			{
				var _client = self.opener.document.getElementById('${target}');
				if(_client)
				{
					_client.remove(_client.selectedIndex);
					
					var _opt = document.createElement('option');
					_opt.value = id;
					_opt.text = code+" "+name;
					
					_client.appendChild(_opt);
				}
				
				if('${filterCriteria.render}' == 'true')
				{
					<c:forEach items='${journalSchemas}' var='schema'>
						if('${schema.id}' == id)
						{
							var _debet = self.opener.document.getElementById('txtBalanceDebet');
							var _credit = self.opener.document.getElementById('txtBalanceCredit');
						
							if(_debet)
								_debet.value = 0;
							
							if(_credit)
								_credit.value = 0;
							
							<c:forEach items='${schema.indexes}' var='index'>
								var _index = self.opener.document.getElementById('hidden-id[${index.index.id}]');
								var _text = self.opener.document.getElementById('text-id[${index.index.id}]');
								
								if(_index)
								{
									<c:if test='${index.on}'>
										_index.disabled = false;
									</c:if>
									<c:if test='${not index.on}'>
										_index.disabled = true;
									</c:if>
								}
								
								if(_text)
								{
									<c:if test='${index.on}'>
										_text.disabled = false;
										_text.setAttribute('class','');
									</c:if>
									<c:if test='${not index.on}'>
										_text.disabled = true;
										_text.setAttribute('class','input-disabled');
									</c:if>
								}
							</c:forEach>
							
							var tbl = self.opener.document.getElementById("lineItemTable");
							if(tbl)
							{
								var t_section = tbl.tBodies[0];
								var len = t_section.rows.length;
										
								for(var idx=len-1;idx>=0;idx--)
									t_section.deleteRow(idx);
							}
							
							<c:forEach items='${schema.accounts}' var='account'>
								<c:if test='${account.mandatory}'>
									<c:if test="${account.postingType == 'CREDIT'}">
										addLineItem('${account.account.id}','${account.account.code}','${account.account.name}',true,id);
									</c:if>
									<c:if test="${account.postingType == 'DEBET'}">
										addLineItem('${account.account.id}','${account.account.code}','${account.account.name}',false,id);
									</c:if>
								</c:if>
							</c:forEach>
						}
					</c:forEach>
				}
			}
			
			window.close();
		}
		
		var index = 0;
		
		function addLineItem(id,code,name,credit,schema)
		{
			var tbl = self.opener.document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				if(t_section)
				{
					if(t_section.rows.length > 0 )
						index = t_section.rows.length+1;
				
					var row = t_section.insertRow(t_section.rows.length);
		
					row.insertCell(0).appendChild(generateIndex(index));
					row.insertCell(1).appendChild(generateCheckBox(index));
					row.insertCell(2).appendChild(generateAccount(index,id,code,name));
					row.insertCell(3).appendChild(generatePopup(index,schema));
					row.insertCell(4).appendChild(generateAmount(index));
					row.insertCell(5).appendChild(generatePostingType(index,credit));
					row.insertCell(6).appendChild(generateNote(index));
					
					index++;
				}
			}
		}
						
		function generateIndex(index)
		{
			var idx = document.createElement("input");
			idx.type = "hidden";
			idx.name = "index";
			idx.id = "index";
			idx.value = index;
			
			return idx;
		}
						
		function generateCheckBox(index)
		{
			var check = document.createElement("input");
			check.type = "checkbox";
			check.name = "check";
			check.id = "check";
			
			return check;
		}
		
		function generateAccount(index,id,code,name)
		{
			var accounts = document.createElement("select");
			accounts.name="accounts";
			accounts.id="glaccounts["+index+"]";
			accounts.setAttribute('class','combobox-ext');
			
			var opt = document.createElement('option');
			opt.value=id;
			opt.text=code+" "+name;
			
			accounts.appendChild(opt);
						
			return accounts;
		}
		
		function generateAmount(index)
		{
			var amounts = self.opener.document.createElement("input");
			amounts.type = "text";
			amounts.name = "amounts";
			amounts.id = "amounts["+index+"]";
			amounts.setAttribute('size',"20");
			amounts.value = "0";
			
			amounts.setAttribute('onchange','amountView()');
			amounts.setAttribute('onblur','amountView()');
			
			return amounts;
		}
		
		function generatePostingType(index,credit)
		{
			var postingTypes = document.createElement("select");
			postingTypes.name = "postingTypes";
			postingTypes.id = "postingTypes["+index+"]";
			
			if(credit)
			{
				var opt1 = document.createElement("option");
				opt1.value = "CREDIT";
				opt1.text = "CREDIT";
				opt1.setAttribute('onclick','amountView();');

				postingTypes.appendChild(opt1);
			}
			else
			{
				var opt2 = document.createElement("option");
				opt2.value = "DEBET";
				opt2.text = "DEBET";
				opt2.setAttribute('onclick','amountView();');
			
				postingTypes.appendChild(opt2);
			}
			
			return postingTypes;
		}
		
		function generateNote()
		{
			var note = document.createElement("input");
			note.type = "text";
			note.name = "notes";
			note.id = "notes";
			note.setAttribute('size',"45");
			
			return note;
		}
				
		function generatePopup(index,schema)
		{
			var _popup = self.opener.document.createElement('img');
			_popup.id = '_popup_line['+index+']';
			_popup.src = 'assets/icons/list_extensions.gif';
			_popup.setAttribute('onclick','popup("glaccounts['+index+']");');
			_popup.setAttribute('style','CURSOR:pointer;');
			_popup.title='GL Account';

			return _popup;
		}
	</script>
</head>

<body>
<div id="se-containers_pick">
	<div id="se-r00">
		<div id="se-r01a">&nbsp;</div>
		<div id="se-r03">&nbsp;</div>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<form id="filterForm" name="filterForm" method="post">
									<table width="100%" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td width="130" align="right" style="WIDTH:130px;">Code / Name&nbsp;&nbsp;</td>
											<td width="7">:&nbsp;</td>
											<td width="295" height="28" align="left"><input type="text" id="name" name="name" value="${filterCriteria.name}" size="35" class="inputbox"/></td>
											<td align="left"><input type="button" value="Search" style="WIDTH:60px; HEIGHT:25px" alt="Search" onclick="search('<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');" class="btn" /></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
						<tr>
							<td width="34%" height="30" align="left" valign="middle"></td>
							<td width="66%" align="right" height="20"><a href="javascript:step('first','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
						
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="6%"><div style="width:10px"></div></th>
					  		<th width="20%">Code</th>
				  		  	<th width="74%">Name</th>
				  		</tr>
						<c:forEach items="${journalSchemas}" var="com">
						<tr>
					  		<td class="tools">
					  			<a class="item-button-add-row" href="javascript:setclient('${com.id}','${com.code}','${com.name}')"  title="Edit"><span>Edit</span></a>
					  		</td>
							<td>${com.code}</td> 
							<td>${com.name}</td>
					  		</tr>
						</c:forEach>
					  	<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
					  	</table>

						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
						<tr>
							<td align="right"><a href="javascript:step('first','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">First</a> | <a href="javascript:step('prev','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Next</a> | <a href="javascript:step('last','<c:url value='/page/popupinterjournalschemaview.htm?&organization=${filterCriteria.organization}'/>');">Last</a></td>
						</tr>
						</table>
				    </div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
    <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer-pick">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>