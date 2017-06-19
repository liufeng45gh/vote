<#list artistList as artist>
<div class="artist-item" <#if artist_index%4==0>style="margin-left: 0px;"</#if>>
    <div class="logo">
        <a href="/artist/${artist.id}/detail" target="_blank">
            <img src="${(artist.avatar)!}" >
        </a>
    </div>
    <div class="text">
        <div class="name">${(artist.name)!}</div>
        <div class="tag">${(artist.tag)!}</div>
    </div>

</div>

</#list>