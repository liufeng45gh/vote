<!DOCTYPE html>
<html>
<head>
    <title>海富文化艺术网-海富招聘</title>
    <meta name="keywords" content="北京海富国际文化艺术集团有限责任公司，海富国际文化艺术金融中心大厦，国赫宫，北京锦泓轩文化艺术传媒，北京观檀家具，一二四八，以艺术品流通为使命"/>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">
    <#include "../c-top.ftl"/>



    <div class="third-block">
        <div class="info-fr wrapper-996">
            <div class="finance-block news-left">
                <div class="news-menu">
                    <#include "menu.ftl"/>

                </div>



                <div class="finance-list news-list" id="news-list">
                    <div class="news-title">${entity.title?default("")}</div>
                    <div class="news-info">
                        <span>
                              ${entity.contacts?default("")}
                        </span>
                        <span>
                            ${(entity.createdAt?string("yyyy-MM-dd HH:mm:ss"))!}
                        </span>
                    </div>
                    <div class="news-content">${entity.description?default("")}</div>

                </div>

                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "right_part.ftl"/>
            


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-recruitment').addClass("active");
});
$("#head-href-about").addClass("active");

</script>

<script  src="/web/js/news/index.js"></script>
</body>
</html>