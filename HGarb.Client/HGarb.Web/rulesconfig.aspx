﻿<%@ Page Title="" Language="C#" MasterPageFile="~/hgarb.Master" AutoEventWireup="true" CodeBehind="rulesconfig.aspx.cs" EnableEventValidation="false" Inherits="HGarb.Web.rulesconfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function addDeField() {
            var selEleVal = $('#lbDEFields').val();
            var tbRuleData = document.getElementById('tbRuleData');
            tbRuleData.value += ' ' + selEleVal;
        }
        function addOpField() {
            var selEleVal = '~' + $('#lbOperator').val() + '~';
            var tbRuleData = document.getElementById('tbRuleData');
            tbRuleData.value += ' ' + selEleVal;
        }

        function genericAddDeField() {
            var selEleVal = $('#generic_stdFieldName').val();
            var tbRuleData = document.getElementById('generic_txtRuleCode');
            tbRuleData.value += ' ' + selEleVal;
        }
        function genericAddOpField() {
            var selEleVal = '~' + $('#generic_lstboxOperator').val() + '~';
            var tbRuleData = document.getElementById('generic_txtRuleCode');
            tbRuleData.value += ' ' + selEleVal;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <section class="panel general">
            <header class="panel-heading tab-bg-dark-navy-blue">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#about" target="_self">Rules Config</a>
                    </li>
                    <li><a href="#generic" data-toggle="tab">Generic Config</a></li>
                </ul>
            </header>
            <div class="panel-body">
                <div class="tab-content">
                    <div id="about" class="tab-pane active">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="CompanyConf">
                                     <div class="row form-group">
                                       <div class="col-lg-12">
                                        <p class="h4">Configure Company Details</p>
                                       </div>
                                    </div>
                                    <div class="row form-group">
                                        <label class="control-label col-lg-2" for="listCompany">Companies</label>
                                        <div class="col-lg-10">
                                            <asp:DropDownList ID="ddlCompany" runat="server" class="form-control m-b-10" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <label class="control-label col-lg-2" for="listTemplates">Templates</label>
                                        <div class="col-lg-10">
                                            <asp:DropDownList ID="ddlCompanyHeaders" runat="server" class="form-control m-b-10" AutoPostBack="true" OnSelectedIndexChanged="ddlCompanyHeaders_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <label class="control-label col-lg-2" for="listTemplates">Element Type</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox runat="server" ID="txtElementType" />
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <label class="control-label col-lg-2" for="listTemplates">IsAutoElementName</label>
                                        <div class="col-lg-10">
                                            <asp:CheckBox runat="server" ID="cbIsAutoElemName" AutoPostBack="true" OnCheckedChanged="cbIsAutoElemName_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <label class="control-label col-lg-2" for="listTemplates">Element Name</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox runat="server" ID="txtElementName" />
                                        </div>
                                    </div>
                                </div>
                                <div class="GenericRulesConf">
                                    <div class="row form-group">
                                       <div class="col-lg-12">
                                        <p class="h4">Configure Generic Rules</p>
                                       </div>
                                    </div>
                                    <div class="row form-group">
                                         <div class="col-lg-2">
                                            <label class="control-label" for="cbIsInheritRule">IsGenericRuleInherited</label>
                                            <asp:CheckBox runat="server" ID="cbIsInheritRule" AutoPostBack="true" OnCheckedChanged="cbIsInheritRule_CheckedChanged" />
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Panel id="panel_GenericRuleType" runat="server" Visible="false">
                                                <label class="control-label col-lg-6" for="ddlSelectAssetClass">Select AssetClass</label>
                                                <asp:DropDownList class="col-lg-6" runat="server" ID="ddlSelectAssetClass" AutoPostBack="true"/>
                                            </asp:Panel>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Button ID="btnAddGenericRule"  runat="server" Text="Add Generic Rule" class="btn btn-info" OnClick="btnAddGenericRule_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="CustomRulesConf">
                                    <div class="row form-group">
                                       <div class="col-lg-12">
                                        <p class="h4">Configure Custom Rules</p>
                                       </div>
                                    </div>
                                    <div class="row form-group">
                                            <label class="col-lg-2 control-label" for="tbRuleName">Rule Name</label>
                                            <div class="col-lg-10">
                                             <asp:TextBox ID="tbRuleName" runat="server"></asp:TextBox>
                                            </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-4">
                                            <label class="control-label" for="lbDEFields">Standard Field Name</label>
                                            <asp:ListBox runat="server" ID="lbDEFields" ClientIDMode="Static" Height="200" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" Width="100%" ondblclick="addDeField()"></asp:ListBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="control-label" for="lbOperator">Operator</label>
                                            <asp:ListBox runat="server" ID="lbOperator" ClientIDMode="Static" Height="200" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" Width="100%" ondblclick="addOpField()">
                                                <asp:ListItem Text="+" Value="PLUS" />
                                                <asp:ListItem Text="-" Value="MINUS" />
                                                <asp:ListItem Text="*" Value="MULTIPLY" />
                                                <asp:ListItem Text="/" Value="DIVIDE" />
                                                <asp:ListItem Text="(" Value="GS" />
                                                <asp:ListItem Text=")" Value="GE" />
                                                <asp:ListItem Text="=" Value="EQUALTO" />
                                                <asp:ListItem Text=">" Value="GREATERTHAN" />
                                                <asp:ListItem Text="<" Value="LESSERTHAN" />
                                                <asp:ListItem Text=">=" Value="GREATERTHANEQUALTO" />
                                                <asp:ListItem Text="<=" Value="LESSERTHANEQUALTO" />
                                                <asp:ListItem Text="OrElse" Value="ORELSE" />
                                                <asp:ListItem Text="AndAlso" Value="ANDALSO" />
                                            </asp:ListBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="control-label" for="tbRuleData">Rule Code</label>
                                            <asp:TextBox ID="tbRuleData" ClientIDMode="Static" runat="server" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" TextMode="MultiLine" Width="100%" Height="200"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-2">
                                            <label class="control-label" for="cbPreviousYear">IsPreviousYear</label>
                                            <asp:CheckBox runat="server" ID="cbPreviousYear" AutoPostBack="true" OnCheckedChanged="cbPreviousYear_CheckedChanged" />
                                        </div>
                                        <div class="col-lg-6">
                                            <form class="form-inline">
                                                <div class="form-group">
                                                    <label class="col=lg-2" for="tbRuleName">Previous Year Columns</label>
                                                    <asp:TextBox class="form-control col=lg-10" ID="tbPrevPeriodValues" runat="server" Width="80%" Enabled="false"></asp:TextBox>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Button ID="btnAddRule"  runat="server" Text="Add Custom Rule" class="btn btn-info" OnClick="btnAddRule_Click" />
                                        </div>
                                    
                                    </div>
                                </div>
                                
                                <div class="RuleSummary">
                                    <div class="row form-group">
                                       <div class="col-lg-12">
                                        <p class="h4">Rules Summary</p>
                                       </div>
                                    </div>
                                    <div class="row form-group">
                                    <div class="col-lg-12">
                                        <asp:Table class="table table-bordered" runat="server" ID="tblRules">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell Text="Rule Name" />
                                                <asp:TableHeaderCell Text="Element Type" />
                                                <asp:TableHeaderCell Text="Element Name" />
                                                <asp:TableHeaderCell Text="IsAutoElementName" />
                                                <asp:TableHeaderCell Text="Rule Data" />
                                                <asp:TableHeaderCell Text="IsPreviousYear" />
                                                <asp:TableHeaderCell Text="Previous Year Columns" />
                                                <asp:TableHeaderCell Text="Rule Action" />
                                            </asp:TableHeaderRow>
                                        </asp:Table>
                                    </div>
                                </div>
                                </div>
                                <div class="SaveRules">
                                    <div class="row form-group">
                                    <div class="col-lg-8">
                                    </div>
                                    <div class="col-lg-4" style="text-align: center;">
                                        <asp:Button ID="btnSave" runat="server" class="btn btn-info" OnClick="btnSave_Click" Text="Save Rules" />
                                    </div>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="generic" class="tab-pane">
                        <asp:UpdatePanel ID="genericRule" runat="server">
                            <ContentTemplate>
                                <div class="row form-group">
                                    <label class="control-label col-lg-2" for="listTemplates">Asset Class</label>
                                    <div class="col-lg-10">
                                        <asp:DropDownList runat="server" ID="ddlAssetClass" Width="30%">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="control-label col-lg-2" for="listTemplates">Element Type</label>
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server" ID="generic_txtElementType" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="control-label col-lg-2" for="listTemplates">IsAutoElementName</label>
                                    <div class="col-lg-10">
                                        <asp:CheckBox runat="server" ID="generic_chkboxIsAutoElementName" AutoPostBack="false"/>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="control-label col-lg-2" for="listTemplates">Element Name</label>
                                    <div class="col-lg-10">
                                        <asp:TextBox runat="server" ID="generic_txtElementName" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-4">
                                        <label class="control-label" for="lbDEFields">Standard Field Name</label>
                                        <asp:ListBox runat="server" ID="generic_stdFieldName" ClientIDMode="Static" Height="200" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" Width="100%" ondblclick="genericAddDeField()"></asp:ListBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label" for="lbOperator">Operator</label>
                                        <asp:ListBox runat="server" ID="generic_lstboxOperator" ClientIDMode="Static" Height="200" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" Width="100%" ondblclick="genericAddOpField()">
                                            <asp:ListItem Text="+" Value="PLUS" />
                                            <asp:ListItem Text="-" Value="MINUS" />
                                            <asp:ListItem Text="*" Value="MULTIPLY" />
                                            <asp:ListItem Text="/" Value="DIVIDE" />
                                            <asp:ListItem Text="(" Value="GS" />
                                            <asp:ListItem Text=")" Value="GE" />
                                            <asp:ListItem Text="=" Value="EQUALTO" />
                                            <asp:ListItem Text=">" Value="GREATERTHAN" />
                                            <asp:ListItem Text="<" Value="LESSERTHAN" />
                                            <asp:ListItem Text=">=" Value="GREATERTHANEQUALTO" />
                                            <asp:ListItem Text="<=" Value="LESSERTHANEQUALTO" />
                                            <asp:ListItem Text="OrElse" Value="ORELSE" />
                                            <asp:ListItem Text="AndAlso" Value="ANDALSO" />
                                        </asp:ListBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label" for="tbRuleData">Rule Code</label>
                                        <asp:TextBox ID="generic_txtRuleCode" ClientIDMode="Static" runat="server" BorderColor="Gray" BorderWidth="1" BorderStyle="Solid" TextMode="MultiLine" Width="100%" Height="200"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-3">
                                        <label class="control-label" for="generic_txtRuleName">Rule Name</label>
                                        <asp:TextBox ID="generic_txtRuleName" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-2">
                                        <label class="control-label" for="generic_chkboxIsPreviousYear">IsPreviousYear</label>
                                        <asp:CheckBox runat="server" ID="generic_chkboxIsPreviousYear" AutoPostBack="true" OnCheckedChanged="generic_chkboxIsPreviousYear_CheckedChanged" />
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="control-label" for="generic_txtPreviousYearColumn">Previous Year Columns</label>
                                        <asp:TextBox ID="generic_txtPreviousYearColumn" runat="server" Width="80%" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-1">
                                        <asp:Button ID="generic_btnAddRule" runat="server" Text="Add Rule" class="btn btn-info" OnClick="generic_btnAddRule_Click" />
                                    </div>
                                    
                                </div>
                                <div class="row form-group">
                                    <asp:Table class="table table-bordered" runat="server" ID="generic_TableRules">
                                        <asp:TableHeaderRow>
                                            <asp:TableHeaderCell Text="Rule Name" />
                                            <asp:TableHeaderCell Text="Element Type" />
                                            <asp:TableHeaderCell Text="Element Name" />
                                            <asp:TableHeaderCell Text="IsAutoElementName" />
                                            <asp:TableHeaderCell Text="Rule Data" />
                                            <asp:TableHeaderCell Text="IsPreviousYear" />
                                            <asp:TableHeaderCell Text="Previous Year Columns" />
                                            <asp:TableHeaderCell Text="Rule Action" />
                                        </asp:TableHeaderRow>
                                    </asp:Table>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-8">
                                    </div>
                                    <div class="col-lg-4" style="text-align: right;">
                                        <asp:Button ID="generic_btnSave" runat="server" class="btn btn-info" OnClick="generic_btnSave_Click" Text="Save Rules" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
