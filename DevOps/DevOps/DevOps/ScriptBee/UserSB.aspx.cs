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
    public partial class UserSB : System.Web.UI.Page
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
        public static string loadActiveQuestion(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.LoadActiveQuestion());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateQuestionaireNotAnswered(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());

            return _sbobj.UpdateQuestionaireNotAnswered();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string alertCorrectAnswer(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.AlertCorrectAnswer());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }



        //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        //public static string checkAnswer(Int32 questid)
        //{
        //    SBObj _sbobj = new SBObj();
        //    _sbobj.QuestionID = questid;
        //    DataSet ds = new DataSet();
        //    try
        //    {
        //        ds.Tables.Add(_sbobj.CheckAnswer());
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return ds.GetXml();
        //}

        //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        //public static string checkAnswer(List<string> _arr)
        //{
        //    SBObj _sbobj = new SBObj();

        //    _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
        //    _sbobj.GuestAnswer = _arr[1].ToString();
        //    return _sbobj.CheckAnswer();
        //}


        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string checkAnswer(List<string> _arr)
        {
            DataSet ds = new DataSet();
            SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            _sbobj.GuestAnswer = _arr[1].ToString();
            try
            {
                ds.Tables.Add(_sbobj.CheckAnswer());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }



        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateCorrect(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            _sbobj.GuestAnswer = _arr[1].ToString();
            _sbobj.EID = _arr[2].ToString();

            return _sbobj.UpdateCorrect();
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

    }
}