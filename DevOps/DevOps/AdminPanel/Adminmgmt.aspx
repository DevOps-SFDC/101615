<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adminmgmt.aspx.cs" Inherits="DevOps.AdminPanel.Adminmgmt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #gridUserLogs > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridUserLogs > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }

        #timeinuserModal .modal-dialog {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div id="page-wrapper" style="padding-top: 3%">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-cubes fa-fw"></i>User Management</h1>
            </div>
        </div>

        <div class="row">
             <div class="col-lg-12">
                <br />
                <button id="addadmin" type="button" class="btn btn-success pull-right"><i class="fa fa-plus fa-fw"></i> Add Administrator</button>
                <div class="clearfix"></div>
            </div>
        </div>

        <div id="adminform" class="panel panel-body" style="display: none;">
            <div class="panel-body">
            </div>
            <div class="col-xs-12">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>EID :</label>
                        <textarea id="eid" cols="100" rows="3" placeholder="Enterprise ID" class="form-control"></textarea>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-xs-12">

                <div class="col-xs-3">
                    <div class="form-group">
                        <label>Capability :</label>
                        <input type="text" id="capability" class="form-control" placeholder="Capability.." />
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="form-group">
                        <label>Project Name :</label>
                        <input type="text" id="project" class="form-control" placeholder="Project Name.." />
                    </div>
                </div>

            </div>


            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
            <div class="pull-right">
                <button id="cancel" type="button" class="btn btn-success"><i class="fa fa-close fa-fw"></i>Cancel</button>
                <button id="add" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>Create Administrator</button>
            </div>
        </div>

        <div class="panel panel-body" id="userdetails">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="gridUserLogs" class="table table-bordered dataTable">
                                <thead>
                                    <tr>
                                        <th>EID</th>
                                        <th>Capability</th>
                                        <th>Project Name</th>
                                        <th>Points</th>
                                        <th>Last Login</th>
                                        <th>User Type</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="madmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="myModalLabel">Make Administrator</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" id="usernoa" />
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <label>Question :</label>
                                    <input type="text" id="eida" class="form-control" />
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-6">
                                    <label>Capability :</label>
                                    <input type="text" id="capabilitya" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-4">
                                    <label>Project Name :</label>
                                    <input type="text" id="projecta" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>

                    <div class="modal-footer">
                        <button id="closemodala" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btnupdate" type="button" class="btn btn-success" data-dismiss="modal">Update</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="muser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="myModalLabel1">Make User</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" id="usernou" />
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <label>Question :</label>
                                    <input type="text" id="eidu" class="form-control" />
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-6">
                                    <label>Capability :</label>
                                    <input type="text" id="capabilityu" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-4">
                                    <label>Project Name :</label>
                                    <input type="text" id="projectu" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>

                    <div class="modal-footer">
                        <button id="closemodalu" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btndelete" type="button" class="btn btn-success" data-dismiss="modal">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        var prm = new Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(initializer);
        prm.add_endRequest(ender);
        prm.add_pageLoaded(loader);

        function initializer(sender, args) {

        }

        function ender(sender, args) {

        }
        function loader(sender, args) {
            $(document).ready(function () {
                if ('<%: Session["Type"]%>' == 'User') {
                    alert('You are not Authorized to use this Tool!..');
                    window.location.href = "/Default.aspx";
                }
                else if ('<%: Session["Type"]%>' == 'Administrator'); {
                    DisplayUsers();
                }
            })
        }

        //Add Questionaire Button Clicked Function
        $('#addadmin').click(function () {
            $('#adminform').slideDown('slow');
            $('#userdetails').slideUp('slow');
            refreshquestionform();
        })

        //Cancel Add Question Button Clicked Function
        $('#cancel').click(function () {
            $('#adminform').slideUp('slow');
            $('#userdetails').slideDown('slow');
            refreshquestionform();
        })


        //Save Question Button Clicked Function
        $('#add').click(function () {
            ValidateQuestionForm();
        })

        //Update Question Button Clicked Function
        $('#btnupdate').click(function () {
            ValidateModalQuestionaire();
        })

        //Delete Question Button Clicked Function
        $('#btndelete').click(function () {
            UpdateUser();
        })

        //Validations

        //Reset Value of question form to NULL
        function refreshquestionform() {
            $('#eid').val('');
            $('#capability').val('');
            $('#project').val('');
        }

        //Validate Question form if the field is NULL
        function ValidateQuestionForm() {
            if ($('#eid').val() == '') {
                alert('Please Insert a Enterprise ID!..');
                $('#eid').focus();
            }
            else {
                AddAdmin();
            }
        }

        //Validate Modal Questionaire if the Field is Changed or Null
        function ValidateModalQuestionaire() {
            if ($('#eida').val() == '') {
                alert('Please Insert a Enterprise ID!..');
                $('#eida').focus();
            }
            else {
                UpdateAdmin();
            }
        }

        //Display Questionaires from database to Datatable
        function DisplayUsers() {

            $('#gridUserLogs').dataTable().fnDestroy();
            $('#gridUserLogs > tbody > tr').remove();


            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/displayUsers",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var ctm = xml.find("Table1");
                    $.each(ctm, function () {
                        var ctm = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("EID").text() + '</td> <td>';
                        col += $(this).find("Capability").text() + '</td> <td>';
                        col += $(this).find("Project").text() + '</td> <td>';
                        col += $(this).find("Points").text() + '</td> <td>';
                        col += $(this).find("LastLogin").text() + '</td> <td>';
                        col += $(this).find("Type").text() + '</td> <td>';
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("UserNo").text() + '"/> <a id="makeadmin" class="makeadmin" data-toggle="modal" data-target="#madmin" href="#"><i class="glyphicon glyphicon-chevron-up"></i> Make Admin</a> <br /> <a id="makeuser" class="makeuser" data-toggle="modal" data-target="#muser" href="#"><i class="glyphicon glyphicon-chevron-down"></i> Make User</a> </td>';

                        $("[id*=gridUserLogs] tbody").append($(row).append(col));
                    })
                    $('.makeadmin').click(function () {
                        //alert($(this).prev().val());
                        DisplayMakeAdmin($(this).prev().val());
                    });

                    $('.makeuser').click(function () {
                        DisplayMakeUser($(this).prev().prev().prev().val());
                    });
                    $('#gridUserLogs').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        //Insert Questionaires to database
        function AddAdmin() {
            var arr = new Array();
            arr[0] = $('#eid').val();
            arr[1] = $('#capability').val();
            arr[2] = $('#project').val();

            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/addAdmin",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {

                $('#adminform').slideUp('slow');
                $('#userdetails').slideDown('slow');
                refreshquestionform();

                alert('New Administrator is Created! ');
                DisplayUsers();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        //Display Questionaire to Modal Update
        function DisplayMakeAdmin(questid) {
            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/displayMakeAdmin",
                data: '{questid: ' + questid + '}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });
            function AjaxSucceeded(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var exkeys = xml.find("Table1");
                $.each(exkeys, function () {
                    $('#usernoa').val($(this).find("UserNo").text());
                    $('#eida').val($(this).find("EID").text());
                    $('#capabilitya').val($(this).find("Capability").text());
                    $('#projecta').val($(this).find("Project").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        //Update the Questionaires to database
        function UpdateAdmin() {
            var arr = new Array();
            arr[0] = $('#usernoa').val();
            arr[1] = $('#eida').val();
            arr[2] = $('#capabilitya').val();
            arr[3] = $('#projecta').val();
            arr[4] = 'Administrator';

            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/updateAdmin",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayUsers();
                alert('User Updated to Administrator! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }


        //Display Questionaire to Modal Delete 
        function DisplayMakeUser(questid) {
            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/displayMakeAdmin",
                data: '{questid: ' + questid + '}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });
            function AjaxSucceeded(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var exkeys = xml.find("Table1");
                $.each(exkeys, function () {

                    $('#usernou').val($(this).find("UserNo").text());
                    $('#eidu').val($(this).find("EID").text());
                    $('#capabilityu').val($(this).find("Capability").text());
                    $('#projectu').val($(this).find("Project").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function UpdateUser() {
            var arr = new Array();
            arr[0] = $('#usernou').val();
            arr[1] = $('#eidu').val();
            arr[2] = $('#capabilityu').val();
            arr[3] = $('#projectu').val();
            arr[4] = 'User';

            $.ajax({
                type: "POST",
                url: "Adminmgmt.aspx/updateAdmin",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayUsers();
                alert('Administrator Updated to User! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }
      

    </script>
</asp:Content>
