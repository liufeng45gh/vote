<#list companyList as company>
<div class="artist-item" <#if company_index%4==0>style="margin-left: 0px;"</#if>>
    <div class="logo">
        <a href="/company/${company.id}/detail" target="_blank">
            <img src="${(company.logo)!}" >
        </a>
    </div>
    <div class="text">
        <div class="name">${(company.name)!}</div>
        
    </div>

</div>

</#list>