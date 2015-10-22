using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Runtime.InteropServices;
using System.Web.Script.Services;
using DevOps.SystemObjects;
using System.Collections.Generic;
using System.Web.Services;

namespace DevOps
{
    public partial class Login : System.Web.UI.Page
    {
        [DllImport("ADVAPI32.dll", EntryPoint = "LogonUserW", SetLastError = true, CharSet = CharSet.Auto)]
        public static extern bool LogonUser(string lpszUsername,
        string lpszDomain, string lpszPassword, int dwLogonType,
        int dwLogonProvider, ref IntPtr phToken);

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
            if (!IsPostBack)
            {


                //if (Request.Cookies["lanid"] != null)
                //    txtUserName.Text = Request.Cookies["lanid"].Value;
                ////if (Request.Cookies["pwd"] != null)
                ////    txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
                //if (Request.Cookies["lanid"] != null && Request.Cookies["pwd"] != null)
                //    //    chkRememberMe.Checked = true;

                //    if (Request.Cookies["lanid"] != null && Request.Cookies["pwd"] != null)
                //        Response.Redirect("Default.aspx", true);
            }
        }


        public static string GetDomainName(string usernameDomain)
        {
            if (string.IsNullOrEmpty(usernameDomain))
            {
                throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            }
            if (usernameDomain.Contains("\\"))
            {
                int index = usernameDomain.IndexOf("\\");
                return usernameDomain.Substring(0, index);
            }
            else if (usernameDomain.Contains("@"))
            {
                int index = usernameDomain.IndexOf("@");
                return usernameDomain.Substring(index + 1);
            }
            else
            {
                return "";
            }
        }

        public static string GetUsername(string usernameDomain)
        {
            if (string.IsNullOrEmpty(usernameDomain))
            {
                throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            }
            if (usernameDomain.Contains("\\"))
            {
                int index = usernameDomain.IndexOf("\\");
                return usernameDomain.Substring(index + 1);
            }
            else if (usernameDomain.Contains("@"))
            {
                int index = usernameDomain.IndexOf("@");
                return usernameDomain.Substring(0, index);
            }
            else
            {
                return usernameDomain;
            }
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://directory.accenture.com/ChangePassword/ManagedPC.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://directory.accenture.com/ChangePassword/ManagedPC.aspx");
        }



        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SBObj _sbobj = new SBObj();

            Session["errMSG"] = "";
            Session["lanid"] = txtUserName.Text;
            if (txtUserName.Text == "")
            {
                Session["errMSG"] = "Invalid EID";
                malingmensahe.ForeColor = System.Drawing.Color.Red;
                malingmensahe.Text = "Invalid EID";
            }
            else
            {
                try
                {
                    if (Session["errMSG"].ToString().Equals(string.Empty))
                    {

                        DataTable dt = new DataTable();
                        dt = _sbobj.getLoginDetails((string)Session["lanid"]).Tables[0];
                        if (dt.Rows.Count == 0)
                        {

                            Session["errMSG"] = "Something Went Wrong";
                            Response.Redirect("~/Login.aspx");


                        }
                        else
                        {
                            DataSet ds = new DataSet();
                            ds = _sbobj.getLoginDetails((string)Session["lanid"]);

                            foreach (DataRow drow in ds.Tables[0].Rows)
                            {
                                Session["Type"] = drow["Type"].ToString();
                                Session["lanid"] = drow["EID"].ToString();
                                Response.Redirect("~/Default.aspx");
                                Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(1);
                                //Response.Cookies["lanid"].Value = txtUserName.Text.Trim();


                            }
                        }

                    }

                    else
                    {

                    }
                }
                catch (Exception)
                {
                    //Response.Redirect("~/Login.aspx");
                    //malingmensahe.ForeColor = System.Drawing.Color.Red;
                    //malingmensahe.Text = "Invalid EID";
                    //throw;
                }
            }

        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string insertRegistration(List<string> _arr)
        {
            SBObj _sbobj = new SBObj();

            _sbobj.EID = _arr[0].ToString();
            _sbobj.Capability = _arr[1].ToString();
            _sbobj.Project = _arr[2].ToString();

            return _sbobj.InsertRegistration();
        }

    }
}



/////OLD CODE COOKIES ON DOMAIN

//Session Checker
//if ((chkRememberMe.Checked == true))
//{
//    Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(12);
//    Response.Cookies["pwd"].Expires = DateTime.Now.AddHours(12);
//}
//else
//{
//    Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(-1);
//    Response.Cookies["pwd"].Expires = DateTime.Now.AddHours(-1);
//}
//Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(-1);
//Response.Cookies["pwd"].Expires = DateTime.Now.AddHours(-1);
//Response.Cookies["lanid"].Value = txtUserName.Text.Trim();
//Response.Cookies["pwd"].Value = txtPassword.Text.Trim();


//string domainName = GetDomainName(txtUserName.Text);
//// Extract user name 
//string userName = GetUsername(txtUserName.Text);  
////from provided DomainUsername e.g Domainname\Username
//IntPtr token = IntPtr.Zero;
//bool result = LogonUser(userName, domainName, txtPassword.Text, 2, 0, ref token);
//if (result)
//{
//    if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
//    {
//        FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
//        Session["lanid"] = userName;
//        Response.Redirect("Default.aspx");

//    }
//    else
//    {
//        //FormsAuthentication.SetAuthCookie(txtUserName.Text, false);
//        //Response.Redirect("Success.aspx");
//        //Prompt cannot access / error or unauthorized account
//    }
//}
//else
//{
//    txtUserName.Focus();
//}