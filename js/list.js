/**
 * @author Agung Dodi Perdana
 * Sirius Indonesia, PT
 * www.siriuserp.com
 */

var HTMLUtil = new Object();
HTMLUtil.add = function (oListbox, sName, sValue,selected) 
{
    var oOption = document.createElement("option");
    oOption.appendChild(document.createTextNode(sName));
    oOption.setAttribute("value", sValue);
    oOption.selected = selected;
    oListbox.appendChild(oOption);
}

HTMLUtil.input = function(type,id,name,value,size,disabled)
{
    var input = document.createElement("input");
    input.setAttribute("name", name);
    input.setAttribute("id", id);
    input.setAttribute("value",value);
    input.setAttribute("size",size);
    input.setAttribute("type", type);
	
	if(disabled != null)
		input.disabled = disabled;
    
    return input;
}

HTMLUtil.checkbox = function(id,name,value)
{
    var checkbox = document.createElement("input");
    checkbox.setAttribute("id", id);
    checkbox.setAttribute("name", name);
    checkbox.setAttribute("value",value);
    checkbox.setAttribute("type", 'checkbox');
    
    return checkbox;
}

HTMLUtil.option = function (oListbox, sName, sValue,selected) 
{
    var option = document.createElement("option");
    option.appendChild(document.createTextNode(sName));
    option.setAttribute("value", sValue);
    option.selected = selected;
    oListbox.appendChild(option);

    return option;
}
