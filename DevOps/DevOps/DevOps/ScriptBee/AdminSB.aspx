<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminSB.aspx.cs" Inherits="DevOps.ScriptBee.AdminSB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #gridQuestiondetails > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
            
        }

        #gridQuestiondetails > tbody > tr:first-child {
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

    <div id="page-wrapper" style="padding-top: 50px">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-question-circle fa-fw"></i>Question Launcher</h1>
            </div>
        </div>

        <div class="row">
             <div class="col-lg-12">
            </div>
        </div>

        <div id="questionform" class="panel panel-body well well-lg">
            <div class="col-xs-12">
                <div class="col-md-12">
                  <h1> Live Session</h1>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="hidden" id="questionid" />
                        <label>Question :</label>
                        <textarea id="question" cols="100" rows="3" placeholder="What is your Question?" class="form-control" readonly></textarea>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="col-md-3">

                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Correct Answer :</label>
                        <input type="text" id="answer" class="form-control" placeholder="Your Answer.." readonly />
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Difficulty :</label>
                        <input type="text" id="difficulty" class="form-control" placeholder="difficulty" readonly />
                    </div>
                </div>

            </div>


            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
        </div>

        <div class="panel panel-body" id="questiondetails">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="gridQuestiondetails" class="table table-bordered dataTable">
                                <thead>
                                    <tr>
                                        <th>Question ID</th>
                                        <th>Question</th>
                                        <th>Answer</th>
                                        <th>Diffuculty</th>
                                        <th>Status</th>
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




        <div class="modal fade" id="timeinuserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="myModalLabel">Update Questionaires</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" id="txtquestionid" />
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <label>Question :</label>
                                    <textarea id="txtquestion" cols="100" rows="3" placeholder="What are your Question?" class="form-control" readonly></textarea>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-6">
                                    <label>Answer :</label>
                                    <input type="text" id="txtanswer" class="form-control" readonly />
                                </div>
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-4">
                                    <label>Difficulty :</label>
                                    <input type="text" id="txtdifficulty" class="form-control"  readonly />
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>

                    <div class="modal-footer">
                        <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btnlaunch" type="button" class="btn btn-success" data-dismiss="modal">Launch</button>
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
                    $('#questionid').val(0);
                    DisplayQuestionaires();
                    refreshquestionform()
                    setInterval(CheckdbAnswered, 500);
                }
            })
        }



        function refreshquestionform() {
            $('#quesitonid').val(0);
            $('#question').val('');
            $('#answer').val('');
            $('#difficulty').val('');

        }

        $('#btnlaunch').click(function () {
            LaunchLiveQuestion();
        })

        function DisplayQuestionaires() {
            $('#gridQuestiondetails').dataTable().fnDestroy();
            $('#gridQuestiondetails > tbody > tr').remove();
            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "AdminSB.aspx/displayQuestionaires",
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

                        col += $(this).find("QuestionID").text() + '</td> <td>';
                        col += $(this).find("Question").text() + '</td> <td>';
                        col += $(this).find("Answer").text() + '</td> <td>';
                        col += $(this).find("Difficulty").text() + '</td> <td>';
                        col += $(this).find("Status").text() + '</td> <td>';
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("QuestionID").text() + '"/> <a id="questionedit" class="questionedit" data-toggle="modal" data-target="#timeinuserModal" href="#"><i class="fa fa-edit fa-fw"></i> Launch Question</a> </td>';

                        $("[id*=gridQuestiondetails] tbody").append($(row).append(col));
                    })
                    $('.questionedit').click(function () {
                        DisplayQuestionairesModal($(this).prev().val());
                    });
                    $('#gridQuestiondetails').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        function DisplayQuestionairesModal(questid) {
            $.ajax({
                type: "POST",
                url: "AdminSB.aspx/displayQuestionairesModal",
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

                    $('#txtquestionid').val($(this).find("QuestionID").text());
                    $('#txtquestion').val($(this).find("Question").text());
                    $('#txtanswer').val($(this).find("Answer").text());
                    $('#txtdifficulty').val($(this).find("Difficulty").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function LaunchLiveQuestion() {
            var arr = new Array();
            arr[0] = $('#txtquestionid').val();
            $.ajax({
                type: "POST",
                url: "AdminSB.aspx/launchLiveQuestion",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                if ($('#questionid').val() == 0) {
                    GetActiveQuestion($('#txtquestionid').val());
                }
                else {
                    alert('You already load a Question!..');
                }
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        function GetActiveQuestion(questid) {
            $.ajax({
                type: "POST",
                url: "AdminSB.aspx/getActiveQuestion",
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

                    $('#questionid').val($(this).find("QuestionID").text());
                    $('#question').val($(this).find("Question").text());
                    $('#answer').val($(this).find("Answer").text());
                    $('#difficulty').val($(this).find("Difficulty").text());
                    alert('Question is Loaded..');
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }
        

        function CheckdbAnswered() {
            CheckifAnswered($('#questionid').val());
        }

        function CheckifAnswered(questid) {

            $.ajax({
                type: "POST",
                url: "AdminSB.aspx/checkifAnswered",
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
                    $('#questionid').val(0);
                    alert($(this).find("EID").text() + '\n Got the right answer on Question ID \n' + $(this).find("QuestionID").text() + '\n + ' + $(this).find("Points").text());
                    refreshquestionform();
                    DisplayQuestionaires();

                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

    </script>
</asp:Content>
