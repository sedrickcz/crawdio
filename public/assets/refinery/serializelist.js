/**
 * jQuery Serialize List
 * Copyright (c) 2009 Mike Botsko, Botsko.net LLC
 * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * Copyright notice and license must remain intact for legal use
 * Version .2
 *
 * Serialize an unordered or ordered list item. Optional ability
 * to determine which attributes are included. The serialization
 * will be read by PHP as a multidimensional array which you may
 * use for saving state.
 *
 * http://github.com/botskonet/jquery.serialize-list
 */
!function(t){t.fn.serializelist=function(e){var i,n,s,o={attributes:["id"],allow_nest:!0,prepend:"ul",att_regex:!1,is_child:!1},a=t.extend(o,e),r=a.attributes,l="",c=function(t,e){if(!a.att_regex)return e;for(n in a.att_regex)if(a.att_regex[n].att===t)return e.replace(a.att_regex[n].regex,"")};return a.is_child||(a.prepend="&"+a.prepend),this.each(function(e,n){t(n).children().each(function(n,o){if(a.allow_nest||r.length>1)for(var u=0;u<r.length;u++)i=c(r[u],t(o).attr(r[u])),l+=a.prepend+"["+e+"]["+n+"]["+r[u]+"]="+i;else i=c(r[0],t(o).attr(r[0])),l+=a.prepend+"["+e+"]["+n+"]="+i;a.allow_nest&&(s=a.prepend+"["+e+"]["+n+"][children]",t(o).children().each(function(){("UL"==this.tagName||"OL"==this.tagName)&&(l+=t(this).serializelist({prepend:s,is_child:!0}))})),n++})}),l}}(jQuery);