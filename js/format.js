var Format = new Object();

Format.format = function Comma(SS) 
{
    var T = "";
    var S = String(SS);
    var L = S.length - 1;
    var C;
    var j;
    
    for (j = 0; j <= L; j++) 
    {
        T += C = S.charAt(j);
        
        if (j < L && (L - j) % 3 == 0 && C != "-") 
        {
            T += ",";
        }
    }
    
    return T;
}

Format.addComma = function(str) {
	var x4 =str.lastIndexOf('.'),x5= str.lastIndexOf(',');
	if ( x4+x5 == -2){
		return str.concat(".00");
	} else 
		return str;
}  
    

Format.toFloat = function(str) {
	var x = String(str).split(/,|\./),
	x2 = x[x.length-1],
	x3 = x.join('').replace(new RegExp(x2+'$'),'.'+x2);
	
	return parseFloat(x3);
	//  x2 is for clarity, could be omitted:
	//=>x.join('').replace(new RegExp(x[x.length-1]+'$'),'.'+x[x.length-1])
} 

Format.isDuplicate = function(param) {
	var duplicates = false;
	$('.'+param).each(function () {
		var $sameValue = $('.'+param+' option[value="'+$(this).val()+'"]');

		duplicates = $sameValue.length > 1;
	});
		
	return duplicates;
}


//Compose template string
String.prototype.compose = (function (){
	var re = /\{{(.+?)\}}/g;
	return function (o){
		return this.replace(re, function (_, k){
			return typeof o[k] != 'undefined' ? o[k] : '';
		});
	}
}());