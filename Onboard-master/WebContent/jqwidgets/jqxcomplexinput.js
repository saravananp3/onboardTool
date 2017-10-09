/*
jQWidgets v4.5.3 (2017-June)
Copyright (c) 2011-2017 jQWidgets.
License: http://jqwidgets.com/license/
*/
!function(a){"use strict";a.jqx.jqxWidget("jqxComplexInput","",{}),a.extend(a.jqx._jqxComplexInput.prototype,{defineInstance:function(){var b={width:null,height:null,decimalNotation:"default",value:"",spinButtons:!1,spinButtonsStep:1,placeHolder:"",roundedCorners:!0,disabled:!1,rtl:!1,changeType:null,template:"",events:["change"]};return this===a.jqx._jqxComplexInput.prototype?b:(a.extend(!0,this,b),b)},createInstance:function(){var b=this;b._firefox="mozilla"===a.jqx.browser.browser,b._currentNumber={},b._allowedCharacters=new RegExp(/([\+\-\.0-9i])/i),b.render()},render:function(){var a=this;if("DIV"===a.element.nodeName.toUpperCase()){a.baseHost=a.host;var b=a.host.data();a.host=a.baseHost.children("input"),a.element=a.host[0],a.host.data(b)}if(!0===a.spinButtons){if(!a.baseHost)throw new Error("jqxComplexInput: Invalid HTML structure. Please initialize the complex input from a div with an input and another div inside.");a._appendSpinButtons()}if(a._addClasses(),a._setSize(),a._removeHandlers(),a._addHandlers(),"exponential"===a.decimalNotation&&-1!==a.value.toLowerCase().indexOf("e")){var c=a._exponentialToDecimal(a.value),d=c.realPart,e=c.imaginaryPart,f=e<0?"-":"+",g=d+" "+f+" "+Math.abs(e)+"i";a._currentNumber={value:g,realPart:d,imaginaryPart:e}}else a._currentNumber={value:a.value,realPart:a._getReal(a.value),imaginaryPart:a._getImaginary(a.value)};"default"===a.decimalNotation?a.element.value=a.value:a._setNotation(),a._refreshPlaceHolder()},refresh:function(a){!0!==a&&this.render()},destroy:function(){var a=this;a._removeHandlers(),a.host.destroy()},val:function(b){var c=this;if("string"!=typeof b&&("object"!=typeof b||!1!==a.isEmptyObject(b)))return c.element.value;var d,e;if("string"==typeof b)if(b=b.toLowerCase(),-1===b.indexOf("e"))d=c._getReal(b),e=c._getImaginary(b);else{var f=c._exponentialToDecimal(b);d=1*f.realPart,e=1*f.imaginaryPart}else"object"==typeof b&&!1===a.isEmptyObject(b)&&(d=b.real,e=b.imaginary);var g=e>=0?"+":"-",h=d+" "+g+" "+Math.abs(e)+"i";h!==c._currentNumber.value&&(c.element.value=h,c._onChange(c.value),"default"!==c.decimalNotation&&c._setNotation())},getReal:function(){return this._currentNumber.realPart},_getReal:function(b){function c(b){return d=d.slice(0,b),d=a.trim(d),parseFloat(e+""+d)}(!b||"object"==typeof b&&!0===a.isEmptyObject(b))&&(b=this.element.value);var d=a.trim(b),e="";if(0===(b.match(/i/g)||[]).length)return parseFloat(d);"+"===b.charAt(0)?d=d.slice(1,b.length):"-"===b.charAt(0)&&(d=d.slice(1,b.length),e="-");var f=d.indexOf("+");if(-1!==f)return c(f);var g=d.indexOf("-");return-1!==g?c(g):0},getImaginary:function(){return this._currentNumber.imaginaryPart},_getImaginary:function(b){function c(b,c){return d=d.slice(b+1,d.indexOf("i")),d=a.trim(d),""===d&&(d=1),parseFloat(c+""+d)}if((!b||"object"==typeof b&&!0===a.isEmptyObject(b))&&(b=this.element.value),0===(b.match(/i/g)||[]).length)return 0;var d=a.trim(b),e="";"-"!==d.charAt(0)&&"+"!==d.charAt(0)||(e="-"===d.charAt(0)?"-":"+",d=a.trim(d.slice(1,b.length)));var f=d.indexOf("+");if(-1!==f)return c(f,"+");var g=d.indexOf("-");return-1!==g?c(g,"-"):(d=e+""+d.slice(0,d.indexOf("i")),""===d||"+"===d?1:"-"===d?-1:parseFloat(d))},getDecimalNotation:function(a,b){var c=this;"real"===a?a=c._currentNumber.realPart:"imaginary"===a&&(a=c._currentNumber.imaginaryPart);var d=a.toExponential();return"scientific"===b?function(a){var b=a.indexOf("e"),d=a.slice(b+1),e=a.slice(0,b+1);return e=e.replace("e","×10"),e+=c._toSuperScript(d),e=e.replace("+","")}(d):"engineering"===b?function(a){var b=a.indexOf("e"),d=a.slice(b+1),e=a.slice(0,b),f=parseInt(d,10)%3;e*=Math.pow(10,f);var g=a.slice(0,b).length-f-2;return g>=0&&(e=e.toFixed(g)),e+"×10"+c._toSuperScript((parseInt(d,10)-f).toString())}(d):d},propertyChangedHandler:function(b,c,d,e){if(e!==d)switch(c){case"template":b.template&&(b._upbutton.removeClass(that.toThemeProperty("jqx-"+d)),b._downbutton.removeClass(that.toThemeProperty("jqx-"+d)),b._upbutton.addClass(that.toThemeProperty("jqx-"+b.template)),b._downbutton.addClass(that.toThemeProperty("jqx-"+b.template)));break;case"width":case"height":b._setSize();break;case"decimalNotation":"default"===e?b.element.value=b._currentNumber.value:b._setNotation();break;case"value":b.element.value=e,b._onChange(d);break;case"spinButtons":var f=function(){b.host.removeClass(b.toThemeProperty("jqx-rc-all")),!1===b.rtl?(b.host.addClass(b.toThemeProperty("jqx-rc-l")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-r"))):(b.host.addClass(b.toThemeProperty("jqx-rc-r")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-l")))};if(b._spinButtonsContainer){var g=b.host.width(),h=b._spinButtonsContainer.outerWidth();!1===e?(b.host.width(g+h),b._spinButtonsContainer.hide(),b.host.addClass(b.toThemeProperty("jqx-rc-all"))):(b.host.width(g-h),b._spinButtonsContainer.show(),f())}else if(!0===e){var i=a("<div></div>");if(b.baseHost)b.host.after(i),b.render();else{var j=b.element.id;b.host.removeAttr("id"),b.host.wrap('<div id="'+j+'" style="display: inline-block;"></div>');var k=a("#"+j);k.append(i);var l=b.host.data();l.jqxComplexInput.host=k,l.jqxComplexInput.element=k[0],b.baseHost=k,b.baseHost.data(l),b.render()}f()}break;case"placeHolder":b._refreshPlaceHolder(d);break;case"roundedCorners":b._spinButtonsContainer?!0===e?!1===b.rtl?(b.host.addClass(b.toThemeProperty("jqx-rc-l")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-r"))):(b.host.addClass(b.toThemeProperty("jqx-rc-r")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-l"))):!1===b.rtl?(b.host.removeClass(b.toThemeProperty("jqx-rc-l")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-rc-r"))):(b.host.removeClass(b.toThemeProperty("jqx-rc-r")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-rc-l"))):!0===e?b.host.addClass(b.toThemeProperty("jqx-rc-all")):b.host.removeClass(b.toThemeProperty("jqx-rc-all"));break;case"disabled":!0===e?(b.host.attr("disabled",!0),b.host.addClass(b.toThemeProperty("jqx-fill-state-disabled jqx-input-disabled")),b._spinButtonsContainer&&b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-fill-state-disabled"))):(b.host.removeAttr("disabled"),b.host.removeClass(b.toThemeProperty("jqx-fill-state-disabled jqx-input-disabled")),b._spinButtonsContainer&&b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-fill-state-disabled")));break;case"rtl":b._spinButtonsContainer&&(!0===e?(b.host.addClass(b.toThemeProperty("jqx-complex-input-child-rtl")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-complex-input-spin-buttons-container-ltr")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-complex-input-child-rtl jqx-complex-input-spin-buttons-container-rtl")),!0===b.roundedCorners&&(b.host.removeClass(b.toThemeProperty("jqx-rc-l")),b.host.addClass(b.toThemeProperty("jqx-rc-r")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-rc-r")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-l")))):(b.host.removeClass(b.toThemeProperty("jqx-complex-input-child-rtl")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-complex-input-child-rtl jqx-complex-input-spin-buttons-container-rtl")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-complex-input-spin-buttons-container-ltr")),!0===b.roundedCorners&&(b.host.removeClass(b.toThemeProperty("jqx-rc-r")),b.host.addClass(b.toThemeProperty("jqx-rc-l")),b._spinButtonsContainer.removeClass(b.toThemeProperty("jqx-rc-l")),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-rc-r")))));break;case"theme":a.jqx.utilities.setTheme(d,e,b.host)}},_raiseEvent:function(b,c){void 0===c&&(c={owner:null});var d=this.events[b];c.owner=this;var e=new a.Event(d);return e.owner=this,c.type=this.changeType,this.changeType=null,e.args=c,e.preventDefault&&e.preventDefault(),this.host.trigger(e)},_appendSpinButtons:function(){var b=this;b._spinButtonsContainer=a(b.baseHost.children("div")),b._spinButtonsContainer.attr("unselectable","on"),b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-fill-state-normal jqx-complex-input-child jqx-formatted-input-spin-buttons-container jqx-complex-input-spin-buttons-container")),!1===b.rtl?b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-complex-input-spin-buttons-container-ltr")):b._spinButtonsContainer.addClass(b.toThemeProperty("jqx-complex-input-child-rtl jqx-complex-input-spin-buttons-container-rtl"));var c='<div unselectable="on" class="'+b.toThemeProperty("jqx-fill-state-normal jqx-formatted-input-spin-button")+'"><div class="'+b.toThemeProperty("jqx-input-icon")+'"></div></div>';b._upbutton=a(c),b._spinButtonsContainer.append(b._upbutton),b._downbutton=a(c),b._spinButtonsContainer.append(b._downbutton),b._upArrow=b._upbutton.find("div"),b._upArrow.addClass(b.toThemeProperty("jqx-icon-arrow-up")),b._downArrow=b._downbutton.find("div"),b._downArrow.addClass(b.toThemeProperty("jqx-icon-arrow-down")),b._upArrow.add(b._downArrow).attr("unselectable","on"),b.template&&(b._upbutton.addClass(b.toThemeProperty("jqx-"+b.template)),b._downbutton.addClass(b.toThemeProperty("jqx-"+b.template)))},_addClasses:function(){var a=this;a.host.addClass(a.toThemeProperty("jqx-widget jqx-input jqx-complex-input jqx-widget-content")),a.baseHost&&(a.baseHost.addClass(a.toThemeProperty("jqx-widget jqx-complex-input-parent")),a.host.addClass(a.toThemeProperty("jqx-complex-input-child"))),!0===a.roundedCorners&&(a._spinButtonsContainer?!1===a.rtl?(a.host.addClass(a.toThemeProperty("jqx-rc-l")),a._spinButtonsContainer.addClass(a.toThemeProperty("jqx-rc-r"))):(a.host.addClass(a.toThemeProperty("jqx-rc-r")),a._spinButtonsContainer.addClass(a.toThemeProperty("jqx-rc-l"))):a.host.addClass(a.toThemeProperty("jqx-rc-all"))),!0===a.disabled&&(a.host.attr("disabled",!0),a.host.addClass(a.toThemeProperty("jqx-fill-state-disabled jqx-input-disabled")),a._spinButtonsContainer&&a._spinButtonsContainer.addClass(a.toThemeProperty("jqx-fill-state-disabled"))),!0===a.rtl&&a.host.add(a._spinButtonsContainer).addClass(a.toThemeProperty("jqx-complex-input-child-rtl"))},_refreshPlaceHolder:function(a){var b=this;"placeholder"in b.element?b.host.attr("placeHolder",b.placeHolder):""!==b.element.value&&b.element.value!==a||(b.element.value=b.placeHolder)},_setSize:function(){function b(){var b=c.baseHost.height(),d=parseInt(c.host.css("border-left-width"),10)+parseInt(c.host.css("border-right-width"),10)+parseInt(c.host.css("padding-left"),10)+parseInt(c.host.css("padding-right"),10),e=0;if(a.jqx.browser.msie&&a.jqx.browser.version<8&&(e=d,c.host.height(c.baseHost.height()-2*(parseInt(c.host.css("border-top-width"),10)+parseInt(c.host.css("border-bottom-width"),10)+parseInt(c.host.css("padding-top"),10)+parseInt(c.host.css("padding-bottom"),10)))),c._spinButtonsContainer){var f="string"==typeof c.width&&"%"===c.width.charAt(c.width.length-1)?1:0;c.host.width(c.baseHost.width()-d-c._spinButtonsContainer.outerWidth()-e-f),a.jqx.browser.msie&&a.jqx.browser.version<8&&c._spinButtonsContainer.height(b-2*(parseInt(c._spinButtonsContainer.css("border-top-width"),10)+parseInt(c._spinButtonsContainer.css("border-bottom-width"),10)+parseInt(c._spinButtonsContainer.css("padding-top"),10)+parseInt(c._spinButtonsContainer.css("padding-bottom"),10)))}else c.host.width(c.baseHost.width()-d-e)}var c=this;c.baseHost?(c.baseHost.width(c.width),c.baseHost.height(c.height),b()):(c.host.width(c.width),c.host.height(c.height)),a.jqx.browser.msie&&a.jqx.browser.version<9&&c.host.css("line-height",c.host.height()+"px");var d=c.baseHost||c.host;a.jqx.utilities.resize(d,function(){b(),(a.jqx.browser.msie&&a.jqx.browser.version<9||!a.jqx.browser.msie)&&"string"==typeof c.height&&"%"===c.height.charAt(c.height.length-1)&&c.host.css("line-height",c.host.height()+"px")})},_addHandlers:function(){var b,c=this;b=c.baseHost?c.baseHost[0].id:c.element.id;var d=[8,9,13,32,35,36,37,38,39,40,46];if(c.addHandler(c.host,"focus.jqxComplexInput"+b,function(){if(c.host.addClass(c.toThemeProperty("jqx-fill-state-focus")),c._spinButtonsContainer&&c._spinButtonsContainer.addClass(c.toThemeProperty("jqx-fill-state-focus")),"placeholder"in c.element||c.element.value!==c.placeHolder||(c.element.value=""),"default"!==c.decimalNotation){var a=c._getCaretPosition();c.element.value=c._currentNumber.value,c._setCaretPosition(a)}}),c.addHandler(c.host,"blur.jqxComplexInput"+b,function(){c.host.removeClass(c.toThemeProperty("jqx-fill-state-focus")),c._spinButtonsContainer&&c._spinButtonsContainer.removeClass(c.toThemeProperty("jqx-fill-state-focus")),(c.element.value!==c.value||"placeholder"in c.element||!("placeholder"in c.element)&&""===c.element.value)&&c._onChange(c.value),"placeholder"in c.element||""!==c.element.value&&c.element.value!==c.placeHolder||(c.element.value=c.placeHolder),"default"!==c.decimalNotation&&c._setNotation()}),c.addHandler(c.host,"keydown.jqxComplexInput"+b,function(a){var b=a.charCode?a.charCode:a.which;if(c.changeType="keyboard",!0!==a.ctrlKey||67!==b&&86!==b&&88!==b){var e=String.fromCharCode(b);b>=96&&b<=105&&(e=(b-96).toString(),b-=48),(!c._firefox&&187===b||c._firefox&&61===b)&&!0===a.shiftKey?e="+":(!c._firefox&&189===b||c._firefox&&173===b)&&!1===a.shiftKey?e="-":190===b&&!1===a.shiftKey&&(e=".");if(!0!==c._allowedCharacters.test(e))return-1!==d.indexOf(b)&&void 0;if("+"===e||"-"===e){if((c.element.value.match(/-/g)||[]).length+(c.element.value.match(/\+/g)||[]).length>1)return!1}else if("."===e){var f=(c.element.value.match(/\./g)||[]).length;if(f>1)return!1}else if("i"===e.toLowerCase()&&-1!==c.element.value.indexOf(e.toLowerCase()))return!1}}),c.addHandler(c.host,"keypress.jqxComplexInput"+b,function(a){13===(a.charCode?a.charCode:a.which)&&c.element.value!==c.value&&c._onChange(c.value)}),c._spinButtonsContainer){var e=c._upbutton.add(c._downbutton);c.addHandler(c._upbutton,"mousedown.jqxComplexInputSpinButtonUp"+b,function(){c.disabled||""===c.value||null===c.value||(c._upbutton.addClass(c.toThemeProperty("jqx-fill-state-pressed")),c.changeType="mouse",c._incrementOrDecrement(!0))}),c.addHandler(c._upbutton,"mouseup.jqxComplexInputSpinButtonUp"+b,function(){c.disabled||""===c.value||null===c.value||c._upbutton.removeClass(c.toThemeProperty("jqx-fill-state-pressed"))}),c.addHandler(c._downbutton,"mousedown.jqxComplexInputSpinButtonDown"+b,function(){c.disabled||""===c.value||null===c.value||(c._downbutton.addClass(c.toThemeProperty("jqx-fill-state-pressed")),c.changeType="mouse",c._incrementOrDecrement(!1))}),c.addHandler(c._downbutton,"mouseup.jqxComplexInputSpinButtonDown"+b,function(){c.disabled||""===c.value||null===c.value||c._downbutton.removeClass(c.toThemeProperty("jqx-fill-state-pressed"))}),c.addHandler(e,"mouseenter.jqxComplexInputSpinButtons"+b,function(b){if(!c.disabled&&""!==c.value&&null!==c.value){var d=a(b.target);d.hasClass("jqx-icon-arrow-up")||d.children().hasClass("jqx-icon-arrow-up")?(c._upbutton.addClass(c.toThemeProperty("jqx-fill-state-hover")),c._upArrow.addClass(c.toThemeProperty("jqx-icon-arrow-up-hover"))):(c._downbutton.addClass(c.toThemeProperty("jqx-fill-state-hover")),c._downArrow.addClass(c.toThemeProperty("jqx-icon-arrow-down-hover")))}}),c.addHandler(e,"mouseleave.jqxComplexInputSpinButtons"+b,function(b){if(!c.disabled&&""!==c.value&&null!==c.value){var d=a(b.target);d.hasClass("jqx-icon-arrow-up")||d.children().hasClass("jqx-icon-arrow-up")?(c._upbutton.removeClass(c.toThemeProperty("jqx-fill-state-hover")),c._upArrow.removeClass(c.toThemeProperty("jqx-icon-arrow-up-hover"))):(c._downbutton.removeClass(c.toThemeProperty("jqx-fill-state-hover")),c._downArrow.removeClass(c.toThemeProperty("jqx-icon-arrow-down-hover")))}}),c.addHandler(a("body"),"mouseup.jqxComplexInputSpinButtons"+b,function(){c._upbutton.add(c._downbutton).removeClass(c.toThemeProperty("jqx-fill-state-pressed"))})}},_removeHandlers:function(){var b,c=this;if(b=c.baseHost?c.baseHost[0].id:c.element.id,c.removeHandler(c.host,"focus.jqxComplexInput"+b),c.removeHandler(c.host,"blur.jqxComplexInput"+b),c.removeHandler(c.host,"keydown.jqxComplexInput"+b),c.removeHandler(c.host,"keypress.jqxComplexInput"+b),c._spinButtonsContainer){var d=c._upbutton.add(c._downbutton);c.removeHandler(c._upbutton,"mousedown.jqxComplexInputSpinButtonUp"+b),c.removeHandler(c._upbutton,"mouseup.jqxComplexInputSpinButtonUp"+b),c.removeHandler(c._downbutton,"mousedown.jqxComplexInputSpinButtonDown"+b),c.removeHandler(c._downbutton,"mouseup.jqxComplexInputSpinButtonDown"+b),c.removeHandler(d,"mouseenter.jqxComplexInputSpinButtons"+b),c.removeHandler(d,"mouseleave.jqxComplexInputSpinButtons"+b),c.removeHandler(a("body"),"mouseup.jqxComplexInputSpinButtons"+b)}},_onChange:function(b){var c,d,e=this,f=e.element.value.toLowerCase();if(""!==a.trim(f)&&a.trim(f)!==e.placeHolder){if(-1!==f.indexOf("++")||-1!==f.indexOf("+-")){var g=f.indexOf("+");f=f.slice(0,g+1)+""+f.slice(g+2,f.length)}else if(-1!==f.indexOf("--")||-1!==f.indexOf("-+")){var h=f.indexOf("-");f=f.slice(0,h+1)+""+f.slice(h+2,f.length)}if(-1!==f.indexOf("..")){var i=f.indexOf(".");f=f.slice(0,i+1)+""+f.slice(i+2,f.length)}var j=e._getReal(f),k=e._getImaginary(f),l=k>=0?"+":"-";if(c=j,d=k,isNaN(c)||isNaN(d))return void(e.element.value=b);e.element.value=j+" "+l+" "+Math.abs(k)+"i",e.value=e.element.value}else c=0,d=0,e.value="";e.value!==b&&(e._currentNumber={value:e.value,realPart:c,imaginaryPart:d},e._raiseEvent("0",{value:e.value,oldValue:b,realPart:c,imaginaryPart:d}))},_incrementOrDecrement:function(a){function b(b){var c,d,f,g=b.toString(),h=g.indexOf(".");return-1!==h?(d=parseInt(g.slice(0,h),10),f=g.slice(g.indexOf(".")+1),c="."):(d=b,f="",c=""),b=!0===a?d+e.spinButtonsStep:d-e.spinButtonsStep,b=parseFloat(b+""+c+f)}var c,d,e=this,f=e.host.is(":focus"),g=e.element.value,h=e._currentNumber.realPart,i=e._currentNumber.imaginaryPart;f&&(c=e._getCaretPosition()),i>=0?d=g.indexOf("+"):("-"===g.charAt(0)&&(g=g.slice(1,g.length)),d=g.indexOf("-")),void 0===c||c<=d?h=b(h):i=b(i);var j=i>=0?"+":"-",k=h+" "+j+" "+Math.abs(i)+"i";e.element.value=k,e._onChange(e.value),f?e._setCaretPosition(c):"default"!==e.decimalNotation&&e._setNotation()},_getCaretPosition:function(){var a=this.element;if("selectionStart"in a)return a.selectionStart;if(document.selection){a.focus();var b=document.selection.createRange(),c=document.selection.createRange().text.length;return b.moveStart("character",-a.value.length),b.text.length-c}},_setCaretPosition:function(a){var b=this.element;setTimeout(function(){if("selectionStart"in b)b.focus(),b.setSelectionRange(a,a);else{var c=b.createTextRange();c.collapse(!0),c.moveEnd("character",a),c.moveStart("character",a),c.select()}},10)},_exponentialToDecimal:function(b){var c=b.indexOf("e")+2,d=b.slice(c),e=d.indexOf("+"),f=d.indexOf("-");c=-1!==e&&(e<f||-1===f)?e:f;var g=d.slice(c),h=b.replace(g,"");g=g.slice(0,g.length-1);var i=g.charAt(0);return g=a.trim(g.slice(1)),"-"===i&&(g="-"+g),h=1*parseFloat(h).toFixed(20),g=1*parseFloat(g).toFixed(20),{realPart:h,imaginaryPart:g}},_setNotation:function(){var a=this,b=a.getDecimalNotation(a._currentNumber.realPart,a.decimalNotation),c=a.getDecimalNotation(Math.abs(a._currentNumber.imaginaryPart),a.decimalNotation),d=a._currentNumber.imaginaryPart>=0?"+":"-";a.element.value=b+" "+d+" "+c+"i"},_toSuperScript:function(a,b){for(var c="-0123456789",d="⁻⁰¹²³⁴⁵⁶⁷⁸⁹",e="",f=0;f<a.length;f++)if(!0===b){var g=d.indexOf(a.charAt(f));e+=-1!==g?c[g]:a[f]}else{var h=c.indexOf(a.charAt(f));e+=-1!==h?d[h]:a[f]}return e}})}(jqxBaseFramework);

