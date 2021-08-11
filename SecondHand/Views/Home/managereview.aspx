<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    managereview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>管理用户跟帖信息</h2>
<table>
          <tr>
        <th>
            用户 &emsp;
        </th>
        <th>
            评论内容 &emsp;
        </th>
        <th>
            评论时间 &emsp;
        </th>
    </tr>
 <%foreach (var re in ViewBag.show){%>
     <%if (re.Upid ==null){ %>  
    <tr>
        <td>
        <%: Html.Encode(re.Rename) %>&emsp;  
        </td>  
        <td>
        <%: Html.Encode(re.Content)%>&emsp;
        </td>
        <td>
        <%: Html.Encode(re.Retime)%>&emsp;
        </td>
        <td>
         <%: Html.ActionLink("删除", "deletereview",new { id = re.Reid })%> 
        </td>
         <% } %> 
     <%if (re.Upid !=null){ %>  
     <tr>
        <td>
       <%: Html.Encode(re.Rename) %>回复<%: Html.Encode(re.Replyname) %>:  
        </td>  
        <td>
        <%: Html.Encode(re.Content)%>&emsp;
        </td>
        <td>
        <%: Html.Encode(re.Retime)%>&emsp;
        </td>
        <td>
         <%: Html.ActionLink("删除", "deletereview",new { id = re.Reid })%> 
        </td> 
         <% } %>     
 <% } %>
</table><br/><br/> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
