<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Telerik.aspx.cs" Inherits="Demo.Telerik.TextEditor" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <p>
        This demo was adapted from <a href="https://demos.telerik.com/aspnet-ajax/editor/ ">https://demos.telerik.com/aspnet-ajax/editor</a>
    </p>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <div class="demo-containers">
        <div class="demo-container">
            <telerik:RadEditor RenderMode="Lightweight" runat="server" ID="RadEditor1" SkinID="DefaultSetOfTools"
                Height="675px">
                <ImageManager ViewPaths="~/Editor/images/UserDir/Marketing,~/Editor/images/UserDir/PublicRelations"
                    UploadPaths="~/Editor/images/UserDir/Marketing,~/Editor/images/UserDir/PublicRelations"
                    DeletePaths="~/Editor/images/UserDir/Marketing,~/Editor/images/UserDir/PublicRelations"
                    EnableAsyncUpload="true"></ImageManager>
            </telerik:RadEditor>
        </div>
    </div>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="CheckBoxListEditMode">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="CheckBoxListEditMode" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadioButtonToolsFile">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RadioButtonToolsFile" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="CheckBoxListModules">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="CheckBoxListModules" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadioButtonListEnabled">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RadioButtonListEnabled" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="NewLineModeButtonList">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="NewLineModeButtonList" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="CheckBoxListModules">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadEditor1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="CheckBoxListModules" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    </form>
</body>
</html>