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

namespace DevOps.Questionaire
{
    public partial class Questionaire : System.Web.UI.Page
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
        public static string addQuestionaire(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.Question = _arr[0].ToString();
            _sbobj.Answer = _arr[1].ToString();
            _sbobj.Difficulty = _arr[2].ToString();
            return _sbobj.AddQuestionaire();
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
        public static string updateQuestionaire(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            _sbobj.Question = _arr[1].ToString();
            _sbobj.Answer = _arr[2].ToString();
            _sbobj.Difficulty = _arr[3].ToString();
            
            return _sbobj.UpdateQuestionaire();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string displayQuestionairesModalD(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.DisplayQuestionairesModalD());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }


        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string deleteQuestionaire(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            _sbobj.Question = _arr[1].ToString();
            _sbobj.Answer = _arr[2].ToString();
            _sbobj.Difficulty = _arr[3].ToString();

            return _sbobj.DeleteQuestionaire();
        }

    }
}