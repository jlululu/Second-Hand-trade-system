<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    闲置供求信息发布
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>管理员专区</h1>
        <h2>请选择操作内容</h2>
    </hgroup>
 <article>
        <br/><br/><br/><br/>
        <h2><%: Html.ActionLink("用户内容管理", "manage", "Home") %></h2><br/><br/>
        <h2><%: Html.ActionLink("跟帖信息管理", "managereview", "Home") %></h2><br/><br/>
        <h2><%: Html.ActionLink("交易信息管理", "manageproduct", "Home") %></h2><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>
    </article>
</asp:Content>
