//$(function () {
//    // cite the references
//    $("span.ref").each(function () {
//        var reference = $(this).data("cite");
//        reference = "#" + reference;
//        var index = $(reference).index() + 1;
//        $(this).text("[" + index + "]");
//        $(this).click(function () {
//            window.location = reference;
//        });
//    });
//    // set the section number (works only for h2)
//    $("a.section-ref").each(
//        function () {
//            var href = $(this).attr("href");
//            var counter = countH2(href);
//            $(this).text("Section " + counter);
//        }
//    );
//}
//
//);

$(function () {
    // cite the references
    $("span.ref").each(function () {
        var references = $(this).data("cite").split(",");
        var txt = "[";
        for (i = 0; i < references.length; i++) {
            var ref = "#" + references[i];
            var index = $(ref).index() + 1;
            if (i > 0) {
                txt += ", ";
            }
            txt += "<a " +
                "href='" + ref + "'>" + index + "</a>"
//            txt += "<a style='text-decoration: none;color: inherit;font-weight: inherit' " +
//                "href='" + ref + "'>" + index + "</a>"
        }
//        references.forEach(function(ref){
//            ref = "#" + ref;
//            var index = $(ref).index() + 1;
//            txt = txt + "<a style='text-decoration: none;color: inherit;font-weight: inherit' "+
//                "href='" + ref + "'>"+index+"</a>"
//        });
        txt = txt + "]";
        $(this).append(txt);
    });
    // set the section number (works only for h2)
    $("a.section-ref").each(
        function () {
            var href = $(this).attr("href");
            var counter = countH2(href);
            if ($(this).text().length > 0)
                $(this).text($(this).text() + " " + counter);
            else
                $(this).text("Section " + counter);
        }
    );

    $("a.section-ref-name").each(
        function () {
            var href = $(this).attr("href");
            var title = getTextH2(href);
            $(this).text(title);
        }
    );
}

);

function getTextH2(href) {
    var title = "Nan";
    $("section h2:not(.nocount)").each(function (index) {
        if ($(this).parent("div").is(href)) {
            title = $(this).text();
            return;
        }

    });
    return title;
}


function countH2(href) {
    var counter = "Nan";
    $("section h2:not(.nocount)").each(function (index) {
        if ($(this).parent("div").is(href)) {
            counter = index + 1;
            return false;
        }

    });
    return counter;
}

/*
 $(function () {
 $('q').click(function () {
 window.location = $(this).attr('cite');
 });
 }); 
 */