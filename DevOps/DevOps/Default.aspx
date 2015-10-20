<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DevOps._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #chatglobal > thead > tr:first-child {
            background: rgba(0, 105, 60, 0.00) !important;
            color: #a3c612;
        }

        #chatglobal > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }


        #mycalendar {
            margin: 30px;
            height: 600px;
            max-width: 500px;
        }


        .container {
            display: flex;
        }

        .column {
            flex: 1;
        }

        .column-one {
            order: 1;
        }

        .column-two {
            order: 2;
        }

        .column-three {
            order: 3;
        }


        .input {
            text-align: right;
        }

        .mainContainer {
            border-radius: 25px;
            border: 2px solid #8AC007;
            padding: 20px;
            width: 100%;
            height: 500px;
        }

        .container1 {
            border-radius: 25px;
            border: 2px solid #8AC007;
            padding: 20px;
            width: 230px;
            height: 220px;
        }

        .aang1, .aang2, .aang3 {
            border: 3px solid #FFF;
            border-radius: 50%;
            box-shadow: rgba(0, 0, 0, 0.40) 1px 5px 5px;
            color: #FFF;
            font-family: 'Open Sans',serif;
            font-size: 32px;
            height: 100px;
            width: 100px;
            margin: 0 auto;
            text-align: center;
            text-shadow: 1px 0px 2px rgba(0, 0, 0, 0.40);
            padding: 25px;
            vertical-align: central;
        }

        .eid, .userType, .eid2, .eid3, .eid4 {
            color: #FFF;
            font-family: 'Lato', serif;
            font-size: 20px;
            font-weight: 300;
        }



        .eid {
            display: none;
        }

        .userType {
            font-size: 17px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id="page-wrapper">

        <div class="row" style="padding-top: 5%;">
            <div class="col-lg-12">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="./Images/carouselimages/image1.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>
                            <div class="item">
                                <img src="./Images/carouselimages/image2.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>
                            <div class="item">
                                <img src="./Images/carouselimages/image3.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="text-align: center;">Dashboard</h1>
                <br />

                <div class="col-md-4">
                    <h2 class="page-header" style="padding-top: 50%; text-align: center;">Top 2</h2>
                    <div class="aang2"></div>
                    <br />
                    <div class="eid3" style="text-align: center;"></div>
                    <input type="hidden" id="txttp2n" />
                    <br />
                    <p id="txttp2s" style="text-align: center;"></p>
                </div>

                <div class="col-md-4">
                    <h2 class="page-header" style="text-align: center;">Top 1</h2>
                    <div class="aang1" style="text-align: center;"></div>
                    <br />
                    <div class="eid2" style="text-align: center;"></div>
                    <input type="hidden" id="txttp1n" />
                    <br />
                    <p id="txttp1s" style="text-align: center;"></p>
                </div>

                <div class="col-md-4">
                    <h2 class="page-header" style="padding-top: 50%; text-align: center;">Top 3</h2>
                    <div class="aang3"></div>
                    <br />
                    <div class="eid4" style="text-align: center;"></div>
                    <input type="hidden" id="txttp3n" />
                    <br />
                    <p id="txttp3s" style="text-align: center;"></p>
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
                LoadTopScorers();




            });
        }




        $('.carousel').carousel({
            interval: 2000

        });

        function LoadTopScorers() {
            LoadTop1('0');
            LoadTop2('0');
            LoadTop3('0');
        }

        function LoadTop1(userno) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/loadTop1",
                data: '{userno: ' + userno + '}',
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

                    $('#txttp1n').text($(this).find("EID").text());
                    $('#txttp1s').text($(this).find("Points").text() + ' Points');

                    var currentUrl = top.location.pathname;
                    var dirPathCon = currentUrl.split("/");
                    var dirPath = dirPathCon[dirPathCon.length - 1];
                    var dirPathNoExt = dirPath.split(".");
                    dirPathNoExt = dirPathNoExt[0];
                    console.log(dirPathNoExt);
                    var name = getNameInitials($('#txttp1n').text());
                    var color = colorPicker();
                    /* Avatar Specifications */
                    $('.eid2').append('<p style="margin: 0; color: black;">' + nameGenerator($('#txttp1n').text()) + '</p>');
                    $('.aang1').append('<p class="avatarName1">' + name + '</p>');
                    $('.aang1').css("background", color);
                    $('.qbtopline11').css("background", colorPicker());
                    $('.avatarName1').css("margin", "0");

                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        function LoadTop2(userno) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/loadTop2",
                data: '{userno: ' + userno + '}',
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

                    $('#txttp2n').text($(this).find("EID").text());
                    $('#txttp2s').text($(this).find("Points").text() + ' Points');

                    var currentUrl = top.location.pathname;
                    var dirPathCon = currentUrl.split("/");
                    var dirPath = dirPathCon[dirPathCon.length - 1];
                    var dirPathNoExt = dirPath.split(".");
                    dirPathNoExt = dirPathNoExt[0];
                    console.log(dirPathNoExt);
                    var name = getNameInitials($('#txttp2n').text());
                    var color = colorPicker();
                    /* Avatar Specifications */
                    $('.eid3').append('<p style="margin: 0; color: black;">' + nameGenerator($('#txttp2n').text()) + '</p>');
                    $('.aang2').append('<p class="avatarName2">' + name + '</p>');
                    $('.aang2').css("background", color);
                    $('.qbtopline12').css("background", colorPicker());
                    $('.avatarName2').css("margin", "0");

                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }

        function LoadTop3(userno) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/loadTop3",
                data: '{userno: ' + userno + '}',
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

                    $('#txttp3n').text($(this).find("EID").text());
                    $('#txttp3s').text($(this).find("Points").text() + ' Points');

                    var currentUrl = top.location.pathname;
                    var dirPathCon = currentUrl.split("/");
                    var dirPath = dirPathCon[dirPathCon.length - 1];
                    var dirPathNoExt = dirPath.split(".");
                    dirPathNoExt = dirPathNoExt[0];
                    console.log(dirPathNoExt);
                    var name = getNameInitials($('#txttp3n').text());
                    var color = colorPicker();
                    /* Avatar Specifications */
                    $('.eid4').append('<p style="margin: 0; color: black;">' + nameGenerator($('#txttp3n').text()) + '</p>');
                    $('.aang3').append('<p class="avatarName3">' + name + '</p>');
                    $('.aang3').css("background", color);
                    $('.qbtopline13').css("background", colorPicker());
                    $('.avatarName3').css("margin", "0");

                });
            }
            function AjaxError(response) {
                //alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                //alert(response.status + ' ' + response.statusText);
            }
        }


        var colorPicker = function () {
            var color = '#';
            var colorSet = 'ABCDEF0123456789'
            for (var i = 0; i < 6; i++) {
                color += colorSet.charAt(Math.floor(Math.random() * (colorSet.length - 1) + 1));
                if (i == 5 && color == "#FFFFFF") {
                    i = 0;
                    color = '#';
                }
            }
            return color;
        }

        var strSplitter = function (str, delim) {
            var strArr = str.split(delim);
            return strArr;
        }

        var getNameInitials = function (str) {
            var eidArr = strSplitter(str, ".");
            var fname = eidArr[0][0];
            var lname = eidArr[eidArr.length - 1][0];
            var name = fname + lname;
            return name.toUpperCase();
        }

        var capitalize = function (str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        }

        var nameGenerator = function (str) {
            var eidArr = strSplitter(str, ".");
            var name = '';
            for (var i = 0; i < eidArr.length; i++) {
                if (eidArr[i].length > 1) {
                    name += capitalize(eidArr[i]) + " ";
                }
            }
            return name;
        }
    </script>

</asp:Content>

