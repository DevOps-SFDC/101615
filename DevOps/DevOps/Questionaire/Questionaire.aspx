<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Questionaire.aspx.cs" Inherits="DevOps.Questionaire.Questionaire" %>

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

    <div id="page-wrapper" style="padding-top: 3%">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-cubes fa-fw"></i>Question Management</h1>
            </div>
        </div>

        <div class="row">
             <div class="col-lg-12">
                <br />
                <button id="addquestionaire" type="button" class="btn btn-success pull-right"><i class="fa fa-plus fa-fw"></i> Add Questionaire</button>
                <div class="clearfix"></div>
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

        <div class="modal fade" id="updatequestionaire" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <textarea id="txtquestion" cols="100" rows="3" placeholder="What is the Question?.." class="form-control"></textarea>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-6">
                                    <label>Answer :</label>
                                    <input type="text" id="txtanswer" placeholder="What is the Answer?.." class="form-control" />
                                </div>
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-4">
                                    <label>Difficulty :</label>
                                    <select id="txtdifficulty" class="form-control">
                                        <option value="0">Select a Difficulty...</option>
                                        <option value="Easy">Easy</option>
                                        <option value="Average">Average</option>
                                        <option value="Hard">Hard</option>
                                        <option value="Extra">Extra</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>

                    <div class="modal-footer">
                        <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btnupdate" type="button" class="btn btn-success" data-dismiss="modal">Update</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deletequestionaire" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="myModalLabel1">Delete Questionaires</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" id="txtquestionidd" />
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <label>Question :</label>
                                    <textarea id="txtquestiond" cols="100" rows="3" class="form-control" readonly></textarea>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-6">
                                    <label>Answer :</label>
                                    <input type="text" id="txtanswerd" class="form-control" readonly/>
                                </div>
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-4">
                                    <label>Difficulty :</label>
                                    <input type="text" id="txtdifficultyd" class="form-control" readonly/>
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>

                    <div class="modal-footer">
                        <button id="closemodald" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btndelete" type="button" class="btn btn-success" data-dismiss="modal">Delete</button>
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
                    DisplayQuestionaires();
                }
            })
        }

        //Add Questionaire Button Clicked Function
        $('#addquestionaire').click(function () {
            $('#questionform').slideDown('slow');
            $('#questiondetails').slideUp('slow');
            refreshquestionform();
        })

        //Cancel Add Question Button Clicked Function
        $('#canceladdquestion').click(function () {
            $('#questionform').slideUp('slow');
            $('#questiondetails').slideDown('slow');
            refreshquestionform();
        })

        //Save Question Button Clicked Function
        $('#addquestion').click(function () {
            ValidateQuestionForm();
        })

        //Update Question Button Clicked Function
        $('#btnupdate').click(function () {
            ValidateModalQuestionaire();
        })

        //Delete Question Button Clicked Function
        $('#btndelete').click(function () {
            DeleteQuestionaire();
        })

        //Validations

        //Reset Value of question form to NULL
        function refreshquestionform() {
            $('#question').val('');
            $('#answer').val('');
            $('#difficulty').val(0);
        }

        //Validate Question form if the field is NULL
        function ValidateQuestionForm() {
            if ($('#question').val() == '') {
                alert('Please Insert a Question!..');
                $('#question').focus();
            }
            else if ($('#answer').val() == '') {
                alert('Please Insert a Answer!..');
                $('#answer').focus();
            }
            else if ($('#difficulty').val() == 0) {
                alert('Please Select a Difficulty!..');
                $('#difficulty').focus();
            }
            else {
                AddQuestionaire();
            }
        }

        //Validate Modal Questionaire if the Field is Changed or Null
        function ValidateModalQuestionaire() {
            if ($('#txtquestion').val() == '') {
                alert('Please Insert a Question!..');
                $('#txtquestion').focus();
            }
            else if ($('#txtanswer').val() == '') {
                alert('Please Insert a Answer!..');
                $('#txtanswer').focus();
            }
            else if ($('#txtdifficulty').val() == 0) {
                alert('Please Select a Difficulty!..');
                $('#txtdifficulty').focus();
            }
            else {
                UpdateQuestionaire();
            }
        }
        
        //Display Questionaires from database to Datatable
        function DisplayQuestionaires() {
            
            $('#gridQuestiondetails').dataTable().fnDestroy();
            $('#gridQuestiondetails > tbody > tr').remove();
            

            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/displayQuestionaires",
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
                        col += '<input id="questionid" type="hidden" value="' + $(this).find("QuestionID").text() + '"/> <a id="questionedit" class="questionedit" data-toggle="modal" data-target="#updatequestionaire" href="#"><i class="fa fa-edit fa-fw"></i> Edit</a> <br /> <a id="deletequestion" class="deletequestion" data-toggle="modal" data-target="#deletequestionaire" href="#"><i class="fa fa-edit fa-fw"></i> Delete</a> </td>';

                        $("[id*=gridQuestiondetails] tbody").append($(row).append(col));
                    })
                    $('.questionedit').click(function () {
                        DisplayQuestionairesModal($(this).prev().val());
                    });

                    $('.deletequestion').click(function () {
                        DisplayQuestionairesModalD($(this).prev().prev().prev().val());
                    });
                    $('#gridQuestiondetails').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

       //Insert Questionaires to database
        function AddQuestionaire() {
            var arr = new Array();
            arr[0] = $('#question').val();
            arr[1] = $('#answer').val();
            arr[2] = $('#difficulty').val();

            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/addQuestionaire",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {

                $('#questionform').slideUp('slow');
                $('#questiondetails').slideDown('slow');
                refreshquestionform();

                alert('Question Saved! ');
                DisplayQuestionaires();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }
    
        //Display Questionaire to Modal Update
        function DisplayQuestionairesModal(questid) {
            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/displayQuestionairesModal",
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

        //Update the Questionaires to database
        function UpdateQuestionaire() {
            var arr = new Array();
            arr[0] = $('#txtquestionid').val();
            arr[1] = $('#txtquestion').val();
            arr[2] = $('#txtanswer').val();
            arr[3] = $('#txtdifficulty').val();

            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/updateQuestionaire",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                $('#questionform').slideUp('slow');
                DisplayQuestionaires();
                $('#questiondetails').slideDown('slow');
                refreshquestionform();
                alert('Question Updated! ');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }


        //Display Questionaire to Modal Delete 
        function DisplayQuestionairesModalD(questid) {
            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/displayQuestionairesModalD",
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

                    $('#txtquestionidd').val($(this).find("QuestionID").text());
                    $('#txtquestiond').val($(this).find("Question").text());
                    $('#txtanswerd').val($(this).find("Answer").text());
                    $('#txtdifficultyd').val($(this).find("Difficulty").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        //Delete the Questionaires to database
        function DeleteQuestionaire() {
            var arr = new Array();
            arr[0] = $('#txtquestionidd').val();
            arr[1] = $('#txtquestiond').val();
            arr[2] = $('#txtanswerd').val();
            arr[3] = $('#txtdifficultyd').val();

            $.ajax({
                type: "POST",
                url: "Questionaire.aspx/deleteQuestionaire",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                $('#questionform').slideUp('slow');
                DisplayQuestionaires();
                $('#questiondetails').slideDown('slow');
                refreshquestionform();
                alert('Question ID ' + $('#txtquestionidd').val() +'   '+ $('#txtquestiond').val() +'  is Deleted! ');
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
