<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SecondHand.Models.Info>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Welcome to our website</h1>
    <h2>在这里你可以管理你发布的内容，进行信息的修改和删除</h2>
<p>
    <%: Html.ActionLink("返回主页", "../Home/Index") %>
</p>
    <%
        string a = "";
        if (User.Identity.Name != null) { a = User.Identity.Name.ToString(); } 
        int count = 0;
        foreach (var item in Model)
        {
            if (item.Username.Contains(a))
            count++;
        }
        if (count > 0)
        {
         %>
    <h3>未完成交易：</h3>
<table>
    <tr>
        <th>
            图片<!--<%: Html.DisplayNameFor(model => model.Pic)%>-->&emsp;
        </th>
        <th>
            物品名称<!--<%: Html.DisplayNameFor(model => model.Product)%>-->&emsp;
        </th>
        <th>
            价格<!--<%: Html.DisplayNameFor(model => model.Price)%>-->&emsp;
        </th>
        <th>
            供求状态<!--<%: Html.DisplayNameFor(model => model.Status)%>-->&emsp;
        </th>       
        <th></th>
    </tr>
<% 
  foreach (var item in Model)
  {
      if (item.Username.Contains(a)&&item.Tradingstatus.Equals("尚未交易"))
      { %>
    <tr>       
        <td>
            <img src="<%:Html.DisplayFor(modelItem => item.Pic)%>" height="200px" width ="300px"/>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Product)%>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price)%>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Status)%>&emsp;
        </td>
        
        <td>
            <%: Html.ActionLink("修改", "Edit", new { id = item.Id })%> |
            <%: Html.ActionLink("详细信息", "Details", new { id = item.Id })%> 
            <%: Html.ActionLink("删除", "Delete", new { id = item.Id })%>
            <%: Html.ActionLink("修改交易状况", "Editstatue", new { id=item.Id })%> 
        </td>
    </tr>
    <% }       %>
<% }%>
</table><br/><br/>
   <h3>已完成交易:</h3>
    <table>
    <tr>
        <th>
            图片<!--<%: Html.DisplayNameFor(model => model.Pic)%>-->&emsp;
        </th>
        <th>
            物品名称<!--<%: Html.DisplayNameFor(model => model.Product)%>-->&emsp;
        </th>
        <th>
            价格<!--<%: Html.DisplayNameFor(model => model.Price)%>-->&emsp;
        </th>
        <th>
            供求状态<!--<%: Html.DisplayNameFor(model => model.Status)%>-->&emsp;
        </th>       
        <th></th>
    </tr>
<% 
  foreach (var item in Model)
  {
      if (item.Username.Contains(a)&&item.Tradingstatus.Equals("完成交易"))
      { %>
    <tr>       
        <td>
            <img src="<%:Html.DisplayFor(modelItem => item.Pic)%>" height="200px" width ="300px"/>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Product)%>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price)%>&emsp;
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Status)%>&emsp;
        </td>
        
        <td>
            <%: Html.ActionLink("修改", "Edit", new { id = item.Id })%> |
            <%: Html.ActionLink("详细信息", "Details", new { id = item.Id })%> 
            <%: Html.ActionLink("删除", "Delete", new { id = item.Id })%>
           
        </td>
    </tr>
    <% }       %>
<% }%>
</table><br/><br/>


<% }%>

 <%else{%>
 <h4>您还没有发布过信息，<a href="/Home/About">快来发布吧！</a></h4>
    <%}%>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
