<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserSB.aspx.cs" Inherits="DevOps.ScriptBee.UserSB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .qbdiff {
            width: 200px;
        }

        .questionContainer {
            border: 0px;
            border-radius: 0;
            background: rgba(37, 116, 169, 1);
            box-shadow: rgba(0, 0, 0, 0.40) 2px 2px 2px;
            color: #FFF;
            padding: 0;
            width: 60%;
        }

        /* entire container, keeps perspective */
        .flip-container {
            perspective: 1000;
            transform-style: preserve-3d;
        }
            /*  UPDATED! flip the pane when hovered */
            .flip-container:hover .back {
                transform: rotateX(0deg);
            }

            .flip-container:hover .front {
                transform: rotateX(180deg);
            }

        .flip-container, .front, .back {
            width: 100px;
            height: 50px;
        }

        /* flip speed goes here */
        .flipper {
            transition: 0.6s;
            transform-style: preserve-3d;
            position: relative;
        }

        /* hide back of pane during swap */
        .front, .back {
            backface-visibility: hidden;
            transition: 0.6s;
            transform-style: preserve-3d;
            position: absolute;
            top: 0;
            left: 0;
        }

        /* front pane, placed above back */
        .front {
            z-index: 2;
            transform: rotateX(0deg);
        }

        /* back, initially hidden pane */
        .back {
            transform: rotateX(-180deg);
        }

        /* 
	        Some vertical flip updates 
        */
        .vertical.flip-container {
            position: relative;
        }

        .vertical .back {
            transform: rotateY(180deg);
        }

        .vertical.flip-container:hover .back {
            transform: rotateY(0deg);
        }

        .vertical.flip-container:hover .front {
            transform: rotateY(180deg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper" style="padding-top: 4%">

        <div class="row" style="margin-top: 15px;"></div>

        <!--<div class="flip-container">
	        <div class="flipper">
		        <div class="front">FRONT
		        </div>
		        <div class="back">
		        </div>
	        </div>
        </div>-->

        <label class="text-center pull-right" id="timer" style="font: bold 16px arial, verdana;">2:00</label><label class="text-center pull-right">Countdown:&nbsp;</label>

        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>

        <div id="questionform" class="panel panel-body well well-lg questionContainer">
            <!--<div class="col-xs-12 qbtopline" style="background: rgba(241, 196, 15,1.0); padding: 0px; height: 10px"></div>-->
            <div class="col-xs-12" style="padding: 0px; box-shadow: rgba(0, 0, 0, 0.30) 0px 1px 1px; display: inline-block;">
                <div class="col-md-12" style="background: rgba(44, 62, 80,1.0); color: #FFF; font-family: 'Open Sans',serif; padding-bottom: 15px; width: 100%">
                    <h1 style="display: inline-block"><i class="fa fa-pencil"></i>Online Quiz Bee</h1>
                    <div class="qbbtn" id="guestsubmitt" style="float: right; margin-top: 15px; width: 90px; height: 50px; text-align: center">
                        <button type="button" class="btn btn-success qbbtnsubmit" id="guestsubmit" style="height: 50px; width: 90px"><span class="qbbtnsubmittxt">Submit</span></button>
                    </div>
                </div>
            </div>

            <%--<input type="hidden" id="correctanswer"/>--%>

            <div class="col-xs-12" style="margin-top: 10px;">
                <div class="col-md-6">
                    <div class="form-group">
                                    <input type="hidden" class="form-control" id="questionid" />
                        <label>Difficulty :</label>
                        <input type="text" id="difficulty" class="form-control qbdiff" placeholder="Difficulty" readonly />
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Points :</label>
                        <input type="text" id="points" class="form-control" placeholder="Points" readonly />
                    </div>
                </div>

            </div>
            <div class="col-xs-12">
                <div class="col-md-12">
                    <div class="form-group">
                        <%--<input type="hidden" id="questionid" />--%>
                        <label>Question :</label>
                        <textarea style="resize: none" id="question" rows="6" placeholder="Are you ready to answer?" class="form-control" readonly></textarea>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="col-md-5">
                </div>
                <div class="col-md-3">
                    <span id="errormes" style="color: red"></span>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="col-md-12">
                    <textarea style="resize: none; height: 150px; margin-bottom: 20px" class="form-control" id="guestanswer" rows="5" placeholder="What is the answer?"></textarea>
                </div>
            </div>

            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
        </div>





        <div class="modal fade" id="countdowntostart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="myModalLabel">GET READY !!</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                    <label style="font: large; text-align: center; display: block;">Countdown</label><br />
                                    <span id="countdowntimer" style="font-size: 36px; text-align: center; display: block;">5</span>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />


                    </div>

                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="notification" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="myModalLabel1"></h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <label id="meid1" style="font-size: 20px; text-align: center; display: block;"></label>
                                    <label style="font: large; text-align: center; display: block;" id="gtra"></label>
                                    <br />
                                    <span id="meid2" style="font-size: 20px; text-align: center; display: block;"></span>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <br />


                    </div>

                    <div class="modal-footer">
                        <button id="dissmiss" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <%--                        <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="btnupdate" type="button" class="btn btn-success" data-dismiss="modal">Update</button>--%>
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
                var val = '';
                $('#guestanswer').on("keyup", function () {
                    console.log($('#guestanswer').val());
                    if ($('#guestanswer').val() == '\n')
                        console.log("ENTERED");
                });
                /*$('.qbbtnsubmit').hover(function () {
                    $('.qbbtnsubmittxt').remove();
                    $('.qbbtnsubmit').animate({ borderRadius: '50%', width: '50px' }, "fast");
                    $('.qbbtnsubmit').append('<i class="fa fa-check fa-2x qbbtnsubmittxt"></i>');
                }, function () {
                    $('.qbbtnsubmittxt').remove();
                    $('.qbbtnsubmit').animate({ borderRadius: '4px', width: '90px' }, "fast");
                    $('.qbbtnsubmit').append('<span class="qbbtnsubmittxt">Submit</span>');
                });
                */
                $('.qbbtn').hover(function () {
                    $('.qbbtnsubmit').remove();
                    $('.qbbtn').append('<button type="button" class="btn btn-success qbbtnsubmit" id="guestsubmit" style="border-radius: 50%; height: 50px; width: 50px"><i class="fa fa-check fa-2x qbbtnsubmittxt"></i></button>');
                }, function () {
                    $('.qbbtnsubmit').remove();
                    $('.qbbtn').append('<button type="button" class="btn btn-success qbbtnsubmit" id="guestsubmit" style="height: 50px; width: 90px"><span class="qbbtnsubmittxt">Submit</span></button>');
                });
                if ('<%: Session["Type"]%>' == 'Administrator') {
                    alert('You are not Authorized to use this Tool!..');
                    window.location.href = "/Default.aspx";
                }
                else if ('<%: Session["Type"]%>' == 'User'); {
                   $('#questionid').val(0);
                   refreshquestionform();
                   setInterval(LoadQuestdummyid, 500);
                   setInterval(CheckdbAnswered, 500);

 

               }
            })
       }


       $('#guestsubmitt').click(function () {
           //alert('1');
           //CheckAnswer($('#questionid').val());
           //CheckAnswer($('#guestanswer').val());
           CheckAnswer();
       })

       $('#dissmiss').click(function () {
           $('#notification').modal('hide');
           clearnotifmodal();
       })

       function clearnotifmodal() {
           $('#myModalLabel1').text('');
           $('#meid1').text('');
           $('#gtra').text('');
           $('#meid2').text('');
       }
       function refreshquestionform() {
           $('#timer').text('2:00');
           $('#questionid').val(0);
           $('#question').val('');
           $('#points').val('');
           $('#difficulty').val('');
           $('#timer').val('');
           $('#guestanswer').val('');
           $('#guestanswer').text('');
           $('#guestsubmit')[0].disabled = true;
           $('#guestanswer')[0].disabled = true;
       }
       function CheckdbAnswered() {
           CheckifAnswered($('#questionid').val());
       }

       function CheckifAnswered(questid) {
           $.ajax({
               type: "POST",
               url: "UserSB.aspx/checkifAnswered",
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

                   //alert($(this).find("EID").text());
                   if ($(this).find("EID").text('<%: Session["lanid"]%>')) {
                       //alert('1');
                       clearnotifmodal();
                       $('#questionid').val(0);
                       //$('#notification').modal('destroy');
                       $('#notification').modal('show');
                       $('#myModalLabel1').text('Congratulations!..');
                       $('#meid1').text('You');
                       $('#gtra').text('Got the right Answer');
                       //$('#meid2').text(' + ' + $(this).find("Points").text() + ' ' + $(this).find("EID").text());
                       refreshquestionform();
                       killInterval();
                       validatequestion();
                    }
                    else {
                       //alert('2');
                       clearnotifmodal();
                       $('#questionid').val(0);
                       $('#notification').modal('show');
                       $('#myModalLabel1').text('Ooopps ! Better Luck next Time :P');
                       $('#meid1').text($(this).find("EID").text());
                       $('#gtra').text('Got the right Answer');
                       $('#meid2').text(' + ' + $(this).find("Points").text() + ' ' + $(this).find("EID").text());
                       refreshquestionform();
                       killInterval();
                       validatequestion();
                    }
                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
       }

        function validatequestion() {
            if ($('#questionid').val() == 0) {
                killInterval();
            }
            else {
                timerstart();
            }
        }

        function timerstart() {
            var min = 1;
            var sec = 59;

            timer = setInterval(function () {

                document.getElementById("timer").innerHTML = "  " + min + ":" + sec;
                sec--;
                if (sec == 00) {
                    min--;
                    sec = 60;
                    if (min == -1) {

                        min = 1;
                        sec = 59;

                        killInterval();
                        UpdateQuestionaireNotAnswered();
                        AlertCorrectAnswer($('#questionid').val());
                        refreshquestionform();
                        $('#timer').text('2:00');
                    }


                }
            }, 100);
        }
        function killInterval() {
            clearInterval(timer);

        };

        //Alert Correct Answer
        function AlertCorrectAnswer(questid) {
            $.ajax({
                type: "POST",
                url: "UserSB.aspx/alertCorrectAnswer",
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
                    refreshquestionform();
                    //UpdateQuestionaireNotAnswered();
                    validatequestion();
                    killInterval();

                    $('#timer').text('2:00');
                    $('#notification').modal('show');
                    $('#myModalLabel1').text('Times UP!..');
                    $('#gtra').text('The Correct Answer is');
                    $('#meid2').text($(this).find("Answer").text());

                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        //Update the Questionaires to database if not Answered
        function UpdateQuestionaireNotAnswered() {
            var arr = new Array();
            arr[0] = $('#questionid').val();

            $.ajax({
                type: "POST",
                url: "UserSB.aspx/updateQuestionaireNotAnswered",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                //SUCESS SUCCESS
                //$('#questionid').val(0);
                //killInterval();
                refreshquestionform();
                validatequestion();

            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        //////////////////////////////////////////fghfdhd

        function LoadQuestdummyid() {
            LoadActiveQuestion($('#questionid').val());
        }

        function LoadActiveQuestion(questid) {
            $.ajax({
                type: "POST",
                url: "UserSB.aspx/loadActiveQuestion",
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
                    $('#countdowntostart').modal('show');
                    countdownto3modal();
                    $('#questionid').val($(this).find("QuestionID").text());
                    $('#question').val($(this).find("Question").text());
                    $('#difficulty').val($(this).find("Difficulty").text());
                    $('#points').val($(this).find("Point").text());
                    $('#guestsubmit')[0].disabled = false;
                    $('#guestanswer')[0].disabled = false;


                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        function countdownto3modal() {
            var secs = 5;

            timer1 = setInterval(function () {

                document.getElementById("countdowntimer").innerHTML = "  " + secs;
                secs--;
                if (secs == -1) {
                    secs = 5;
                    killInterval1();
                    $('#countdowntostart').modal('hide');
                    $('#countdowntimer').text('5');
                    $('#countdowntimer').val('5');
                    validatequestion();

                }
            }, 1000);
        }
        killInterval1 = function () {
            clearInterval(timer1);
        };



        function CheckAnswer() {
            var arr = new Array();
            arr[0] = $('#questionid').val();
            arr[1] = $('#guestanswer').val();
            $.ajax({
                type: "POST",
                url: "UserSB.aspx/checkAnswer",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var parents = xml.find("Table1");
                    //UpdateCorrect();
                    if (response.d == '<NewDataSet />') {
                        $('#errormes').text('Wrong Answer');
                        $('#guestanswer').val('');
                        $('#guestanswer').focus();
                    }
                    else {
                        UpdateCorrect();
                    }
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }





        //function CheckAnswer() {
        //    var arr = new Array();
        //    arr[0] = $('#questionid').val();
        //    arr[1] = $('#guestanswer').val();
        //    $.ajax({
        //        type: "POST",
        //        url: "UserSB.aspx/checkAnswer",
        //        data: JSON.stringify({ _arr: arr }),
        //        contentType: "application/json; charset=utf-8",
        //        dataTaype: "json",
        //        success: AjaxSucceeded,
        //        error: AjaxError,
        //        failure: AjaxFailure
        //    });

        //    function AjaxSucceeded(response) {
        //        //SUCESS SUCCESS
        //        //UpdateCorrect();
                
        //    }
        //    function AjaxError(response) {
        //        alert(response.status + ' ' + response.statusText);
        //    }
        //    function AjaxFailure(response) {
        //        alert(response.status + ' ' + response.statusText);
        //    }
        //}


        ////Check if Answer is Correct
        //function CheckAnswer(questid) {
        //    $.ajax({
        //        type: "POST",
        //        url: "UserSB.aspx/checkAnswer",
        //        data: '{questid: ' + questid + '}',
        //        contentType: "application/json; charset=utf-8",
        //        dataTaype: "json",
        //        success: AjaxSucceeded,
        //        error: AjaxError,
        //        failure: AjaxFailure
        //    });
        //    function AjaxSucceeded(response) {
        //        var xmlDoc = $.parseXML(response.d);
        //        var xml = $(xmlDoc);
        //        var exkeys = xml.find("Table1");
        //        $.each(exkeys, function () {
        //            if ($('#guestanswer').val() == $(this).find("Answer").text()) {
        //                UpdateCorrect();

        //            }
        //            else {
        //                $('#errormes').text('Wrong Answer');
        //                $('#guestanswer').val('');
        //                $('#guestanswer').focus();
        //            }
        //        });
        //    }
        //    function AjaxError(response) {
        //        //alert(response.status + ' ' + response.statusText);
        //    }
        //    function AjaxFailure(response) {
        //        //alert(response.status + ' ' + response.statusText);
        //    }
        //}

        //Update Questionaire if Correct
        function UpdateCorrect() {
            var arr = new Array();
            arr[0] = $('#questionid').val();
            arr[1] = $('#guestanswer').val();
            arr[2] = '<%: Session["lanid"] %>'
            $.ajax({
                type: "POST",
                url: "UserSB.aspx/updateCorrect",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                //SUCESS SUCCESS
                //alert('You got the Right Answer!..' + ' +' + $('#points').val());
                refreshquestionform();
                killInterval();
                $('#errormes').text('');
                validatequestion();
            }
            function AjaxError(response) {
                //alert('Your Answer is not Correct');
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }


    </script>
</asp:Content>
