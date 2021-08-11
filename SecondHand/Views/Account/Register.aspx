<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<SecondHand.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    注册
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>注册</h1>
        <h2>新建帐户</h2>
    </hgroup>
    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

        <fieldset>
            <legend>注册表单</legend>
            <ol>
                <li>
                    <%: Html.LabelFor(m => m.UserName) %>
                    <%: Html.TextBoxFor(m => m.UserName) %>
                </li>
                <li>
                    <%: Html.LabelFor(m => m.Password) %>
                    <%: Html.PasswordFor(m => m.Password) %>
                </li>
                <li>
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                </li>
                <li>
                    <br>邮箱<br>
                  <input type="email" name="email" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="请输入正确的邮箱地址">
                </li>
                <li contenteditable="true">
                    <br>手机号码<br>
                  <input type="text" id="number" name="number" pattern="^[1][3,4,5,7,8][0-9]{9}$" title="请输入正确的手机号码" required>
                </li>
            </ol>
            <input type="submit" value="注册" />
        </fieldset>
    <% } %>
 <br><%= ViewData["re"]%><br>
    
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <script>
        $("input[type=submit]").on("click", function (e) {
            e.preventDefault();
            var number = $("#number").val();
            console.log(number.match(/^[1][3,4,5,7,8][0-9]{9}$/));
            if (number.match(/^[1][3,4,5,7,8][0-9]{9}$/)) {
                // $("form").submit();
            }
            else {
                alert("手机号格式错误！");
            }
        });
    </script>
</asp:Content>
