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
        public static string checkQuizStatus(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();
            _sbobj.QuestionID = Convert.ToInt32(_arr[0]);
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.CheckQuizStatus());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
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

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string loadChoices(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.LoadChoices());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        //OLD Check Answer
        //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        //public static string checkAnswer(List<string> _arr)
        //{
        //    DataTable dummy = new DataTable();

        //    SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();
        //    _sbobj.QuestionID = Convert.ToInt32(_arr[0]);
        //    _sbobj.GuestAnswer = _arr[1].ToString();
        //    _sbobj.EID = _arr[2].ToString();
        //    DataSet ds = new DataSet();
        //    try
        //    {
        //        dummy.Merge(_sbobj.CheckAnswer());
        //        ds.Tables.Add(dummy);
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return ds.GetXml();
        //}

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string checkAnswer(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();
            _sbobj.QuestionID = Convert.ToInt32(_arr[0]);
            _sbobj.GuestAnswer = _arr[1].ToString();
            _sbobj.EID = _arr[2].ToString();
            _sbobj.TimeAnswered = Convert.ToDecimal(_arr[3].ToString());
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.CheckAnswer());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }



        //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        //public static string checkAnswer(List<string> _arr)
        //{
        //    DataSet ds = new DataSet();
        //    SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();

        //    _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
        //    _sbobj.GuestAnswer = _arr[1].ToString();
        //    try
        //    {
        //        ds.Tables.Add(_sbobj.CheckAnswer());
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return ds.GetXml();
        //}



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

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateQuizbeeStatus(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            return _sbobj.UpdateQuizbeeStatus();
        }
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateQuizbeeStatusI(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.QuestionID = Convert.ToInt32(_arr[0].ToString());
            return _sbobj.UpdateQuizbeeStatusI();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string loadQuestionIDforNewinRoom(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.LoadQuestionIDforNewinRoom());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string checkifnotAnswered(Int32 questid)
        {
            SBObj _sbobj = new SBObj();
            _sbobj.QuestionID = questid;
            DataSet ds = new DataSet();
            try
            {
                ds.Tables.Add(_sbobj.CheckifnotAnswered());
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string updateUserSBStatus(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.EID = _arr[1].ToString();
            return _sbobj.UpdateUserSBStatus();
        }


        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string checkifQuizBeeStatusisActive(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();
            _sbobj.EID = _arr[0].ToString();
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.CheckifQuizBeeStatusisActive());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string loadScore(List<string> _arr)
        {
            DataTable dummy = new DataTable();

            SystemObjects.SBObj _sbobj = new SystemObjects.SBObj();
            _sbobj.EID = _arr[0];
            DataSet ds = new DataSet();
            try
            {
                dummy.Merge(_sbobj.LoadScore());
                ds.Tables.Add(dummy);
            }
            catch (Exception ex)
            {

            }
            return ds.GetXml();
        }
    }
}