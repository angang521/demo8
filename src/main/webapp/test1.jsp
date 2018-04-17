<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<!-- Head -->
<head>
    <meta charset="utf-8"/>
    <title>代扣平台配置管理</title>
    <meta name="description" content="话费充值商品管理"/>
    <div th:replace="/system/resource/base/baseHead.template"></div>
</head>
<!-- /Head -->
<!-- Body -->
<body>
<!-- 引入头部 -->
<div th:include="/system/resource/base/baseNav.template"></div>
<link th:href="${application.resourceUrl}+'/assets/css/datetimepicker.css'" rel="stylesheet"/>
<!-- /引入头部 -->

<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">

        <!-- 引入左侧菜单 -->
        <div class="page-sidebar" id="sidebar" th:include="/system/resource/base/baseLeftMenu.template"></div>
        <!-- /引入左侧菜单 -->

        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb"></ul>
            </div>
            <!-- /Page Breadcrumb -->
            <!-- Page Body -->
            <div class="page-body">
                <div class="row" id="query_result">
                    <div class="col-xs-12 col-md-12" id="Project_List_Form">
                        <div class="widget">

                            <!-- 查询框 -->
                            <div class="widget  radius-bordered">
                                <div class="widget-header">
                                    <span class="widget-caption"><i class="fa fa-cogs"></i>&nbsp;查询条件</span>
                                </div>
                                <div class="widget-body">
                                    <form id="query-form" method="post" class="form-horizontal bv-form">
                                        <table class="querytable">
                                            <tr>
                                                <td class="form-group col-md-6">
                                                    <label class="col-lg-6 control-label">运营商:</label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control input-sm"
                                                               id="query_carrierOperator" name="carrierOperator"
                                                               data-bv-checkUnsafeLetters="true"/>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="col-lg-12 col-lg-offset-5">
                                                            <button type="button" class="btn default"
                                                                    onclick="$.bboss.form.resetForm('#query-form')">重置
                                                            </button>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="button" class="btn btn-warning"
                                                                    onclick="$.bboss.form.doSearch('#query-form',initTableDate);">
                                                                查询
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </table>

                                    </form>
                                </div>
                            </div>
                            <!-- 表格头部 -->
                            <div class="widget-header ">
                                <span class="widget-caption"><i class="fa fa-globe"></i>&nbsp;查询结果</span>
                                <div class="widget-buttons">
                                    <button class="btn btn-success" data-toggle="modal" id="save_btn"
                                            onclick="showDialog(false);">
                                        <i class="fa fa-pencil"></i> 新增
                                    </button>
                                    <button class="btn btn-yellow disabled" id="update_btn" onclick="showDialog(true);">
                                        <i class="fa fa-pencil"></i> 修改
                                    </button>
                                    <button class="btn btn-danger disabled" id="delete_btn"
                                            onclick="$.bboss.form.doDelete(_tableDataList,doDeleteCallBack);">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                </div>
                            </div>
                            <!-- 表格主体 -->
                            <div class="widget-body" id="Service_Table">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 添加-----管理页面 -->
                <div class="col-xs-12 col-md-12" id="manage_add_dialog" modifyFlag="" style="display: none;">
                    <div class="widget radius-bordered">
                        <div class="widget-header">
                            <span class="widget-caption"><i class="fa fa-cogs"></i>&nbsp;<span
                                    id="modifyTitle">新增</span>代扣配置</span>
                        </div>
                        <div class="widget-body">
                            <form id="manage_add_form" method="post" class="form-horizontal bv-form">
                                <div class="form-title">
                                    基本信息<input type="hidden" name="merchantkey_recordid" id="merchantkey_recordid"/>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">key(商户号+产品码循环次数/产品码超时时间):</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control input-sm" name="controlKey"
                                               id="controlKey" placeholder="key(商户号+产品码/产品码超时)" data-bv-notempty="false"
                                               data-bv-checkUnsafeLetters="false"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label"><font
                                            color="red">*</font>类型(循环次数/超时时间)):</label>
                                    <div class="col-lg-8">
                                        <select class="form-control" name="controlType" id="controlType">
                                            <option value="PRODUCT_TIMEOUT" selected>产品超时时间</option>
                                            <option value="MERCHANT_LOOP">商户轮询次数</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">value(超时时间单位:秒):</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control input-sm" name="controlValue"
                                               id="controlValue" placeholder="值" data-bv-notempty="false"
                                               data-bv-checkUnsafeLetters="false"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label"><font color="red">*</font>状态:</label>
                                    <div class="col-lg-8">
                                        <select class="form-control" name="controlStatus" id="controlStatus">
                                            <option value="NORMAL" selected>正常</option>
                                            <option value="INVALID">失效</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-offset-5 col-lg-8">
                                        <input id="cancel" class="btn btn-default" type="button" value="取消"
                                               onclick="cancelDialog();"/>
                                        <input id="save" class="btn btn-palegreen" type="button" value="增加"
                                               onclick="submit_add(this);"/>
                                        <input id="update" class="btn btn-palegreen" type="button" value="修改"
                                               onclick="submit_update(this);"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Page Body -->
    </div>
</div>
<!-- /Page Content -->
<div th:replace="/system/resource/base/baseFoot.template"></div>
<script th:src="${application.resourceUrl}+'/assets/js/datatable/jquery.dataTables.min.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/datatable/dataTables.tableTools.min.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/datatable/dataTables.bootstrap.min.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/datatable/DT_bootstrap.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/validation/bootstrapValidator.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/validation/bootstrapValidator_zh_CN.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/validator/bootstrapValidator-extend.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/datatable/datatable_client.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/datatable/datatable_server.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/form/form.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/select2/select2.min.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/select2/selectTab.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/dialog/dialog-page.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/dialog/bboss-dialog-page.js?'+${application.JSVERSION}"></script>

<!--Page Related Scripts-->

<script th:inline="javascript">

    var tableId = 'List_Table';
    var initTableDate = function (parms) {
        //初始化表格表格title和对应的值名称
        var titleAndcolumns = [
            {'title': 'key(关键字)', 'column': 'controlKey'},
            {'title': '类型', 'column': 'controlType'},
            {'title': 'value(值)', 'column': 'controlValue'},
            {'title': '状态', 'column': 'controlStatus'}
        ];
        _tableDataList = new $.bboss.datatableServer.init('Service_Table', tableId, titleAndcolumns, WWWROOT + '/capital/service/tradededuct/query.do', parms, function (row, data) {
            $('td:eq(0)', row).html('<label><input type="checkbox" class="checkboxes" value="' + data.controlKey + '" onclick="changeBtnStat(this)" /><span class="text"></span></label>');
        }, true, function () {
        });
    };

    $(document).ready(function () {
        $("#s2id_autogen2").change(function () {
            $.bboss.form.doSearch('#query-form', initTableDate);
        });
        $("#query-form").bootstrapValidator();
        $.bboss.select.ajaxInitSelectTab("#query_carrierOperator", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=personalStore_CarrierOperator");
        $("#manage_add_form").bootstrapValidator();
        $.bboss.form.doSearch('#query-form', initTableDate);
    });

    <!--显示添加对话框-->
    var showDialog = function (modifyflag) {
        $.bboss.form.resetForm("#manage_add_form");
        $('#manage_add_dialog').show();
        $.bboss.select.ajaxInitSelectTab("#carrierOperator", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=personalStore_CarrierOperator");
        $.bboss.select.ajaxInitSelectTab("#priceType", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=personalStore_PriceType");
        $.bboss.select.ajaxInitSelectTab("#commodityStatus", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=personalStore_commodityStatus");
        if (modifyflag) {
            $('#update').show();
            $('#save').hide();
            $('#query_result').hide();
            $.bboss.form.showUpdate("#modifyForm", _tableDataList, null, "name", function (rowData) {
                $("#recordId").val(rowData.recordId);
                $("#carrierId").val(rowData.carrierId);
                $("#sortId").val(rowData.sortId);
                $("#carrierOperator").val(rowData.carrierOperator);
                $("#commodityName").val(rowData.commodityName);
                $("#commodityPrice").val(rowData.commodityPrice);
                $("#commodityStatus").val(rowData.commodityStatus);
                $("#priceType").val(rowData.priceType);
            });
        } else {
            $('#save').show();
            $('#update').hide();
            $('#query_result').hide();
        }
    }
    <!--取消添加对话框-->
    var cancelDialog = function () {
        $.bboss.form.resetForm("#manage_add_form");
        $('#manage_add_dialog').hide();
        $('#query_result').show();
    }
    <!--提交管理信息  -- 增加-->
    var submit_add = function (btnObj) {

        $.bboss.form.doAdd(btnObj, "#manage_add_form", WWWROOT + "/personalStore/service/carrierCommodity/addCarrierCommodity.do", null, function (data) {
            cancelDialog();
            $.bboss.form.doSearch('#query-form', initTableDate);
        });
    }
    <!--提交管理信息  -- 修改-->
    var submit_update = function (btnObj) {
        $.bboss.form.doUpdate(btnObj, "#manage_add_form", WWWROOT + "/personalStore/service/carrierCommodity/updateCarrierCommodity.do", null, function (data) {
            cancelDialog();
            $.bboss.form.doSearch('#query-form', initTableDate);
        });
    }
    <!--删除-->
    var doDeleteCallBack = function (param) {
        bootbox.confirm(" 是否删除【" + param.carrierOperator + "】【" + param.commodityName + "】商品？", function (result) {
            if (result) {
                $.bboss.remote.ajax(WWWROOT + "/personalStore/service/carrierCommodity/deleteCarrierCommodity.do", {"carrierId": param.carrierId}, 'post', function (json) {
                    $.bboss.form.doSearch('#query-form', initTableDate);
                    bootbox.alert('操作成功！');
                });
            }
        });
    }

    <!--复选框 处理-->
    var changeBtnStat = function (obj) {
        $("#update_btn,#delete_btn").addClass('disabled');
        $("#update_btn,#delete_btn").attr('disabled', 'disabled');
        if (obj.checked) {
            $("#update_btn,#delete_btn").removeAttr('disabled');
            $("#update_btn,#delete_btn").removeClass('disabled');
        }
    }
</script>

</body>
<!--  /Body -->
</html>