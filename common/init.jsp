<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<jsp:useBean class="java.util.Date" id="now"/>

<link rel="icon" type="image/png" href="<c:url value='/assets/images/sirius-logo.png'/>">
<link rel="stylesheet/less" type="text/css" href="<c:url value='/assets/sirius.css'/>">
<style type="text/css" media="screen">@import url("<c:url value='/css/jquery-ui.css'/>");</style>
<script type="text/javascript">var djConfig = {isDebug: false,extraLocale: ['en-us']};var base_url="<%=basePath%>";</script>
<script type="text/javascript" src="<c:url value='/js/less.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/table.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dojo/dojo.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/string-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/capslock.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/clock.js'/>"></script>

<script type="text/javascript" src="<c:url value='/js/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.dialogextend.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.init.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/excellentexport.min.js'/>"></script>

<script type="text/javascript">
Clock.init("<fmt:formatDate value='${now}' pattern='dd-MM-yyyy|HH:mm:ss'/>");
</script>