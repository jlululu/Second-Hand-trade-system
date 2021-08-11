<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site1.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
闲置供求信息发布
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>管理员专区</h1>
        <h2>请选择操作内容</h2>
    </hgroup>
 <h3>未完成交易产品:</h3>
 <table>
          <tr>
        <th>
            产品编号 &emsp;
        </th>
        <th>
            产品名称 &emsp;
        </th>
        <th>
            发布用户 &emsp;
        </th>
        <th>
            产品价格 &emsp;
        </th>
        <th>
            供求状况 &emsp;
        </th>
    </tr>
 <%foreach (var re in ViewBag.showpro1){%>
      <tr>
        <td>
        <%: Html.Encode(re.Id) %>&emsp;  
        </td>  
        <td>
        <%: Html.Encode(re.Product)%>&emsp;
        </td>  
        <td>
        <%: Html.Encode(re.Username)%>&emsp;
        </td>
        <td>
        <%: Html.Encode(re.Price)%>&emsp;
        </td>    
        <td>
        <%: Html.Encode(re.Status)%>&emsp;
        </td>
        <td>
          <%: Html.ActionLink("修改交易状况", "Editstatue", new { id=re.Id })%> &emsp;
        </td>
         <td>
          <%: Html.ActionLink("删除交易信息", "deleteinfo", new { id=re.Id })%> 
        </td>   
<% } %>
</table><br/><br/>
<h3>已完成交易产品:</h3>
<table>
          <tr>
        <th>
            产品编号 &emsp;
        </th>
        <th>
            产品名称 &emsp;
        </th>
        <th>
            发布用户 &emsp;
        </th>
        <th>
            产品价格 &emsp;
        </th>
        <th>
            供求状况 &emsp;
        </th>
    </tr>
 <%foreach (var re in ViewBag.showpro2){%>
      <tr>
        <td>
        <%: Html.Encode(re.Id) %>&emsp;  
        </td>  
        <td>
        <%: Html.Encode(re.Product)%>&emsp;
        </td>  
        <td>
        <%: Html.Encode(re.Username)%>&emsp;
        </td>
        <td>
        <%: Html.Encode(re.Price)%>&emsp;
        </td>    
        <td>
        <%: Html.Encode(re.Status)%>&emsp;
        </td>
        <td>
          <%: Html.ActionLink("修改交易状况", "Editstatue", new { id=re.Id })%> &emsp;  
        </td>
         <td>
          <%: Html.ActionLink("删除交易信息", "deleteinfo", new { id=re.Id })%> 
        </td> 
<% } %>
</table><br/><br/>
</asp:Content>
