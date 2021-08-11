<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SecondHand.Models.Info>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Welcome to our website</h2>

<p>
    <%: Html.ActionLink("返回上一页", "../Home/Action") %>
</p>
     <% using (Html.BeginForm()){%>
           <p>物品名称:<%=Html.TextBox("Search")%>
           <input type="submit" value="查找"></p><% }%>
 <%if (ViewBag.hao== "1") {%>
   <h3> <%=ViewData["Mes"]%></h3>
<table>
 <%foreach (var re in ViewBag.haoinfo){%>
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
            交易状况&emsp;
        </th>
    </tr>
      <tr>
         <td>  
        <img src="<%:Html.Encode(re.Pic)%>" height="200px" width ="300px"/>&emsp;
       </td>
        <td>
        <%: Html.Encode(re.Product) %>&emsp;  
        </td>
        <td>
        <%: Html.Encode(re.Price) %>&emsp;  
        </td>  
        <td>
        <%: Html.Encode(re.Status)%>&emsp;
        </td> 
        <td>
        <%: Html.Encode(re.Tradingstatus)%>&emsp;
        </td>
          <%if (re.Tradingstatus.Equals("完成交易")) { %>
              <h3> !注意：该商品已完成交易，不能查看信息</h3>
         <%  } %>
         <% else{%>
        <th>
        <%: Html.ActionLink("详细信息", "../EF/Details", new { id=re.Id }) %> 
        </th>
           <%  } %>   
<% } %>
</table><br/><br/>
    <% } %>


    <%  string a = "";
        string b = "";
        string c = "尚未交易";
        if ((Request["id"] != null) && (Request["st"] != null))
        {
            a = Request["id"].ToString(); b = Request["st"].ToString(); 
        } %>
<p>
   <% using (Html.BeginForm("indextime", "EF", FormMethod.Post, new { enctype ="multipart/form-data"}))
   { %>
    <input type="hidden" name="type" value="<%=a %>"/>
    <input type="hidden" name="statue" value="<%=b %>"/>
    <input type="hidden" name="trading" value="<%=c %>"/>
    <input type="submit" value="按时间排序"/>
   <% } %>
</p>
    <%
        int count = 0;
        foreach (var item in Model)
        {
            if ((item.Type.Contains(a)) && (item.Status.Contains(b)) && (item.Tradingstatus.Contains(c)))
            count++;
        }
        if (count > 0)
        {
         %>
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
         <th>
            发布时间<!--<%: Html.DisplayNameFor(model => model.Infotime)%>-->&emsp;
        </th>      
      
    </tr>
<% 
  foreach (var item in Model)
  {
      if ((item.Type.Contains(a)) && (item.Status.Contains(b)) && (item.Tradingstatus.Contains(c)))
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
            <%: Html.DisplayFor(modelItem => item.Infotime)%>&emsp;
        </td>
        <td>
            <%: Html.ActionLink("详细信息", "Details", new { id = item.Id })%> 
        </td>
    </tr>
    <% }   %>
<% }
    } else{%>
    <h>该专区暂时没有内容，<a href="/Home/About">来发布吧！</a></h>
    <%}
   %>

</table><br/><br/>
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
