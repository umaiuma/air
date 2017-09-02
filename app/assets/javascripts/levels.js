alert("hi");


//User control
function Chapter(){
    this.name ='';
}
function Subject(){
    this.name ='';
    this.chapters =[];
}
function Test(){
    this.name='';
    this.subjects =[];
}
function User(){
    this.name='' ;
    this.tests =[];

}
var current_user = new User();
current_user.name= '<%= @user.username%>';
var test_js;
var subject_js;
var chapter_js;
alert(@user.exams.each);
// <% @user.exams.each do |exam| %>
//   test_js = new Test();
//   test_js.name = '<%=exam.name%>';
//   test_js.id = <%=exam.id%>
//   <% exam.subjects.each do |subject| %>
//     subject_js=new Subject();
//     subject_js.name = '<%= subject.name %>';
//     subject_js.onExam = <%= subject.onExam %>;
//     subject_js.onStudy = <%= subject.onStudy %>;
//
//             <% subject.chapters.each do |chapter| %>
//         chapter_js=new Chapter();
//         chapter_js.name = '<%= chapter.name %>';
//         chapter_js.onExam = <%= chapter.onExam %>;
//         chapter_js.onStudy = <%= chapter.onStudy %>;
//         subject_js.chapters.push(chapter_js);
//
//
// <%end%>
//     test_js.subjects.push(subject_js);
//   <% end %>
//   current_user.tests.push(test_js);
//
//
// <% end %>

$(document).ready(function(){
  for( var i=0; i<current_user.tests.length;i++){
    // alert("load1");

    $('#nav').append(fullTestHtml(current_user.tests[i],i));
  }
  // check_startable();
  // alert("load2");
});
