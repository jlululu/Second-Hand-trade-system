<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.Info>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    发布供求信息
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>我要转让闲置</h2>

<% using (Html.BeginForm("Create", "EF", FormMethod.Post, new { enctype ="multipart/form-data"}))
   { %>
    <%: Html.ValidationSummary(true)%>

    <fieldset>
        <legend>物品详情</legend>

        <div class="editor-label">
            <h3>供求状态：供</h3>
        </div>
        <div class="editor-field">
            <%:Html.HiddenFor(model => model.Status, new { @Value = "供" })%>
            <%:Html.ValidationMessageFor(model => model.Status)%>
        </div><br/>
        <div class="editor-label">
            物品种类（请选择你要发布的专区）<!--<%: Html.LabelFor(model => model.Type)%>-->
        </div>
    <!--  <div class="editor-field">
            <%: Html.EditorFor(model => model.Type) %>
            <%: Html.ValidationMessageFor(model => model.Type) %>   
        </div>    -->
         
        <select id="type" name="Type" style="width: 145px; height: 26px">
            <option value="电子数码">电子数码</option>
            <option value="潮鞋服饰">潮鞋配饰</option> 
            <option value ="家居日用">家居日用</option> 
            <option value ="图书音像">图书音像</option> 
            <option value="艺术收藏">艺术收藏</option> 
            <option value ="办公设备">办公设备</option> 
            <option value="其他物品">其他物品</option> 
        </select>
        <div class="editor-label">
            物品名称
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Product)%>
            <%: Html.ValidationMessageFor(model => model.Product)%>
        </div>
        <div class="editor-label">
            图片<br/>
            <input type="file" name="Pic1" />
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Pic, new { @Value = "/Images/PiciPad.jpg" })%>
            <%: Html.ValidationMessageFor(model => model.Pic)%>
        </div>
        <div class="editor-label">
            价格
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Price)%>
            <%: Html.ValidationMessageFor(model => model.Price)%>
        </div>
        <div class="editor-label">
            细节信息
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Detail)%>
            <%: Html.ValidationMessageFor(model => model.Detail)%>
        </div>        
        <div class="editor-label">
            联系电话
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tel)%>
            <%: Html.ValidationMessageFor(model => model.Tel)%>
        </div>
        
        <div class="editor-label">
            交易状态：尚未交易
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Tradingstatus, new {@Value="尚未交易"})%>
            <%: Html.ValidationMessageFor(model => model.Tradingstatus)%>
        </div>
        <p>
            <input type="submit" value="发布" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("返回主页", "../Home/Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
   <%: Scripts.Render("~/bundles/jqueryval") %>
    <script>
        $("input[type=submit]").on("click", function (e) {
            e.preventDefault();
            if ($("#Product").val() == "") {
                alert("物品名称不能为空");
                return;
            }
            if ($("#Pic").val() == "") {
                alert("图片不能为空");
                return;
            }
            if ($("#Price").val() == "") {
                alert("价格不能为空");
                return;
            }
            if ($("#Detail").val() == "") {
                alert("详情描述不能为空");
                return;
            }
            if ($("#Tel").val() == "") {
                alert("电话号码不能为空");
                return;
            }
            $("form").submit();
        });
        
    </script>
</asp:Content>
