var Currency = new Object();

Currency.init = function($plugin)
{	
	$.ajax({
		url:$('base').attr('href')+"page/currencypreparedropdown.htm",
		method : 'POST',
		dataType : 'json',
		success : function(json) {
			if(json)
			{
				if(!json.empty)
				{
					$currency = $('#currency');
					$currency.empty();
					
					$.each(json.currencys,function(idx,obj){
						$opt = $('<option></option>');
						$opt.attr('value',obj.id);
						$opt.html(obj.symbol);
						$opt.attr('exchange',obj.exchange);
						$opt.click(function(e){
							if($('#trxrate'))
							{
								if(!dojo.widget.byId('date').getValue())
								{
									alert('Please select date first!');
									return;
								}
									
								$.ajax({
									url:$('base').attr('href')+"page/exchangemanagementloadrate.htm",
									data:{from:e.target.value,date:dojo.widget.byId('date').getValue(),type:$('#type').val()},
									method : 'GET',
									dataType : 'json',
									success : function(json) {
										if(json)
										{
											if($('#trxrate'))
												$('#trxrate').val(json.rate.numberFormat('#,#.00'));
											
											if($plugin)
												$plugin.execute();
										}
									}
								});
							}
							
							if($('#amt_display'))
								$('#amt_display').html('Amount ('+e.target.text+')');
						});
						
						if(idx==0)
						{
							if($('#trxrate'))
								$('#trxrate').val(obj.exchange.numberFormat('#,#.00'));
							
							if($('#amt_display'))
								$('#amt_display').html('Amount ('+obj.symbol+')');
						}
						
						$opt.appendTo($currency);
					});
				}
				else
					alert(json.message);
			}
		}
	});	
}		