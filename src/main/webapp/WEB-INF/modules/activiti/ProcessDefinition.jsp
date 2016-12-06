<%--
  Created by IntelliJ IDEA.
  User: LiZW
  Date: 2016/12/4
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%-- EasyUI --%>
    <link rel="stylesheet" type="text/css" href="${applicationScope.staticPath}/EasyUI/jquery-easyui-1.4.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${applicationScope.staticPath}/EasyUI/jquery-easyui-1.4.5/themes/icon.css">
    <script type="text/javascript" src="${applicationScope.staticPath}/EasyUI/jquery-easyui-1.4.5/jquery.min.js"></script>
    <script type="text/javascript" src="${applicationScope.staticPath}/EasyUI/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${applicationScope.staticPath}/EasyUI/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${applicationScope.staticPath}/EasyUI/extend/jquery.easyui.customize.js"></script>

    <%--FancyBox--%>
    <script type="text/javascript" src="${applicationScope.staticPath}/FancyBox/FancyBox-v2.1.5-0/lib/jquery.mousewheel-3.0.6.pack.js"></script>
    <script type="text/javascript" src="${applicationScope.staticPath}/FancyBox/FancyBox-v2.1.5-0/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="${applicationScope.staticPath}/FancyBox/FancyBox-v2.1.5-0/source/jquery.fancybox.css?v=2.1.5" media="screen"/>

    <%-- 加载自定义的全局JS文件 --%>
    <script type="text/javascript" src="${applicationScope.mvcPath}/core/globaljs/globalPath.js"></script>
    <%-- 当前页面的CSS、JS脚本 --%>
    <link rel="stylesheet" type="text/css" href="${applicationScope.modulesPath}/activiti/ProcessDefinition.css">
    <script type="text/javascript" src="${applicationScope.modulesPath}/activiti/ProcessDefinition.js"></script>
    <%-- 页面标题 --%>
    <title>流程定义</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
<%-- 页面上部 --%>
<div data-options="region:'north',border:true,minWidth:800" style="height:75px;">
    <form id="searchForm">
        <%--'name'（默认），'id'，'key'，'category'，'deploymentId'和'version'--%>
        <input type="hidden" name="sort" value="name">
        <input type="hidden" name="order" value="asc">
        <div class="row">
            <span class="column">
                <label for="searchNameLike">流程名称</label>
                <input id="searchNameLike" name="nameLike">
            </span>
            <span class="column">
                <label for="searchCategoryLike">流程类别</label>
                <input id="searchCategoryLike" name="categoryLike">
            </span>
            <span class="columnLast">
                <label for="searchKeyLike">模型Key</label>
                <input id="searchKeyLike" name="keyLike">
            </span>
        </div>
        <div class="row">
            <span class="column">
                <label for="searchResourceNameLike">源数据名称</label>
                <input id="searchResourceNameLike" name="resourceNameLike">
            </span>
            <span class="column">
                <label for="searchStartableByUser">启动的用户</label>
                <input id="searchStartableByUser" name="startableByUser">
            </span>
            <span class="columnLast">
                <label for="searchSuspended">是否挂起</label>
                <input id="searchSuspended" name="suspended">
            </span>
        </div>
        <%--deploymentId--%>
    </form>
</div>

<%-- 页面中部 --%>
<div id="centerPanel" data-options="region:'center',border:true">
    <table id="dataTable" data-options="border:false">
        <thead>
        <tr>
            <th data-options="width:80 ,align:'left',hidden:false,field:'id'">流程ID</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'url'">流程Url</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'version'">流程版本</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'key'">流程Key</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'category'">流程类别</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'suspended'">是否挂起</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'name'">流程名称</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'description'">流程说明</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'deploymentId'">部署ID</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'deploymentUrl'">部署Url</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'graphicalNotationDefined'">是否图形化</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'resource'">流程源数据</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'diagramResource'">流程图形源数据</th>
            <th data-options="width:80 ,align:'left',hidden:false,field:'startFormDefined'">流程表单</th>
            <%--可编译源码 附加可编辑源码--%>
        </tr>
        </thead>
    </table>
    <div id="dataTableButtons">
        <a id="dataTableButtonsSearch" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
        <a id="dataTableButtonsAdd" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    </div>
</div>




启动流程(新建流程实例)
</body>
</html>
