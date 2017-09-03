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
  console.log("element length: "+ element.length);
  for(var i = 0; i<element.length;i++){
    names.push(element[i].name);
    level.push(element[i].level);

  }
  var data ={
      labels: names,
      datasets: [{
          label: "성취도",
          data: level,
          backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
          ],
          borderColor: [
              "rgba(255,99,132,1)",
          ],
          borderWidth: 5,
      }]
  }
  return data;
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
