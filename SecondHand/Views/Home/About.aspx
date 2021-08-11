<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    闲置供求信息发布
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>发布信息。</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>

    <article>
        <br/><br/><br/><br/>
        <h2><%: Html.ActionLink("我想求闲置", "../EF/Create2", "Home") %></h2><br/><br/><br/><br/>

        <h2><%: Html.ActionLink("我要卖闲置", "../EF/Create", "Home") %></h2><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>

        
    </article>
</asp:Content>