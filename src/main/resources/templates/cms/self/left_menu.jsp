<%@ page language="java" pageEncoding="utf-8"%>
<div id="admin_left" style="height:100%" class="side">
	<ul class="submenu">
		<li><span>后台首页</span>
			<ul name="menu"><li id="left_menu_welcome"><a href="/cms/self/welcome">后台首页</a></li></ul>
		</li>
		<li><span>分类管理</span>
			<ul name="menu"><li id="left_menu_city"><a href="/cms/self/classification">分类列表</a></li></ul>
		</li>
		<li><span>书城管理</span>
			<ul name="menu"><li id="left_menu_store_add"><a href="/cms/store/add">添加书城</a></li></ul>
			<ul name="menu"><li id="left_menu_store"><a href="/cms/store/list">书城列表</a></li></ul>
		</li>
		<li><span>频道管理</span>
			<ul name="menu"><li id="left_menu_channel_add"><a href="/cms/channel/add">添加频道</a></li></ul>
			<ul name="menu"><li id="left_menu_channel"><a href="/cms/channel/list">频道列表</a></li></ul>
		</li>
		<li><span>书籍管理</span>
			<ul name="menu"><li id="left_menu_book_add"><a href="/cms/book/add">添加书籍</a></li></ul>
			<ul name="menu"><li id="left_menu_book"><a href="/cms/book/list">书籍列表</a></li></ul>
			<ul name="menu"><li id="left_menu_book_init"><a href="/cms/book/init_list">书籍初始化列表</a></li></ul>
		</li>
		<li><span>广告管理</span>
			<ul name="menu"><li id="left_menu_ad_add"><a href="/cms/ad/add">添加广告</a></li></ul>
			<ul name="menu"><li id="left_menu_ad"><a href="/cms/ad/list?type=the_new">广告列表</a></li></ul>
		</li>
		<li><span>搜索热词管理</span>
			<ul name="menu"><li id="left_menu_hot_add"><a href="/cms/hot/add">添加热词</a></li></ul>
			<ul name="menu"><li id="left_menu_hot"><a href="/cms/hot/list">热词列表</a></li></ul>
		</li>
		<li><span>个人资料</span>
			<ul name="menu">				
				<li id="left_menu_upnick"><a href="/cms/self/upnick">修改昵称</a></li>
			</ul>
			
			<ul name="menu">				
				<li id="left_menu_uppass"><a href="/cms/self/uppassword">修改密码</a></li>
			</ul>
		</li>
	</ul>
	
	<div id="copyright"></div>
</div>
<script>
$("#top_menu_self").addClass("selected");
</script>