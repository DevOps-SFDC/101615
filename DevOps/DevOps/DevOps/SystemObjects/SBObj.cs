using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DevOps.SystemObjects
{
    public class SBObj : DbInterface
    {
        DbInterface _dbi = new DbInterface();
        #region Script Bee


        #region Declaration
        private string _question, _answer, _difficulty, _status, _eid, _guestanswer, _capability, _project, _type, _title, _description, _message;
        private int _questionid, _userno;
        private DateTime? _date;
        #endregion

        #region Properties

        #region INT
        public Int32 QuestionID
        { set { _questionid = value; } }
        public Int32 UserNo
        { set { _userno = value; } }
        #endregion

        #region STRING
        public String Question
        { set { _question = value; } }
        public String Status
        { set { _status = value; } }
        public String Answer
        { set { _answer = value; } }
        public String Difficulty
        { set { _difficulty = value; } }
        public String EID
        { set { _eid = value; } }
        public String GuestAnswer
        { set { _guestanswer = value; } }
        public String Capability
        { set { _capability = value; } }
        public String Project
        { set { _project = value; } }
        public String Type
        { set { _type = value; } }
        public String Title
        { set { _title = value; } }
        public String Description
        { set { _description = value; } }
        public String Message
        { set { _message = value; } }
        #endregion

        #region DATE
        public DateTime? Date
        { set { _date = value; } }
        #endregion

        #endregion

        #region Functions
        public DataTable DisplayQuestionaires()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBDisplayQuestion", oParam);
        }

        public DataTable DisplayUnansweredQuestionaires()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBDisplayUnansweredQuestionaires", oParam);
        }

        public DataTable DisplayAnsweredQuestionaires()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBDisplayAnsweredQuestionaires", oParam);
        }

        public string AddQuestionaire()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@question", _question);
            oParam.AddWithValue("@answer", _answer);
            oParam.AddWithValue("@difficulty", _difficulty);
            try
            {
                this.ExecuteInsert(@"TBInsertQuestionaire", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string UpdateQuestionaire()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            oParam.AddWithValue("@question", _question);
            oParam.AddWithValue("@answer", _answer);
            oParam.AddWithValue("@difficulty", _difficulty);
            try
            {
                this.ExecuteInsert(@"TBUpdateQuestionaire", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable DisplayQuestionairesModal()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBDisplayQuestionInfo", oParam);
        }


        public string LaunchLiveQuestion()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBLaunchLiveQuestion", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable GetActiveQuestion()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBDisplayLiveQuestion", oParam);
        }

        public DataTable LoadActiveQuestion()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBLoadActiveQuestion", oParam);
        }

        //public DataTable GetUser()
        //{
        //    DataTable dt = new DataTable();
        //    var oParam = new SqlCommand().Parameters;
        //    oParam.AddWithValue("@eid", _eid);
        //    return dt = this.FGetDataTable(@"SBGetUser", oParam);
        //}

        public DataSet getLoginDetails(string lanid)
        {
            DataSet ds = new DataSet();
            //lanid = lanid.Remove(0, lanid.IndexOf('\\') + 1);
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@eid", lanid);
            return ds = _dbi.FGetDataSet(@"TBGetLoginDetails", oParam);
        }

        public DataTable DisplayQuestionairesModalD()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBDisplayQuestionInfo", oParam);
        }

        public string DeleteQuestionaire()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            oParam.AddWithValue("@question", _question);
            oParam.AddWithValue("@answer", _answer);
            oParam.AddWithValue("@difficulty", _difficulty);
            try
            {
                this.ExecuteInsert(@"TBDeleteQuestionaire", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }


        public string UpdateQuestionaireNotAnswered()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBUpdateQuestionaireNotAnswered", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable AlertCorrectAnswer()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBDisplayQuestionInfo", oParam);
        }

        public DataTable CheckAnswer()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            oParam.AddWithValue("@guestanswer", _guestanswer);
            return dt = this.FGetDataTable(@"SBCheckAnswer", oParam);
        }
        //public string CheckAnswer()
        //{
        //    string msg;
        //    var oParam = new SqlCommand().Parameters;
        //    oParam.AddWithValue("@questionid", _questionid);
        //    oParam.AddWithValue("@guestanswer", _guestanswer);
        //    try
        //    {
        //        this.ExecuteInsert(@"SBCheckAnswer", oParam);
        //        msg = "Updated!";
        //    }
        //    catch (Exception ex)
        //    {
        //        msg = ex.ToString();
        //    }

        //    return msg;
        //}



        public string UpdateCorrect()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            oParam.AddWithValue("@guestanswer", _guestanswer);
            oParam.AddWithValue("@eid", _eid);
            try
            {
                this.ExecuteInsert(@"SBUpdateCorrect", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable CheckifAnswered()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            return dt = this.FGetDataTable(@"SBCheckifAnswered", oParam);
        }


        public string RecycleUA()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBRecycleUA", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string RecycleUAA()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            //oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBRecycleUAA", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string RecycleA()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBRecycleA", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string RecycleAA()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            //oParam.AddWithValue("@questionid", _questionid);
            try
            {
                this.ExecuteInsert(@"SBRecycleAA", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public string AddAdmin()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@eid", _eid);
            oParam.AddWithValue("@capability", _capability);
            oParam.AddWithValue("@project", _project);
            try
            {
                this.ExecuteInsert(@"TBInsertAdmin", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }
        public DataTable DisplayUsers()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBGetUser", oParam);
        }
        public DataTable DisplayMakeAdmin()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@userno", _userno);
            return dt = this.FGetDataTable(@"SBDisplayUserInfo", oParam);
        }
        public string UpdateAdmin()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@userno", _userno);
            oParam.AddWithValue("@eid", _eid);
            oParam.AddWithValue("@capability", _capability);
            oParam.AddWithValue("@project", _project);
            oParam.AddWithValue("@type", _type);
            try
            {
                this.ExecuteInsert(@"SBUpdateUser", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable DisplayActivity()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBDisplayActivity", oParam);
        }

        public string AddActivity()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@title", _title);
            oParam.AddWithValue("@description", _description);
            oParam.AddWithValue("@date", _date);
            try
            {
                this.ExecuteInsert(@"SBInsertActivity", oParam);
                msg = "Saved!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable LoadTop1()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@userno", _userno);
            return dt = this.FGetDataTable(@"SBTop1", oParam);
        }

        public DataTable LoadTop2()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@userno", _userno);
            return dt = this.FGetDataTable(@"SBTop2", oParam);
        }

        public DataTable LoadTop3()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@userno", _userno);
            return dt = this.FGetDataTable(@"SBTop3", oParam);
        }

        public string InsertRegistration()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@eid", _eid);
            oParam.AddWithValue("@capability", _capability);
            oParam.AddWithValue("@project", _project);
            try
            {
                this.ExecuteInsert(@"TBInsertRegistration", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }

        public DataTable DisplayChat()
        {
            DataTable dt = new DataTable();
            var oParam = new SqlCommand().Parameters;
            return dt = this.FGetDataTable(@"SBGetChat", oParam);
        }

        public string InsertChat()
        {
            string msg;
            var oParam = new SqlCommand().Parameters;
            oParam.AddWithValue("@eid", _eid);
            oParam.AddWithValue("@message", _message);
            try
            {
                this.ExecuteInsert(@"SBInsertChat", oParam);
                msg = "Updated!";
            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;
        }
        #endregion


        #endregion

    }
}