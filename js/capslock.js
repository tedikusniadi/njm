/*

CapsLock.js

An object allowing the status of the caps lock key to be determined

Created by Stephen Morley - http://code.stephenmorley.org/ - and released under
the terms of the CC0 1.0 Universal legal code:

http://creativecommons.org/publicdomain/zero/1.0/legalcode

*/

var CapsLock=new function(){
var _1=false;
var _2=[];
this.isOn=function(){
return _1;
};
this.addListener=function(_3){
_2.push(_3);
};
function _4(e){
if(!e){
e=window.event;
}
var _5=_1;
var _6=(e.charCode?e.charCode:e.keyCode);
if(_6>=97&&_6<=122){
_1=e.shiftKey;
}else{
if(_6>=65&&_6<=90&&!(e.shiftKey&&/Mac/.test(navigator.platform))){
_1=!e.shiftKey;
}
}
if(_1!=_5){
for(var _7=0;_7<_2.length;_7++){
_2[_7](_1);
}
}
};
if(window.addEventListener){
window.addEventListener("keypress",_4,false);
}else{
document.documentElement.attachEvent("onkeypress",_4);
}
}();

