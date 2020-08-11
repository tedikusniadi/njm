<%@ include file="/common/tld-common.jsp"%>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Root Group</a></li>
			<li><a href="#tabs-2">Module</a></li>
		</ul>
		<div id="tabs-1" class="tab-pages">
			<div class="toolbar-clean">
				<a class="item-button-new" href="javascript:displayContent('page/modulegrouppreadd.htm?parent=${moduleGroup.id}')"><span>New Group</span></a>
			</div>
			<table width="100%" cellpadding="0" cellspacing="0" class="table-list" align="center">
			<tr>
				<th><div style="WIDTH:40px;"></div></th>
				<th>Index</th>
				<th>Status</th>
				<th>Name</th>
				<th>Note</th>
			</tr>
			<c:forEach items="${groups}" var="member">
			<tr>
				<td class="tools">
					<a class="item-button-edit" href="javascript:displayContent('page/modulegrouppreedit.htm?id=${member.id}')"><span>Edit</span></a>
					<a class="item-button-delete" href="page/modulegroupdelete.htm?id=${member.id}" title="Delete"><span>Delete</span></a>
				</td>
				<td>${member.menuIndex}</td>
				<td>${(member.enabled)?'Enabled':'Disabled'}-${(member.displayed)?'Visible':'Hidden'}</td>
				<td>${member.name}</td>
				<td>${member.note}</td>
			</tr>
			</c:forEach>
			<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
			</table>
		</div>
		<div id="tabs-2" class="tab-pages">
			<div class="toolbar-clean">
				<a class="item-button-new" href="javascript:displayContent('page/modulepreadd.htm?id=${moduleGroup.id}')"><span>New Module</span></a>
			</div>
			<table width="968" cellpadding="0" cellspacing="0" class="table-list" align="center">
			<tr>
				<th  style="WIDTH:40px;"><div style="WIDTH:40px;"></div></th>
				<th style="WIDTH:10px;">Index</th>
					<th style="WIDTH:100px;">Status</th>
				  <th  style="WIDTH:34px;">Code</th>
				  <th  style="WIDTH:300px;">Name</th>
				  <th  style="WIDTH:200px;">Default URI</th>
			</tr>
			<c:forEach items="${modules}" var="module">
			<tr>
				<td class="tools">
					<a class="item-button-edit" href="javascript:displayContent('page/modulepreedit.htm?id=${module.id}')"><span>Edit</span></a>
					<a class="item-button-delete" href="page/moduledelete.htm?id=${module.id}" title="Delete"><span>Delete</span></a>
				</td>
				<td>${module.menuIndex}</td>
				<td>${(module.enabled)?'Enabled':'Disabled'}-${(module.mandatory)?'Visible':'Hidden'}</td>
				<td>${module.code}</td>
				<td style="oveflow:hidden;text-overflow: ellipsis-word;">${module.name}</td>
				<td style="text-overflow: ellipsis-word;">${module.defaultUri}</td>
			</tr>
			</c:forEach>
			<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
			</table>
		</div>
	</div>
