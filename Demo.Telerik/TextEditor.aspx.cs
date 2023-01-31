using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Demo.Telerik
{
    public partial class TextEditor : Page
    {
        protected void RadioButtonListEnabled_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem selectedItem = RadioButtonListEnabled.SelectedItem;
            switch (selectedItem.Value)
            {
                case "Enable":
                    RadEditor1.Enabled = true;
                    RadEditor1.Style.Remove("overflow");
                    RadEditor1.Width = new Unit(null);
                    break;
                case "Disable":
                    RadEditor1.Enabled = false;
                    RadEditor1.Width = new Unit(680);
                    RadEditor1.Style.Add("overflow", "auto");
                    break;
            }
        }


        protected void NewLineModeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem selectedItem = NewLineModeButtonList.SelectedItem;
            switch (selectedItem.Value)
            {
                case "P":
                    RadEditor1.NewLineMode = EditorNewLineModes.P;
                    break;
                case "Div":
                    RadEditor1.NewLineMode = EditorNewLineModes.Div;
                    break;
                default:
                    RadEditor1.NewLineMode = EditorNewLineModes.Br;
                    break;
            }
        }

        protected void CheckBoxListEditMode_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            bool IsDesignModeSelected = CheckBoxListEditMode.Items.FindByValue("Design").Selected;
            bool IsHtmlModeSelected = CheckBoxListEditMode.Items.FindByValue("Html").Selected;
            bool IsPreviewModeSelected = CheckBoxListEditMode.Items.FindByValue("Preview").Selected;

            if (!(IsDesignModeSelected || IsHtmlModeSelected || IsPreviewModeSelected))
            {
                CheckBoxListEditMode.Items.FindByValue("Design").Selected = true;
                CheckBoxListEditMode.Items.FindByValue("Html").Selected = true;
                CheckBoxListEditMode.Items.FindByValue("Preview").Selected = true;
                RadEditor1.EditModes = global::Telerik.Web.UI.EditModes.All;
                return;
            }
            RadEditor1.EditModes = global::Telerik.Web.UI.EditModes.All;
            if (!IsDesignModeSelected)
            {
                RadEditor1.EditModes = RadEditor1.EditModes ^ global::Telerik.Web.UI.EditModes.Design;
            }
            if (!IsHtmlModeSelected)
            {
                RadEditor1.EditModes = RadEditor1.EditModes ^ global::Telerik.Web.UI.EditModes.Html;
            }
            if (!IsPreviewModeSelected)
            {
                RadEditor1.EditModes = RadEditor1.EditModes ^ global::Telerik.Web.UI.EditModes.Preview;
            }

        }

        protected void CheckBoxListModules_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool IsRadEditorStatisticsSelected = CheckBoxListModules.Items.FindByValue("RadEditorStatistics").Selected;
            bool IsRadEditorDomInspectorSelected = CheckBoxListModules.Items.FindByValue("RadEditorDomInspector").Selected;
            bool IsRadEditorNodeInspector = CheckBoxListModules.Items.FindByValue("RadEditorNodeInspector").Selected;

            RadEditor1.Modules.Clear();
            if (IsRadEditorStatisticsSelected)
            {
                EditorModule moduleStatistics = new EditorModule();
                moduleStatistics.Name = "RadEditorStatistics";
                RadEditor1.Modules.Add(moduleStatistics);
            }

            if (IsRadEditorDomInspectorSelected)
            {
                EditorModule moduleDomInspector = new EditorModule();
                moduleDomInspector.Name = "RadEditorDomInspector";
                RadEditor1.Modules.Add(moduleDomInspector);
            }

            if (IsRadEditorNodeInspector)
            {
                EditorModule moduleNodeInspector = new EditorModule();
                moduleNodeInspector.Name = "RadEditorNodeInspector";
                RadEditor1.Modules.Add(moduleNodeInspector);
            }
        }

        private void SelectAllModules()
        {
            foreach (ListItem item in CheckBoxListModules.Items)
            {
                item.Selected = true;
            }
        }

        protected void RadioButtonToolsFile_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem selectedItem = RadioButtonToolsFile.SelectedItem;
            switch (selectedItem.Value)
            {
                case "FullSet":
                    RadEditor1.ToolsFile = "FullSetOfTools.xml";
                    SelectAllModules();
                    break;
                case "Default":
                    RadEditor1.ToolsFile = null;
                    RadEditor1.CssFiles.Add("~/App_Themes/Default/CustomStyles.css");
                    SelectAllModules();
                    break;
                case "BasicTools":
                    RadEditor1.ToolsFile = "BasicTools.xml";
                    CheckBoxListModules.SelectedIndex = -1;
                    break;
            }
        }
        protected void ChooseToolbarMode_TextChanged(object sender, EventArgs e)
        {
            global::Telerik.Web.UI.EditorToolbarMode OldMode = RadEditor1.ToolbarMode;
            global::Telerik.Web.UI.EditorToolbarMode NewMode = (global::Telerik.Web.UI.EditorToolbarMode)Enum.Parse(typeof(global::Telerik.Web.UI.EditorToolbarMode), ChooseToolbarMode.SelectedItem.Value);
            RadEditor1.ToolbarMode = NewMode;
            //Call EnsureToolsFileLoaded in order to load the right set of tools.
            //There is a different set for RibbonBar modes.
            RadEditor1.EnsureToolsFileLoaded();
            RadEditor1.CssClasses.Clear();
            RadEditor1.CssFiles.Add("~/App_Themes/Default/CustomStyles.css");
        }

        protected RadEditor RadEditor1;
        protected RadAjaxManager RadAjaxManager1;
        protected RadioButtonList RadioButtonListEnabled;
        protected RadioButtonList RadioButtonToolsFile;
        protected CheckBoxList CheckBoxListModules;
        protected CheckBoxList CheckBoxListEditMode;
        protected ListBox NewLineModeButtonList;
        protected RadioButtonList ChooseToolbarMode;
    }
}