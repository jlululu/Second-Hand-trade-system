<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    详细信息
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<div class="row">
    <div class="col-sm-7">
<fieldset>
    <legend></legend>
    <div class="display-field">
        <h4>供求状态：<%:Html.DisplayFor(model => model.Status)%></h4>
        <h2>【<%: Html.DisplayFor(model => model.Product) %>】</h2>        
    </div><br/>
    <div class="display-label">
        <img src="<%:Html.DisplayFor(model => model.Pic)%>" height="200px" width ="300px"/>
    </div>
    <div class="display-field">
      
        <b>分类：</b><%: Html.DisplayFor(model => model.Type) %>
    </div><br/>
     <div class="display-label">
        <b>价格：</b><%: Html.DisplayFor(model => model.Price) %>
    </div><br/>
     <div class="display-label">
        <b>详细信息：</b><!--<%: Html.DisplayNameFor(model => model.Detail) %>-->
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Detail) %>
    </div><br/>
    <div class="display-label">
        <b>联系人：</b><%: Html.DisplayFor(model => model.Username) %>
    </div><br/>
    <div class="display-label">
        <b>联系电话：</b><%: Html.DisplayFor(model => model.Tel) %>
    </div><br/>
     <div class="display-label">
        <b>发布时间：</b><%: Html.DisplayFor(model => model.Infotime) %>
    </div><br/>
</fieldset>
    </div>
    <div class="col-sm-5">
    <div class="display-label">
        <h3>评论用户|评论内容|评论时间</h3>
     </div>
     <%=ViewData["Mes"]%>
<%foreach (var re in ViewBag.re) 
  {%>
    <%if (re.Upid ==null){ %>
       <div class="display-label">
            <%: Html.Encode(re.Rename) %>:
        
            <%: Html.Encode(re.Content) %>&emsp;
            
            <%: Html.Encode(re.Retime) %>&emsp;
          
        <%: Html.ActionLink("回复", "Createreply", new { id = re.Reid })%>
       </div>
     <%  } %>
     <%if (re.Upid !=null){ %>
            <%: Html.Encode(re.Rename) %>回复<%: Html.Encode(re.Replyname) %>:
        
            <%: Html.Encode(re.Content) %>&emsp;
            
            <%: Html.Encode(re.Retime) %>&emsp;
          
        <%: Html.ActionLink("回复", "Createreply",new { id = re.Reid })%>
    <%  } %>
<%  } %>
<p>
<% using (Html.BeginForm("Createre", "EF", FormMethod.Post, new { enctype ="multipart/form-data"}))
   { %>
    <%: Html.ValidationSummary(true)%>
      <input type="text" name="content1"/>
      <input type="hidden" name="id1" value="<%=Model.Id %>"/>
      <input type="submit" value="我要评论"/>        
</p><% } %>
<p>
   <%: Html.ActionLink("返回专区选择", "../Home/Action") %>
   <%: Html.ActionLink("返回个人消息", "Message") %>
</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
