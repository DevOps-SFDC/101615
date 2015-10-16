using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevOps.SystemObjects;
using System.Web.Services;
using System.Web.Script.Services;

namespace DevOps.AdminPanel
{
    public partial class Adminmgmt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                dummyTable();
            }
        }

        private void dummyTable()
        {

        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string addAdmin(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.EID = _arr[0].ToString();
            _sbobj.Capability = _arr[1].ToString();
            _sbobj.Project = _arr[2].ToString();
            return _sbobj.AddAdmin();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayUsers(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SBObj _sbobj = new SBObj();
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.DisplayUsers());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayMakeAdmin(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.UserNo = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.DisplayMakeAdmin());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateAdmin(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.UserNo = Convert.ToInt32(_arr[0].ToString());
            _sbobj.EID = _arr[1].ToString();
            _sbobj.Capability = _arr[2].ToString();
            _sbobj.Project = _arr[3].ToString();
            _sbobj.Type = _arr[4].ToString();
            return _sbobj.UpdateAdmin();
        }
    }
}