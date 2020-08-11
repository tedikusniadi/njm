/**
 * @author Agung Dodi Perdana
 * Sirius Indonesia, PT
 * www.siriuserp.com
 */
var PostalAddress = new Object();

PostalAddress.init = function($plugin)
{
	$org = $('#org');
	$org.focus(function(){
		
		$bill = $('#billTo');
		if($bill)
		{
			$.ajax({
				url:$('base').attr('href')+'page/popuppostaladdressjsonview.htm',
				data:{party:$org.val()},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$bill.empty();
							
							$.each(json.addresses,function(idx,obj){
								$.each(obj.types,function(tIdx,tObj){
									if(tObj.type == 'OFFICE')
									{
										$opt = $('<option></option>');
										$opt.attr('value',obj.id);
										$opt.html(obj.address);
										$opt.appendTo($bill);
									}
								});
							});
						}
					}
				}
			});
		}
		
		$ship = $('#shipTo');
		if($ship)
		{
			$.ajax({
				url:$('base').attr('href')+'page/popupfacilityjsonview.htm',
				data:{organization:$org.val()},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$ship.empty();
						
							$.each(json.facilitys,function(idx,obj){
								if(obj.address)
								{
									$opt = $('<option></option>');
									$opt.attr('value',obj.id);
									$opt.html(obj.address);									
									$opt.appendTo($ship);
								}
							});
						}
					}
				}
			});
		}
	});
}