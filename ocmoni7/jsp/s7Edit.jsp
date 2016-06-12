<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>s7编译页面</title>
    <jsp:include page="/WEB-INF/pages/oc/oc_common.jsp"></jsp:include>
</head>
<body>
<!--导航 start-->
<div class="navbar-fixed-top">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-9" aria-expanded="false">
                    <span class="sr-only">导航菜单</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">附加服务</a></li>
                    <li><a href="#">数据源配置</a></li>
                    <li><a href="#">里程积分兑换</a></li>
                    <li><a href="#">运价校验</a></li>
                    <li><a href="#">批量导入</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <!--query section start-->
    <div class ="query_section">
        <span class="query_title">新建服务费用</span>
        <span>服务类型&nbsp;|</span>
        <span>费用&nbsp;|</span>
        <span>规则</span>
        <span class="pull-right marginR15" style="padding-top: 2px">
            <button type="submit" id ="saveBtn" class="btn btn-default btn-sm">保存</button>
            <button type="submit" id ="saveAndPublishBtn" class="btn btn-default btn-sm btn-success">保存并发布</button>
        </span>
    </div>
    <!--query section end-->
</div>
<!--导航 end-->


<!--主编辑区域 start-->
<div class="container-fluid main_content">
    <form class="form-horizontal">
        <div class="data_section">
            <div class="title_layout">
                <span class="left">1.选择附加服务</span>
                <span style="margin-right:40px;"></span>
                <span class="serviceInputSpan right"></span>
            </div>
            <div class="content_layout">
                <!-- 附加服务选择框-->
                <div class="service_choose_layout">
                    <s><i></i></s>
                    <div class="service_choose">
                        <div class="choose_box">
                            <div class="choose_box_title">
                                <input type="text" class="form-control input-sm"  placeholder="选择服务分组" />
                            </div>
                            <div class="service_list">
                                <ul>
                                    <li bindonce ng-repeat="l in serviceGroupList"
                                        ng-click="subGroupQuery(l.serviceGroupDescription,l.serviceGroup)" bo-bind="l.serviceGroupDescription">
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="choose_box choose_box_right">
                            <div class="choose_box_title">
                                <input type="text" class="form-control input-sm"  placeholder="选择服务分组" />
                            </div>
                            <div class="service_list">
                                <ul>
                                    <li bindonce ng-repeat="l in subGroupList"
                                        ng-click="s5Query(l.subGroupDescription,l.subGroup)"  bo-bind="l.subGroupDescription">
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="choose_box choose_box_right">
                            <div class="choose_box_title">
                                <input type="text" class="form-control input-sm"  placeholder="选择服务分组" />
                            </div>
                            <div class="service_list">
                                <ul>
                                    <li bindonce ng-repeat="l in lastGroupList"
                                        ng-click="lastChooseClick(l)">
                                        <div class="service_name">
                                            <span class="serviceTypeSpan" bo-bind = "l.serviceType"></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="choose_box choose_box_right">
                            <div class="choose_box_title">
                                <span class="text-info">服务详细</span>
                            </div>
                            <div class="service_list">
                                <ul>
                                    <li bindonce ng-repeat="l in lastGroupList2" class="choose4li">
                                        <div class="service_name">
                                            <p bo-bind="'['+l.subCode+']'+l.commercialName"></p>
                                            <span bo-bind="'x'+l.subCodeOccurence"></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--第二部分‘确定费用’ start-->
        <div class="data_section ">
            <div class="title_layout">
                <span class="left">2.确定费用</span>
                <span class="right text-info"> 描述  | 费用 </span>
            </div>
            <!--描述 strart-->
            <div class="content_layout">
                <span class="left">描述</span>
                <span class="right">
                   <div class="form-group">
                       <label for="inputEmail3" class="pure-u-1-8 control-label">销售生效日期</label>
                       <div class="pure-u-1-4">
                           <input type="text" id ="id1"  class="form-control input-sm datetimepicker" id="inputEmail3" placeholder="销售生效日期">
                       </div>
                       <label for="id1" class="glyphicon glyphicon-th iconfont_box"></label>
                       <span class="input_error_tip">这里是错误提示信息</span>
                   </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">销售截止日期</label>
                        <div class="pure-u-1-4">
                            <input type="text" id="id2" class="form-control input-sm datetimepicker"  placeholder="销售截止日期" >
                        </div>
                        <label for="id2" class="glyphicon glyphicon-th iconfont_box"></label>

                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">服务套数</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"  placeholder="起始套数" >
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"  placeholder="结束套数" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">描述</label>
                        <div class="pure-u-1-2">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">产品代号</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                        <span class="input_error_tip">这里是错误提示信息</span>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">是否检查库存</label>
                        <div class="pure-u-1-4" >
                            <div class="radio-inline">
                                <input type="radio" ><label>是</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio" ><label>否</label>
                            </div>
                        </div>
                    </div>
                </span>
            </div>
            <!--描述 end-->
            <!--费用 strart-->
            <div class="content_layout">
                <span class="left">费用</span>
                <span class="right">
                   <div class="form-group">
                       <label class="pure-u-1-8 control-label">是否收费</label>
                       <div class="pure-u-1-4">
                           <select class="form-control input-sm">
                               <option value="">1</option>
                               <option value="">2</option>
                               <option value="">3</option>
                           </select>
                       </div>
                   </div>

                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">金额</label>
                        <div class="pure-u-1-2 " >
                            <div class="table_control">
                                <a href="#">填写表格</a>
                                <span class="table_reuse">
                                    <label class ="text-info">复用表号:</label>
                                    <input type="text" class="common_input" id="autocomplete" style="width: 100px"/>
                                    <span class="iconfont_box">
                                        <i class="glyphicon glyphicon-search gray"></i>
                                    </span>
                                    <span class ="text-danger myhand">自定义表格</span>
                                </span>
                            </div>

                            <div class="table_layout" style ="width:460px">
                                <table>
                                    <thead>
                                    <tr> <th>销售地类型</th> <th>销售地代码</th><th>金额</th><th>货币类型</th></tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><select name="" class="common_input" ><option value="">选择</option><option value="">国家</option></select></td>
                                        <td><input type="text" class="common_input"></td>
                                        <td><input type="text" class="common_input"> </td>
                                        <td><input type="text" class="common_input"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table_footer">
                                    <button class="btn btn-success btn-sm">增加一行</button>
                                    <button class="btn btn-default btn-sm">删除一行</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">或/和</label>
                        <div class="pure-u-1-4">
                            <div class="radio-inline">
                                <input type="radio" /><label class="radioLabel">或则</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio" /><label  class="radioLabel">和</label>
                            </div>
                        </div>
                    </div>

                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">里程兑换标识</label>
                         <div class="pure-u-1-2">
                            <div class="radio-inline"><input type="radio" /><span>不兑换</span></div>
                            <div class="radio-inline"><input type="radio" /><span>兑换，用里程支付</span></div>
                            <div class="radio-inline"><input type="radio" /><span>兑换，用里程或金额支付</span></div>
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">里程费</label>
                         <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">适用于</label>
                         <div class="pure-u-1-4">
                             <select class="form-control input-sm">
                                 <option value="">选择</option>
                                 <option value="">每用一次服务算一次服务费用</option>
                                 <option value="">3</option>
                             </select>
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">包含/扣除</label>
                         <div class="pure-u-1-4">
                             <select class="form-control input-sm">
                                 <option value="">选择</option>
                                 <option value="">每用一次服务算一次服务费用</option>
                                 <option value="">3</option>
                             </select>
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">净价/销售价</label>
                         <div class="pure-u-1-4">
                             <select class="form-control input-sm">
                                 <option value="">选择</option>
                                 <option value="">每用一次服务算一次服务费用</option>
                                 <option value="">3</option>
                             </select>
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">有无代理费</label>
                         <div class="pure-u-1-4">
                             <span class="radio-inline"><input type="radio" /><label >有</label></span>
                             <span class="radio-inline"><input type="radio" /><label>无</label></span>
                         </div>
                     </div>
                     <div class="form-group">
                         <label  class="pure-u-1-8 control-label">有无税费</label>
                         <div class="pure-u-1-4">
                            <span class="radio-inline"> <input type="radio" /><label  class="radioLabel">有</label></span>
                            <span class="radio-inline"> <input type="radio" /><label class="radioLabel">无</label></span>
                         </div>
                     </div>
                </span>
            </div>
            <!--费用 end-->
        </div>
        <!--第二部分‘确定费用’ end-->
        <!--第三部分‘规则详细’ start-->
        <div class="data_section">
            <div class="title_layout">
                <span class="left">3.规则详细</span>
                <span class="text-info">序号  | 旅客  | 发布  | 航程  | 航班  | 购买  | 票价  | 票证  | 退款</span>
            </div>
            <!--序号 strart-->
            <div class="content_layout">
                <span class="left">序号</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">优先级序号</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                    </div>
                </span>
            </div>
            <!--序号 end-->

            <!--旅客 strart-->
            <div class="content_layout">
                <span class="left">旅客</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">旅客范围</label>
                        <div class="pure-u-1-4">
                            <select name=""  class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">年龄范围</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">服务适用人数范围</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">旅客序号范围</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">常旅客状态</label>
                        <div class="pure-u-1-4">
                            <select name=""  class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">客户积分范围</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">大客户/特殊客户</label>
                        <div class="pure-u-1-2 control_right_content">
                            <a href="">填写表格</a>
                            <div class="table_layout" style ="width:160px">
                                <table>
                                    <thead>
                                    <tr> <th>大客户编码</th></tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td> <input type="text" class="common_input"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </span>
            </div>
            <!--旅客 end-->

            <!--发布 strart-->
            <div class="content_layout">
                <span class="left">发布</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">发布对象</label>
                        <div class="pure-u-1-2 control_right_content">
                            <a href="">填写表格</a>
                            <div class="table_layout" style ="width:750px">
                                <table>
                                    <thead>
                                    <tr>
                                        <th width="62px">旅行社</th>
                                        <th width="100px">航空公司/分销商</th>
                                        <th width="76px">职责/功能码</th>
                                        <th width ="80px">区域类型</th>
                                        <th width ="65px">区域代码</th>
                                        <th width ="150px">发布对象类型</th>
                                        <th width ="87px">发布对象代码</th>
                                        <th width ="110px">权限</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                        <td> <input type="text" class="common_input" style="width:93%;"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">公布私有</label>
                        <div class="pure-u-1-4">
                            <div class="radio-inline">
                                <input type="radio" /><label>公布</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio" /><label>私有</label>
                            </div>
                        </div>
                    </div>

                </span>
            </div>
            <!--发布 end-->

            <!--航程 strart-->
            <div class="content_layout">
                <span class="left">航程</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">区域限制</label>
                        <div class="pure-u-1-2">
                            <div class="radio-inline">
                                <input type="radio"/><label>不限区域</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio"/><label>区域1→2</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio"/><label>区域2→1</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio"/><label>区域1内部</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">Sector/Portion/Journey</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                        <i class="glyphicon glyphicon-asterisk red input_tip"></i>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">指定区域</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">经停时间</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">经停类型</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">区域1</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">区域2</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">经停区域</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">里程范围</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">是否联程</label>
                        <div class="pure-u-1-4">
                            <div class="radio-inline">
                                <input type="radio"/><label>是</label>
                            </div>
                            <div class="radio-inline">
                                <input type="radio"/><label>否</label>
                            </div>
                        </div>
                    </div>
                </span>
            </div>
            <!--航程 end-->

            <!--航班 strart-->
            <div class="content_layout">
                <span class="left">航班</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">旅行开始日期</label>
                        <div class="pure-u-1-4">
                            <input type="text" id="date3" class="form-control input-sm datepicker"  >
                        </div>
                        <label for="date3" class="glyphicon glyphicon-th iconfont_box"></label>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">旅行结束日期</label>
                        <div class="pure-u-1-4">
                            <input id="date4" type="text" class="form-control input-sm datepicker"  >
                        </div>
                        <label for="date4" class="glyphicon glyphicon-th iconfont_box"></label>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">开始时刻</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm datepicker"  >
                        </div>
                        <span class="glyphicon glyphicon-th iconfont_box"></span>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">结束时刻</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm datepicker"  >
                        </div>
                        <span class="glyphicon glyphicon-th iconfont_box"></span>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">应用范围</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm" >
                                <option value="">选择</option>
                                <option value="">1</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">星期</label>
                        <div class="pure-u-1-2">
                            <div class="checkbox-inline"> <input type="checkbox"/><label>星期一</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期二</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期三</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期四</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期五</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期六</label></div>
                            <div class="checkbox-inline"><input type="checkbox"/><label>星期日</label></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">机型</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">航班号</label>
                        <div class="pure-u-1-2 control_right_content">
                            <a href="">填写表格</a>
                            <div class="table_layout" style ="width:360px">
                                <table>
                                    <thead>
                                    <tr> <th>市场方</th><th>承运方</th><th>航班号</th></tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td> <input type="text" class="common_input"></td>
                                        <td> <input type="text" class="common_input"></td>
                                        <td> <input type="text" class="common_input"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">舱位等级</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">定座属性表</label>
                        <div class="pure-u-1-4 control_right_content">
                            <a href="">填写表格</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">升舱到的服务等级</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                </span>
            </div>
            <!--航班 end-->

            <!--购买 strart-->
            <div class="content_layout">
                <span class="left">购买</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">提前购票时间</label>
                        <div class="pure-u-1-8">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                        <div class="pure-u-1-8">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                </span>
            </div>
            <!--购买 end-->

            <!--兑换 strart-->
            <div class="content_layout">
                <span class="left">兑换</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">允许兑换的服务</label>
                        <div class="pure-u-1-4 control_right_content">
                            <span class="text-info ">航班</span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-12 control-label">兑换信息</label>
                        <div class="pure-u-1-4 control_right_content">
                            <a href="">填写表格</a>
                            <div class="table_layout" style="width: 870px">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>&nbsp;</th>
                                        <th colspan ="3">原始运价</th>
                                        <th>&nbsp;</th>
                                        <th colspan ="3">新票填开</th>
                                    </tr>
                                    <tr>
                                        <th width ="127">兑换舱位</th>
                                        <th width ="58">office</th>
                                        <th width ="58">IATA_NO</th>
                                        <th width ="103">DepartmentCode</th>
                                        <th width ="152">farebasis</th>
                                        <th width ="150">差价</th>
                                        <th width ="143">TourCode</th>
                                        <th width ="138">签注</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="selected_td">
                                        <td><input class ="common_input" type ="text" style="width:96%" placeholder="A/B/C/D" /></td>
                                        <td><input type ="text" style="width: 98%" class ="common_input" /></td>
                                        <td><input type ="text" style="width:98%" class ="common_input" /></td>
                                        <td><input type ="text" style="width:98%" class ="common_input" /></td>
                                        <td>
                                            <span style="display:inline-block;width: 46%">原始运价&nbsp;</span>
                                            <input type ="text" style="width:50%" class ="common_input"/>
                                            <div style="padding-top: 2px">
                                                <span style="display:inline-block;width: 46%">新票面</span>
                                                <input type ="text" style="width:50%" class ="common_input"/>
                                            </div>
                                        </td>
                                        <td>
                                            <select style ="width:98%" class ="common_input">
                                                <option value="0">免差价</option>
                                                <option value ="1">收差价,ET计算差额</option>
                                                <option value ="2">收差价,自定义差额</option>
                                            </select>
                                            <div style="margin-top: 2px">
                                                <input type ="text" style="width: 47%" class ="common_input"/>
                                                <span style="float: right;width:49%;margin-right: 2px;">
                                                    <select  class="common_input">
                                                        <option value ="">选择</option>
                                                        <option value ="CNY">CNY</option>
                                                        <option value ="USD">USD</option>
                                                        <option value ="EUR">EUR</option>
                                                        <option value ="RUB">RUB</option>
                                                        <option value ="CAD">CAD</option>
                                                    </select>
                                                </span>
                                                <span class="clearfix"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0)" >编辑TourCode文本</a><br>
                                            <span style="display:inline-block;width: 48%">附加规则</span>
                                            <input type ="text" style ="width:48%" class="common_input"  placeholder ="如:123"/>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0)" >编辑备注文本</a><br>
                                            <span style="display:inline-block;width: 48%">附加规则</span>
                                            <input type ="text" style="width:48%" class="common_input" placeholder ="如:123"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </span>
            </div>
            <!--兑换 end-->

            <!--票价 strart-->
            <div class="content_layout">
                <span class="left">票价</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">旅行编码</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">TICKET DESIGNATOR</label>
                        <div class="pure-u-1-4 control_right_content">
                            <a href="">填写表格</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">TARIFF NO.</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">RULE NO.</label>
                        <div class="pure-u-1-4">
                            <input type="text" class="form-control input-sm"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">RESULTING TICKET DESIGNATOR </label>
                        <div class="pure-u-1-4 control_right_content">
                            <a href="">填写表格</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">客票舱位等级表 </label>
                        <div class="pure-u-1-4 control_right_content">
                            <a href="">填写表格</a>
                        </div>
                    </div>
                </span>
            </div>
            <!--票价 end-->

            <!--票证 strart-->
            <div class="content_layout">
                <span class="left">票证</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">与机票同时出票</label>
                        <div class="pure-u-1-4">
                            <div class="radio-inline"><input type="radio"/><label>是</label></div>
                            <div class="radio-inline"><input type="radio"/><label>否</label></div>
                        </div>
                    </div>
                </span>
            </div>
            <!--票证 end-->

            <!--退款 strart-->
            <div class="content_layout">
                <span class="left">退款</span>
                <span class="right">
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">是否可退</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="pure-u-1-8 control-label">退款形式</label>
                        <div class="pure-u-1-4">
                            <select name="" class="form-control input-sm">
                                <option value="">选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                </span>
            </div>
            <!--退款 end-->

        </div>
        <!--第三部分‘规则详细’ end-->

    </form>
</div>
<!--主编辑区域 end-->


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/oc/components/jquery/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/oc/components/angular/angular.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/oc/dist/s7Edit.js"></script>
</body>
</html>