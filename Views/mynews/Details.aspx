<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    详细信息
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<fieldset>
    <legend></legend>
    <div class="display-field">
        <h4>供求状态：<%:Html.DisplayFor(model => model.Status)%></h4>
        <h2>【<%: Html.DisplayFor(model => model.Product) %>】</h2>        
    </div><br/>
    <div class="display-label">
        <img src="<%:Html.DisplayFor(model => model.Pic)%>" height="200px" width ="300px"/>
    </div>
    <div class="display-field">
        
        <b>分类：</b><%: Html.DisplayFor(model => model.Type) %>
    </div><br/>
     <div class="display-label">
        <b>价格：</b><%: Html.DisplayFor(model => model.Price) %>
    </div><br/>
     <div class="display-label">
        <b>详细信息：</b><!--<%: Html.DisplayNameFor(model => model.Detail) %>-->
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Detail) %>
    </div><br/>
    <div class="display-label">
        <b>联系人：</b><%: Html.DisplayFor(model => model.Username) %>
    </div><br/>
    <div class="display-label">
        <b>联系电话：</b><%: Html.DisplayFor(model => model.Tel) %>
    </div><br/>
    <div class="display-label">
        <b>发布时间：</b><%: Html.DisplayFor(model => model.Infotime) %>
    </div><br/>
</fieldset>
<p>
    <%: Html.ActionLink("返回上一级", "Index") %>
     <%: Html.ActionLink("我要回复", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>