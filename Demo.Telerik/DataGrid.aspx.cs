using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using Telerik.Web.UI;
using Telerik.Web.UI.PersistenceFramework;

namespace Demo.Telerik
{
    public class SessionStorageProvider : IStateStorageProvider
    {
        private System.Web.SessionState.HttpSessionState session = HttpContext.Current.Session;
        string storageKey;

        public SessionStorageProvider(string key)
        {
            storageKey = key;
        }

        public void SaveStateToStorage(string key, string serializedState)
        {
            session[storageKey] = serializedState;
        }

        public string LoadStateFromStorage(string key)
        {
            if (session[key] == null)
            {
                return String.Empty;
            }
            return session[key].ToString();
        }
    }

    public class DataGrid : Page
    {
        protected RadPersistenceManager RadPersistenceManager1;
        protected RadGrid RadGrid1;

        protected string NormalizeValue(object inputValue)
        {
            return inputValue.ToString().Replace(" ", "");
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            RadPersistenceManager1.StorageProvider = new SessionStorageProvider(RadPersistenceManager1.StorageProviderKey);

            GridFilterMenu filterMenu = RadGrid1.FilterMenu;

            int currentItemIndex = 0;
            while (currentItemIndex < filterMenu.Items.Count)
            {
                RadMenuItem item = filterMenu.Items[currentItemIndex];
                if (item.Text.Contains("Empty") || item.Text.Contains("Null"))
                {
                    filterMenu.Items.Remove(item);
                }
                else currentItemIndex++;
            }
        }

        protected string GetCarImageUrl(object container)
        {
            Hashtable values = new Hashtable();
            (container as GridNestedViewItem).ParentItem.ExtractValues(values);
            return String.Format("~/Grid/Examples/Overview/Images/Cars/{0}_{1}.png", NormalizeValue(values["BrandName"]), NormalizeValue(values["Model"]));
        }

        private void CollapseAllRows()
        {
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                item.Expanded = false;
            }
        }

        protected void BrandNameCombo_DataBound(object sender, EventArgs e)
        {
            RadComboBox combo = sender as RadComboBox;
            foreach (RadComboBoxItem item in combo.Items)
            {
                item.ImageUrl = String.Format("~/Grid/Examples/Overview/Images/SmallLogos/{0}.png", NormalizeValue(item.Text));
            }
        }

        protected void SaveSettingsButton_Click(object sender, EventArgs e)
        {
            RadPersistenceManager1.SaveState();
        }

        protected void LoadSettingsButton_Click(object sender, EventArgs e)
        {
            RadPersistenceManager1.LoadState();
            RadGrid1.Rebind();
        }
    }
}