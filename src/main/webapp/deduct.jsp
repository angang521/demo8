<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<!-- Head -->
<head>
    <meta charset="utf-8"/>
    <title>首页deduct配置管理</title>

    <div th:replace="/system/resource/base/baseHead.template"></div>
    <link rel="stylesheet" type="text/css" th:href="${application.resourceUrl}+'/assets/js/lightbox/css/lightbox.css'"/>
</head>
<!-- /Head -->
<!-- Body -->
<body>
<!-- 引入头部 -->
<div th:include="/system/resource/base/baseNav.template"></div>
<link th:href="${application.resourceUrl}+'/assets/css/datetimepicker.css'"
      rel="stylesheet"/>
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
                <div class="row">
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
                                                <td class="form-group col-md-4">
                                                    <label class="col-lg-5 control-label">banner名称</label>
                                                    <div class="form-group col-lg-7">
                                                        <input type="text" class="form-control input-sm"
                                                               name="bannerName" data-bv-checkUnsafeLetters="true"/>

                                                    </div>
                                                </td>
                                                <td class="form-group col-md-4">
                                                    <label class="col-lg-5 control-label">省份:</label>
                                                    <div class="form-group col-lg-7">
                                                        <input type="text" class="form-control input-sm"
                                                               id="query_provinceId" name="provinceId"
                                                               data-bv-checkUnsafeLetters="true"/>
                                                    </div>
                                                </td>
                                                <td class="form-group col-md-4">
                                                    <label class="col-lg-5 control-label">banner类型</label>
                                                    <div class="form-group col-lg-7">
                                                        <select name="bannerType" id="bannerType"
                                                                class="form-control input-sm">
                                                            <option value="" selected>--请选择--</option>
                                                            <option value="1">首页大型活动</option>
                                                            <option value="2">底部tab图标</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="form-group">
                                            <div class="col-lg-12 col-lg-offset-5">
                                                <button type="button" class="btn default"
                                                        onclick="$.bboss.form.resetForm('#query-form')">重置
                                                </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button th:if="${session.button_menu['/mbp/service/appBannerService/selectByPage.do']}"
                                                        type="button" class="btn btn-warning"
                                                        onclick="$.bboss.form.doSearch('#query-form',initTableDate);">查询
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- 表格头部 -->
                            <div class="widget-header ">
                                <span class="widget-caption"><i class="fa fa-globe"></i>&nbsp;查询结果</span>
                                <div class="widget-buttons">
                                    <button th:if="${session.button_menu['/mbp/service/appBannerService/add.do']}"
                                            class="btn btn-success" data-toggle="modal" onclick="showModifyDiv('add');">
                                        <i class="fa fa-pencil"></i> 新增
                                    </button>
                                    <button th:if="${session.button_menu['/mbp/service/appBannerService/modify.do']}"
                                            class="btn btn-yellow disabled" id="update_btn"
                                            onclick="showModifyDiv('update');">
                                        <i class="fa fa-pencil"></i> 修改
                                    </button>
                                    <button th:if="${session.button_menu['/mbp/service/appBannerService/delete.do']}"
                                            class="btn btn-danger disabled" id="delete_btn"
                                            onclick="$.bboss.form.doDelete(_tableDataList,doDeleteCallBack);">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                </div>
                            </div>
                            <!-- 表格主体 -->
                            <div class="widget-body" id="Demo_Table">
                            </div>
                        </div>
                    </div>
                    <!-- 添加deduct页页面 -->
                    <div class="col-xs-12 col-md-12" id="Project_Add_Form" modifyFlag="" style="display: none;">
                        <div class="widget radius-bordered">
                            <div class="widget-header">
                                <span class="widget-caption"><i class="fa fa-cogs"></i>&nbsp;<span
                                        id="modifyTitle">新增</span>banner页</span>
                            </div>
                            <div class="widget-body">
                                <form id="uploadForm-auto" method="post" class="form-horizontal bv-form">
                                    <table class="table table-striped table-bordered table-hover dataTable"
                                           aria-describedby="datatable_orders_info" style="table-layout: fixed;">
                                        <tr>
                                            <td colspan="6">
                                                <label class="control-label">图片1——大型活动、底部选中状态图、底部动画图</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-group col-lg-2 "><label class="control-label">上传图片：</label>
                                            </td>
                                            <td class="form-group col-lg-2 bbossfile" colspan="5">
                                                <input type="text" id="filePath-auto" name="filePath"
                                                       data-bv-fileType="true"
                                                       data-bv-fileType-fileType="image/png,image/jpg,image/jpeg,image/gif"
                                                       data-bv-fileMaxSize="true" data-bv-fileMaxSize-maxMB="1"
                                                       bboss-file-photoTitle="图片"/>
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="form-group">
                                        <div class="col-lg-offset-5 col-lg-8">
                                            <span class="btn loading upload_loading"
                                                  style="padding:2px 0 2px 22px;;font-size:13px;display:none;"
                                                  id="upload_loading-auto">文件正在上传中...</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">图片预览:</label>
                                        <div class="col-lg-8">
                                            <img src="" name="image" id="image"/>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="widget-body">
                                <form id="uploadForm-auto-page2" method="post" class="form-horizontal bv-form">
                                    <table class="table table-striped table-bordered table-hover dataTable"
                                           aria-describedby="datatable_orders_info" style="table-layout: fixed;">
                                        <tr>
                                            <td colspan="6">
                                                <label class="control-label">图片2——底部未选中状态图、底部动画图</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-group col-lg-2 "><label class="control-label">上传图片：</label>
                                            </td>
                                            <td class="form-group col-lg-2 bbossfile" colspan="5">
                                                <input type="text" id="filePath-auto-page2" name="filePath"
                                                       data-bv-fileType="true"
                                                       data-bv-fileType-fileType="image/png,image/jpg,image/jpeg,image/gif"
                                                       data-bv-fileMaxSize="true" data-bv-fileMaxSize-maxMB="1"
                                                       bboss-file-photoTitle="图片"/>
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="form-group">
                                        <div class="col-lg-offset-5 col-lg-8">
                                            <span class="btn loading upload_loading"
                                                  style="padding:2px 0 2px 22px;;font-size:13px;display:none;"
                                                  id="upload_loading-auto">文件正在上传中...</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">图片预览:</label>
                                        <div class="col-lg-8">
                                            <img src="" name="image-page2" id="image-page2"/>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="widget-body">
                                <form id="modifyForm" method="post" class="form-horizontal bv-form">
                                    <input type="hidden" name="bannerId"/>
                                    <input type="hidden" name="parentId" id="modify_parentId"/>
                                    <input type="hidden" name="parentName" id="modify_parentName"/>
                                    <input type="hidden" name="parentTag" id="modify_parentTag"/>
                                    <input type="hidden" name="level" id="modify_level"/>
                                    <div class="form-title">
                                        基本信息
                                    </div>

                                    <input type="hidden" name="uploadPath" id="uploadPath" value="">
                                    <input type="hidden" name="uploadPathSub" id="uploadPathSub" value="">

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label"><font
                                                color="red">*</font>banner名称:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="bannerName"
                                                   placeholder="请输入名称" data-bv-notempty="true"
                                                   data-bv-checkUnsafeLetters="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label"><font color="red">*</font>标题:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="title"
                                                   placeholder="请输入名称" data-bv-notempty="true"
                                                   data-bv-checkUnsafeLetters="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">内容:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="content"
                                                   placeholder="请输入内容" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">底部tab默认内容:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="contentSub"
                                                   placeholder="请输入默认内容" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">URL:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="url" id="url"
                                                   placeholder="请输入URL" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">省份:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="provinceId"
                                                   id="provinceId" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label"></font>banner类型:</label>
                                        <div class="col-lg-8">
                                            <select name="bannerType" id="bannerType" class="form-control input-sm">
                                                <option value="1" selected>--首页大型活动--</option>
                                                <option value="2">--底部tab图标--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">字体选中颜色:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="fontColor"
                                                   id="fontColor" placeholder="请输入字体颜色" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">字体默认颜色:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="fontColorSub"
                                                   id="fontColorSub" placeholder="请输入字体默认颜色" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-2 control-label"></font>开始时间:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control datetime input-sm"
                                                   name="beginDateTemp" id="beginDateTemp"
                                                   data-bv-checkUnsafeLetters="false"/>
                                            <input type="hidden" name="beginDate" id="beginDate">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label"></font>结束时间:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control datetime input-sm" name="endDateTemp"
                                                   id="endDateTemp" data-bv-checkUnsafeLetters="false"/>
                                            <input type="hidden" name="endDate" id="endDate">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">展示顺序:</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control input-sm" name="showSeq" id="showSeq"
                                                   placeholder="请输入展示顺序" data-bv-notempty="false"
                                                   data-bv-checkUnsafeLetters="false"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-5 col-lg-8">
                                            <input id="cancel" class="btn btn-default" type="button" value="取消"
                                                   onclick="doAddRoll();"/>
                                            <input id="save" class="btn btn-palegreen" type="button" value="增加"
                                                   onclick="doModify(this);"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Page Body -->
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

<script th:src="${application.resourceUrl}+'/assets/js/jquery-file-upload/js/vendor/jquery.ui.widget.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/jquery-file-upload/js/jquery.iframe-transport.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/jquery-file-upload/js/jquery.fileupload.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/lightbox/js/lightbox.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/bboss/js/upload/bboss-fileUpload.js?'+${application.JSVERSION}"></script>
<script th:src="${application.resourceUrl}+'/assets/js/datetime/bootstrap-datetimepicker.js?'+${application.JSVERSION}"></script>

<!--Page Related Scripts-->
<script th:inline="javascript">
    var tableId = 'List_Table';
    var parentId = '';
    var parentTag = '';
    var parentName = '';
    var img = '';
    var initTableDate = function (parms) {
        //初始化表格表格title和对应的值名称
        var titleAndcolumns = [
            {'title': '选择', 'column': 'bannerId'},
            {'title': 'banner名称', 'column': 'bannerName'},
            {'title': '标题', 'column': 'title'},
            {'title': '类型', 'column': 'bannerTypeConvert'},
            {'title': '内容', 'column': 'content'},
            {'title': 'URL', 'column': 'url'},
            {'title': '省份', 'column': 'province'},
            {'title': '开始时间', 'column': 'beginDate'},
            {'title': '结束时间', 'column': 'endDate'},
            {'title': '更新时间', 'column': 'updatedAt'},
            {'title': '状态', 'column': 'status'}
        ];
        resetControlBtns();
        $.bboss.remote.ajax(WWWROOT + "/mbp/service/appBannerService/selectByPage.do", parms, 'get', function (data) {
            _tableDataList = new $.bboss.datatableClient.init("Demo_Table", tableId, titleAndcolumns, data.result, function (row, data, index) {

                $('td:eq(0)', row).html('<label><input type="checkbox" class="checkboxes" value="' + data.id + '" onclick="changeBtnStat(this)" /><span class="text"></span></label>');

                if (data.parentId == '0' || data.parentId == 0) {
                    parentId = data.id;
                    parentName = data.resName;
                    parentTag = data.tag;

                }
            }, false, function () {
                resetControlBtns();
            });
        });
    };
    var resetControlBtns = function () {
        $("#update_btn,#delete_btn").attr('disabled', 'disabled');
        $("#update_btn,#delete_btn").addClass('disabled');
    }
    var changeBtnStat = function (obj) {
        $("#update_btn,#delete_btn").addClass('disabled');
        $("#update_btn,#delete_btn").attr('disabled', 'disabled');
        if (obj.checked) {
            $("#update_btn,#delete_btn").removeAttr('disabled');
            $("#update_btn,#delete_btn").removeClass('disabled');
        }
    }
    //提交删除
    var doDeleteCallBack = function (param) {
        bootbox.confirm(" 是否删除名称为【" + param.title + "】的记录？", function (result) {
            if (result) {
                $.bboss.remote.ajax(WWWROOT + "/mbp/service/appBannerService/delete.do", {"bannerId": param.bannerId}, 'post', function (json) {
                    bootbox.alert('操作成功！');
                    $.bboss.form.doSearch('#query-form', initTableDate);
                });
            }
        });
    }

    //添加页面取消
    var doAddRoll = function () {
        $('#Project_Add_Form').hide();
        $('#Project_List_Form').show();
    }
    //显示添加/更新
    var showModifyDiv = function (modifyFlag) {


        var oldFlag = $("#Project_Add_Form").attr("modifyFlag");
        $.bboss.select.ajaxInitSelectTab("#provinceId", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=mbp_provinceType");
        if (modifyFlag) {
            if ("add" == modifyFlag) {
                if (oldFlag != modifyFlag) {
                    $.bboss.form.resetForm("#modifyForm");
                }
                $('#Project_List_Form').hide();
                $('#Project_Add_Form').show();
                $("#save").val("新增");
                $('#modifyTitle').text("新增");
            } else if ("update" == modifyFlag) {
                $.bboss.form.resetForm("#modifyForm");
                $.bboss.form.showUpdate("#modifyForm", _tableDataList, null, "name", function (rowData) {
                    $("#image").attr("src", rowData.pageImg);
                    $("#image-page2").attr("src", rowData.pageImgSub);
                    $("#Project_List_Form").hide();
                    $("#Project_Add_Form").show();
                    $("#save").val("更新");
                    $('#modifyTitle').text("更新");
                });
            }
            $("#modify_parentId").val(parentId);
            $("#modify_parentName").val(parentName);
            $("#modify_parentTag").val(parentTag);
            $("#modify_level").val(2);
        }
        $("#Project_Add_Form").attr("modifyFlag", modifyFlag);
    }

    //时间控件
    var handleDateTimePickerOrderTradeQuery = function () {
        $(".datetime").datetimepicker({
            maskInput: true,
            autoclose: true,
            pickSeconds: true,
            pick12HourFormat: false,
            language: 'cn',
            minView: 2,
            maxView: 4,
            viewSelect: 'year',
            readonly: false,
            format: "yyyy-mm-dd",
            endDate: "2050-12-31",
            startDate: "2010-01-01",
            pickerPosition: (false ? "bottom-right" : "bottom-left")
        });
        $('#beginDateTemp').on('change', function (ev) {
            var val = $('#beginDateTemp').val();
            var date = (val != null && val.trim() != '') ? val + " 00:00:00" : val;
            $('#endDateTemp').datetimepicker('setStartDate', val);
            $("#beginDate").val(date);
        });
        $('#endDateTemp').on('change', function (ev) {
            var val = $('#endDateTemp').val();
            var date = (val != null && val.trim() != '') ? val + " 23:59:59" : val;
            $('#beginDateTemp').datetimepicker('setEndDate', val);
            $("#endDate").val(date);
        });

    }

    //新增或者更新
    var doModify = function (btnObj) {
        var flag = $("#Project_Add_Form").attr("modifyFlag");
        if (flag) {
            if ("add" == flag) {
                $.bboss.form.doAdd(btnObj, "#modifyForm", WWWROOT + "/mbp/service/appBannerService/add.do", null, function (data) {
                    $('#Project_Add_Form').hide();
                    $('#Project_List_Form').show();
                    $.bboss.form.doSearch('#query-form', initTableDate);
                });
            } else if ("update" == flag) {
                $.bboss.form.doUpdate(btnObj, "#modifyForm", WWWROOT + '/mbp/service/appBannerService/modify.do', null, function (data) {
                    $('#Project_Add_Form').hide();
                    $('#Project_List_Form').show();
                    $.bboss.form.doSearch('#query-form', initTableDate);
                });
            }
        }
    }
    $(document).ready(function () {
        $("#query-form").bootstrapValidator();
        $("#modifyForm").bootstrapValidator();
        $.bboss.select.ajaxInitSelectTab("#query_provinceId", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=mbp_provinceType");
        $.bboss.select.ajaxInitSelectTab("#query_type", WWWROOT + "/system/service/dictionary/permissionDictValidItems.do?key=" + BBOSS_APPCODE + "_UMSURL-TYPE");
        $('#uploadForm-auto').bootstrapValidator();
        handleDateTimePickerOrderTradeQuery();
        $.bboss.file.initSubmitAuto("/mbp/service/appBannerService/uploadFile.upload", '#filePath-auto', '#uploadForm-auto', null, function (result) {
            $('.download-tr-auto').show();
            $("#uploadPath").val(result.result);
            var url = "http://bestpay.ctdns.net" + result.result;
            $("#image").attr("src", url);
        }, function () {
            $('.download-tr-auto').hide();
        });
        $('#uploadForm-auto-page2').bootstrapValidator();
        $.bboss.file.initSubmitAuto("/mbp/service/appBannerService/uploadFile.upload", '#filePath-auto-page2', '#uploadForm-auto-page2', null, function (result) {
            $('.download-tr-auto').show();
            $("#uploadPathSub").val(result.result);
            var url = "http://bestpay.ctdns.net" + result.result;
            $("#image-page2").attr("src", url);
        }, function () {
            $('.download-tr-auto').hide();
        });

    });
</script>
</body>
<!--  /Body -->
</html>