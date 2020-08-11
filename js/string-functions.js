String.prototype.contain = function(text) {
    return (this.indexOf(text)!=-1);
}

String.prototype.contains = function(text) {
    return (this.indexOf(text)!=-1);
}

String.prototype.reverse = function() {
    var res = "";
    for (var i = this.length; i > 0; --i) {
        res += this.charAt(i - 1);
    }
    return res;
}

String.prototype.ltrim = function(chars) {
	chars = chars || "\\s";
	return this.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

String.prototype.rtrim = function( hars) {
	chars = chars || "\\s";
	return this.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

String.prototype.trim = function(ch) {
    if (!ch) ch = ' ';
    return this.replace(new RegExp("^" + ch + "+|" + ch + "+$", "g"), "");
    //return ltrim(rtrim(str, chars), chars);
}

String.leftPad = function (val, size, ch) {
    var result = new String(val);
    if (ch == null) {
        ch = " ";
    }
    while (result.length < size) {
        result = ch + result;
    }
    return result;
}

String.escape = function(string) {
    return string.replace(/('|\\)/g, "\\$1");
}

String.prototype.toNumber = function(){
	if(this)
		return new Number(this.replace(/,/gi,''));
	else
		return 0;
}