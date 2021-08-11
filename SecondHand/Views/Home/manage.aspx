<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site1.Master"  Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
闲置供求信息发布
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>管理员专区</h1>
        <h2>请选择操作内容</h2>
    </hgroup>
    <h3>用户信息:</h3>
 <table>
          <tr>
        <th>
            用户id &emsp;
        </th>
        <th>
            用户名 &emsp;
        </th>
        <th>
            用户邮箱 &emsp;
        </th>
        <th>
            用户号码 &emsp;
        </th>
        <th>
            用户注册时期 &emsp;
        </th>
    </tr>
 <%foreach (var re in ViewBag.showuser){%>
    <%if(re.UserId!=5){ %>
      <tr>
        <td>
        <%: Html.Encode(re.UserId) %>&emsp;  
        </td>  
        <td>
        <%: Html.Encode(re.UserName)%>&emsp;
        </td>  
        <td>
        <%: Html.Encode(re.Email)%>&emsp;
        </td>
        <td>
        <%: Html.Encode(re.Phonenumber)%>&emsp;
        </td>    
        <td>
        <%: Html.Encode(re.Registerdate)%>&emsp;
        </td>
        <th>
          <%: Html.ActionLink("删除", "Delete", new { id=re.UserId })%> 
        </th>  
<% } %>
       <% } %>
</table><br/><br/>
</asp:Content>