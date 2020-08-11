<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Leasing >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
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
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                        	<th></th>
                        	<th width="99%">Nama</th>
                          	<!-- <th width="19%">Tenor</th> -->
                        </tr>
                        <c:forEach items='${leasing}' var='leas'>
                        <tr>
                        	<td class="tools">
					  			<a class="item-button-ok" href="javascript:setclient('${leas.id}','${leas.name}')"  title="Pilih"><span>Pilih</span></a>
					  		</td>
                        	<td><c:out value='${leas.name}'/></td>
                            <%-- <td>${leas.tenor}</td> --%>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
                        </table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
function setclient(id,name)
{
	if(id && name)
	{
		var _client = self.opener.document.getElementById('${param.target}');
		if(_client) {
			for(var idx=_client.options.length;idx>=0;idx--)
				_client.remove(_client.selectedIndex);

			var opt = document.createElement('option');
			opt.value = id;
			opt.text = name;

			_client.appendChild(opt);
		}
		
		if(self.opener.getSubdictionLeasing)
			self.opener.getSubdictionLeasing();
		
		if(self.opener.calculate)
			self.opener.calculate();
	}
	_client.focus();
	window.close();
}
</script>
</body>

</html>