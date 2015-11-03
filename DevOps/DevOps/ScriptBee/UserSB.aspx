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

        <label class="text-center pull-right" id="timer" style="font: bold 16px arial, verdana;">0:30 second</label><label class="text-center pull-right">Countdown:&nbsp;</label>

        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>

        <div id="questionform" class="panel panel-body well well-lg questionContainer">
            <div class="col-xs-12" style="padding: 0px; box-shadow: rgba(0, 0, 0, 0.30) 0px 1px 1px; display: inline-block;">
                <div class="col-md-12" style="background: rgba(44, 62, 80,1.0); color: #FFF; font-family: 'Open Sans',serif; padding-bottom: 15px; width: 100%">
                    <h1 style="display: inline-block"><i class="fa fa-pencil"></i>&nbsp;Online Quiz Bee</h1>
                </div>
            </div>

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
                <div class="col-md-6" style="padding-top: 5%; padding-bottom: 10%;">
                    <span id="answer1" style="border: 2px solid #FFFFFF; color: #FFFFFF; text-align: center; display: block; padding-bottom: 5%; padding-top: 5%; background: rgba(0, 0, 0, 0.55);"></span>
                    <br />
                    <span id="answer2" style="border: 2px solid #FFFFFF; color: #FFFFFF; text-align: center; display: block; padding-bottom: 5%; padding-top: 5%; background: rgba(0, 0, 0, 0.55);"></span>
                </div>
                <div class="col-md-6" style="padding-top: 5%; padding-bottom: 10%;">
                    <span id="answer3" style="border: 2px solid #FFFFFF; color: #FFFFFF; text-align: center; display: block; padding-bottom: 5%; padding-top: 5%; background: rgba(0, 0, 0, 0.55);"></span>
                    <br />
                    <span id="answer4" style="border: 2px solid #FFFFFF; color: #FFFFFF; text-align: center; display: block; padding-bottom: 5%; padding-top: 5%; background: rgba(0, 0, 0, 0.55);"></span>
                    <%--<textarea style="resize: none; height: 150px; margin-bottom: 20px" class="form-control" id="guestanswer" rows="5" placeholder="What is the answer?"></textarea>--%>
                </div>
            </div>

            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
        </div>

        <div class="scorePanel" style="background: #000; width: 100px; height: 300px; float: left;">

        </div>



        <div class="modal" id="countdowntostart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
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
        var ans;
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
                if ('<%: Session["Type"]%>' == 'Administrator') {
                    alert('You are not Authorized to use this Tool!..');
                    window.location.href = "/Default.aspx";
                }
                else if ('<%: Session["Type"]%>' == 'User'); {
                    $('#questionid').val(0);
                    CheckifQuizBeeStatusisActive();

                    //refreshquestionform();

                    //$('#answer1').disableSelection();
                    //$('#answer2').disableSelection();
                    //$('#answer3').disableSelection();
                    //$('#answer4').disableSelection();
                    //CheckQuizStatus();




                                                   



                 }
            });
        };



           function CheckifQuizBeeStatusisActive() {
               var arr = new Array();
               arr[0] = '<%: Session["lanid"] %>'

               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/checkifQuizBeeStatusisActive",
                   data: JSON.stringify({ _arr: arr }),
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function AjaxSucceded(response) {
                       var xmlDoc = $.parseXML(response.d);
                       var xml = $(xmlDoc);
                       var details = xml.find("Table1");
                       $.each(details, function () {
                           var metrics = $(this);

                           //alert($(this).find("Answer").text());
                           if ($(this).find("Answer").text() == 'UserSB') {
                               alert('A Quiz Bee Page is already open in one of your browser \nPlease check your browser!..');
                               window.location.href = "/Default.aspx";
                           }
                           else if ($(this).find("Answer").text() == 'UserSB2'){
                               
                              refreshquestionform();

                               $('#answer1').disableSelection();
                               $('#answer2').disableSelection();
                               $('#answer3').disableSelection();
                               $('#answer4').disableSelection();
                               CheckQuizStatus();






                    $(window).bind('beforeunload', function () {
                        var arr = new Array();
                        arr[1] = '<%: Session["lanid"] %>';
                                                $.ajax({
                                                    type: "POST",
                                                    url: "UserSB.aspx/updateUserSBStatus",
                                                    data: JSON.stringify({ _arr: arr }),
                                                    contentType: "application/json; charset=utf-8",
                                                    dataTaype: "json",
                                                    success: AjaxSucceeded,
                                                    error: AjaxError,
                                                    failure: AjaxFailure
                                                });

                                                function AjaxSucceeded(response) {


                                                }
                                                function AjaxError(response) {
                                                }
                                                function AjaxFailure(response) {
                                                }
                    });

                    $(window).bind('unload', function () {
                        var arr = new Array();
                        arr[1] = '<%: Session["lanid"] %>';
                                                $.ajax({
                                                    type: "POST",
                                                    url: "UserSB.aspx/updateUserSBStatus",
                                                    data: JSON.stringify({ _arr: arr }),
                                                    contentType: "application/json; charset=utf-8",
                                                    dataTaype: "json",
                                                    success: AjaxSucceeded,
                                                    error: AjaxError,
                                                    failure: AjaxFailure
                                                });

                                                function AjaxSucceeded(response) {


                                                }
                                                function AjaxError(response) {
                                                    //alert(response.status + ' ' + response.statusText);
                                                }
                                                function AjaxFailure(response) {
                                                    //alert(response.status + ' ' + response.statusText);
                                                }
                    });





                           }
                       });

                   },
                   error: function AjaxError(response) {
                       //alert(response.status + ' ' + response.responseText);
                   },
                   failure: function AjaxFailure(response) {
                       //response.status + ' ' + response.statusText;
                   }
               })
           }






                                                   ///unload and close update status








        $('#notification').keydown(function (e) {
            if (e.keyCode === 13) {
                $('#dissmiss').click();
            }
        });

        $('#guestanswer').keydown(function (e) {
            if (e.keyCode === 13) {
                CheckAnswer();
                //alert('Enter was Pressed!.')
            };
        });


        $('#guestsubmitt').click(function () {
            CheckAnswer();
        });

        $('#dissmiss').click(function () {
            $('#notification').modal('hide');
            clearnotifmodal();
        });;

        function clearnotifmodal() {
            $('#myModalLabel1').text('');
            $('#meid1').text('');
            $('#gtra').text('');
            $('#meid2').text('');
        };
        function refreshquestionform() {
            $('#timer').text('0:00 second');
            $('#questionid').val(0);
            $('#question').val('');
            $('#points').val('');
            $('#difficulty').val('');
            $('#timer').val('');
            $('#answer1').text('Answer');
            $('#answer2').text('Answer');
            $('#answer3').text('Answer');
            $('#answer4').text('Answer');
            ans = '';
            document.getElementById("answer1").style.backgroundColor = "rgba(0, 0, 0, 0.45)";
            document.getElementById("answer2").style.backgroundColor = "rgba(0, 0, 0, 0.45)";
            document.getElementById("answer3").style.backgroundColor = "rgba(0, 0, 0, 0.45)";
            document.getElementById("answer4").style.backgroundColor = "rgba(0, 0, 0, 0.45)";

            $('#answer1').unbind('click');
            $('#answer1').unbind('dblclick');
            $('#answer2').unbind('click');
            $('#answer2').unbind('dblclick');
            $('#answer3').unbind('click');
            $('#answer3').unbind('dblclick');
            $('#answer4').unbind('click');
            $('#answer4').unbind('dblclick');
        }



        function CheckQuizStatus() {
            var arr = new Array();
            arr[0] = 1;

            $.ajax({
                type: "POST",
                url: "UserSB.aspx/checkQuizStatus",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var details = xml.find("Table1");
                    $.each(details, function () {
                        var metrics = $(this);
                        if ($(this).find("sessionstatus").text() == 'Inactive') {
                            setInterval(LoadQuestdummyid, 500);
                        }
                        else {
                            LoadQuestionIDforNewinRoom($('#questionid').val());
                            setInterval(CheckdbifnotAnsweredd, 500);
                            setInterval(CheckdbAnswered, 500);
                        }
                    });

                },
                error: function AjaxError(response) {
                    //alert(response.status + ' ' + response.responseText);
                },
                failure: function AjaxFailure(response) {
                    //response.status + ' ' + response.statusText;
                }
            })
        }






        function CheckdbAnswered() {
            CheckifAnswered($('#questionid').val());
        };

        function showmodalYGTRA() {

            //$('#meid2').text('+ ' + $('#points').text() + ' Points')
        };





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
                    if ($(this).find("EID").text() == '<%: Session["lanid"]%>') {
                        //alert('1');
                        $('#questionid').val(0);
                        refreshquestionform();
                        killInterval();
                        validatequestion();
                    }
                    else {
                        $('#questionid').val(0);
                        refreshquestionform();
                        killInterval();
                        validatequestion();
                        $('#notification').modal('show');
                        $('#myModalLabel1').text('Ooopps ! Better Luck next Time..');
                        //$('#meid1').text($(this).find("EID").text());
                        $('#meid1').text('Someone Already');
                        $('#gtra').text('Got the right Answer');
                        //$('#meid2').text(' + ' + $(this).find("Points").text() + ' Points for ' + $(this).find("EID").text());
                        setInterval(LoadQuestdummyid, 500);
                        UpdateQuizbeeStatusI();
                    }
                });
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };

           function validatequestion() {
               if ($('#questionid').val() == 0) {
                   killInterval();
               }
               else {
                   if ($('#difficulty').val() == 'Easy') {
                       timerstart();
                   }
                   else if ($('#difficulty').val() == 'Average') {
                       timerstartave();
                   }
                   else if ($('#difficulty').val() == 'Hard') {
                       timerstarthard();
                   }
                   else if ($('#difficulty').val() == 'Extra') {
                       timerstartextra();
                   }

               }
           };

           function timerstart() {
               var min = 0;
               var sec = 30;
               //$('#guestanswer').focus();
               timer = setInterval(function () {

                   document.getElementById("timer").innerHTML = "  " + min + ":" + sec + " second";
                   sec--;
                   if (sec == 00) {
                       min = 0;
                       sec = 30;

                       killInterval();
                       UpdateQuestionaireNotAnswered();
                       AlertCorrectAnswer($('#questionid').val());
                       refreshquestionform();
                       //$('#timer').text('0:30 second');

                   }
               }, 1000);
           };
           function killInterval() {
               clearInterval(timer);

           };


           function timerstartave() {
               var min = 0;
               var sec = 45;
               //$('#guestanswer').focus();
               timerave = setInterval(function () {

                   document.getElementById("timer").innerHTML = "  " + min + ":" + sec + " second";
                   sec--;
                   if (sec == 00) {
                       min = 0;
                       sec = 45;

                       killIntervalave();
                       UpdateQuestionaireNotAnswered();
                       AlertCorrectAnswer($('#questionid').val());
                       refreshquestionform();
                       //$('#timer').text('0:30 second');

                   }
               }, 1000);
           };
           function killIntervalave() {
               clearInterval(timerave);

           };

           function timerstarthard() {
               var min = 0;
               var sec = 90;
               //$('#guestanswer').focus();
               timerhard = setInterval(function () {

                   document.getElementById("timer").innerHTML = "  " + min + ":" + sec + " second";
                   sec--;
                   if (sec == 00) {
                       min = 0;
                       sec = 90;

                       killIntervalhard();
                       UpdateQuestionaireNotAnswered();
                       AlertCorrectAnswer($('#questionid').val());
                       refreshquestionform();
                       //$('#timer').text('0:30 second');

                   }
               }, 1000);
           };
           function killIntervalhard() {
               clearInterval(timerhard);

           };


           function timerstartextra() {
               var min = 0;
               var sec = 20;
               //$('#guestanswer').focus();
               timerextra = setInterval(function () {

                   document.getElementById("timer").innerHTML = "  " + min + ":" + sec + " second";
                   sec--;
                   if (sec == 00) {
                       min = 0;
                       sec = 20;

                       killIntervalextra();
                       UpdateQuestionaireNotAnswered();
                       AlertCorrectAnswer($('#questionid').val());
                       refreshquestionform();
                       //$('#timer').text('0:30 second');

                   }
               }, 1000);
           };
           function killIntervalextra() {
               clearInterval(timerextra);

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
                       //killIntervalave();
                       //killIntervalhard();
                       //killIntervalextra();
                       setInterval(CheckdbAnswered, 5000000);
                       setInterval(LoadQuestdummyid, 500);
                       $('#timer').text('0:30 second');
                       $('#notification').modal('show');
                       $('#meid1').text('');
                       $('#myModalLabel1').text('Times UP!..');
                       $('#gtra').text('The Correct Answer is');
                       $('#meid2').text($(this).find("CorrectAnswer").text());
                       UpdateQuizbeeStatusI();

                   });
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };

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

                   refreshquestionform();
                   validatequestion();
                   UpdateQuizbeeStatusI();
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };

           //////////////////////////////////////////fghfdhd

           function LoadQuestdummyid() {
               LoadActiveQuestion($('#questionid').val());
           };

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
                       if ($('#questionid').val() == $(this).find("QuestionID").text()) {

                       }
                       else {
                           $('#notification').modal('hide');
                           $('#countdowntostart').modal('show');
                           countdownto3modal();
                           $('#questionid').val($(this).find("QuestionID").text());
                           $('#question').val($(this).find("Question").text());
                           $('#difficulty').val($(this).find("Difficulty").text());
                           $('#points').val($(this).find("Point").text());
                           setInterval(LoadQuestdummyid, 5000000);
                           setInterval(CheckdbAnswered, 500);
                           UpdateQuizbeeStatus();
                       }



                   });
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };

           function countdownto3modal() {
               var secs = 5;

               timer1 = setInterval(function () {

                   document.getElementById("countdowntimer").innerHTML = "  " + secs;
                   secs--;
                   if (secs == -1) {
                       secs = 5;
                       killInterval1();

                       $('#countdowntimer').text('5');
                       $('#countdowntimer').val('5');
                       $('#countdowntostart').modal('hide');
                       LoadChoices($('#questionid').val());


                       validatequestion();


                   }
               }, 1000);
           };
           killInterval1 = function () {
               clearInterval(timer1);
           };


           function LoadChoices(questid) {
               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/loadChoices",
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

                       $('#answer1').bind("click", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "green";
                       });
                       $('#answer1').bind("dblclick", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "green";
                           ans = $('#answer1').text();
                           CheckAnswer();
                       });

                       $('#answer2').bind("click", function () {
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer2").style.backgroundColor = "green";
                       });
                       $('#answer2').bind("dblclick", function () {
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer2").style.backgroundColor = "green";
                           ans = $('#answer2').text();
                           CheckAnswer();
                       });

                       $('#answer3').bind("click", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "green";
                       });
                       $('#answer3').bind("dblclick", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "green";
                           ans = $('#answer3').text();
                           CheckAnswer();
                       });
                       $('#answer4').bind("click", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "green";
                       });
                       $('#answer4').bind("dblclick", function () {
                           document.getElementById("answer2").style.backgroundColor = "darkorange";
                           document.getElementById("answer3").style.backgroundColor = "darkorange";
                           document.getElementById("answer1").style.backgroundColor = "darkorange";
                           document.getElementById("answer4").style.backgroundColor = "green";
                           ans = $('#answer4').text();
                           CheckAnswer();
                       });

                       $('#answer1').text($(this).find("answer1").text());
                       $('#answer2').text($(this).find("answer2").text());
                       $('#answer3').text($(this).find("answer3").text());
                       $('#answer4').text($(this).find("answer4").text());


                   });
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };



           function CheckAnswer() {
               var arr = new Array();
               arr[0] = $('#questionid').val();
               arr[1] = ans;
               arr[2] = '<%: Session["lanid"] %>'

               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/checkAnswer",
                   data: JSON.stringify({ _arr: arr }),
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function AjaxSucceded(response) {
                       var xmlDoc = $.parseXML(response.d);
                       var xml = $(xmlDoc);
                       var details = xml.find("Table1");
                       $.each(details, function () {
                           var metrics = $(this);
                           //alert($(this).find("Answer").text());
                           if (ans == $(this).find("Answer").text()) {
                               //UpdateCorrect();
                               $('#notification').modal('show');
                               $('#myModalLabel1').text('Congratulations!..');
                               $('#meid1').text('You');
                               $('#gtra').text('Got the right Answer');
                               $('#meid2').text(' + ' + $('#points').val() + ' Points');
                               refreshquestionform();
                               killInterval();
                               validatequestion();
                               UpdateQuizbeeStatusI();
                           }
                           else if ($(this).find("Answer").text() == 'Wrong') {
                               $('#answer1').unbind('click');
                               $('#answer1').unbind('dblclick');
                               $('#answer2').unbind('click');
                               $('#answer2').unbind('dblclick');
                               $('#answer3').unbind('click');
                               $('#answer3').unbind('dblclick');
                               $('#answer4').unbind('click');
                               $('#answer4').unbind('dblclick');

                               $('#notification').modal('show');
                               $('#meid1').text('');
                               $('#myModalLabel1').text('Ooopps ! Better Luck next Time!');
                               //$('#gtra').text('You Choose the Wrong Answer');
                               $('#gtra').text('Your answer is incorrect! ');
                               $('#meid2').text('');
                               ans = '';
                           }
                           else if ($(this).find("Answer").text() == 'Someone') {
                               CheckdbAnswered();
                           }
                       });

                   },
                   error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                   failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
               })
           }


           function UpdateQuizbeeStatus() {
               var arr = new Array();
               arr[0] = 1;
               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/updateQuizbeeStatus",
                   data: JSON.stringify({ _arr: arr }),
                   contentType: "application/json; charset=utf-8",
                   dataTaype: "json",
                   success: AjaxSucceeded,
                   error: AjaxError,
                   failure: AjaxFailure
               });

               function AjaxSucceeded(response) {


               }
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               }
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               }
           }

           function UpdateQuizbeeStatusI() {
               var arr = new Array();
               arr[0] = 1;
               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/updateQuizbeeStatusI",
                   data: JSON.stringify({ _arr: arr }),
                   contentType: "application/json; charset=utf-8",
                   dataTaype: "json",
                   success: AjaxSucceeded,
                   error: AjaxError,
                   failure: AjaxFailure
               });

               function AjaxSucceeded(response) {


               }
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               }
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               }
           }

           function LoadQuestionIDforNewinRoom(questid) {
               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/loadQuestionIDforNewinRoom",
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


                   });
               };
               function AjaxError(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
               function AjaxFailure(response) {
                   //alert(response.status + ' ' + response.statusText);
               };
           };


           function CheckdbifnotAnsweredd() {
               CheckifnotAnswered($('#questionid').val());
           }

           function CheckifnotAnswered(questid) {

               $.ajax({
                   type: "POST",
                   url: "UserSB.aspx/checkifnotAnswered",
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
                       if ($('#questionid').val() == $(this).find("QuestionID").text()) {
                           refreshquestionform();
                           setInterval(CheckdbAnswered, 5000000);
                           setInterval(LoadQuestdummyid, 500);
                           UpdateQuizbeeStatusI();
                       }
                       else {

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


    </script>
</asp:Content>
