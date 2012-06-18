jQuery.easing.jswing = jQuery.easing.swing;
jQuery.extend(jQuery.easing, {
    def: "easeOutQuad",
    swing: function(e, f, a, h, g) {
        return jQuery.easing[jQuery.easing.def](e, f, a, h, g)
    },
    easeInQuad: function(e, f, a, h, g) {
        return h * (f /= g) * f + a
    },
    easeOutQuad: function(e, f, a, h, g) {
        return - h * (f /= g) * (f - 2) + a
    },
    easeInOutQuad: function(e, f, a, h, g) {
        if ((f /= g / 2) < 1) {
            return h / 2 * f * f + a
        }
        return - h / 2 * ((--f) * (f - 2) - 1) + a
    },
    easeInCubic: function(e, f, a, h, g) {
        return h * (f /= g) * f * f + a
    },
    easeOutCubic: function(e, f, a, h, g) {
        return h * ((f = f / g - 1) * f * f + 1) + a
    },
    easeInOutCubic: function(e, f, a, h, g) {
        if ((f /= g / 2) < 1) {
            return h / 2 * f * f * f + a
        }
        return h / 2 * ((f -= 2) * f * f + 2) + a
    },
    easeInQuart: function(e, f, a, h, g) {
        return h * (f /= g) * f * f * f + a
    },
    easeOutQuart: function(e, f, a, h, g) {
        return - h * ((f = f / g - 1) * f * f * f - 1) + a
    },
    easeInOutQuart: function(e, f, a, h, g) {
        if ((f /= g / 2) < 1) {
            return h / 2 * f * f * f * f + a
        }
        return - h / 2 * ((f -= 2) * f * f * f - 2) + a
    },
    easeInQuint: function(e, f, a, h, g) {
        return h * (f /= g) * f * f * f * f + a
    },
    easeOutQuint: function(e, f, a, h, g) {
        return h * ((f = f / g - 1) * f * f * f * f + 1) + a
    },
    easeInOutQuint: function(e, f, a, h, g) {
        if ((f /= g / 2) < 1) {
            return h / 2 * f * f * f * f * f + a
        }
        return h / 2 * ((f -= 2) * f * f * f * f + 2) + a
    },
    easeInSine: function(e, f, a, h, g) {
        return - h * Math.cos(f / g * (Math.PI / 2)) + h + a
    },
    easeOutSine: function(e, f, a, h, g) {
        return h * Math.sin(f / g * (Math.PI / 2)) + a
    },
    easeInOutSine: function(e, f, a, h, g) {
        return - h / 2 * (Math.cos(Math.PI * f / g) - 1) + a
    },
    easeInExpo: function(e, f, a, h, g) {
        return (f == 0) ? a: h * Math.pow(2, 10 * (f / g - 1)) + a
    },
    easeOutExpo: function(e, f, a, h, g) {
        return (f == g) ? a + h: h * ( - Math.pow(2, -10 * f / g) + 1) + a
    },
    easeInOutExpo: function(e, f, a, h, g) {
        if (f == 0) {
            return a
        }
        if (f == g) {
            return a + h
        }
        if ((f /= g / 2) < 1) {
            return h / 2 * Math.pow(2, 10 * (f - 1)) + a
        }
        return h / 2 * ( - Math.pow(2, -10 * --f) + 2) + a
    },
    easeInCirc: function(e, f, a, h, g) {
        return - h * (Math.sqrt(1 - (f /= g) * f) - 1) + a
    },
    easeOutCirc: function(e, f, a, h, g) {
        return h * Math.sqrt(1 - (f = f / g - 1) * f) + a
    },
    easeInOutCirc: function(e, f, a, h, g) {
        if ((f /= g / 2) < 1) {
            return - h / 2 * (Math.sqrt(1 - f * f) - 1) + a
        }
        return h / 2 * (Math.sqrt(1 - (f -= 2) * f) + 1) + a
    },
    easeInElastic: function(f, h, e, o, n) {
        var l = 1.70158;
        var m = 0;
        var g = o;
        if (h == 0) {
            return e
        }
        if ((h /= n) == 1) {
            return e + o
        }
        if (!m) {
            m = n * 0.3
        }
        if (g < Math.abs(o)) {
            g = o;
            var l = m / 4
        } else {
            var l = m / (2 * Math.PI) * Math.asin(o / g)
        }
        return - (g * Math.pow(2, 10 * (h -= 1)) * Math.sin((h * n - l) * (2 * Math.PI) / m)) + e
    },
    easeOutElastic: function(f, h, e, o, n) {
        var l = 1.70158;
        var m = 0;
        var g = o;
        if (h == 0) {
            return e
        }
        if ((h /= n) == 1) {
            return e + o
        }
        if (!m) {
            m = n * 0.3
        }
        if (g < Math.abs(o)) {
            g = o;
            var l = m / 4
        } else {
            var l = m / (2 * Math.PI) * Math.asin(o / g)
        }
        return g * Math.pow(2, -10 * h) * Math.sin((h * n - l) * (2 * Math.PI) / m) + o + e
    },
    easeInOutElastic: function(f, h, e, o, n) {
        var l = 1.70158;
        var m = 0;
        var g = o;
        if (h == 0) {
            return e
        }
        if ((h /= n / 2) == 2) {
            return e + o
        }
        if (!m) {
            m = n * (0.3 * 1.5)
        }
        if (g < Math.abs(o)) {
            g = o;
            var l = m / 4
        } else {
            var l = m / (2 * Math.PI) * Math.asin(o / g)
        }
        if (h < 1) {
            return - 0.5 * (g * Math.pow(2, 10 * (h -= 1)) * Math.sin((h * n - l) * (2 * Math.PI) / m)) + e
        }
        return g * Math.pow(2, -10 * (h -= 1)) * Math.sin((h * n - l) * (2 * Math.PI) / m) * 0.5 + o + e
    },
    easeInBack: function(e, f, a, l, h, g) {
        if (g == undefined) {
            g = 1.70158
        }
        return l * (f /= h) * f * ((g + 1) * f - g) + a
    },
    easeOutBack: function(e, f, a, l, h, g) {
        if (g == undefined) {
            g = 1.70158
        }
        return l * ((f = f / h - 1) * f * ((g + 1) * f + g) + 1) + a
    },
    easeInOutBack: function(e, f, a, l, h, g) {
        if (g == undefined) {
            g = 1.70158
        }
        if ((f /= h / 2) < 1) {
            return l / 2 * (f * f * (((g *= (1.525)) + 1) * f - g)) + a
        }
        return l / 2 * ((f -= 2) * f * (((g *= (1.525)) + 1) * f + g) + 2) + a
    },
    easeInBounce: function(e, f, a, h, g) {
        return h - jQuery.easing.easeOutBounce(e, g - f, 0, h, g) + a
    },
    easeOutBounce: function(e, f, a, h, g) {
        if ((f /= g) < (1 / 2.75)) {
            return h * (7.5625 * f * f) + a
        } else {
            if (f < (2 / 2.75)) {
                return h * (7.5625 * (f -= (1.5 / 2.75)) * f + 0.75) + a
            } else {
                if (f < (2.5 / 2.75)) {
                    return h * (7.5625 * (f -= (2.25 / 2.75)) * f + 0.9375) + a
                } else {
                    return h * (7.5625 * (f -= (2.625 / 2.75)) * f + 0.984375) + a
                }
            }
        }
    },
    easeInOutBounce: function(e, f, a, h, g) {
        if (f < g / 2) {
            return jQuery.easing.easeInBounce(e, f * 2, 0, h, g) * 0.5 + a
        }
        return jQuery.easing.easeOutBounce(e, f * 2 - g, 0, h, g) * 0.5 + h * 0.5 + a
    }
}); (function(a) {
    a.jGrowl = function(b, c) {
        if (a("#jGrowl").size() == 0) {
            a('<div id="jGrowl"></div>').addClass((c && c.position) ? c.position: a.jGrowl.defaults.position).appendTo("body")
        }
        a("#jGrowl").jGrowl(b, c)
    };
    a.fn.jGrowl = function(b, d) {
        if (a.isFunction(this.each)) {
            var c = arguments;
            return this.each(function() {
                var e = this;
                if (a(this).data("jGrowl.instance") == undefined) {
                    a(this).data("jGrowl.instance", a.extend(new a.fn.jGrowl(), {
                        notifications: [],
                        element: null,
                        interval: null
                    }));
                    a(this).data("jGrowl.instance").startup(this)
                }
                if (a.isFunction(a(this).data("jGrowl.instance")[b])) {
                    a(this).data("jGrowl.instance")[b].apply(a(this).data("jGrowl.instance"), a.makeArray(c).slice(1))
                } else {
                    a(this).data("jGrowl.instance").create(b, d)
                }
            })
        }
    };
    a.extend(a.fn.jGrowl.prototype, {
        defaults: {
            pool: 0,
            header: "",
            group: "",
            sticky: false,
            position: "top-right",
            glue: "after",
            theme: "default",
            themeState: "highlight",
            corners: "10px",
            check: 50,
            life: 3000,
            closeDuration: "normal",
            openDuration: "normal",
            easing: "swing",
            noclose: true,
            closer: true,
            closeTemplate: "&times;",
            closerTemplate: "<div>[ close all ]</div>",
            log: function(c, b, d) {},
            beforeOpen: function(c, b, d) {},
            afterOpen: function(c, b, d) {},
            open: function(c, b, d) {},
            beforeClose: function(c, b, d) {},
            close: function(c, b, d) {},
            animateOpen: {
                opacity: "show"
            },
            animateClose: {
                opacity: "hide"
            }
        },
        notifications: [],
        element: null,
        interval: null,
        create: function(b, c) {
            var c = a.extend({},
            this.defaults, c);
            if (typeof c.speed !== "undefined") {
                c.openDuration = c.speed;
                c.closeDuration = c.speed
            }
            this.notifications.push({
                message: b,
                options: c
            });
            c.log.apply(this.element, [this.element, b, c])
        },
        render: function(d) {
            var b = this;
            var c = d.message;
            var e = d.options;
            var d = a('<div class="jGrowl-notification ' + e.themeState + " ui-corner-all" + ((e.group != undefined && e.group != "") ? " " + e.group: "") + '">' + (e.noclose ? "": '<div class="jGrowl-close">' + e.closeTemplate + "</div>") + '<div class="jGrowl-header">' + e.header + '</div><div class="jGrowl-message">' + c + "</div></div>").data("jGrowl", e).addClass(e.theme);
            a(d).bind("mouseover.jGrowl",
            function() {
                a("div.jGrowl-notification", b.element).data("jGrowl.pause", true)
            }).bind("mouseout.jGrowl",
            function() {
                a("div.jGrowl-notification", b.element).data("jGrowl.pause", false)
            }).bind("jGrowl.beforeOpen",
            function() {
                if (e.beforeOpen.apply(d, [d, c, e, b.element]) != false) {
                    a(this).trigger("jGrowl.open")
                }
            }).bind("jGrowl.open",
            function() {
                if (e.open.apply(d, [d, c, e, b.element]) != false) {
                    if (e.glue == "after") {
                        a("div.jGrowl-notification:last", b.element).after(d)
                    } else {
                        a("div.jGrowl-notification:first", b.element).before(d)
                    }
                    a(this).animate(e.animateOpen, e.openDuration, e.easing,
                    function() {
                        if (a.browser.msie && (parseInt(a(this).css("opacity"), 10) === 1 || parseInt(a(this).css("opacity"), 10) === 0)) {
                            this.style.removeAttribute("filter")
                        }
                        a(this).data("jGrowl").created = new Date();
                        a(this).trigger("jGrowl.afterOpen")
                    })
                }
            }).bind("jGrowl.afterOpen",
            function() {
                e.afterOpen.apply(d, [d, c, e, b.element])
            }).bind("jGrowl.beforeClose",
            function() {
                if (e.beforeClose.apply(d, [d, c, e, b.element]) != false) {
                    a(this).trigger("jGrowl.close")
                }
            }).bind("jGrowl.close",
            function() {
                a(this).data("jGrowl.pause", true);
                a(this).animate(e.animateClose, e.closeDuration, e.easing,
                function() {
                    a(this).remove();
                    var f = e.close.apply(d, [d, c, e, b.element]);
                    if (a.isFunction(f)) {
                        f.apply(d, [d, c, e, b.element])
                    }
                })
            }).trigger("jGrowl.beforeOpen");
            if (e.corners != "" && a.fn.corner != undefined) {
                a(d).corner(e.corners)
            }
            if (a("div.jGrowl-notification:parent", b.element).size() > 1 && a("div.jGrowl-closer", b.element).size() == 0 && this.defaults.closer != false) {
                a(this.defaults.closerTemplate).addClass("jGrowl-closer ui-state-highlight ui-corner-all").addClass(this.defaults.theme).appendTo(b.element).animate(this.defaults.animateOpen, this.defaults.speed, this.defaults.easing).bind("click.jGrowl",
                function() {
                    a(this).siblings().trigger("jGrowl.beforeClose");
                    if (a.isFunction(b.defaults.closer)) {
                        b.defaults.closer.apply(a(this).parent()[0], [a(this).parent()[0]])
                    }
                })
            }
        },
        update: function() {
            a(this.element).find("div.jGrowl-notification:parent").each(function() {
                if (a(this).data("jGrowl") != undefined && a(this).data("jGrowl").created != undefined && (a(this).data("jGrowl").created.getTime() + parseInt(a(this).data("jGrowl").life)) < (new Date()).getTime() && a(this).data("jGrowl").sticky != true && (a(this).data("jGrowl.pause") == undefined || a(this).data("jGrowl.pause") != true)) {
                    a(this).trigger("jGrowl.beforeClose")
                }
            });
            if (this.notifications.length > 0 && (this.defaults.pool == 0 || a(this.element).find("div.jGrowl-notification:parent").size() < this.defaults.pool)) {
                this.render(this.notifications.shift())
            }
            if (a(this.element).find("div.jGrowl-notification:parent").size() < 2) {
                a(this.element).find("div.jGrowl-closer").animate(this.defaults.animateClose, this.defaults.speed, this.defaults.easing,
                function() {
                    a(this).remove()
                })
            }
        },
        startup: function(b) {
            this.element = a(b).addClass("jGrowl").append('<div class="jGrowl-notification"></div>');
            this.interval = setInterval(function() {
                a(b).data("jGrowl.instance").update()
            },
            parseInt(this.defaults.check));
            if (a.browser.msie && parseInt(a.browser.version) < 7 && !window.XMLHttpRequest) {
                a(this.element).addClass("ie6")
            }
        },
        shutdown: function() {
            a(this.element).removeClass("jGrowl").find("div.jGrowl-notification").remove();
            clearInterval(this.interval)
        },
        close: function() {
            a(this.element).find("div.jGrowl-notification").each(function() {
                a(this).trigger("jGrowl.beforeClose")
            })
        }
    });
    a.extend({
        closejGrowl: function(b) {
            a("#jGrowl").find("div.jGrowl-notification:parent").each(function() {
                if (a(this).data("jGrowl").name == b) {
                    a(this).trigger("jGrowl.close")
                }
            })
        }
    });
    a.jGrowl.defaults = a.fn.jGrowl.prototype.defaults
})(jQuery);
jQuery.cookie = function(d, e, b) {
    if (arguments.length > 1 && String(e) !== "[object Object]") {
        b = jQuery.extend({},
        b);
        if (e === null || e === undefined) {
            b.expires = -1
        }
        if (typeof b.expires === "number") {
            var g = b.expires,
            c = b.expires = new Date();
            c.setDate(c.getDate() + g)
        }
        e = String(e);
        return (document.cookie = [encodeURIComponent(d), "=", b.raw ? e: encodeURIComponent(e), b.expires ? "; expires=" + b.expires.toUTCString() : "", b.path ? "; path=" + b.path: "", b.domain ? "; domain=" + b.domain: "", b.secure ? "; secure": ""].join(""))
    }
    b = e || {};
    var a,
    f = b.raw ?
    function(h) {
        return h
    }: decodeURIComponent;
    return (a = new RegExp("(?:^|; )" + encodeURIComponent(d) + "=([^;]*)").exec(document.cookie)) ? f(a[1]) : null
};
var bindPopupEvent = function(f, c, b, a, g) {
    if (typeof(f) != "array") {
        f = [f]
    }
    this.debug = 0;
    var e = this;
    this.callback = g;
    this.triggerObj = f;
    this.triggerIndex,
    this.triggerChildIndex;
    this.popupObj = c;
    this.respTime = b;
    this.popType = a;
    this.overTrigger = Boolean(0);
    this.overPopup = Boolean(0);
    this.showType = "";
    this.hideType = "";
    this.timerhandle = null;
    if (a.substr(0, 1) == "c") {
        this.showType = "click"
    }
    if (a.substr(0, 1) == "m") {
        this.showType = "mouseover"
    }
    if (a.substr(1, 2) == "c") {
        this.hideType = "click"
    }
    if (a.substr(1, 2) == "m") {
        this.hideType = "mouseover"
    }
    if (this.showType == "click") {
        for (i = 0; i < this.triggerObj.length; i++) {
            $(this.triggerObj[i]).click(function() {
                for (j = 0; j < e.triggerObj.length; j++) {
                    if ($(this) == $(e.triggerObj[j])) {
                        e.triggerIndex = j
                    }
                    e.triggerChildIndex = k
                }
                if ($(e.popupObj).is(":hidden")) {
                    e.showPopup()
                }
                return false;
                if (e.debug == 1) {
                    $("#triCliCount").html((parseInt($("#triCliCount").html()) + 1).toString());
                    $("#popupStatus").html("show")
                }
            })
        }
    }
    for (i = 0; i < this.triggerObj.length; i++) {
        $(this.triggerObj[i]).hover(function(h) {
            for (j = 0; j < e.triggerObj.length; j++) {
                for (k = 0; k < $(e.triggerObj[j]).length; k++) {
                    if (this == $(e.triggerObj[j])[k]) {
                        e.triggerIndex = j;
                        e.triggerChildIndex = k;
                        e.overTrigger = 1;
                        clearTimeout(e.timerhandle);
                        e.timerhandle = setTimeout(function() {
                            $("#onTrigger").html("yes");
                            if (e.showType == "mouseover") {
                                if (e.debug == 1) {
                                    $("#popupStatus").html("show")
                                }
                                e.showPopup(h)
                            }
                        },
                        b);
                        break
                    }
                }
            }
        },
        function(h) {})
    }
    $(this.popupObj).hover(function() {
        e.overPopup = 1;
        clearTimeout(e.timerhandle);
        e.timerhandle = setTimeout(function() {
            if (e.debug == 1) {
                $("#onPopup").html("yes");
                $("#popupStatus").html("show")
            }
            e.showPopup()
        },
        b)
    },
    function(h) {});
    for (i = 0; i < this.triggerObj.length; i++) {
        $(this.triggerObj[i]).hover(function(h) {},
        function() {
            e.overTrigger = 0;
            if (e.debug == 1) {
                $("#onTrigger").html("no")
            }
            for (j = 0; j < e.triggerObj.length; j++) {
                for (k = 0; k < $(e.triggerObj[j]).length; k++) {
                    if (this == $(e.triggerObj[j])[k]) {
                        break
                    }
                }
                d(j)
            }
        })
    }
    $(this.popupObj).hover(function(h) {},
    function() {
        e.overPopup = 0;
        if (e.debug == 1) {
            $("#onPopup").html("no")
        }
        d( - 1)
    });
    var d = function(h) {
        if (h == e.triggerIndex || h == -1) {
            clearTimeout(e.timerhandle);
            if (e.hideType == "mouseover") {
                e.timerhandle = setTimeout(function() {
                    if (!e.overTrigger && !e.overPopup) {
                        if (e.debug == 1) {
                            $("#popupStatus").html("hide")
                        }
                        e.hidePopup()
                    }
                },
                e.respTime)
            }
        }
    }
};
bindPopupEvent.prototype.hidePopup = function() {
    $(this.popupObj).fadeOut(100);
    $(window).unbind(this.winHandle)
};
bindPopupEvent.prototype.showPopup = function(b) {
    var a = this;
    if (this.callback) {
        if (!this.callback(b, this.triggerObj[this.triggerIndex], this.popupObj, this.triggerChildIndex.that)) {
            return
        }
    }
    $(this.popupObj).fadeIn(100);
    if (this.hideType == "click") {
        this.winHandle = $(window).bind("click",
        function(c) {
            if (!a.overPopup) {
                a.hidePopup()
            }
            if (a.debug == 1) {
                $("#bodyCliCount").html((parseInt($("#bodyCliCount").html()) + 1).toString());
                $("#popupStatus").html("hide")
            }
        })
    }
};
var getBrowserRules = function() {
    return {
        height: document.documentElement.clientHeight,
        width: document.documentElement.clientWidth,
        sLeft: document.documentElement.scrollLeft,
        sTop: typeof($.fn.scrollTop) == "function" ? $(document).scrollTop() : $(document).offset().scrollTop,
        sHeight: document.documentElement.scrollHeight,
        sWidth: document.documentElement.scrollWidth
    }
};
var getMousePos = function(a) {
    if (a.pageX || a.pageY) {
        return {
            x: a.pageX,
            y: a.pageY
        }
    }
    return {
        x: a.clientX + document.body.scrollLeft - document.body.clientLeft,
        y: a.clientY + document.body.scrollTop - document.body.clientTop
    }
};
var ajax_req = function(c, b, a) {
    this.debug_mode = true;
    this.winHandle = $(window);
    this.ajax_method = c;
    this.ajax_param = "";
    this.req_cb = null;
    this.mark_curpage = a;
    this.msg = b;
    this.load_layer = c + "_loading";
    this.usage = 0;
    if (typeof usage_threshold == "undefined") {
        this.usage_threshold = 1
    }
};
ajax_req.prototype = {
    req: function(e, d, c) {
        var a = this.debug_mode,
        f = this;
        if (a === true && (typeof d != "function" || typeof c != "function")) {
            alert("Loading Callback or Request Callback is not defined!")
        }
        if (this._usageCtl("status") >= this.usage_threshold) {
            if (a === true) {
                alert('Error \n\n Ajax "' + this.ajax_method + "(" + this._usageCtl("status") + ')" exceed usage limit of ' + this.usage_threshold + "!")
            } else {
                f._tipCtl("show", "overaction")
            }
            return
        }
        this._usageCtl("add");
        this.ajax_method = this.ajax_method,
        this.ajax_param = e;
        var b = this.ajax_method + ".ajax";
        $.ajaxSetup({
            timeout: 5000
        });
        if (typeof d == "function") {
            d()
        }
        if (typeof d != "function") {
            alert("Error occur! Contact admin for detail > <");
            return
        }
        if (a === true && typeof d != "function") {
            alert('Error \n\n Loading function in Ajax "' + this.ajax_method + '" is not a function!');
            return
        }
        f._tipCtl("show", "loading");
        $.get(b, e,
        function(h) {
            if (typeof h != "undefined") {
                var g = c(h);
                if (g == false) {
                    f._tipCtl("show", "fail")
                } else {
                    if (typeof f.msg[g] == "string") {
                        f._tipCtl("show", g)
                    } else {
                        if (typeof f.msg[g] == "object") {
                            $.each(f.msg,
                            function(l, m) {
                                if (g == l) {
                                    f._tipCtl("show", l, m.mode)
                                }
                            })
                        } else {
                            if (g != "nomessage") {
                                f._tipCtl("show", "unknown")
                            }
                        }
                    }
                }
            } else {
                f._tipCtl("show", "fail")
            }
            f._tipCtl("hide", "loading");
            f._usageCtl("minus")
        },
        "json");
        $("body").ajaxError(function(l, m, h, g) {
            if (h.url == b) {
                if (a === true) {
                    var l = [];
                    $(m.responseText).each(function(o, n) {
                        if (n.innerHTML != null) {
                            l.push(n)
                        }
                    });
                    alert("Error request: \n" + h.url + "\n\nError title: \n" + $(l[0]).html() + "\n\nError content: \n" + $(l[2]).html())
                } else {
                    alert("Error occur! Contact admin for detail > <")
                }
            }
        })
    },
    _tipCtl: function(c, b, f) {
        var g = this,
        a = g.ajax_method + "_" + b;
        var e = $.extend({
            loading: "正在载入数据...",
            success: "操作成功!",
            fail: "操作失败",
            AUTH: "请登录后再进行操作",
            overaction: "请不要连续进行操作哦<br />请先等待Tora酱完成上一个请求@@"
        },
        g.msg);
        var d = {
            action: c,
            name: a,
            tip_mode: f ? f: b
        };
        if (typeof e[b] != "undefined") {
            if (typeof e[b].text != "undefined") {
                $.extend(d, {
                    msg_text: e[b].text
                })
            } else {
                $.extend(d, {
                    msg_text: e[b]
                })
            }
        }
        $.tipCtl(d)
    },
    _usageCtl: function(a) {
        switch (a) {
        case "add":
            this.usage++;
            break;
        case "minus":
            this.usage--;
            if (this.debug_mode === true && this.usage > 0) {
                alert("Minused, but still over 0 (" + this.usage + ")")
            }
            if (this.debug_mode === true && this.usage < 0) {
                alert('Error \n\n AJAX "' + this.ajax_method + '" usage number is below 0, which is abnormal!')
            }
            break;
        case "status":
            return this.usage;
        default:
            if (this.debug_mode === true) {
                alert("A no-param usageCtl is called!")
            }
            break
        }
    }
}; (function(a) {})($); (function(a) {
    a.fn.extend({
        setCaret: function() {
            if (!a.browser.msie) {
                return
            }
            var b = function() {
                var c = a(this).get(0);
                c.caretPos = document.selection.createRange().duplicate()
            };
            a(this).click(b).select(b).keyup(b)
        },
        insertAtCaret: function(b) {
            var l = a(this).get(0);
            if (document.all && l.createTextRange && l.caretPos) {
                var e = l.caretPos;
                var h = b.openWith + b.closeWith;
                e.text = e.text.charAt(e.text.length - 1) == "" ? h: b.openWith + e.text + b.closeWith
            } else {
                if (l.setSelectionRange) {
                    var m = l.selectionStart;
                    var c = l.selectionEnd;
                    var n = l.value.substring(m, c);
                    var f = l.value.substring(0, m);
                    var d = l.value.substring(c);
                    var h;
                    if (b.noContent) {
                        h = b.openWith + b.closeWith
                    } else {
                        h = b.openWith + n + b.closeWith
                    }
                    l.value = f + h + d;
                    l.focus();
                    var g = h.length;
                    l.setSelectionRange(m, m + g);
                    l.blur()
                } else {
                    var h = b.openWith + b.closeWith;
                    l.value += h
                }
            }
        },
        elemNum: function(b) {
            a(this).text(Number(a(this).text()) + b)
        },
        fobtn_init: function(b) {
            var c = typeof b.ajaxreq != "undefined" ? a.extend({
                ajaxreq: null
            },
            b) : a.extend({},
            b);
            a(this).bind("click",
            function() {
                var l = this,
                f = a(this);
                var e = a(this).attr("href").split("_");
                var d = e.shift(),
                h = e.pop();
                var g = (d == "follow" ? "fo=": "unfo=") + h;
                c.ajaxreq.req(g,
                function() {},
                function(m) {
                    if (m.result == "OK") {
                        if (d == "follow") {
                            f.removeClass("b_blue").addClass("b_green").attr("href", "unfollow_" + h).html("<span>正在关注</span><span>取消关注</span>");
                            return "added"
                        } else {
                            f.removeClass("b_green").addClass("b_blue").attr("href", "follow_" + h).html("+ 添加关注");
                            return "removed"
                        }
                    }
                });
                return false
            })
        },
        initPopup: function(d, c) {
            this.debugMode = 0;
            var g = this,
            b = a(this);
            var e = a.extend({
                animateTime: 250,
                trigger: d ? d: "",
                show: function() {
                    b.fadeIn(e.animateTime)
                },
                hide: function() {
                    b.fadeOut(e.animateTime)
                },
                initCallback: function() {},
                afterCallback: function() {}
            },
            c);
            var f = "pop_setting";
            pop_layer = ".dialog-wrap";
            pop_closeBtn = ".dialog-close";
            a.data(a(this)[0], f, e);
            if (a(e.trigger).length > 0) {
                a(e.trigger).click(function() {
                    e.initCallback(b);
                    e.show();
                    e.afterCallback(b);
                    return false
                })
            }
            b.click(function(h) {
                b.data(f).hide()
            });
            b.find(pop_layer).click(function(h) {
                a.stopBubble(h)
            });
            b.find(pop_closeBtn).click(function() {
                e.hide();
                return false
            })
        },
        setPlaceholder: function(b) {
            a(this).attr("placeholder", b);
            a(this).val(b)
        },
        quoteCtl: function(d) {
            if (typeof d == "undefined") {
                d = null
            }
            var h = a.extend({
                ulink: "@",
                name: "",
                avatar: null,
                content: "这只不是鱼丸",
                tar_floor: 0
            },
            d),
            f = a(this).find(".cmmt-target-meta"),
            g = a(this).find(".cmmt-target-content"),
            c = a(this).find(".target-name"),
            b = a(this).find(".target-floor"),
            e = a(this).find("img");
            if (h.name == "") {
                f.hide()
            } else {
                if (b.text() != h.tar_floor) {
                    a(this).queue("fx");
                    a(this).fadeOut(0)
                }
                f.show();
                e.attr("src", h.avatar);
                if (h.name == "游客") {
                    c.removeAttr("href")
                } else {
                    c.attr("href", h.ulink)
                }
                c.html(h.name);
                b.html(h.tar_floor)
            }
            g.html(h.content);
            if (b.text() != h.tar_floor) {
                a(this).fadeIn(300)
            } else {
                a(this).fadeToggle(300)
            }
        }
    });
    a.extend({
        stopBubble: function(b) {
            if (b.stopPropagation) {
                b.stopPropagation()
            } else {
                window.event.cancelBubble = true
            }
        },
        tipCtl: function(b) {
            var c = a.extend({
                action: "show",
                msg_text: "咦，发生了什么事？@@",
                tip_mode: "",
                name: String(Math.random() * 10000000000),
                sticky: false,
                closer: false,
                speed: 0,
                theme: "orangejGrowl"
            },
            b);
            switch (c.tip_mode) {
            case "loading":
                c = a.extend(c, {
                    sticky: true
                });
                break;
            case "success":
                c = a.extend(c, {
                    theme: "greenjGrowl"
                });
                break;
            case "fail":
            case "overaction":
                c = a.extend(c, {
                    theme: "redjGrowl"
                });
                break;
            default:
                break
            }
            if (c.action == "show") {
                a.jGrowl(c.msg_text, c)
            } else {
                a.closejGrowl(c.name)
            }
        },
        splitTags: function(d) {
            var c = d.split(/,|，/),
            e = [];
            for (i in c) {
                var b = c[i];
                b = b.replace(/(^\s*)|(\s*$)/g, "");
                b = b.replace(/&/g, "&amp;");
                b = b.replace(/</g, "&lt;");
                b = b.replace(/>/g, "&gt;");
                if (b != "") {
                    e.push(b)
                }
            }
            return e
        },
        init_ubbEditor: function(b) {
            var c = a(".qbeditor");
            if (c.length > 0) {
                c.each(function() {
                    textarea = a(this).find("textarea");
                    textarea.setCaret();
                    var d = a(this).find(".edit_item");
                    a(this).find(".edit_button").each(function() {
                        var e = this;
                        if (a(this).find(".edit_item").length > 0) {
                            a.data(this, "menuHandle", new bindPopupEvent(this, a(this).find(".edit_item")[0], 200, "cc",
                            function(g, f, h) {
                                a.each(d,
                                function(l, m) {
                                    if (m != h) {
                                        a(m).hide()
                                    }
                                });
                                return true
                            }))
                        }
                        a(this).find(".edit_item a, .edit_insert").bind("click",
                        function() {
                            a(e).data("menuHandle").hidePopup()
                        })
                    });
                    a(this).find(".edit_item a, .edit_button, .edit_insert").bind("click",
                    function() {
                        if (a(this).find("input, a").length == 0) {
                            for (var f in a.ubbSets()) {
                                if (a(this).hasClass("edit_" + f) || a(this).parent().parent().hasClass("edit_" + f)) {
                                    var e = a.ubbSets()[f];
                                    if (e.callback) {
                                        e = e.callback(a(this))
                                    }
                                    textarea.insertAtCaret(e);
                                    a(this).parent().find("input[type='text']").val("");
                                    break
                                }
                            }
                        }
                        return false
                    });
                    a(this).find(".edit_button").click(function(f) {
                        a.stopBubble(f)
                    })
                })
            }
        },
        ubbSets: function() {
            return {
                bold: {
                    name: "Bold",
                    openWith: "[b]",
                    closeWith: "[/b]"
                },
                italic: {
                    name: "Italic",
                    openWith: "[i]",
                    closeWith: "[/i]"
                },
                underline: {
                    name: "Underline",
                    openWith: "[u]",
                    closeWith: "[/u]"
                },
                del: {
                    name: "Strike through",
                    openWith: "[del]",
                    closeWith: "[/del]"
                },
                hidden: {
                    name: "Hide",
                    openWith: "[h]",
                    closeWith: "[/h]"
                },
                title: {
                    name: "Title",
                    openWith: "[t]",
                    closeWith: "[/t]"
                },
                color_yellow: {
                    name: "Color Yellow",
                    openWith: "[color=yellow]",
                    closeWith: "[/color]"
                },
                color_orange: {
                    name: "Color Orange",
                    openWith: "[color=orange]",
                    closeWith: "[/color]"
                },
                color_red: {
                    name: "Color Red",
                    openWith: "[color=red]",
                    closeWith: "[/color]"
                },
                color_blue: {
                    name: "Color Blue",
                    openWith: "[color=blue]",
                    closeWith: "[/color]"
                },
                color_green: {
                    name: "Color Green",
                    openWith: "[color=green]",
                    closeWith: "[/color]"
                },
                color_purple: {
                    name: "Color Purple",
                    openWith: "[color=purple]",
                    closeWith: "[/color]"
                },
                color_white: {
                    name: "Color White",
                    openWith: "[color=white]",
                    closeWith: "[/color]"
                },
                color_gray: {
                    name: "Color Gray",
                    openWith: "[color=gray]",
                    closeWith: "[/color]"
                },
                bg_yellow: {
                    name: "Background Yellow",
                    openWith: "[bgcolor=yellow]",
                    closeWith: "[/bgcolor]"
                },
                bg_orange: {
                    name: "Background Orange",
                    openWith: "[bgcolor=orange]",
                    closeWith: "[/bgcolor]"
                },
                bg_red: {
                    name: "Background Red",
                    openWith: "[bgcolor=red]",
                    closeWith: "[/bgcolor]"
                },
                bg_blue: {
                    name: "Background Blue",
                    openWith: "[bgcolor=blue]",
                    closeWith: "[/bgcolor]"
                },
                bg_green: {
                    name: "Background Green",
                    openWith: "[bgcolor=green]",
                    closeWith: "[/bgcolor]"
                },
                bg_purple: {
                    name: "Background Purple",
                    openWith: "[bgcolor=purple]",
                    closeWith: "[/bgcolor]"
                },
                bg_white: {
                    name: "Background White",
                    openWith: "[bgcolor=white]",
                    closeWith: "[/bgcolor]"
                },
                bg_gray: {
                    name: "Background Gray",
                    openWith: "[bgcolor=gray]",
                    closeWith: "[/bgcolor]"
                },
                size10: {
                    name: "Size 10",
                    openWith: "[size=10]",
                    closeWith: "[/size]"
                },
                size12: {
                    name: "Size 12",
                    openWith: "[size=12]",
                    closeWith: "[/size]"
                },
                size14: {
                    name: "Size 14",
                    openWith: "[size=14]",
                    closeWith: "[/size]"
                },
                size16: {
                    name: "Size 16",
                    openWith: "[size=16]",
                    closeWith: "[/size]"
                },
                size20: {
                    name: "Size 20",
                    openWith: "[size=20]",
                    closeWith: "[/size]"
                },
                size24: {
                    name: "Size 24",
                    openWith: "[size=24]",
                    closeWith: "[/size]"
                },
                link: {
                    name: "Insert Link",
                    openWith: "[url]",
                    closeWith: "[/url]",
                    callback: function(d) {
                        var c = d.parent().find("#url-linker").val();
                        var b = "[url]";
                        if (c) {
                            b = "[url=" + c + "]"
                        }
                        return {
                            openWith: b,
                            closeWith: "[/url]"
                        }
                    }
                },
                img: {
                    name: "Insert Picture",
                    openWith: "[img]",
                    closeWith: "[/img]",
                    callback: function(c) {
                        var b = c.parent().find("#img-linker").val();
                        if (b) {
                            return {
                                openWith: "[img]" + b,
                                closeWith: "[/img]",
                                noContent: true
                            }
                        } else {
                            return {
                                openWith: "[img]",
                                closeWith: "[/img]"
                            }
                        }
                    }
                },
                em01: {
                    name: "Smileys 01",
                    openWith: "[sm001]",
                    closeWith: ""
                },
                em02: {
                    name: "Smileys 02",
                    openWith: "[sm002]",
                    closeWith: ""
                },
                em03: {
                    name: "Smileys 03",
                    openWith: "[sm003]",
                    closeWith: ""
                },
                em04: {
                    name: "Smileys 04",
                    openWith: "[sm004]",
                    closeWith: ""
                },
                em05: {
                    name: "Smileys 05",
                    openWith: "[sm005]",
                    closeWith: ""
                },
                em06: {
                    name: "Smileys 06",
                    openWith: "[sm006]",
                    closeWith: ""
                },
                em07: {
                    name: "Smileys 07",
                    openWith: "[sm007]",
                    closeWith: ""
                },
                em08: {
                    name: "Smileys 08",
                    openWith: "[sm008]",
                    closeWith: ""
                },
                em09: {
                    name: "Smileys 09",
                    openWith: "[sm009]",
                    closeWith: ""
                },
                em10: {
                    name: "Smileys 10",
                    openWith: "[sm010]",
                    closeWith: ""
                },
                em11: {
                    name: "Smileys 11",
                    openWith: "[sm011]",
                    closeWith: ""
                },
                em12: {
                    name: "Smileys 12",
                    openWith: "[sm012]",
                    closeWith: ""
                },
                em13: {
                    name: "Smileys 13",
                    openWith: "[sm013]",
                    closeWith: ""
                },
                em14: {
                    name: "Smileys 14",
                    openWith: "[sm014]",
                    closeWith: ""
                },
                quote: {
                    name: "Quote",
                    openWith: "[quote]",
                    closeWith: "[/quote]"
                },
                code: {
                    name: "Code",
                    openWith: "[code]",
                    closeWith: "[/code]"
                },
                align_left: {
                    name: "Align Left",
                    openWith: "[align=left]",
                    closeWith: "[/align]"
                },
                align_center: {
                    name: "Align Center",
                    openWith: "[align=center]",
                    closeWith: "[/align]"
                },
                align_right: {
                    name: "Align right",
                    openWith: "[align=right]",
                    closeWith: "[/align]"
                },
                indent_left: {
                    name: "LeftIndent",
                    openWith: "[indent=left]",
                    closeWith: "[/leftindent]"
                },
                indent_right: {
                    name: "LeftIndent",
                    openWith: "[indent=right]",
                    closeWith: "[/leftindent]"
                }
            }
        },
        createSlideshow: function(c) {
            var f = null,
            e = a.extend({
                ttype: "mouseover",
                triggers: null,
                shows: null,
                current_class: ".current",
                trigger_id_pattern: "trigger-pattern-",
                show_id_pattern: "show-pattern-"
            },
            c);
            a(e.triggers).each(function(g, h) {
                if (a(h).hasClass(e.current_class)) {
                    f = a(h).attr("id").match(e.trigger_id_pattern + "(.*)").pop()
                }
            });
            var b = a("#" + e.show_id_pattern + f),
            d = a("#" + e.trigger_id_pattern + f);
            a(e.triggers).bind(e.ttype,
            function() {
                var h = a(this).attr("id").match(e.trigger_id_pattern + "(.*)").pop(),
                g = a("#" + e.show_id_pattern + h);
                b.hide();
                d.removeClass(e.current_class);
                a(this).addClass(e.current_class);
                g.show();
                b = g;
                d = a(this);
                return false
            })
        }
    })
})($);
if (Global.action == "index") { (function(a) {
        new a.createSlideshow({
            triggers: "#bangumi-wrap .bangumi-trigger",
            shows: "#bangumi-wrap .bangumi-detail",
            current_class: "current-bgm",
            trigger_id_pattern: "bangumi-trigger-",
            show_id_pattern: "bangumi-detail-"
        });
        new a.createSlideshow({
            ttype: "click",
            triggers: "#tag-forum-label li",
            shows: "#tag-forum .forum-list-wrap",
            current_class: "current-tag-forum-label",
            trigger_id_pattern: "forumtrigger-",
            show_id_pattern: "forumlist-"
        })
    })($)
} else {
    if (Global.action == "search") { (function(a) {
            new bindPopupEvent("#adv-search-trigger", "#adv-search-opt", 200, "cc");
            a("#adv-search-opt-finish-btn").click(function() {
                a("#adv-search-form").submit();
                return false
            })
        })($)
    } else {
        if (Global.action == "article") { (function($) {
                var AJAX_fav = new ajax_req("fav", {
                    loading: "正在加入收藏...",
                    success: "编辑收藏成功!",
                    fail: "编辑收藏失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题"
                },
                "article"),
                AJAX_favstat = new ajax_req("favstat", {
                    loading: "正在读取收藏数据...",
                    fail: "获取收藏信息失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题"
                },
                "article"),
                AJAX_rate = new ajax_req("rate", {
                    loading: "正在进行评分...",
                    success: "评分完成~",
                    fail: "评分失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题",
                    RATED: {
                        text: "您已经评过分了",
                        mode: "fail"
                    }
                },
                "article");
                AJAX_tags = new ajax_req("tagopt", {
                    loading: "正在编辑标签...",
                    success: "编辑标签成功",
                    fail: "编辑标签失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题",
                    LIMIT: {
                        text: "文章已达到最大标签数，无法继续添加",
                        mode: "fail"
                    },
                    COOLDOWN: {
                        text: "不可以连续修改他人文章的标签呢@@",
                        mode: "fail"
                    }
                },
                "article"),
                AJAX_forumadmin = new ajax_req("tagforumopt", {
                    loading: "正在编辑属性...",
                    success: "属性编辑成功...",
                    fail: "不知怎么的修改失败了orz"
                },
                "article");
                AJAX_articleban = new ajax_req("articleban", {
                    loading: "正在联系河蟹...",
                    fail: "不知怎么的抵抗了orz",
                    HEXIED: {
                        text: "已和谐v(9 9)v",
                        mode: "success"
                    },
                    FANHEXIED: {
                        text: "已驱逐河蟹..(( v(9 9)v",
                        mode: "success"
                    }
                },
                "article");
                var gp_f = "#globalpop_fav",
                $gp_f = $(gp_f),
                gp_t = "#globalpop_tagedit",
                $gp_t = $(gp_t),
                gp_fa = "#globalpop_forumadmin",
                $gp_fa = $(gp_fa);
                var postid = $("#post-header .post-title a").attr("href").substr(1),
                postauthor = $("#post-author").text(),
                currentuser = $("#breadcrumbs a").text().split(" ")[1];
                if ($gp_fa.length > 0) {
                    $gp_fa.initPopup("#trigger_forumadmin");
                    $gp_fa.find("label").mouseup(function(e) {
                        if (e.which != 1) {
                            return false
                        }
                        var $i = $(this).find("input"),
                        action = $i.attr("id").split("_")[2],
                        tag = $i.attr("name"),
                        aid = $i.attr("id").split("_")[1];
                        if (action == "hexie" || action == "fanhexie") {
                            var act = action == "hexie" ? "ban": "unban";
                            AJAX_articleban.req("action=" + act + "&id=" + aid,
                            function() {},
                            function(data) {
                                if (data.result == "OK") {
                                    $i.attr("id", "forumadmin_" + aid + (act == "ban" ? "_fanhexie": "_hexie"));
                                    $i.attr("checked", act == "ban" ? true: false);
                                    return act == "ban" ? "HEXIED": "FANHEXIED"
                                } else {
                                    if (data.result) {
                                        return data.result
                                    } else {
                                        return false
                                    }
                                }
                            });
                            return
                        }
                        var $paContainer = $(this).parent(),
                        checkbox_top = $paContainer.find("#forumadmin_" + aid + "_top"),
                        checkbox_recommend = $paContainer.find("#forumadmin_" + aid + "_recommend"),
                        radio_add = $paContainer.find("#forumadmin_" + aid + "_add"),
                        radio_reset = $paContainer.find("#forumadmin_" + aid + "_reset"),
                        radio_ban = $paContainer.find("#forumadmin_" + aid + "_ban");
                        if ($i.attr("checked") == true) {
                            action = "un" + action
                        }
                        if ($i.attr("type") == "radio" && $i.attr("checked") == true) {
                            return false
                        }
                        AJAX_forumadmin.req("action=" + action + "&id=" + aid + "&tag=" + tag.replace("#", "%23"),
                        function() {},
                        function(data) {
                            if (data.result == "OK") {
                                switch (action) {
                                case "top":
                                case "recommend":
                                    radio_ban.attr("checked", "");
                                    radio_reset.attr("checked", "");
                                    radio_add.attr("checked", "checked");
                                    break;
                                case "ban":
                                case "reset":
                                    checkbox_top.attr("checked", "");
                                    checkbox_recommend.attr("checked", "");
                                    break
                                }
                                return "success"
                            } else {
                                if (data.result) {
                                    return data.result
                                } else {
                                    return false
                                }
                            }
                        })
                    })
                }
                if ($gp_t.length > 0) {
                    $("#globalpop_tagedit").initPopup("#trigger_tagedit", {
                        afterCallback: function($P) {
                            $P.find("#dialog-tag-insert").focus()
                        }
                    });
                    $gp_t.find("#tagedit_add").click(function() {
                        var M = this,
                        $M = $(this),
                        $tar = $gp_t.find("#dialog-tag-insert");
                        if ($tar.val().indexOf("\\") != -1 || $tar.val().indexOf('"') != -1) {
                            $gp_t.find(".error-msg").css("visibility", "visible").html("标签中不能包含引号和斜杠哦");
                            return false
                        }
                        AJAX_tags.req("id=" + postid + "&action=add&tag=" + $tar.val().replace("#", "%23"),
                        function() {},
                        function(data) {
                            if (data.result == "OK") {
                                if (postauthor == currentuser) {
                                    $gp_t.find("#edittag_tags ul").append('<li><a href="deltag_' + $tar.val() + '"></a>*' + $tar.val() + "</li>");
                                    if ($tar.val().substr(0, 1) == "#") {
                                        $("#post-header .post-tags").append('<a href="search?tags=' + $tar.val() + '" class="tag-from-forum">[' + $tar.val() + "]</a>")
                                    } else {
                                        $("#post-header .post-tags").append('<a href="search?tags=' + $tar.val() + '" class="tag-from-owner">*' + $tar.val() + "</a>")
                                    }
                                } else {
                                    $gp_t.find("#edittag_tags ul").append('<li><a href="deltag_' + $tar.val() + '"></a>' + $tar.val() + "</li>");
                                    $("#post-header .post-tags").append('<a href="search?tags=' + $tar.val() + '" class="tag-from-user">' + $tar.val() + "</a>")
                                }
                                $("#edittag_deledtags ul li a").each(function(index, elem) {
                                    if ($tar.val() == $(elem).attr("href").split("recovtag_").pop()) {
                                        $(elem).parent().remove()
                                    }
                                });
                                $tar.val("");
                                return "success"
                            } else {
                                if (data.result) {
                                    return data.result
                                } else {
                                    return false
                                }
                            }
                        });
                        return false
                    });
                    $gp_t.find("#dialog-tag-insert").bind("keyup",
                    function(e) {
                        if (e.keyCode == 13 && $(this).val() != "") {
                            $gp_t.find("#tagedit_add").click()
                        }
                    });
                    $gp_t.find("#edittag_switch").click(function() {
                        $gp_t.find("#edittag_tags").toggle();
                        $gp_t.find("#edittag_deledtags").toggle();
                        if ($gp_t.find("#edittag_tags").is(":visible")) {
                            $(this).html("查看所有被删除的标签 &raquo;")
                        } else {
                            $(this).html("查看文章标签 &raquo;")
                        }
                        return false
                    });
                    $gp_t.find(".post-tags-edit").delegate("a", "click",
                    function() {
                        var hrefValue = $(this).attr("href"),
                        type = hrefValue.split("_").shift(),
                        tarTag = hrefValue.split(type + "_").pop();
                        method = type == "addtag" ? "add": (type == "deltag" ? "del": "reborn");
                        var M = this,
                        $M = $(this);
                        var tagtype = $(this).attr("tagtype");
                        if (tagtype == "event") {
                            if (method == "add") {
                                if (!confirm("您真的要将这篇文章添加进活动论坛「" + decodeURIComponent($(this).attr("tn")) + "」么？")) {
                                    return false
                                }
                            }
                        }
                        AJAX_tags.req("id=" + postid + "&action=" + method + "&tag=" + tarTag.replace("#", "%23"),
                        function() {},
                        function(data) {
                            if (data.result == "OK") {
                                $M.parent().remove();
                                if (type == "deltag") {
                                    $("#edittag_deledtags ul").append('<li><a href="recovtag_' + tarTag + '"></a>' + tarTag + "</li>")
                                } else {
                                    tarTag = decodeURIComponent(tarTag);
                                    tarTags = tarTag.split(",");
                                    for (var i = 0; i < tarTags.length; i++) {
                                        $("#edittag_tags ul").append('<li><a href="deltag_' + tarTags[i] + '"></a> *' + tarTags[i] + "</li>")
                                    }
                                }
                                $(".post-tags").find("a").each(function(index, elem) {
                                    if ($(elem).attr("href").split("=").pop() == tarTag) {
                                        $(elem).remove()
                                    }
                                });
                                $("#post-header .post-tags").find("a").each(function(index, elem) {
                                    var t = $(elem).text().match(/^\[(#.*)\]$/);
                                    if (t != null && encodeURI(t.pop()).replace("#", "%23") == tarTag) {
                                        $(elem).remove()
                                    }
                                });
                                return "success"
                            } else {
                                if (data.result) {
                                    return data.result
                                } else {
                                    return false
                                }
                            }
                        });
                        return false
                    })
                }
                $("#trigger_fav").click(function() {
                    AJAX_favstat.req("id=" + $(this).attr("href").split("actfav_").pop(),
                    function() {},
                    function(data) {
                        if (data == "") {
                            return false
                        } else {
                            if (data.desc) {
                                $gp_f.find("#favlayer_desc").html(data.desc)
                            } else {
                                var desc_elem = $gp_f.find("#favlayer_desc").html("").attr("disabled", true);
                                $gp_f.find("#favlayer_desc").blur();
                                $gp_f.find(".need-dl-notyet").unbind("click").click(function() {
                                    if ($(this).find("input[type='checkbox']").attr("checked") == true) {
                                        desc_elem.attr("disabled", false).setPlaceholder("在这里添加一些下载备注吧~")
                                    } else {
                                        desc_elem.attr("disabled", true).setPlaceholder('只有勾选了"想下载这些资源"之后才能添加下载备注喔w')
                                    }
                                })
                            }
                            if (data.dlist == 1) {
                                $gp_f.find(".need-dl-notyet").hide();
                                if ((tmp = $gp_f.find(".need-dl-already").show()).find("input").length == 0) {
                                    tmp.append('<input type="hidden" name="down" value="1">')
                                }
                            } else {
                                $gp_f.find(".need-dl-notyet input").attr("checked", false)
                            }
                            if (data.fav == 1) {
                                $gp_f.find(".need-watch-notyet").hide();
                                $gp_f.find(".need-watch-already").show();
                                $gp_f.find("#favlayer_desc").attr("readonly", false)
                            } else {
                                $gp_f.find(".need-watch-notyet input").attr("checked", false)
                            }
                            $gp_f.data("pop_setting").show()
                        }
                        return "nomessage"
                    });
                    return false
                });
                if ($gp_f.length > 0) {
                    $gp_f.find(".fav-btn").click(function() {
                        AJAX_fav.req($("#form_fav").serialize(),
                        function() {},
                        function(data) {
                            if (data.result == "OK") {
                                $gp_f.data("pop_setting").hide();
                                $gp_f.find(".need-watch-already, .need-dl-already").each(function(index, elem) {
                                    if ($(elem).is(":visible") == true) {
                                        return "success"
                                    }
                                });
                                $("#post-header .stats-value p:eq(2)").elemNum(1);
                                return "success"
                            } else {
                                return false
                            }
                        });
                        return false
                    });
                    $("#globalpop_fav").initPopup()
                }
                $("#trigger_rateplus, #trigger_rateminus").click(function() {
                    var value = $(this).attr("href").split("_");
                    var id = value.pop(),
                    rate = value.pop() == "add" ? 1: -1;
                    AJAX_rate.req({
                        rate: rate,
                        id: id
                    },
                    function() {},
                    function(data) {
                        if (data.result == "OK") {
                            $("#post-header .stats-value p:eq(1)").elemNum(rate);
                            $("#post-header .stats-desc p:eq(1)").html("你" + (rate > 0 ? "加": "减") + "了一分");
                            return "success"
                        } else {
                            if (data.result) {
                                return data.result
                            } else {
                                return false
                            }
                        }
                    });
                    return false
                });
                $(".page-nav-wrap .btn").click(function() {
                    var M = this,
                    $M = $(this);
                    $("#say-action").val("对楼主吐槽说");
                    $("#reply").focus();
                    return false
                });
                $(".one-cmmt .replyto").click(function() {
                    var meta = $(this).parents(".cmmt-meta");
                    var replyer = meta.find(".replyer_name").text(),
                    floor = meta.find(".cmmt-num a").text().split("#")[1];
                    var author = $("#post-header .post-meta a").text(),
                    user = $("#reply-wrap em").text();
                    $("#say-action").val("对" + floor + "楼的" + (replyer == user ? "自己": (replyer == author ? "楼主": replyer)) + "吐槽说");
                    $("#reply").focus();
                    return false
                });
                var AJAX_deletereply = new ajax_req("deletereply", {
                    loading: "正在删除回复...",
                    success: "删除回复成功!",
                    fail: "删除回复失败@@"
                },
                "article");
                $(".delreply a").click(function() {
                    $(this).parent().parent().find(".cf_delreply").show();
                    $(this).parent().hide();
                    return false
                });
                $(".cf_delreply a").click(function() {
                    var $M = $(this);
                    if ($(this).attr("href") == "cancel") {
                        $(this).parent().parent().find(".delreply").show();
                        $(this).parent().hide()
                    } else {
                        var rid = $(this).attr("href").split("_")[1];
                        AJAX_deletereply.req("replyid=" + rid,
                        function() {},
                        function(data) {
                            if (data.result == "OK") {
                                var $thiscmmt = $M.parents(".one-cmmt").fadeOut(100);
                                return "success"
                            } else {
                                if (data.result) {
                                    return data.result
                                } else {
                                    return false
                                }
                            }
                        })
                    }
                    return false
                });
                var AJAX_getrep = new ajax_req("getreplys", {
                    loading: "正在获取回复内容...",
                    fail: "获取回复内容失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题"
                },
                "article");
                var reply_numbers = [],
                rtar_numbers = [],
                rtar_obj = null;
                $(".cmmt-meta .cmmt-num a").each(function(index, elem) {
                    reply_numbers.push($(elem).text().substr(1))
                });
                $(".cmmt-meta .verb").each(function(index, elem) {
                    var m_text = $(elem).text(),
                    m_result = m_text.match(/\d+楼/g);
                    if (m_result != null) {
                        $(elem).html(m_text.replace(/(\d+楼)/g, ' <a class="cmmt-tar" href="#show_quote">$1</a> '));
                        for (var t in m_result) {
                            var tn = Number(m_result[t].toString().match(/\d+/)[0]);
                            if ($.inArray(tn, rtar_numbers) == -1) {
                                rtar_numbers.push(tn)
                            }
                        }
                    }
                });
                $(".cmmt-meta .verb a").click(function() {
                    var $M = $(this),
                    tar_nm = $(this).text().match(/\d{1,}/)[0],
                    c = $.inArray(tar_nm, reply_numbers),
                    $tar_info = $(this).parents(".one-cmmt").find(".cmmt-target-info"),
                    o = {};
                    if (c != -1) {
                        var $tar_cmmt = $($(".one-cmmt")[c]),
                        $tar_cmmt_user = $tar_cmmt.find(".replyer_name");
                        o = $.extend({
                            ulink: $tar_cmmt_user.attr("href"),
                            name: $tar_cmmt_user.text(),
                            avatar: $tar_cmmt.find(".cmmter img").attr("src"),
                            content: $tar_cmmt.find(".cmmt-content").html(),
                            tar_floor: tar_nm
                        },
                        o)
                    } else {
                        if (rtar_obj == null) {
                            AJAX_getrep.req("id=" + postid + "&floor=" + rtar_numbers.toString(),
                            function() {},
                            function(data) {
                                if (data.result == "OK") {
                                    rtar_obj = data.replys;
                                    if (typeof rtar_obj[tar_nm] != "undefined") {
                                        o = $.extend({
                                            ulink: "@" + rtar_obj[tar_nm].userid,
                                            name: rtar_obj[tar_nm].username,
                                            avatar: rtar_obj[tar_nm].headimg_url,
                                            content: rtar_obj[tar_nm].html,
                                            tar_floor: tar_nm
                                        },
                                        o);
                                        $tar_info.quoteCtl(o)
                                    } else {
                                        $M.wrap("<del />");
                                        $tar_info.quoteCtl()
                                    }
                                    return "nomessage"
                                } else {
                                    if (data.result) {
                                        return data.result
                                    } else {
                                        return false
                                    }
                                }
                            });
                            return false
                        } else {
                            if (typeof rtar_obj[tar_nm] != "undefined") {
                                o = $.extend({
                                    ulink: "@" + rtar_obj[tar_nm].userid,
                                    name: rtar_obj[tar_nm].username,
                                    avatar: rtar_obj[tar_nm].headimg_url,
                                    content: rtar_obj[tar_nm].html,
                                    tar_floor: tar_nm
                                },
                                o)
                            }
                        }
                    }
                    $tar_info.quoteCtl(o);
                    return false
                });
                var AJAX_reloadvimg = new ajax_req("vimg", {
                    loading: "正在获取新的验证码...",
                    fail: "获取新的验证码失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题"
                },
                "article");
                $("#reply-form .reply-vccode img,#reply-form .reply-vccode a").click(function() {
                    AJAX_reloadvimg.req("dataurl",
                    function() {},
                    function(data) {
                        if (data.key) {
                            $("#vcode").val(data.key);
                            $("#reply-form .reply-vccode img").attr("src", data.image);
                            return "nomessage"
                        } else {
                            return false
                        }
                    })
                });
                $(".reply-vccode input").bind("keyup",
                function() {
                    var tar_val = $(this).val();
                    var arr = ["零|o|O", "一|壹|l", "贰|二", "叁|三", "四", "五", "六", "七|柒", "八|叭|捌", "久|九|⑨"];
                    for (var i in arr) {
                        tar_val = tar_val.replace(eval("/[" + arr[i] + "]/g"), i)
                    }
                    $(this).val(tar_val)
                })
            })($)
        } else {
            if (Global.action == "post") { (function(b) {
                    b("#post_addtags").click(function() {
                        var d = b("#post-tag").val();
                        b.each(b.splitTags(d),
                        function(e, f) {
                            b("#post-taglist ul").append("<li><a href='deltag'></a> " + f + "<input type='hidden' name='tagx[]' value='" + f + "' /></li>")
                        });
                        b("#post-tag").val("")
                    });
                    if (b("#post-tag").val() != "") {
                        b("#post_addtags").click()
                    }
                    b("#post-taglist").delegate("a", "click",
                    function() {
                        b(this).parent().remove();
                        return false
                    });
                    b("#post-tag").keydown(function(d) {
                        if (d.keyCode == "13") {
                            b("#post_addtags").click();
                            return false
                        }
                    });
                    b("#write-title").keydown(function(d) {
                        if (d.keyCode == "13") {
                            if (b(this).val() == "") {
                                b("#errormsg-title").html("标题一定要写喔w").show()
                            }
                            return false
                        }
                    });
                    b("#postarticleform").submit(function(d) {
                        if (b("#write-title").val() == "") {
                            b("#errormsg-title").html("标题一定要写喔w").show();
                            return false
                        }
                        if (b("#write-content").val() == "") {
                            b("#errormsg-content").html("内容不能不填喔w").show();
                            return false
                        }
                    });
                    var c = b("#post_del"),
                    a = b("#post_del_confirm");
                    c.click(function() {
                        b(this).hide();
                        a.show()
                    });
                    a.find("a:eq(1)").click(function() {
                        b(this).parent().hide();
                        c.show();
                        return false
                    })
                })($)
            } else {
                if (Global.action == "discutter") {
                    if (Global.mainpart == "article" || Global.mainpart == "fotimeline") { (function(b) {
                            var a = new ajax_req("follow", {
                                loading: "正在读取用户信息...",
                                fail: "加入关注失败 <br />请重新尝试或去反馈版反应您所遇到的问题",
                                added: {
                                    text: "已加入关注列表！",
                                    mode: "success"
                                },
                                removed: {
                                    text: "已从关注列表移除",
                                    mode: "success"
                                }
                            },
                            "discutter_article");
                            b(".follow-btn").fobtn_init({
                                ajaxreq: a
                            })
                        })($)
                    }
                    if (Global.mainpart == "article") { (function(a) {
                            var b = new ajax_req("articleopt", {
                                loading: "正在置顶文章...",
                                fail: "置顶文章失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题",
                                topped: {
                                    text: "置顶完成w",
                                    mode: "success"
                                },
                                untopped: {
                                    text: "取消置顶完成",
                                    mode: "success"
                                }
                            },
                            "discutter_article");
                            a(".discutter-entry .entry-edit-atop").click(function() {
                                var d = a(this),
                                c = d.attr("href").split("_"),
                                f = c[0] == "#atop" ? 1: 0,
                                e = a("#discutter-entry-" + c[1]);
                                b.req("id=" + c[1] + "&action=top&value=" + f,
                                function() {},
                                function(g) {
                                    if (g.result == "OK") {
                                        if (f) {
                                            d.attr("href", "#auntop_" + c[1]).html("取消置顶");
                                            e.find(".entry-status").append('<div class="es-sticky"></div>');
                                            return "topped"
                                        } else {
                                            d.attr("href", "#atop_" + c[1]).html("置顶");
                                            e.find(".es-sticky").remove();
                                            return "untopped"
                                        }
                                    } else {
                                        return false
                                    }
                                });
                                return false
                            });
                            a(".entry-edit").each(function(d, e) {
                                var c = a(this).find(".entry-edit-cast-btn-anchor");
                                var f = a(this).find(".entry-edit-popup");
                                c.click(function() {
                                    return false
                                });
                                new bindPopupEvent(c, f, 200, "mm")
                            })
                        })($)
                    } else {
                        if (Global.mainpart == "favfeed") { (function(b) {
                                var a = new ajax_req("fav", {
                                    loading: "正在编辑收藏信息...",
                                    success: "编辑收藏成功w",
                                    added: {
                                        text: "已加入关注列表！",
                                        mode: "success"
                                    },
                                    removed: {
                                        text: "已从关注列表移除",
                                        mode: "success"
                                    }
                                },
                                "favfeed");
                                b(".entry-status .follow-btn").fobtn_init({
                                    ajaxreq: a
                                })
                            })($)
                        } else {
                            if (Global.mainpart == "dlist") { (function(b) {
                                    var a = new ajax_req("fav", {
                                        loading: "正在编辑下载列表...",
                                        success: "编辑下载列表成功w",
                                        fail: "编辑下载列表失败@@ <br />请重新尝试或去反馈版反应您所遇到的问题"
                                    },
                                    "dlist");
                                    var c = {
                                        undone: '<span class="first-child">已下载完成?</span><span class="last-child">尚未下载完成</span>',
                                        done: '<span class="first-child">其实还没下载完?</span><span class="last-child">已下载完成</span>'
                                    };
                                    b("#discutter-content-wrap .entry-dl a").click(function() {
                                        var l = this,
                                        e = b(this);
                                        if (!e.hasClass("dlact")) {
                                            return
                                        }
                                        var h = e.attr("href"),
                                        n = h.split("_").shift(),
                                        g = h.split("_").pop(),
                                        o,
                                        d,
                                        m,
                                        f;
                                        switch (n) {
                                        case "complete":
                                            o = "docomplete";
                                            d = "dl-done";
                                            m = "notcomplete";
                                            toHTML = c.done;
                                            break;
                                        case "notcomplete":
                                            o = "dowait";
                                            d = "dl-undone";
                                            m = "complete";
                                            toHTML = c.undone;
                                            break;
                                        case "discard":
                                            o = "dodiscard";
                                            break
                                        }
                                        if (n == "complete") {
                                            o = "docomplete";
                                            classname = "dl-done"
                                        } else {
                                            if (n == "discard") {
                                                o = "dodiscard";
                                                classname = "dl-discard"
                                            } else {
                                                if (n == "notcomplete") {
                                                    o = "dowait";
                                                    classname = "dl-undone"
                                                }
                                            }
                                        }
                                        a.req("method=" + o + "&id=" + g,
                                        function() {},
                                        function(p) {
                                            if (p.result == "OK") {
                                                if (n != "discard") {
                                                    e.attr("class", "dlact " + d).attr("href", m + "_" + g).html(toHTML)
                                                } else {
                                                    e.parent().parent().fadeOut(100)
                                                }
                                                return "success"
                                            } else {
                                                if (p.result) {
                                                    return p.result
                                                } else {
                                                    return false
                                                }
                                            }
                                        });
                                        return false
                                    })
                                })($)
                            }
                        }
                    } (function(c) {
                        if (c("#search-wrap input[name='userid']").length > 0) {
                            var a = c("#search-dis-user"),
                            d = c("search-dis-all"),
                            b = c("#search-form");
                            b.submit(function() {
                                if (a.attr("checked") == true && Global.mainpart == "dlist") {
                                    b.attr("action", "d@" + a.attr("name", "").attr("value"));
                                    c("#search").attr("name", "filter")
                                }
                                if (d.attr("checked") == true) {
                                    a.attr("name", "user")
                                }
                            })
                        }
                    })($)
                } else {
                    if (Global.action == "dashboard" && Global.mainpart == "myinfo") { (function(a) {
                            a("#myinfo-addtag").click(function() {
                                var b = a("#myinfo-tags").val();
                                a.each(a.splitTags(b),
                                function(c, d) {
                                    a("#myinfo-taglist ul").append("<li><a href='deltag'></a> " + d + "<input type='hidden' name='tagx[]' value='" + d + "' /></li>")
                                });
                                a("#myinfo-tags").val("")
                            });
                            if (a("#myinfo-tags").val() != "") {
                                a("#myinfo-addtag").click()
                            }
                            a("#myinfo-taglist").delegate("a", "click",
                            function() {
                                a(this).parent().remove();
                                return false
                            });
                            a("#myinfo-tags").keydown(function(b) {
                                if (b.keyCode == "13") {
                                    a("#myinfo-addtag").click();
                                    return false
                                }
                            })
                        })($)
                    } else {
                        if (Global.action == "sysmsg") {
                            var $init_entry = $("#message-list-wrap").find(".announce-entry").eq(0),
                            current_id = $init_entry.attr("id").substr(14);
                            $init_entry.find(".current-msg").show();
                            $("#announce-content-wrap").find(".message-content").eq(0).show();
                            $(".announce-entry").click(function() {
                                var c = $(this),
                                b = c.attr("id").split("-").pop(),
                                a = $("#announce-content-wrap").find("#announcecontent-" + b);
                                if (current_id != b) {
                                    $("#announcecontent-" + current_id).hide(100);
                                    $("#announcetitle-" + current_id).find(".current-msg").hide();
                                    $("#announcetitle-" + b).find(".current-msg").show();
                                    a.show(100);
                                    current_id = b
                                }
                                return false
                            })
                        }
                    }
                }
            }
        }
    }
} (function(e) {
    var a = e("#sys-dialog-trigger"),
    b = e("#sys-dialog"),
    d = b.find(".sys-dialog-title a"),
    f = null;
    if (b.length > 0) {
        d.click(function() {
            b.hide(200);
            a.show();
            return false
        });
        a.click(function() {
            b.show(200);
            a.hide();
            f = e(window).bind("click",
            function() {
                d.click();
                f = null
            });
            e.cookie("anid", e("#sys-dialog").attr("class").substr(5), {
                expires: 365
            });
            return false
        })
    }
    e(".btn_jumpto").click(function() {
        var g = e(this).parent().parent();
        if (g.attr("tagName") == "FORM") {
            g.submit()
        }
    });
    // e(".avatar img").bind("error",
    // function() {
    //     e(this).attr("src", "http://cdn13.mukkyu.com/upload/headimgs/default_m.gif")
    // });
    e(".avoidclick").click(function() {
        return false
    });
    e.init_ubbEditor();
    var c = document.createElement("input");
    if (!c.hasOwnProperty || !c.hasOwnProperty("placeholder")) {
        e("[placeholder]").focus(function() {
            var g = e(this);
            if (g.val() == g.attr("placeholder")) {
                g.val("");
                g.removeClass("placeholder")
            }
        }).blur(function() {
            var g = e(this);
            if (g.val() == "" || g.val() == g.attr("placeholder")) {
                g.addClass("placeholder");
                g.val(g.attr("placeholder"))
            }
        }).blur();
        e("[placeholder]").parents("form").submit(function() {
            e(this).find("[placeholder]").each(function() {
                var g = e(this);
                if (g.val() == g.attr("placeholder")) {
                    g.val("")
                }
            })
        })
    }
})($);
function addEventTag(b) {
    var a = decodeURIComponent(b.href.split("addtag_").pop());
    $.each($.splitTags(a),
    function(c, d) {
        $("#post-taglist ul").append("<li><a href='deltag'></a> " + d + "<input type='hidden' name='tagx[]' value='" + d + "' /></li>")
    });
    return false
};