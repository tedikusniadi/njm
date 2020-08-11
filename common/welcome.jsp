<font color="#990000" style="font-family:Arial, Helvetica, sans-serif; font-size:11px;">
<spring:message code="sirius.wide.welcome"/> &nbsp;<a href="<c:url value='/page/userprofilepreedit.htm'/>"><strong>${visitor}</strong></a>
		| <fmt:formatDate value="${now}" pattern="dd MMMM yyyy"/> &nbsp;<span id="theClock"></span><br/>
		<c:out value="${activerole.name}"/> | <c:out value="${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}"/>
</font>