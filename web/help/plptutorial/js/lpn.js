/**
 * @fileOverview
 * Embedded SWISH
 *
 * @version 0.2.0
 * @author Giuseppe Cota, giuseppe.cota@unife.it (based on the code written by Jan Wielemaker, J.Wielemaker@vu.nl)
 * @requires jquery
 */

(function ($) {
    var pluginName = 'PLPT';
    var currentSWISHElem = null;

    var SWISH = "http://cplint.lamping.unife.it/";

    /** @lends $.fn.PLPT */
    var methods = {
        _init: function (options) {
            var currentSource = null;

            return this.each(function () {
                var elem = $(this);
                var data = {};			/* private data */

                data.swishURL = options.swish || SWISH;

                function appendRunButtonTo(obj) {
                    obj.append("<i class='run-button fa fa-play-circle-o'></i>")
                        .on("click", ".run-button", function () {
                            toggleSWISH(elem);
                        });

                    return obj;
                }

                if (elem.hasClass("query")) {
                    var program = elem.prevAll().prev("div.program:first");//.find("code");
                    var t = program.length;
                    if (program.length == 0) {
                        var currElem = elem;
                        var section = currElem.closest("section").prev();
                        while (program.length == 0 && section) {
                            program = section.find("div.program:last")
                            section = section.prev();
                        }
                    }
                    // **
                    if (program.data("code")) {
                        data.source = $.trim(program.data("code"));
                    } else {
                        data.source = $.trim(program.text());
                    }
                    data.queries = [makeQuery(elem.text())];
                    elem.wrap("<div class='query'></div>");
                    appendRunButtonTo(elem.parent());
                } 
                elem.data(pluginName, data);	/* store with element */
            });
        }
    }; // methods

    // <private functions>

    function toggleSWISH(elem) {
        function attr(name, value) {
            content.push(" ", name, '="', value, '"');
        }

        var data = elem.data(pluginName);


        if (data.swish) {
            var swish = data.swish;

            delete data.swish;
            var runButton = currentSWISHElem.parent().find(".run-button");
            currentSWISHElem = null;
            swish.hide(400, function () {
                swish.remove();
            });
            elem.show(400, function () {
                elem.parent().removeClass("swish");
            });
            elem.parent()
                .resizable('destroy')
                .css("height", "auto");
            runButton.removeClass("fa-times-circle-o");
            runButton.addClass("fa-play-circle-o");

        } else
        {
            var query = data.swishURL;
            var content = ["<iframe "];
            var q = "?";

            if (currentSWISHElem)
                toggleSWISH(currentSWISHElem);

            if (data.source) {
                query += q + "code=" + encodeURIComponent(data.source);
                q = "&";
            }
            if (data.queries && data.queries.length > 0) {
                query += q + "examples=" + encodeURIComponent(data.queries.join(""));
                q = "&";
            }

            attr("class", "swish");
            attr("src", query);
            attr("width", "94%");
            attr("height", "100%");

            content.push("></iframe>");

            data.swish = $(content.join(""))
                .hide()
                .insertAfter(elem);
            elem.parent()
                .css("height", "500px")
                .resizable({handles: 's'});
            elem.hide(400);
            var runButton = elem.parent().find(".run-button");
            runButton.removeClass("fa-play-circle-o");
            runButton.addClass("fa-times-circle-o");
            data.swish.show(400, function () {
                elem.parent().addClass("swish");
            });

            currentSWISHElem = elem;
        }
    }

    /**
     * @returns {String} Query text, which starts with ?- and ends in .\n
     */
    function makeQuery(text) {
        text = text.trim().replace(/\s\s+/g, " ");
        if (!/^\?-/.test(text))
            text = "?- " + text;
        if (!/\.$/.test(text))
            text = text + ".";

        return text + "\n";
    }

    /**
     * <Class description>
     *
     * @class PLPT
     * @tutorial jquery-doc
     * @memberOf $.fn
     * @param {String|Object} [method] Either a method name or the jQuery
     * plugin initialization object.
     * @param [...] Zero or more arguments passed to the jQuery `method`
     */

    $.fn.PLPT = function (method) {
        if (methods[method]) {
            return methods[method]
                .apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods._init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery. ' + pluginName);
        }
    };
}(jQuery));
