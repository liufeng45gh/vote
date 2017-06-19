<div class="rnImgWrap">
    <div class="rnImgBody">
        <div class="main pr" id="oWrap">
            <a id="targetImg" href="javascript:;" class="targetImg" target="_blank">
        <span>
          <i>O</i>查看原图</span>
            </a>
            <a href="javascript:;" id="imgPrevBtn" title="上一张"></a>
            <a href="javascript:;" id="imgNextBtn" title="下一张"></a>
            <div class="rnImgCon" id="rnImgCon">
                <img id="newsBigPic" src="${(pictureList[0].url)!}" style="opacity: 1;"></div>
        </div>
    </div>
    <div class="rnImgDes">
        <div class="main Clear">
            <div class="rnImgNum fl" id="rnImgNum">
                <span class="s1">1</span>
                <span class="s2">/</span>
                <span class="s3">${pictureList?size}</span></div>
            <p id="rnImgDes">${(pictureList[0].description)!}</p></div>
    </div>
    <div class="rnImgThumb">
        <div class="main">
            <div class="ablumListBox pr ">
                <ul id="ablumList" class="Clear" style="width: 1430px; left: 0px;">

                    <#list pictureList as picture>
                    <li class="thumb-li  <#if picture_index==0>active</#if>" style="left: ${(130*picture_index)}px; " index="${(picture_index + 1)}" id="thumb-${(picture_index + 1)}">
                        <img src="${picture.url}">
                        <span>${(picture_index + 1)}/${pictureList?size}</span>
                        <p>
                        </p>
                        <div style="display:none" class="description">${picture.description}</div>
                    </li>
                    </#list>

                </ul>
            </div>
            <div class="scrollBarBox pr" id="scrollBarBox">
                <div id="scrollBarCon" style="width: 358px; left: 0px;">
                    <div id="scrollBar" class="scrollBarNor"></div>
                </div>
            </div>
        </div>
    </div>
</div>