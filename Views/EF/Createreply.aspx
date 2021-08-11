<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Createreply
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <%foreach (var re in ViewBag.rep) 
  {%>
         <div class="display-label">
            <%: Html.Encode(re.Rename) %>&emsp;
        
            <%: Html.Encode(re.Content) %>&emsp;
            
            <%: Html.Encode(re.Retime) %>&emsp;
       </div>
    <%}%>
     <h5>回复用户|回复内容|回复时间</h5>
    <h3> <%=ViewData["Mess"]%></h3>
<p>
    <% using (Html.BeginForm("reply", "EF", FormMethod.Post, new { enctype ="multipart/form-data"}))
   { %>
     <% foreach(var rep in ViewBag.rep){%>
    <%: Html.ValidationSummary(true)%>
      <input type="text" name="content2"/>
      <input type="hidden" name="id2" value="<%=rep.Id %>"/>
      <input type="hidden" name="name2" value="<%=rep.Rename %>"/>
      <input type="hidden" name="reid2" value="<%=rep.Reid %>"/>  
      <input type="submit" value="我要回复"/>        
</p><% } %><% } %>
<p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>