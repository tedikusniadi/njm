/**
 * @author Muhammad Khairullah
 * Sirius Indonesia, PT
 * www.siriuserp.com
 *
 *
 * This function for deleting table data,but you need create a checkMaster element on table
 * <input type="checkbox" name="checkMaster" id="checkMaster_table_id" onclick="clickAll('table_id');"/>
 * @param String table_id
 */
function clickAll(id)
{
	var checked = document.getElementById("checkMaster_"+id);
	if(!checked)
		checked = document.getElementById("check_"+id).checked;
	else
		checked=checked.checked;

	var tbl = document.getElementById(id);
	if(tbl)
	{
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		for(var idx=len-1;idx>=0;idx--){
			var cname=t_section.rows[idx].cells[0].firstChild.id;
			cname=cname.replace("[","\\[");
			cname=cname.replace("]","\\]");
			var $chk=$("#"+cname);
			if(checked)
				$chk.attr("checked",true);
			else
				$chk.removeAttr("checked");
		}
	}
	else
	{
		alert('Table doesnot exsist!');
	}
}

function deleteRow(id)
{
	var tbl = document.getElementById(id);

	var t_section = tbl.tBodies[0];
	var len = t_section.rows.length;

	for(var idx=len-1;idx>=0;idx--)
	{
		if(t_section.rows[idx].cells[0].firstChild.checked == true)
			t_section.deleteRow(idx);
	}

	var check = document.getElementById("checkMaster_"+id);
	if(check)
		check.checked = false;
}
/**
 * @author Agung Dodi Perdana
 * Sirius Indonesia, PT
 * www.siriuserp.com
var HTMLTableUtil = new Object();
var _row;
var _table;
HTMLTableUtil.initialize = function(table)
{
    if(length != null && length > 0)
    {
        _object = null;
        _object = new Array(length);
    }

    if(table != null)
    {
        _table = null;
        _table = table;
        _row = null;
        _row = _table.insertRow(_table.rows.length);
    }
}
HTMLTableUtil.insert = function(_object)
{
    if(_row != null && _object != null)
    {
        var td = document.createElement("td");
        td.align = "center";
        td.appendChild(_object);
        _row.appendChild(td);
    }
}

HTMLTableUtil.selectAll = function(_checkMater)
{
    var checked = false;
	if(_checkMater.checked)
		checked = true;

	var rowLen = _table.rows.length;
	for(var idx=1;idx<rowLen;idx++)
	{
		var row = _table.rows[idx];
		var cell = row.cells[1];
		var node = cell.lastChild;
		node.checked = checked;
	}
}

HTMLTableUtil.removeAll = function(_checkMater)
{
    var rowLen = _table.rows.length - 1;
	for(var idx=rowLen;idx > 0;idx--)
		_table.deleteRow(idx)
}

HTMLTableUtil.clears = function(table)
{
    var rowLen = table.rows.length - 1;
	for(var idx=rowLen;idx > 0;idx--)
		table.deleteRow(idx)
}

HTMLTableUtil.buffer = function(b_table,a_table)
{
	for(var idx=1;idx < a_table.rows.length; idx++)
	{
		var buffered = 0;

		var t_row = a_table.rows[idx];
		var cell = t_row.cells[1];
		var node = cell.lastChild;
		if(node.checked == false)
		{
			var n_row = b_table.insertRow(b_table.rows.length);

			for(var _idx=0;_idx < t_row.cells.length;_idx++)
			{
			    var td = document.createElement("td");
			    td.appendChild(t_row.cells[_idx].lastChild);
			    n_row.appendChild(td);
			}
		}
	}
}

HTMLTableUtil.reindex = function(b_table,a_table)
{
	for(var idx=0; idx < b_table.rows.length; idx++)
	{
		var b_row = b_table.rows[idx];
		var t_row = a_table.insertRow(a_table.rows.length);

		for(var _idx=0;_idx < b_row.cells.length; _idx++)
		{
		    var td = document.createElement("td");
		    td.appendChild(b_row.cells[_idx].lastChild);
		    t_row.appendChild(td);
		}
	}
}

HTMLTableUtil.remove = function(_checkMater,table)
{
	this._table = table;

	if(_checkMater.checked)
	{
		this.removeAll();
		_checkMater.checked = false;
	}
	else
	{
		var b_table = document.createElement("table");

		this.buffer(b_table,table);
		this.removeAll();
		this.reindex(b_table,table);
	}
}*/