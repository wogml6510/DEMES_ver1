<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="unitworkData" value="${dataMap.unitworkData}" />

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
      integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
      crossorigin="anonymous" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body {
   margin-top: 5px;
   width: 100%;
   height: calc(930px - 65px - 63px);
   padding: 2px;
}

/* progress bar */
.complete-con, .inProgress-con, .onHold-con, .expected-con {
   border: 1px solid #e7e7e7;
}

.complete-con, .onHold-con {
   margin: 0 5px 0 5px;
}

.conainer {
   width: 260px;
   margin: 20px;
   height: 120px;
   padding-left: 40px;
}

.circle_percent {
   font-size: 200px;
   width: .6em;
   height: .6em;
   position: relative;
   background: #eee;
   border-radius: 50%;
   overflow: hidden;
   display: inline-block;
}

.circle_inner {
   position: absolute;
   left: 0;
   top: 0;
   width: .6em;
   height: .6em;
   clip: rect(0, .6em, .6em, .3em);
}

.round_per {
   position: absolute;
   left: 0;
   top: 0;
   width: .6em;
   height: .6em;
   background: red;
   clip: rect(0, .6em, .6em, .3em);
   transform: rotate(180deg);
   transition: 1.05s;
}

.chart-yellow .round_per, .chart-yellow .percent_more:after {
   background: yellow;
}

.chart-red .round_per, .chart-red .percent_more:after {
   background: red;
}

.chart-blue .round_per, .chart-blue .percent_more:after {
   background: blue;
}

.chart-green .round_per, .chart-green .percent_more:after {
   background: green;
}

.percent_more .circle_inner {
   clip: rect(0, .3em, .6em, 0em);
}

.percent_more:after {
   position: absolute;
   left: .3em;
   top: 0em;
   background: red;
   right: 0;
   bottom: 0;
   content: '';
}

.circle_inbox {
   position: absolute;
   top: 10px;
   left: 10px;
   right: 10px;
   bottom: 10px;
   background: #fff;
   z-index: 3;
   border-radius: 50%;
}

.percent_text {
   position: absolute;
   font-size: 36px;
   left: 50%;
   top: 50%;
   transform: translate(-50%, -50%);
   z-index: 3;
}

.desc {
   padding-left: 30px;
}

.progress-title {
   font-size: 2rem;
   padding-bottom: 8px;
}

.progress-count, .progress-percent {
   font-size: 19px;
}

html {
   font-size: 14px;
   font-family: Arial, Helvetica, sans-serif;
}

.k-gantt-treelist span>strong {
   background: pink;
}

.kendo-
</style>

<div class="">
      <div class="">
            <!-- project작업공간 -->
            <div class="">
                  <!-- 총 프로젝트 진행률 시작-->
                  <div class="project-con w-full flex row" style="height: 160px;">
                        <div class="project-card col-sm" style="background-color: #e6f2fc; width: 20%; height: inherit;">
                              <span class="flex" style="padding: 40px 30px; flex-direction: column;">
                                    <span style="font-size: 18px; color: #4d4d4d;">
                                          <b>프로젝트 진행률</b>
                                    </span>
                                    <span style="font-size: 20px; color: #046fc7;">
                                          <b>26%</b>
                                    </span>
                              </span>
                        </div>
                        <!-- 총 프로젝트 진행률 끝-->


                        <!-- 프로젝트 프로그래스바 부분 시작-->
                        <!-- 완료 -->
                        <div class="complete-con">
                              <div class="conainer flex chart-green">
                                    <div class="circle_percent" data-percent=80>
                                          <div class="circle_inner">
                                                <div class="round_per round1"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>완료</b>
                                          </p>
                                          <p class="desc progress-count">건수</p>
                                          <p class="desc progress-percent">진행률</p>
                                    </div>
                              </div>

                        </div>
                        <!-- 진행중 -->
                        <div class="inProgress-con">
                              <div class="conainer flex chart-blue">
                                    <div class="circle_percent" data-percent=60>
                                          <div class="circle_inner">
                                                <div class="round_per round2"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>진행중</b>
                                          </p>
                                          <p class="desc progress-count">건수</p>
                                          <p class="desc progress-percent">진행률</p>
                                    </div>
                              </div>
                        </div>

                        <!-- 지연 -->
                        <div class="onHold-con">
                              <div class="conainer flex chart-red">
                                    <div class="circle_percent" data-percent=70>
                                          <div class="circle_inner">
                                                <div class="round_per round3"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>지연</b>
                                          </p>
                                          <p class="desc progress-count">건수</p>
                                          <p class="desc progress-percent">진행률</p>
                                    </div>
                              </div>
                        </div>

                        <!-- 예정 -->
                        <div class="expected-con">
                              <div class="conainer flex chart-yellow">
                                    <div class="circle_percent" data-percent=50>
                                          <div class="circle_inner">
                                                <div class="round_per round4"></div>
                                          </div>
                                    </div>
                                    <div>
                                          <p class="desc progress-title">
                                                <b>예정</b>
                                          </p>
                                          <p class="desc progress-count">건수</p>
                                          <p class="desc progress-percent">진행률</p>
                                    </div>
                              </div>
                        </div>
                        <!-- 프로젝트 프로그래스바 부분 끝-->



                  </div>

                  <!-- gantt chart markup -->
                  <div id="gantt"></div>
                  <!-- gantt chart markup -->

            </div>

      </div>
</div>
<%@ include file="../common/foot.jsp"%>