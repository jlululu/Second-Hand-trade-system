<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Message
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>个人消息</h2>
        <% using (Html.BeginForm()){%>
           <p>输入产品编号:<%=Html.TextBox("Search")%>
           <input type="submit" value="查找"></p><% }%>
<h3>评论发出的消息:</h3>
 <%=ViewData["Mes1"]%>
<%foreach (var re in ViewBag.send)
  {%>
       <div class="display-label">
            <%: Html.Encode(re.Rename) %>&emsp;
        
            <%: Html.Encode(re.Content) %>&emsp;
            
            <%: Html.Encode(re.Retime) %>&emsp;
           编号：<%: Html.Encode(re.Id) %>&emsp;
           <%: Html.ActionLink("删除评论", "deletereply", new { id = re.Reid })%>
       </div>
     <%  } %>
<h3>收到的消息</h3>
<%=ViewData["Mes2"]%>
<%foreach (var re in ViewBag.reply) 
  {%>
       <div class="display-label">
            <%: Html.Encode(re.Rename) %>&emsp;
        
            <%: Html.Encode(re.Content) %>&emsp;
            
            <%: Html.Encode(re.Retime) %>&emsp;
            编号：<%: Html.Encode(re.Id) %>&emsp;
        <%: Html.ActionLink("回复", "Createreply", new { id = re.Reid })%>
       </div>
     <%  } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
