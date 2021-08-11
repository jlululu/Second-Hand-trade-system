<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    indextime
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>按时间排序</h2>
<p>
    <%: Html.ActionLink("返回上一页", "../Home/Action") %>
</p>
    <table>
    <tr>
        <th>
            图片&emsp;
        </th>
        <th>
            物品名称&emsp;
        </th>
        <th>
            价格&emsp;
        </th>
        <th>
            供求状态&emsp;
        </th>       
        <th>
            发布时间&emsp;
        </th>
    </tr>
<% 
  foreach (var item in ViewBag.infotime)
  {
  %>
    <tr>       
        <td>
            <img src="<%:Html.Encode(item.Pic)%>" height="200px" width ="300px"/>
        </td>
        <td>
            <%:Html.Encode(item.Product)%>&emsp;
        </td>
        <td>
            <%:Html.Encode(item.Price)%>&emsp;
        </td>
        <td>
            <%:Html.Encode(item.Status)%>&emsp;
        </td>
        <td>
            <%:Html.Encode(item.Infotime)%>&emsp;
        </td>
        <td>
            <%: Html.ActionLink("详细信息", "Details", new { id = item.Id })%> 
        </td>
    </tr>
    <% }   %>
        </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
