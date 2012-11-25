jQuery(function($) {

    var refresh_selector = function(ctx) {
        $(".chzn-select", ctx).chosen({no_results_text: "No results matched"});
        $('form .required', ctx).after('<span class="star">*</span>');
        $('form', ctx).on('submit', function() {
            var msg = null;
            $('.required', $(this)).each(function(i, e) {
                if ($.trim(e.value) == "") {
                    msg += ($(e).prev('label').text() + " Can't be empty \n");
                }
            });
            if (msg) {
                alert(msg);
                return false;
            }
            return true;
        }).on('ajax:success', function(event, data, status, xhr){
            if(data.status){
                window.location.reload();
            }else{
                try{
                    ctx.parent('.ui-dialog-content').dialog('close');
                    alert(data.reason);
                }catch(e){
                    //console.log(e.message);
                }
            }
        });
    };

    refresh_selector(window);

    var contextPath = "/";
    if(typeof(requestContextPath) != 'undefined'){
        contextPath = requestContextPath;
    }


    $('input[data-article_id]').on('click', function(){
        window.location.href = contextPath + "/prevOpenBADoc.action?baId=" + $(this).data('article_id');
    });

    $(".contribute").on('click', function(){
        window.location.href = contextPath + "/prevSay.action";
    });

    $(".delete_tag").on('ajax:success', function(event, data, status, xhr) {
        if (data.status) {
            window.location.reload();
        } else {
            alert("Can't delete the resources: " + data.reason);
        }
    });


    var dialogContainer = $('#tag_dialog');
    $('.tags_container').on('ajax:success', '.edit_tag,.add_tag', function(event, data) {
        var form = $(data);
        dialogContainer.html(form);
        var dialog = dialogContainer.dialog({modal: true, minWidth: 420, minHeight: 420, title: $(this).data('title')});

        $.post('findCatalogs.action', function(data) {
            var current = $('#tag_catalog').val();
            $.each(data.catalogs, function(i, catalog) {
                if(current != catalog["lmId"]){
                    $('<option>').attr('value', catalog["lmId"]).html(catalog["lmName"]).appendTo('#tag_catalog');
                }
            });
            refresh_selector(form);
        }, 'json');
    });


    $("#tag_input").ajaxChosen({
        method: 'GET',
        url: 'findTags.action',
        dataType: 'json',
        minLength: 0,
        before: function(data) {
            data['module'] = $('#module_input').val();
        }
    }, function (tags) {
        var terms = {};
        $.each(tags, function (i, tag) {
            terms[tag["id"]] = tag["name"];
        });
        return terms;
    });


    var params = function(url){
        var vars = [], hash;
        var hashes = url.slice(url.indexOf('?') + 1).split('&');
        for(var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars[hash[0]] = hash[1];
        }
        return vars;
    }
    var to_url = function(params){
        var url = "?"
        for(var p in params){
            if(p && params[p]){
                url += p + "=" + params[p] + "&";
            }
        }
        return url;
    }

    function goto_page(pageNum) {
        var ps = params(window.location.href);
        ps["page"] = pageNum;
        ps["limit"] = pageSize;
        window.location.href = to_url(ps);
    }


    $(".pager a").on("click", function() {
        var pageNum = $(this).data('index');
        if (pageNum) {
            goto_page(pageNum);
        }
    });

    $(".pager .page_num").on('keydown', function(event) {
        if (event.which == 13) {
            var num = parseInt($(this).val());
            if (num && num > 0 && num <= pageCount) {
                goto_page(num);
            } else {
                alert("Please input a valid page num.");
            }
        }
    });

    $(".pager .goto").on('click', function() {
        var num = parseInt($(this).prev('input.page_num').val());
        if (num && num > 0 && num <= pageCount) {
            goto_page(num);
        } else {
            alert("Please input a valid page num.");
        }
    });
});