﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SecondHand.Models.Info>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>
    
<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>     <% %>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.Username) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Password) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Tel) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Type) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Product) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Detail) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Price) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Status) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Pic) %>
        </th>
        <th></th>
    </tr>
    
<% foreach (var item in Model) { %>
    <tr>    
        <td>
            <%: Html.DisplayFor(modelItem => item.Username) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Password) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Tel) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Type) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Product) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Detail) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Status) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pic) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.Id }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
