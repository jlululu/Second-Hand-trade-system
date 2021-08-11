<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Info</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tel) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tel) %>
            <%: Html.ValidationMessageFor(model => model.Tel) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Type) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Type) %>
            <%: Html.ValidationMessageFor(model => model.Type) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Product) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Product) %>
            <%: Html.ValidationMessageFor(model => model.Product) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Detail) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Detail) %>
            <%: Html.ValidationMessageFor(model => model.Detail) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Price) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Price) %>
            <%: Html.ValidationMessageFor(model => model.Price) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Status) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Status) %>
            <%: Html.ValidationMessageFor(model => model.Status) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pic) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pic) %>
            <%: Html.ValidationMessageFor(model => model.Pic) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
