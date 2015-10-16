<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DevOps.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="Images/BOB.png" type="image/png" />
    <title>DevOps Battle of the Brains</title>
    <!-- Bootstrap Core CSS -->
    <link href="~/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="~/bootstrap/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet" />

    <!-- Timeline CSS -->
    <link href="~/bootstrap/css/plugins/timeline.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="~/bootstrap/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Morris Charts CSS -->
    <link href="~/bootstrap/css/plugins/morris.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="~/bootstrap/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <%-- jQuery UI CSS --%>
    <link href="~/Content/jquery-ui.css" rel="stylesheet" />

    <!-- Custom Overlay -->
    <link href="~/Content/overlay.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>

    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
        body {
            background: url('Images/building.jpg') scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            padding-bottom: 500px;
        }
        .loginContainer {
            height: 100%;
            width: 100%;
            margin-top: 1%;
        }

        .loginHeadWrapper {
            height: 2%;
            width: inherit;
        }

        .loginBodyWrapper {
            height: 95%;
            width: inherit;
        }

        .loginFormContainer {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 6px;
            box-shadow: rgba(0, 0, 0, 0.45) 2px 0px 2px; 
            height: 330px;
            margin-top: 6%;
            margin-left: 25%;
            width: 290px;
        }

        .loginFormBanner {
            color: #FFF;
            font-family: 'Lato',serif;
            font-size: 60px;
            padding: 20px;
            text-shadow: 2px 0px 2px rgba(0, 0, 0, 0.8);
        }

        .loginTitle {
            color: #FFF; 
            font-family: 'Lato', serif; 
            font-size: 25px;
            font-weight: 300;
            margin-left: 8px;
            margin-top: 20px;
            text-shadow: 1px 1px 1px rgb(0, 0, 0);
        }

        .loginFormHeader {
            color: #000;
            font-family: 'Lato',serif;
            font-size: 22px;
            font-weight: 300;
            padding: 2px;
            padding-top: 20px;
            text-align: center;
        }

        .btnForgot, .btnLogin, .btnRegister {
            margin-top: 10px;
            width: 220px;
            transition: all 0.2s ease-in-out;
        }

        .btnForgot:hover, .btnLogin:hover, .btnRegister:hover {
            color: #000;
            background: rgba(0, 0, 0, 0);
            border: 1px solid rgba(0, 0, 0, 1);
            font-weight: 500;
        }

        .btnGoBack {
            background: rgba(255, 255, 255, 0);
            border: 0px;
            color: #000;
            font-size: 15px;
            transition: all 0.5s ease-in-out;
        }

        .btnGoBack:hover {
            background: rgba(255, 255, 255, 0);
            border: 0px;
            color: rgba(150, 40, 27, 1);
        }
    </style>
    <link href="~/bootstrap/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet" />
</head>
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
<body>
    
    <!-- Container -->
    <div class="loginContainer container-fluid">
        <div class="loginHeadWrapper">
            <img src="Images/BOB.png" style="height: 60px; width: 60px" />
            <span class="loginTitle">
                DevOps Battle of the Brains
            </span>
        </div>
        <div class="loginBodyWrapper" style="vertical-align: central">

            <div class="loginFormContainer loginForm" style="display: inline-block" hidden="hidden">
                <div class="loginFormHeader">
                    <span> <img src="Images/BOB.png" style="height: 40px; width: 40px" /> Sign in to Your Account</span>
                    <hr style="color: #000; margin-top: 5px; margin-bottom: 22px" />
                    <form id="signin" class="navbar-form navbar-right" role="form" runat="server" style="padding-left: 5px">
                    <div class="input-group" style="margin-bottom: 10px">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enterprise ID" ClientIDMode="Static" />
                    </div>
       
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btnLogin" Text="Sign In" OnClick="btnLogin_Click" OnClientClick="return validateCheck()" /><br />
                    </form>
                    <button id="btnRegisterHome" class="btn btn-info btnRegister">Register</button> 
                    <br />
                    <asp:Label ID="malingmensahe" runat="server"></asp:Label>
                    <%--<a href="https://directory.accenture.com/ChangePassword/ManagedPC.aspx" class="btn btn-success btnForgot">Can&rsquo;t Remember Password</a>--%>
                </div>
            </div>

            <div class="loginFormContainer registerForm" style="display: none">
                <div class="loginFormHeader">
                    <span> <img src="Images/BOB.png" style="height: 40px; width: 40px" /> Sign in to Your Account</span>
                    <hr style="color: #000; margin-top: 5px; margin-bottom: 22px" />
                    <form id="Form1" class="navbar-form navbar-right" role="form" style="padding-left: 5px">
                    <div class="input-group" style="margin-bottom: 10px">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" id="EID" class="form-control" placeholder="Enterprise ID" />
                    </div>
                    <div class="input-group" style="margin-bottom: 10px">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" id="CAP" class="form-control" placeholder="Capability" />
                    </div>
                    <div class="input-group" style="margin-bottom: 10px">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" id="PRO" class="form-control" placeholder="Project" />
                    </div>       
                        <button type="button" id="REG" class="btn btn-primary">Register</button><br />
                    <%--<button id="REG" class="btn btn-primary btnRegister btnRegisterNow">Register</button><br /> --%>
                    <button id="GBC" class="btn btn-info btnGoBack"><i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;&nbsp;Go Back</button><br /> 
                    </form>
                </div>
            </div>
            <div class="loginFormBanner" style="display: inline-block; a">
                <span style="margin-left: 1%; margin-top: 400px;">Ready to Take <br /> &nbsp;the Challenge?</span>
            </div>
        </div>
    </div>

    <script src="Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">


           $(document).ready(function () {

               $('#btnRegisterHome').click(function () {
                   $('.loginForm').hide();
                   $('.registerForm').css({ display: 'inline-block' }, "fast");

               });



               //$('#btnGoBack').click(function () {
               //    console.log('Hello');
               //    $('.loginForm').show();
               //    $('.registerForm').css({ display: 'inline-block' }, "fast");
               //});
           })
       


        function validateCheck() {
            var valid = true;
            var x = document.getElementById("txtUserName").value;
            var y = document.getElementById("txtPassword").value;
            if (x == "") {
                alert("Empty Lan ID..");
                valid = false;
            }
            else if (y == "") {
                alert("Empty Password..");
                valid = false;
            }
            return valid;
        }


        $('#REG').click(function () {
            if ($('#EID').val() == '') {
                alert('Please Insert Your Enterprise ID!..');
                $('#EID').focus();
            }
            else {
                InsertRegistration();
            }

        })
     
        function InsertRegistration() {
            var arr = new Array();
            arr[0] = $('#EID').val();
            arr[1] = $('#CAP').val();
            arr[2] = $('#PRO').val();
            //arr[2] = '<%: Session["lanid"] %>'
            $.ajax({
                type: "POST",
                url: "Login.aspx/insertRegistration",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                //SUCESS SUCCESS
                alert('You are now Registered!.. ');
                $('.btnGoBack').click();

            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }



    </script>

</body>

</html>
