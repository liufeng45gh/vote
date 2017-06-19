<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
 <#include "../common_header.ftl"/>
</head>
<body style="zoom: 1;">
	<div class="b-container">
	    <#include "../top_menu.ftl"/>
        <#include "../quick_menu.ftl"/>
        <div id="wrap">
            <div class="outer with-side with-transition" style="min-height: 600px;">

                    <#include "left_menu.ftl"/>
                     <div id="admin_right" class="main">
                       <div class="content_box" style="border:none">
                        <div class="content" style="height: 422px;">
                         <ul class="red_box">
                         </ul>
                         <table width="98%" cellspacing="0" cellpadding="5" class="border_table_blue" style="float:left">
                          <thead>
                           <tr>
                            <th>系统信息</th>
                           </tr>
                          </thead>
                          <tbody>
                           <tr>
                            <td>
                             <table class="list_table2" width="100%">
                              <colgroup>
                               <col width="80px" />
                               <col />
                              </colgroup>
                              <tbody>
                               <tr>
                                <th>操作系统</th>
                                <td>${osName}</td>
                               </tr>
                               <tr>
                                <th>web服务器</th>
                                <td>tomcat8</td>
                               </tr>
                               <tr>
                                <th>数据库</th>
                                <td>mysql</td>
                               </tr>

                               <tr>
                                <th>ip</th>
                                <td>${localAddr}</td>
                               </tr>
                               <tr>
                                <th>附件上传容量</th>
                                <td>2M</td>
                               </tr>
                               <tr>
                                <th>授权信息</th>
                                <td><b >Copyright &copy; 海富文化网 All Rights Reserved</b></td>
                               </tr>
                              </tbody>
                             </table> </td>
                           </tr>
                          </tbody>
                         </table>
                         </td>
                           </tr>
                          </tbody>
                         </table>
                         <table width="98%" cellspacing="0" cellpadding="0" class="border_table_blue" style="float:left">
                          <thead>
                           <tr>
                            <th></th>
                           </tr>
                          </thead>
                          <tbody>
                           <tr>
                            <td style="padding:5px 0"> </td>
                           </tr>
                          </tbody>
                         </table>
                        </div>
                       </div>
                      </div>
            </div>

        </div>




	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_welcome").addClass("selected");
		});
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body></html>