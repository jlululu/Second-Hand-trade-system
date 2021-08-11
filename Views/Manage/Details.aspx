<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Info</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Username) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Username) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Password) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Password) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Tel) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tel) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Product) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Product) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Detail) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Detail) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Price) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Price) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Status) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Status) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Pic) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pic) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
