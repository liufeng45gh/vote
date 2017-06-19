<div class="report-block news-right">
    <div class="search-box">
        <form method="get" action="/appreciate/search" class="new-searching-unit" data-regestered="regestered" id="search-form">
            <input id="query" type="text" size="27" name="title" autocomplete="off" placeholder="搜索你喜欢的" value="${title!}" />
            <a href="#" onclick="return false;" class="go" id="search-btn"></a>
        </form>

    </div>

</div>

<script type="text/javascript">
$(function() {
	$("#head-href-appreciate").addClass("active");
	$("#search-btn").click(function (){
        $("#search-form").submit();
	});
});
</script>