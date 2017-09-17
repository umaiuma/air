function show_chart(id){
  var test_id = id.test;
  var subject_id = id.subject;
  var chapter_id = id.chapter;
  if(chapter_id != -1){
    console.log("chapter chart showing");
    var patterns = current_user.tests[test_id].subjects[subject_id].chapters[chapter_id].patterns;
    draw_chart(patterns);
  }
  else if (subject_id != -1) {
    console.log("subject chart showing");
    var chapters = current_user.tests[test_id].subjects[subject_id].chapters;
    draw_chart(chapters);
  }
  else{
    default_page();
  }
}

console.log("levels_chart.js");
$(document).ready(function(){
  default_page();

})
function default_page(){
  $('.chart_content').hide();
  $('#default_page img').attr("src",function(){
    var ran_num=Math.floor((Math.random() * 3) + 1);
    return "/img/logos/deer3/0"+ran_num+".png";
  })
}
function draw_chart(element){
  $('.chart_content').show();
  $('#default_page').remove();
  var chart_data = get_data_for_chart(element);
  chart_html(chart_data);
}

function get_data_for_chart(element){
  var names = [];
  var level = [];
  var level_sum = 0;
  console.log("element length: "+ element.length);
  for(var i = 0; i<element.length;i++){
    names.push(element[i].name);
    level.push(element[i].level);
    level_sum += parseFloat(element[i].level);
  }
  level_sum /=element.length;
  level_sum *=2;
  console.log(level_sum);

  var color = calculate_color(level_sum);
  var data ={
      labels: names,
      datasets: [{
          label: "성취도",
          data: level,
          backgroundColor: [
              // "rgba(255, 99, 132, 0.2)",
              color.backgroundColor,
          ],
          borderColor: [
              // // "rgba(255,99,132,1)",
              // // color.borderColor,
              // "rgba(200,100,30,0)",
          ],
          pointBackgroundColor: color.pointColor,
          pointBorderColor:color.pointColor,
          pointRadius: 4,
          borderWidth:-1,
      }]
  }
  return data;
}
function calculate_color(c_level){
  c_level = c_level;
  var r = Math.round(127.5-25.5*c_level)
  var g = Math.round(127.5+25.5*c_level)
  var b = Math.round(255-51*Math.abs(c_level));
  var color={
    backgroundColor: "rgba("+r+","+g+","+b+", 0.3)",
    pointColor: "rgba("+r+","+g+","+b+",1)"
  }
  return color;
}
function chart_html(data){
  var ctx = $("#myChart");
  var myChart = new Chart(ctx, {
      type: "line",
      data: data,
      options: {
          legend:{
            display: false,
          },
          elements: {
            line: {
              tension: 0,
              backgroundColor: "rgba(100,20,300,0)",
              fill: 'zero',
            }
          },
          title: {
            display: false,
            text: 'AIR CHART'
          },
          responsive: true,
          scales: {
              yAxes: [{
                  ticks: {
                      min: -6,
                      max: 6,
                      beginAtZero:false
                  }
              }]
          },
          maintainAspectRatio: false,

      }
  });

}
//
// function chart_default(){
//   var ctx = $("#myChart");
//   var data ={
//       labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
//       datasets: [{
//           label: "유형",
//           data: [5, 2, -1, 3, 2, -4],
//           // backgroundColor: [
//           //     "rgba(255, 99, 132, 0.2)",
//           // ],
//           // borderColor: [
//           //     "rgba(255,99,132,)",
//           // ],
//           borderWidth: 0,
//       }]
//   }
//   var myChart = new Chart(ctx, {
//       type: "line",
//       data: data,
//       options: {
//           legend:{
//             display: false,
//           },
//           elements: {
//             line: {
//               tension: 0,
//               backgroundColor: "rgba(100,20,300,0.1)",
//               fill: 'zero',
//             }
//           },
//           title: {
//             display: true,
//             text: 'Test Chart!!'
//           },
//           responsive: true,
//           scales: {
//               yAxes: [{
//                   ticks: {
//                       min: -6,
//                       beginAtZero:false
//                   }
//               }]
//           }
//       }
//   });
//
// }
