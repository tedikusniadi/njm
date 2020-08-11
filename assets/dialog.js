var dlg;
function init(e)
{
	dlg = dojo.widget.byId("DialogContent");
	var btn = document.getElementById("close");
	dlg.setCloseControl(btn);
}
dojo.addOnLoad(init);


function remove()
{
	window.location = document.getElementById("deletedId").value;
}
