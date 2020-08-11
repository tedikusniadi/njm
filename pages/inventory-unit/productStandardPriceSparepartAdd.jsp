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
							<a class="item-button-list" href="<c:url value='/page/productstandardpricesparepartview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" enctype="multipart/form-data">
								<table width="100%" style="border:none">
                                <tr>
                                  <td width="26%" nowrap="nowrap" align="right">Import File :</td>
                                  <td width="74%">
                                  		<input type="file" id="fileImport" name="file" size='31'/>
                                  </td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                                <a class="item-button-new" href="javascript:addItem();"><span>New Row</span></a>
	                                <a class="item-button-delete" href="javascript:deleteRow('lineItemTable');"><span>Delete Row</span></a>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0">
	                            <thead>
	                            <tr>
	                           	  	<th width="1%"><input type="checkbox" name="checkMaster" id="check_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
	                                <th width="99%">Organization</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
	                            </tfoot>
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
		$('.item-button-save').click(function(e){
			document.addForm.action = "<c:url value='/page/productstandardpricesparepartuploadadd.htm'/>";
			document.addForm.submit();
			/* var data = new FormData();
			jQuery.each($('#fileImport')[0].files, function(i, file) {
				if(i==0)
			    	data.append('file', file);
				else
					data.append('file-'+i, file);
			});
			data.append('organizations',null);
			$.ajax({
				url:"<c:url value='/page/productstandardpricesparepartuploadadd.htm'/>",
				data:data,
				type : 'POST',
				dataType : 'json',
				cache: false,
			    contentType: false,
			    processData: false,
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Loading....');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productstandardpricesparepartview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			}); */
		});
	});

	var index = 0;
	function addItem()
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

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genFacility(index));

				index++;
			}
		}
	}
	
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";

		return check;
	}
	
	function genFacility(index)
	{
		var elem=document.createElement("div");

		var facility = document.createElement("select");
		facility.name="organizations";
		facility.id="facility["+index+"]";
		facility.setAttribute('class','combobox-medium');

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function() {openOrg("facility["+index+"]");}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Company';

		elem.appendChild(facility);
		elem.appendChild(document.createTextNode(" "));
		elem.appendChild(_popup);

		return elem;
	}
</script>