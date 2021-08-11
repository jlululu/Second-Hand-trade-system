<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>删除</h2>

<h3>你确定要删除这条闲置闲置信息吗？</h3>
<fieldset>
    <legend>Info</legend>

    <div class="display-label">
        发布者
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Username) %>
    </div>

    <div class="display-label">
        联系电话
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tel) %>
    </div>

    <div class="display-label">
        物品分类:
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Type) %>
    </div>

    <div class="display-label">
       物品名称
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Product) %>
    </div>

    <div class="display-label">
        细节信息
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Detail) %>
    </div>

    <div class="display-label">
       定价
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Price) %>
    </div>

    <div class="display-label">
        供求状态
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Status) %>
    </div>

    <div class="display-label">
        图片<!--<%: Html.DisplayNameFor(model => model.Pic) %>-->
    </div>
     
    <div class="display-label">
        <img src="<%:Html.DisplayFor(model => model.Pic)%>" height="200px" width ="300px"/>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="删除" /> |
        <%: Html.ActionLink("返回上一级", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
