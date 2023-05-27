<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- kendo -->
<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css" />
<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.metro.min.css" />
<script src="//kendo.cdn.telerik.com/2015.3.930/js/jquery.min.js"></script>
<script src="//kendo.cdn.telerik.com/2015.3.930/js/kendo.all.min.js"></script>

<script>
   $(".circle_percent")
         .each(
               function() {
                  var $this = $(this), $dataV = $this.data("percent"), $dataDeg = $dataV * 3.6, $round = $this
                        .find(".round_per");
                  $round.css("transform", "rotate("
                        + parseInt($dataDeg + 180) + "deg)");
                  $this
                        .append('<div class="circle_inbox"><span class="percent_text"></span></div>');
                  $this.prop('Counter', 0).animate(
                        {
                           Counter : $dataV
                        },
                        {
                           duration : 2000,
                           easing : 'swing',
                           step : function(now) {
                              $this.find(".percent_text").text(
                                    Math.ceil(now) + "%");
                           }
                        });
                  if ($dataV >= 51) {
                     $round.css("transform", "rotate(" + 360 + "deg)");
                     setTimeout(function() {
                        $this.addClass("percent_more");
                     }, 1000);
                     setTimeout(function() {
                        $round.css("transform", "rotate("
                              + parseInt($dataDeg + 180) + "deg)");
                     }, 1000);
                  }
               });
</script>
<script>
   
   var tasksDataSource = new kendo.data.GanttDataSource({
      batch : false,
      transport : {
         read : {
            url : "/project/unitwork?PJ_NUM="+PJ_NUM,
            dataType : "json"
         },
         update : {
            url : "/project/unitwork/update",
            dataType : "json"

         },
         create : {
            url : "/project/unitwork/create",
            dataType : "json"

         },
         parameterMap : function(options, operation) {
            if (operation !== "read") {
               return {
                  models : kendo.stringify(options.models || [ options ])
               };
            }
         }
      },
      schema : {
         model : {
            id : "num",
            fields : {
               num : {
                  from : "uw_NUM",
                  type : "int"
               },
               parentId : {
                  from : "uw_NUM",
                  type : "int"
               },
               orderId : {
                  from : "uw_NUM",
                  type : "int"
               },
               title : {
                  from : "uw_NAME",
                  type : "String"
               },
               start : {
                  from : "uw_STARTDATE",
                  type : "date"
               },
               end : {
                  from : "uw_ENDDATE",
                  type : "date"
               },
               percentComplete : {
                  from : "uw_PERCENT",
                  type : "int"
               },
               status : {
                  from : "uw_STATUS",
                  type : "int"
               },
               note : {
                  from : "uw_NOTE",
                  type : "String"
               },
               member : {
                  from : "member_NUM",
                  type : "int"
               },
               pjNum : {
                  from : "pj_NUM",
                  type : "int"
               },
               summary : {
                  from : "Summary",
                  type : "boolean",
                  defaultValue : true
               },
               expanded : {
                  from : "Expanded",
                  type : "boolean",
                  defaultValue : true
               }
            }
         }
      }
   });

   var dependenciesDataSource = new kendo.data.GanttDependencyDataSource({
      batch : false,
      transport : {
         read : {
            url : "/project/unitwork?PJ_NUM="+PJ_NUM,
            dataType : "json"
         },
         update : {
            url : "/project/unitwork/update",
            dataType : "json"
         },
         create : {
            url : "/project/unitwork/create",
            dataType : "json"

         },
         parameterMap : function(options, operation) {
            if (operation !== "read") {
               return {
                  models : kendo.stringify(options.models || [ options ])
               };
            }
         }
      },
      schema : {
         model : {
            num : "num",
            fields : {
               num : {
                  from : "uw_NUM",
                  type : "int"
               },
               parentId : {
                  from : "uw_NUM",
                  type : "int"
               },
               orderId : {
                  from : "uw_NUM",
                  type : "int"
               },
               title : {
                  from : "uw_NAME",
                  type : "String"
               },
               start : {
                  from : "uw_STARTDATE",
                  type : "date"
               },
               end : {
                  from : "uw_ENDDATE",
                  type : "date"
               },
               percentComplete : {
                  from : "uw_PERCENT",
                  type : "int"
               },
               status : {
                  from : "uw_STATUS",
                  type : "int"
               },
               note : {
                  from : "uw_NOTE",
                  type : "String"
               },
               member : {
                  from : "member_NUM",
                  type : "int"
               },
               pjNum : {
                  from : "pj_NUM",
                  type : "int"
               }
            }
         }
      }
   });

   var gantt = $("#gantt").kendoGantt({
      dataSource : tasksDataSource,
      dependencies : dependenciesDataSource,
      views : [ "week", {
         type : "month",
         selected : true
      }, "year" ],
      columns : [ {
         field : "num",
         title : "번호",
         width : 50
      }, {
         field : "title",
         title : "단위업무명",
         width : 300,
         editable : true,
         sortable : true
      }, {
         field : "member",
         title : "담당자",
         width : 100
      }, {
         field : "start",
         title : "시작일",
         format : "{0:yyyy-MM-dd}",
         width : 130,
         editable : true
      }, {
         field : "end",
         title : "종료일",
         format : "{0:yyyy-MM-dd}",
         width : 130,
         editable : true
      }, {
         field : "percentComplete",
         title : "진행률",
         format : "{0:0.##%}",
         width : 65,
         editable : true
      }, {
         field : "status",
         title : "상태",
         width : 70,
         editable : true
      }, {
         field : "note",
         title : "비고",
         width : 300,
         editable : true
      } ],
      showWorkHours : true,
      showWorkDays : true,

      snap : true,

      //add : addTask,
      edit : editTask
   }).data("kendoGantt");

   /* gantt.one("dataBound", function(e) {
      var dsView = e.sender.dataSource.view();
      for (var i = 0; i < dsView.length; i += 1) {

         var currentItem = dsView[i];
         if (currentItem.summary === true && currentItem.id == 7) {
            currentItem.expanded = true;
         }
      }

      gantt.refresh();

      console.log('refresh');
      $('.k-icon.k-i-collapse, .k-icon.k-i-expand').on('click', function() {
         var tr = $(this).parent().parent();

         console.log(gantt.dataItem(tr));
      });
   }); */

   /* var expandedIds = [];
   var returnWithInnerDataIdList= [];

   $("#gantt").kendoGantt.bind("dataBound", function(e) {  
        ganttChart.element.find("tr[data-uid]").each(function (e) {
           var dataItem = ganttChart.dataSource.getByUid($(this).attr("data-uid"));
    
           if (dataItem.expanded == true && jQuery.inArray(dataItem.id, expandedIds) < 0) {
               expandedIds.push(dataItem.id);
               if (dataItem.Level == 1) {
                   returnWithInnerDataIdList.push(dataItem.id);
                   loadDataWithNewIds();
               }
           }
           else if (dataItem.expanded == false && jQuery.inArray(dataItem.id, expandedIds) >= 0) {
               expandedIds = jQuery.grep(expandedIds, function (value) {
                   return value != dataItem.id;
               });
           }
       });
   }); */

   /* const createUnitwork = () => {
        const unitworkData = {
          property1: "uw_NUM",
          property2: "uw_NAME",
          property3: "uw_STARTDATE",
          property4: "uw_ENDDATE",
          property5: "uw_PERCENT",
          property6: "uw_STATUS",
          property7: "uw_NOTE"
          // Add more properties as needed
        };

        fetch('/project/unitwork/create', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(unitworkData),
        })
          .then(response => {
            if (response.ok) {
              console.log('Unitwork created successfully');
            } else {
              console.error('Failed to create unitwork');
            }
          })
          .catch(error => {
            console.error('Error:', error);
          });
      }; */

   function editTask(e) {
      var clickHandler = function(e) {

         console.log("Save button is clicked");

         $(this).off("click", clickHandler);

         history.go(0);
      };

      $(e.container).find(".k-gantt-update").on("click", clickHandler);
   };

   $(document).keyup(function(event) {
      if (window.event.keyCode == 13) {
         history.go(0);
      }
   }); 
</script>


</body>
</html>