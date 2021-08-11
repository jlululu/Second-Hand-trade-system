<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    发布信息修改
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>发布信息修改</h2>

<% using (Html.BeginForm("Edit", "mynews", FormMethod.Post, new { enctype ="multipart/form-data"}))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>信息</legend>
        <%: Html.HiddenFor(model => model.Id) %>
        <%: Html.HiddenFor(model => model.Username) %>
        <%: Html.HiddenFor(model => model.Password) %>
        <%: Html.HiddenFor(model => model.Infotime) %>
        <div class="editor-label">
          电话号码
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tel) %>
            <%: Html.ValidationMessageFor(model => model.Tel) %>
        </div>

        <div class="editor-label">
            商品专区
        </div>
         <select id="type" name="Type" style="width: 145px; height: 26px">
            <option value="电子数码">电子数码</option>
            <option value="潮鞋服饰">潮鞋配饰</option> 
            <option value ="家居日用">家居日用</option> 
            <option value ="图书音像">图书音像</option> 
            <option value="艺术收藏">艺术收藏</option> 
            <option value ="办公设备">办公设备</option> 
            <option value="其他物品">其他物品</option> 
        </select>

        <div class="editor-label">
            产品名称
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Product) %>
            <%: Html.ValidationMessageFor(model => model.Product) %>
        </div>

        <div class="editor-label">
            信息简介
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Detail) %>
            <%: Html.ValidationMessageFor(model => model.Detail) %>
        </div>

        <div class="editor-label">
           价格
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Price) %>
            <%: Html.ValidationMessageFor(model => model.Price) %>
        </div>

        <div class="editor-label">
           供求状况
        </div>
        <select id="Select3" name="Status" style="width: 145px; height: 26px">
            <option value="供">供</option>
            <option value="求">求</option>          
        </select>

         <div class="editor-label">
          图片<br/>
        <input type="file" name="Pic"/>
        </div>
        <div class="editor-field">
            <%: Html.ValidationMessageFor(model => model.Pic)%>
        </div>
         <div class="editor-label">
            交易状态
             </div>     
        <select id="Select1" name="Tradingstatus" style="width: 145px; height: 26px">
            <option value="尚未交易">尚未交易</option>
            <option value="完成交易">完成交易</option>          
        </select>
        <p>
            <input type="submit" value="确认修改" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("返回上一级", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
