<%@include file="/common/init.jsp" %>
<center>
<div id="se-top-container">
	<div id="se-top-logo-container">
		<img id="se-top-logo" src="<c:url value='/assets/images/logo_njm.png'/>" width="180" height="38"/>
	</div>
	<div id="se-top">
	<table border="0" cellpadding="0" cellspacing="0" align="right">
	 <tr valign="top">
	 	<td valign="top">
	 		<form class="top-search" action="page/goTo.htm">
	 			<input type="text" name="code" id="searchMenu" size="10" class="search" value="Menu..." title="Enter to go"/>
	 		</form>
	 	</td>
	 	<td><a class="home" href="<c:url value='/page/start.htm' />" title="Home"><span>Home</span></a></td>
		<td><a class="logout" href="<c:url value='/page/signout.htm' />" title="Logout Session"><span>Logout</span></a></td>
	 </tr>
	</table>
	</div>
</div>
</center>