<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Activitymgmt.aspx.cs" Inherits="DevOps.AdminPanel.Activitymgmt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #gridActivity > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridActivity > tbody > tr:first-child {
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
                <h1 class="page-header"><i class="fa fa-cubes fa-fw"></i>Activity Management</h1>
            </div>
        </div>

        <div class="row">
             <div class="col-lg-12">
                <br />
                <button id="addactivity" type="button" class="btn btn-success pull-right"><i class="fa fa-plus fa-fw"></i> Add Activity</button>
                <div class="clearfix"></div>
            </div>
        </div>

        <div id="activityform" class="panel panel-body" style="display: none;">
            <div class="panel-body">
            </div>
            <div class="col-xs-12">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Title :</label>
                        <input type="text" id="title" class="form-control" placeholder="Decription of you Activity.." />
                        <%--<textarea id="title" cols="100" rows="3" placeholder="Activity Title.." class="form-control"></textarea>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-xs-12">

                <div class="col-xs-3">
                    <div class="form-group">
                        <label>Description :</label>
                        <textarea id="description" cols="100" rows="3" placeholder="Activity Title.." class="form-control"></textarea>
                        <%--<input type="text" id="description" class="form-control" placeholder="Decription of you Activity.." />--%>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="form-group">
                        <label>Date to Happen :</label>
                        <input type="text" id="date" class="form-control" placeholder="Date to be Held.." />
                    </div>
                </div>

            </div>


            <span id="ErrorDiv" class="Framework_Error_Message_Span"></span>
            <div class="pull-right">
                <button id="cancel" type="button" class="btn btn-success"><i class="fa fa-close fa-fw"></i>Cancel</button>
                <button id="add" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>Create Activity</button>
            </div>
        </div>

        <div class="panel panel-body" id="activitydetails">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="gridActivity" class="table table-bordered dataTable">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Date</th>
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
                if ('<%: Session["UAL"]%>' == 'User') {
                     alert('You are not Authorized to use this Tool!..');
                     window.location.href = "/Default.aspx";
                 }
                 else if ('<%: Session["UAL"]%>' == 'Administrator'); {
                     DisplayActivity();
                 }


             })
        }


        function validateactivityform() {
            if ($('#title').val() == ''){
                alert('Empty Title!..');
                $('#title').focus();
            }
            else if ($('#description').val() == ''){
                alert('Empty Description!..');
                $('#description').focus();
            }
            else if ($('#date').val() == '') {
                alert('Empty Date!..');
                $('#date').focus();
            }
            else {
                AddActivity();
            }
    
        }

        function refreshform() {
            $('#title').val('');
            $('#description').val('');
            $('#date').val('');
        }

        $('#addactivity').click(function () {
            $('#activityform').slideDown('slow');
            $('#activitydetails').slideUp('slow');
            refreshform();
        })
        $('#cancel').click(function () {
            $('#activityform').slideUp('slow');
            $('#activitydetails').slideDown('slow');
            refreshform();
        })


        $('#date').datepicker({
            //minDate: '-30', // The min date that can be selected, i.e. 30 days from the 'now' 
            //   maxDate: '+1m +1w +1d' // The max date that can be selected, i.e. + 1 month, 1 week, and 1 days from 'now' 
        });

        $('#add').click(function () {
            validateactivityform();
        })



        function DisplayActivity() {

            $('#gridActivity').dataTable().fnDestroy();
            $('#gridActivity > tbody > tr').remove();


            var arr = new Array();
            $.ajax({
                type: "POST",
                url: "Activitymgmt.aspx/displayActivity",
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
                        var date = new Date();

                        col += $(this).find("Title").text() + '</td> <td>';
                        col += $(this).find("Description").text() + '</td> <td>';
                        col += moment($(this).find("Date").text()).utcOffset(480).format('MMMM/DD/YYYY') + '</td> <td>';

                        col += '<input id="questionid" type="hidden" value="' + $(this).find("ActivityID").text() + '"/> <a id="makeadmin" class="makeadmin" data-toggle="modal" data-target="#madmin" href="#"><i class="glyphicon glyphicon-chevron-up"></i> Edit</a> <br /> <a id="makeuser" class="makeuser" data-toggle="modal" data-target="#muser" href="#"><i class="glyphicon glyphicon-chevron-down"></i> Delete</a> </td>';

                        $("[id*=gridActivity] tbody").append($(row).append(col));
                    })
                    $('.makeadmin').click(function () {
                        //alert($(this).prev().val());
                        DisplayMakeAdmin($(this).prev().val());
                    });

                    $('.makeuser').click(function () {
                        DisplayMakeUser($(this).prev().prev().prev().val());
                    });
                    $('#gridActivity').dataTable();


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        function AddActivity() {
            var arr = new Array();
            arr[0] = $('#title').val();
            arr[1] = $('#description').val();
            arr[2] = $('#date').val();

            $.ajax({
                type: "POST",
                url: "Activitymgmt.aspx/addActivity",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {

                $('#activityform').slideUp('slow');
                $('#activitydetails').slideDown('slow');
                refreshform();

                alert('Activity has bee Added! ');
                DisplayActivity()
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


