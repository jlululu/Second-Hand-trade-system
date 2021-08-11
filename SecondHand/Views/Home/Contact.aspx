<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="contactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    浏览记录
</asp:Content>

<asp:Content ID="contactContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>浏览记录。</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>
    
    <section class="contact">
        <header>
            <h3>最近浏览:</h3>
        </header>
        <p>
            图片：
            名称：
            种类：
            供求状态：
        </p>

    </section>
</asp:Content>