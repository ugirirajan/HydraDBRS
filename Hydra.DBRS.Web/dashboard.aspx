﻿<%@ Page Title="" Language="C#" MasterPageFile="~/dbrs.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Main content -->
        <section class="content">

            <div class="row" style="margin-bottom: 5px;">
                <div class="col-md-3">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-blue"><i class="fa fa-paperclip"></i></span>
                        <div class="sm-st-info">
                            <span>4567</span>
                            Total Documents
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                        <div class="sm-st-info">
                            <span>3200</span>
                            Completed Documents
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-violet"><i class="fa fa-paperclip"></i></span>
                        <div class="sm-st-info">
                            <span>2200</span>
                            Approved
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-red"><i class="fa fa-dollar"></i></span>
                        <div class="sm-st-info">
                            <span>320</span>
                            Error/Disapproved
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main row -->
            <div class="row">

                <div class="col-md-8">
                    <section class="panel">
                        <header class="panel-heading">
                            Work Progress
                        </header>
                        <div class="panel-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Company</th>
                                        <th>File Name</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Facebook</td>
                                        <td>Mark</td>
                                        <td><span class="label label-danger">error</span></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Twitter</td>
                                        <td>Evan</td>
                                        <td><span class="label label-success">completed</span></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Google</td>
                                        <td>Larry</td>
                                        <td><span class="label label-warning">in progress</span></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>LinkedIn</td>
                                        <td>Allen</td>
                                        <td><span class="label label-info">in progress</span></td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Tumblr</td>
                                        <td>David</td>
                                        <td><span class="label label-warning">in progress</span></td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Tesla</td>
                                        <td>Musk</td>
                                        <td><span class="label label-info">in progress</span></td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>Ghost</td>
                                        <td>XXX</td>
                                        <td><span class="label label-info">in progress</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>


                </div>
                <!--end col-6 -->
                <div class="col-md-4">
                    <section class="panel">
                        <header class="panel-heading">
                            Team Chat
                        </header>
                        <div class="panel-body">
                            <div class="twt-area">
                                <form action="#" method="post">
                                    <textarea class="form-control" name="profile-tweet" placeholder="Share something..." rows="3"></textarea>

                                    <div class="clearfix">
                                        <button class="btn btn-sm btn-primary pull-right" type="submit">
                                            Send
                                        </button>
                                        <a class="btn btn-link btn-icon fa fa-location-arrow" data-original-title="Add Location" data-placement="bottom" data-toggle="tooltip" href="#" style="text-decoration: none;" title=""></a>
                                        <a class="btn btn-link btn-icon fa fa-camera" data-original-title="Add Photo" data-placement="bottom" data-toggle="tooltip" href="#"
                                            style="text-decoration: none;" title=""></a>
                                    </div>
                                </form>
                            </div>
                            <ul class="media-list">
                                <li class="media">
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small><em>30 min ago</em></small>
                                        </span>
                                        <a href="page_ready_user_profile.php">
                                            <strong>Employee 1</strong>
                                        </a>
                                        <p>
                                            In hac <a href="#">habitasse</a> platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend.
                                        <a href="#" class="text-danger">
                                            <strong>#dev</strong>
                                        </a>
                                        </p>
                                    </div>
                                </li>
                                <li class="media">
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small><em>30 min ago</em></small>
                                        </span>
                                        <a href="page_ready_user_profile.php">
                                            <strong>Admin</strong>
                                        </a>
                                        <p>
                                            In hac <a href="#">habitasse</a> platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend.
                                        <a href="#" class="text-danger">
                                            <strong>#design</strong>
                                        </a>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </section>
                </div>

            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="panel">
                        <header class="panel-heading">
                            Allocate Work
                        </header>

                        <ul class="list-group teammates">
                            <li class="list-group-item">
                                <span class="pull-right label label-danger inline m-t-15">Admin</span>
                                <a href="">Damon Parker</a>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right label label-info inline m-t-15">Member</span>
                                <a href="">Joe Waston</a>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right label label-warning inline m-t-15">Editor</span>
                                <a href="">Jannie Dvis</a>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right label label-warning inline m-t-15">Editor</span>
                                <a href="">Emma Welson</a>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right label label-success inline m-t-15">Subscriber</span>
                                <a href="">Emma Welson</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-7">
                    <section class="panel tasks-widget">
                        <header class="panel-heading">
                            Todo list
                        </header>
                        <div class="panel-body">
                            <div class="task-content">
                                <ul class="task-list">
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey list-child" />
                                            <!-- <input type="checkbox" class="square-grey"/> -->
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Director is Modern Dashboard</span>
                                            <span class="label label-success">2 Days</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Fully Responsive & Bootstrap 3.0.2 Compatible</span>
                                            <span class="label label-danger">Done</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Latest Design Concept</span>
                                            <span class="label label-warning">Company</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Write well documentation for this theme</span>
                                            <span class="label label-primary">3 Days</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Don't bother to download this Dashbord</span>
                                            <span class="label label-inverse">Now</span>
                                            <div class="pull-right">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Give feedback for the template</span>
                                            <span class="label label-success">2 Days</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="task-checkbox">
                                            <!-- <input type="checkbox" class="list-child" value=""  /> -->
                                            <input type="checkbox" class="flat-grey" />
                                        </div>
                                        <div class="task-title">
                                            <span class="task-title-sp">Tell your friends about this admin template</span>
                                            <span class="label label-danger">Now</span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button>
                                                <button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class=" add-task-row">
                                <a class="btn btn-success btn-sm pull-left" href="#">Add New Tasks</a>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- row end -->
        </section>
        <!-- /.content -->
    </div>
    <!-- ./wrapper -->

</asp:Content>

