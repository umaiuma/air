console.log("levels_chart.js");
$(document).ready(function(){
  chart_default();
})

function draw_chart(element){
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
  // level_sum /=element.length;
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
              // "rgba(255,99,132,1)",
              color.borderColor,

          ],
          borderWidth: 5,
      }]
  }
  return data;
}
function calculate_color(c_level){
  c_level = c_level * 5;
  var r = Math.round(127.5-25.5*c_level)
  var g = Math.round(127.5+25.5*c_level)
  var b = Math.round(255-51*Math.abs(c_level));
  var color={
    backgroundColor: "rgba("+r+","+g+","+b+", 0.2)",
    borderColor: "rgba("+r+","+g+","+b+",1)"
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
              backgroundColor: "rgba(100,20,300,0.1)",
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
          }
      }
  });

}

function chart_default(){
  var ctx = $("#myChart");
  var data ={
      labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
      datasets: [{
          label: "유형",
          data: [5, 2, -1, 3, 2, -4],
          backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
          ],
          borderColor: [
              "rgba(255,99,132,1)",
          ],
          borderWidth: 5,
      }]
  }
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
              backgroundColor: "rgba(100,20,300,0.1)",
              fill: 'zero',
            }
          },
          title: {
            display: true,
            text: 'Test Chart!!'
          },
          responsive: true,
          scales: {
              yAxes: [{
                  ticks: {
                      min: -6,
                      beginAtZero:false
                  }
              }]
          }
      }
  });

}
