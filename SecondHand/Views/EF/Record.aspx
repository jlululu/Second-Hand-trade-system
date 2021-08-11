<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SecondHand.Models.Table>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    浏览历史
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
<h2>浏览历史</h2>

<table>
    <tr>
        <th>
            图片&emsp;
        </th>
        <th>
            名称&emsp;
        </th>
        <th>
            种类&emsp;
        </th>            
        <th>
            供求状态<!--<%: Html.DisplayNameFor(model => model.Status) %>-->&emsp;&emsp;
        </th>
        <th>
            浏览时间&emsp;
        </th>
      
    </tr>
    <%int i = 0; %>
    <%var Model1 = (from j in Model where j.Uname.Equals(User.Identity.Name) orderby j.Time descending select j); %>
<% foreach (var item in Model1) { %>
    <tr>
        <td>
            <img src="<%:Html.DisplayFor(modelItem => item.Pic)%>" height="150px" width ="200px"/>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Product) %>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Type) %>&emsp;
        </td>               
        <td>
            <%: Html.DisplayFor(modelItem => item.Status) %>&emsp;&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Time) %>&emsp;
        </td>
       
</tr>
<% i++;
    if (i >= 5)break;
   } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
