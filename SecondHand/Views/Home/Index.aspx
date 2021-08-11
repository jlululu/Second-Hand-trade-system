<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
   
</asp:Content>
<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <form id="form1" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>闲置物品交易网</h1>
                <h2>&nbsp;</h2>
            </hgroup>
            <p>
                &nbsp;该网站是专业的闲置物品交易网站，为用户提供二手物品交易的平台。您可以查看和发布求购或者出售相关的物品信息。</p>
        </div>
    </section>
    </form>
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <hgroup class="title">
        <h1>选择专区</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>
    <h3>对哪些感兴趣？</h3>
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
    <div class="col-sm-4">
<ol class="round">
        <li class="one">
            <h3><a href="/EF?id=电子数码&&st=供">电子数码供应区</a></h3>
           Electronic Digital Selling Area
            <h3><a href="/EF?id=电子数码&&st=求">电子数码求购区</a></h3>
            Electronic Digital Buying Area
        </li>

        <li class="four">
            <h3><a href="/EF?id=鞋服配饰&&st=供">鞋服配饰供应区</a></h3>
            Tide Shoes Apparel Selling Area
             <h3><a href="/EF?id=鞋服配饰&&st=求">鞋服配饰求购区</a></h3>
            Tide Shoes Apparel Buying Area
        </li>

        <li class="seven">
            <h3><a href="/EF?id=家居日用&st=供">家居日用供应区</a></h3>
            Household Daily Use Selling Area
             <h3><a href="/EF?id=家居日用&&st=求">家居日用求购区</a></h3>
            Household Daily Use Buying Area
        </li>
    </ol></div>
    <div class="col-sm-4"><ol class="round">
        <li class="two">
            <h3><a href="/EF?id=图书音像&&st=供">图书音像供应区</a></h3>
          Book Audio And Video Selling Area
            <h3><a href="/EF?id=图书音像&&st=求">图书音像求购区</a></h3>
          Book Audio And Video Buying Area

        </li>
         <li class="five">
            <h3><a href="/EF?id=艺术收藏&&st=供">艺术收藏供应区</a></h3>
           Art Collection Selling Area
             <h3><a href="/EF?id=艺术收藏&&st=求">艺术收藏求购区</a></h3>
           Art Collection Buying Area
        </li>
        </ol></div>
    <div class="col-sm-4"><ol class="round">
        <li class="three">
            <h3><a href="/EF?id=其他物品&&st=供">其他物品供应区</a></h3>
            Other Item Selling Area
            <h3><a href="/EF?id=其他物品&&st=求">其他物品求购区</a></h3>
            Other Item Buying Area
        </li>
        <li class="six">
            <h3><a href="/EF?id=办公设备&&st=供">办公设备供应区</a></h3>
            Office Equipment Selling Area
             <h3><a href="/EF?id=办公设备&&st=求">办公设备求购区</a></h3>
            Office Equipment Buying Area
        </li>
    </ol></div>
</asp:Content>



