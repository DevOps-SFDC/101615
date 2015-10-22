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


namespace DevOps.ScriptBee
{
    public partial class AdminSB : System.Web.UI.Page
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
        public static string displayQuestionaires(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SBObj _sbobj = new SBObj();
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.DisplayQuestionaires());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayQuestionairesModal(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.DisplayQuestionairesModal());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string launchLiveQuestion(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());

            return _sbobj.LaunchLiveQuestion();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string getActiveQuestion(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.GetActiveQuestion());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string checkifAnswered(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.CheckifAnswered());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        //public static string checkifAnswered(Int32 questid)
        //{
        //    SBObj _sbobj = new SBObj();
        //    _sbobj.QuestionID = questid;
        //    DataSet ds = new DataSet();
        //    try
        //    {
        //        ds.Tables.Add(_sbobj.CheckifAnswered());
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return ds.GetXml();
        //}

    }
}