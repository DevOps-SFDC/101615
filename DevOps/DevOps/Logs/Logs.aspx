<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="DevOps.Logs.Logs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #gridAvailQuestion > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
            
        }

        #gridAvailQuestion > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }

        #gridUnansweredQuest > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridUnansweredQuest > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }

        #gridAnsweredQuest > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridAnsweredQuest > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }

        #timeinuserModal .modal-dialog {
            width: 50%;
        }

        /*#availModal .modal-dialog {
            width: 50%;
        }
        #unansweredModal .modal-dialog {
            width: 50%;
        }
        #answeredModal .modal-dialog {
            width: 50%;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id="page-wrapper">
                <div class="row" style="padding-top: 5%">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-cubes fa-fw"></i>Question Logs</h1>
            </div>
        </div>

<div class="panel-body">
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#availquest-pills" data-toggle="tab" id="avail">Available Question</a>
                            </li>
                            <li><a href="#unansweredquest-pills" data-toggle="tab" id="unanswered">Unanswered Question</a>
                            </li>
                            <li><a href="#answeredquest-pills" data-toggle="tab" id="answered">Answered Question</a>
                            </li>
<%--                            <li><a href="#howto-pills" data-toggle="tab">How To Instructions</a>
                            </li>--%>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="availquest-pills">
                                <div id="question-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Available Questions</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridAvailQuestion" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>QuestionID</th>
                                                        <th>Question</th>
                                                        <th>Answer</th>
                                                        <th>Difficulty</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>

 <%--                                       <div class="pull-right" style="padding-top: 5px">
                                            <button id="addquest" type="button" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add New Question</button>
                                        </div>--%>
                                        <div class="clearfix"></div>


                                        <div class="modal fade" id="viewAV" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h2 class="modal-title" id="myModalLabel2">View Questionaires</h2>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <input type="hidden" id="txtquestionid" />
                                                            <div class="col-lg-12">
                                                                <div class="col-md-12">
                                                                    <label>Question :</label>
                                                                    <textarea id="txtquestion" cols="100" rows="3" placeholder="What is the Question?.." class="form-control" readonly></textarea>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="col-md-6">
                                                                    <label>Answer :</label>
                                                                    <input type="text" id="txtanswer" placeholder="What is the Answer?.." class="form-control" readonly />
                                                                </div>
                                                                <div class="col-md-2">
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label>Difficulty :</label>
                                                                    <input type="text" id="txtdifficulty" placeholder="Difficulty!.." class="form-control" readonly />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />

                                                    </div>

                                                    <div class="modal-footer">
                                                        <button id="closemodalAV" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="questionform" class="panel panel-body" style="display: none;">
                                            <div class="panel-body">
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Question :</label>
                                                        <textarea id="question" cols="100" rows="3" placeholder="What is your Question?" class="form-control"></textarea>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">

                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <label>Answer :</label>
                                                        <input type="text" id="answer" class="form-control" placeholder="Your Answer.." />
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <label>Difficulty :</label>
                                                        <select id="difficulty" class="form-control">
                                                            <option value="0">Select a Difficulty..</option>
                                                            <option value="Easy">Easy</option>
                                                            <option value="Average">Average</option>
                                                            <option value="Hard">Hard</option>
                                                            <option value="Extra">Extra</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>


                                            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
                                            <div class="pull-right">
                                                <button id="canceladdquestion" type="button" class="btn btn-success"><i class="fa fa-close fa-fw"></i>Cancel</button>
                                                <button id="addquestion" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>Add Question</button>
                                            </div>
                                        </div>
                                        <input id="hfteamempid" type="hidden" />
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="unansweredquest-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Unanswered Questions</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridUnansweredQuest" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>QuestionID</th>
                                                        <th>Question</th>
                                                        <th>Answer</th>
                                                        <th>Difficulty</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                        <div class="pull-right" style="padding-top: 5px">
                                            <button id="reuseu" type="button" class="btn btn-success"><i class="glyphicon glyphicon-refresh"></i> Recycle All Questions</button>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal fade" id="reuseUA" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h2 class="modal-title" id="myModalLabel3">Recycle Questionaire</h2>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <input type="hidden" id="txtquestionidua" />
                                                    <div class="col-lg-12">
                                                        <div class="col-md-12">
                                                            <label>Question :</label>
                                                            <textarea id="txtquestionua" cols="100" rows="3" placeholder="What is the Question?.." class="form-control" readonly></textarea>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="col-md-6">
                                                            <label>Answer :</label>
                                                            <input type="text" id="txtanswerua" placeholder="What is the Answer?.." class="form-control" readonly />
                                                        </div>
                                                        <div class="col-md-2">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Difficulty :</label>
                                                            <input type="text" id="txtdifficultyua" placeholder="Difficulty!.." class="form-control" readonly />
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                            </div>

                                            <div class="modal-footer">
                                                <button id="closemodalUA" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="btnreuseUA" type="button" class="btn btn-success" data-dismiss="modal">Recycle</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            
                            </div>

                            <div class="tab-pane fade" id="answeredquest-pills">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Answered Questions</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridAnsweredQuest" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>QuestionID</th>
                                                        <th>Question</th>
                                                        <th>Answer</th>
                                                        <th>Difficulty</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>

                                        <div class="pull-right" style="padding-top: 5px">
                                            <button id="reusea" type="button" class="btn btn-success"><i class="glyphicon glyphicon-refresh"></i> Recycle All Questions</button>
                                        </div>
                                        <div class="modal fade" id="reuseA" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h2 class="modal-title" id="myModalLabel4">Recycle Questionaire</h2>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <input type="hidden" id="txtquestionida" />
                                                    <div class="col-lg-12">
                                                        <div class="col-md-12">
                                                            <label>Question :</label>
                                                            <textarea id="txtquestiona" cols="100" rows="3" placeholder="What is the Question?.." class="form-control" readonly></textarea>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="col-md-6">
                                                            <label>Answer :</label>
                                                            <input type="text" id="txtanswera" placeholder="What is the Answer?.." class="form-control" readonly />
                                                        </div>
                                                        <div class="col-md-2">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Difficulty :</label>
                                                            <input type="text" id="txtdifficultya" placeholder="Difficulty!.." class="form-control" readonly />
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                            </div>

                                            <div class="modal-footer">
                                                <button id="closemodalA" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="btnreuseA" type="button" class="btn btn-success" data-dismiss="modal">Recycle</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="tab-pane fade" id="howto-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How to Manage Attendance</h4>
                                    </div>
                                    <div class="panel-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                </div>
                            </div>--%>
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
                    DisplayAvailableQuestionaires();
                }
            })
        }


        $('#avail').click(function () {
            DisplayAvailableQuestionaires();
        })
        $('#unanswered').click(function () {
            DisplayUnansweredQuestionaires()
        })
        $('#answered').click(function () {
            DisplayAnsweredQuestionaires();
        })
        $('#btnreuseUA').click(function () {
            RecycleUA();
        })
        $('#btnreuseA').click(function () {
            RecycleA();
        })
        $('#reuseu').click(function () {
            RecycleUAA();
        })
        $('#reusea').click(function () {
            RecycleAA();
        })


        function DisplayAvailableQuestionaires() {

            $('#gridAvailQuestion').dataTable().fnDestroy();
            $('#gridAvailQuestion > tbody > tr').remove();


            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayQuestionaires",
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
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("QuestionID").text() + '"/> <a id="reusequestav" class="reusequestav" data-toggle="modal" data-target="#viewAV" href="#"><i class="glyphicon glyphicon-list-alt"></i> View</a></td>';
                        //<br /> <a id="deletequestion1" class="deletequestion1" data-toggle="modal" data-target="#delAV" href="#"><i class="glyphicon glyphicon-trash"></i> Delete</a> 
                        $("[id*=gridAvailQuestion] tbody").append($(row).append(col));
                    })
                    $('.reusequestav').click(function () {
                        //alert($(this).prev().val());
                        DisplayQuestionairesModalAVR($(this).prev().val());
                    });

                    $('.deletequestion1').click(function () {
                        
                        DisplayQuestionairesModalAVD($(this).prev().prev().prev().val());
                    });
                    $('#gridAvailQuestion').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        function DisplayUnansweredQuestionaires() {

            $('#gridUnansweredQuest').dataTable().fnDestroy();
            $('#gridUnansweredQuest > tbody > tr').remove();


            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayUnansweredQuestionaires",
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
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("QuestionID").text() + '"/> <a id="reuseUnA" class="reuseUnA" data-toggle="modal" data-target="#reuseUA" href="#"><i class="glyphicon glyphicon-refresh"></i> Recycle</a></td>';
                        //<br /> <a id="deletequestion" class="deletequestion" data-toggle="modal" data-target="#deletequestionaire" href="#"><i class="fa fa-edit fa-fw"></i> Delete</a> 
                        $("[id*=gridUnansweredQuest] tbody").append($(row).append(col));
                    })
                    $('.reuseUnA').click(function () {
                        //alert($(this).prev().val());
                        DisplayQuestionairesModalUA($(this).prev().val());
                    });

                    //$('.deletequestion').click(function () {
                    //    DisplayQuestionairesModalAVD($(this).prev().prev().prev().val());
                    //});
                    $('#gridUnansweredQuest').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        function DisplayAnsweredQuestionaires() {

            $('#gridAnsweredQuest').dataTable().fnDestroy();
            $('#gridAnsweredQuest > tbody > tr').remove();


            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayAnsweredQuestionaires",
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
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("QuestionID").text() + '"/> <a id="reuseAn" class="reuseAn" data-toggle="modal" data-target="#reuseA" href="#"><i class="glyphicon glyphicon-refresh"></i> Recycle</a></td>';
                        $("[id*=gridAnsweredQuest] tbody").append($(row).append(col));
                    })
                    $('.reuseAn').click(function () {
                        DisplayQuestionairesModalA($(this).prev().val());
                    });

                    //$('.deletequestion').click(function () {
                    //    DisplayQuestionairesModalD($(this).prev().prev().prev().val());
                    //});
                    $('#gridAnsweredQuest').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }


        function DisplayQuestionairesModalAVR(questid) {
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayQuestionairesModal",
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

        function DisplayQuestionairesModalUA(questid) {
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayQuestionairesModal",
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

                    $('#txtquestionidua').val($(this).find("QuestionID").text());
                    $('#txtquestionua').val($(this).find("Question").text());
                    $('#txtanswerua').val($(this).find("Answer").text());
                    $('#txtdifficultyua').val($(this).find("Difficulty").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function DisplayQuestionairesModalA(questid) {
            $.ajax({
                type: "POST",
                url: "Logs.aspx/displayQuestionairesModal",
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

                    $('#txtquestionida').val($(this).find("QuestionID").text());
                    $('#txtquestiona').val($(this).find("Question").text());
                    $('#txtanswera').val($(this).find("Answer").text());
                    $('#txtdifficultya').val($(this).find("Difficulty").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function RecycleUA() {
            var arr = new Array();
            arr[0] = $('#txtquestionidua').val();
            //arr[1] = $('#txtquestionua').val();
            //arr[2] = $('#txtanswerua').val();
            //arr[3] = $('#txtdifficultyua').val();

            $.ajax({
                type: "POST",
                url: "Logs.aspx/recycleUA",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayUnansweredQuestionaires();
                alert('Question Recycled! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function RecycleA() {
            var arr = new Array();
            arr[0] = $('#txtquestionida').val();
            //arr[1] = $('#txtquestionua').val();
            //arr[2] = $('#txtanswerua').val();
            //arr[3] = $('#txtdifficultyua').val();

            $.ajax({
                type: "POST",
                url: "Logs.aspx/recycleA",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayAnsweredQuestionaires();
                alert('Question Recycled! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function RecycleUAA() {
            var arr = new Array();
            //arr[0] = $('#txtquestionidua').val();
            //arr[1] = $('#txtquestionua').val();
            //arr[2] = $('#txtanswerua').val();
            //arr[3] = $('#txtdifficultyua').val();

            $.ajax({
                type: "POST",
                url: "Logs.aspx/recycleUAA",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayUnansweredQuestionaires();
                alert('All Questions are Recycled! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function RecycleAA() {
            var arr = new Array();
            //arr[0] = $('#txtquestionida').val();
            //arr[1] = $('#txtquestionua').val();
            //arr[2] = $('#txtanswerua').val();
            //arr[3] = $('#txtdifficultyua').val();

            $.ajax({
                type: "POST",
                url: "Logs.aspx/recycleAA",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                DisplayAnsweredQuestionaires();
                alert('All Questions are Recycled! ');
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
