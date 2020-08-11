/**
 * @author Agung Dodi Perdana
 * Sirius Indonesia, PT
 * www.siriuserp.com
 */
var Facility = new Object();

Facility.init = function($plugin)
{	
	$warehouse = $('#warehouse');
	$org = $('#org');
	
	$org.focus(function(e){
		if(e.target.value)
		{
			$warehouse.empty();
			
			$run = true;
			$impl = "";
			$sales = $('#salesType');
			if($sales)
			{
				if($sales.val() == 'PO_REF')
					$impl = 'VIRTUAL';
				else if($sales.val() == 'STANDARD')
					$impl = 'REAL';
				else
					$run = false;
			}
			
			if($run)
			{
				$.ajax({
					url:$('base').attr('href')+"page/popupfacilityjsonview.htm?organization="+e.target.value,
					data:{organization:$org.val(),implementation:$impl},
					method : 'GET',
					dataType : 'json',
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$warehouse.empty();
							
								$.each(json.facilitys,function(idx,obj){
									$opt = $('<option></option>');
									$opt.attr('value',obj.id);
									$opt.html(obj.name);
									
									$opt.appendTo($warehouse);
								});
								
								if($plugin)
									$plugin.execute();
								
								e.target.blur();
							}
						}
					}
				});
			}
		}
	});
}