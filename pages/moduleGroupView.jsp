<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Module Group</title>
	<%@ include file="/common/sirius-header.jsp"%><!-- /top menu -->
    <script type="text/javascript" src="assets/dialog.js"></script>
	<script type="text/javascript">
		var $deleteDialog=function(href){
			id=href.substring(href.indexOf("?")+4);
			$( "<div><span>Do you really want to delete Module Group?</span></div>" ).dialog({
			title:'Information',
			modal: true,
			buttons: {
				"Cancel": function() {
					$(this).dialog("close");
				},
				"Delete": function() {
					$(this).dialog("close");
					$.get(href,function(json){
						displayContent(json.url);
					});
				}
			}
		});};
		function deletes(id)
		{
	        var confirmation=confirm("Do you really want to delete Module Group?");
	       	if(confirmation==true)
			{
	       	    	var url = "<c:url value='/page/modulegroupdelete.htm'/>?id="+id;
	       	    	window.location=url;
	        }
	    }
		function displayContent(url)
		{
			$("#listPane").load(url,function(response, status, xhr){
				//alert(status+"["+xhr.status+"]("+xhr.statusText+")"+response);
				$( "#tabs" ).tabs();

				$(".item-button-delete").each(function(idx){
					var href=$(this).attr("href");
					$(this).removeAttr("href");
					$(this).click(function(){$deleteDialog(href)});
				});
				/*var href=$(".item-button-delete").attr("href");
				$(".item-button-delete").removeAttr("href");
				$(".item-button-delete").click(function(){
					$deleteDialog(href);
				});*/
				$(".item-button-save").click(function(){
					if($('#addForm').length>0){
						$action=$('#addForm').attr("action");
						$datas=$('#addForm').serialize();
					}else{
						$action=$('#editForm').attr("action");
						$datas=$('#editForm').serialize();
					}
					$.ajax({
						url:$action,
						data:$datas,
						type : 'POST',
						dataType : 'json',
						beforeSend:function()
						{
							$dialog.empty();
							$dialog.html('Saving data......');
							$dialog.dialog('open');
						},
						success : function(json) {
							if(json)
							{
								if(json.status == 'OK')
								{
									$dialog.dialog('close');
									displayContent(json.url);
								}
								else
								{
									$dialog.empty();
									$dialog.html('Proccess fail,reason :<br/>'+json.message);
								}
							}
						}
					});
				});
			});
		}
	</script>
	<!-- meta tags here -->
</head>
<!-- BEGIN OF BODY -->
<body onload="displayContent('page/modulegrouplist.htm');">
<!-- top menu -->


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Tools > Module Group</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<div dojoType="SplitContainer" style="width: 100%; height: 430px;" orientation="horizontal" sizerWidth="5" activeSizing="0"	layoutAlign="client">
								<div id="treePane" dojoType="Tree" widgetId="treePane" toggle="wipe" toggleDuration="500" sizeMin="20" sizeShare="3" style="width:230px !important;">
									<div dojoType="TreeNode" title="Root" expandLevel="1" onTitleClick='displayContent("page/modulegrouplist.htm");' childIconSrc="assets/icons/coa-parent.gif">
										<c:forEach items='${groups}' var='parent'>
											<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${parent.id}");' title="${parent.name}" childIconSrc="assets/icons/group.gif">
                                            	<c:if test='${not empty parent.members}'>
												<c:forEach items="${parent.members}" var="group0">
													<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group0.id}");' title="${group0.name}" childIconSrc="assets/icons/<c:if test="${not empty group0.members}">group.gif</c:if><c:if test="${empty group0.members}">child.png</c:if>">
                                                    	<c:if test='${not empty group0.members}'>
														<c:forEach items="${group0.members}" var="group1">
															<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group1.id}");' title="${group1.name}" childIconSrc="assets/icons/<c:if test="${not empty group1.members}">group.gif</c:if><c:if test="${empty group1.members}">child.png</c:if>">
                                                            	<c:if test='${not empty group1.members}'>
																<c:forEach items="${group1.members}" var="group2">
																	<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group2.id}");' title="${group2.name}" childIconSrc="assets/icons/<c:if test="${not empty group2.members}">group.gif</c:if><c:if test="${empty group2.members}">child.png</c:if>">
                                                                    	<c:if test='${not empty group2.members}'>
																		<c:forEach items="${group2.members}" var="group3">
																			<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group3.id}");' title="${group3.name}" childIconSrc="assets/icons/<c:if test="${not empty group3.members}">group.gif</c:if><c:if test="${empty group3.members}">child.png</c:if>">
                                                                            	<c:if test='${not empty group3.members}'>
																				<c:forEach items="${group3.members}" var="group4">
																					<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group4.id}");' title="${group4.name}" childIconSrc="assets/icons/<c:if test="${not empty group4.members}">group.gif</c:if><c:if test="${empty group4.members}">child.png</c:if>">
                                                                                    	<c:if test='${not empty group4.members}'>
																						<c:forEach items="${group4.members}" var="group5">
																							<div dojoType="TreeNode" onTitleClick='displayContent("page/modulegrouppreedit.htm?id=${group5.id}");' title="${group5.name}" childIconSrc="assets/icons/<c:if test="${not empty group5.members}">group.gif</c:if><c:if test="${empty group5.members}">child.png</c:if>">
																							</div>
																						</c:forEach>
                                                										</c:if>
																					</div>
																				</c:forEach>
                                                								</c:if>
																			</div>
																		</c:forEach>
                                                						</c:if>
																	</div>
																</c:forEach>
                                                				</c:if>
															</div>
														</c:forEach>
                                                		</c:if>
													</div>
												</c:forEach>
                                                </c:if>
											</div>
										</c:forEach>
									</div>
								</div>
								<div id="listPane" dojoType="ContentPane" style="padding: 5px; width:100% ; height:430px;overflow:scroll" refreshOnShow="true" doLayout="true">
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>