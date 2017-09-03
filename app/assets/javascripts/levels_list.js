console.log("levels_list.js");


$(document).ready(function(){
  for( var i=0; i<current_user.tests.length;i++){

    $('#nav ul').append(fullTestHtml(current_user.tests[i],i));
  }
});
$(document).on("click",'.icon',function(event){
  event.stopPropagation();
  var display_check=$(this).closest('li').children('ul');

  if(display_check.css("display")=="none"){
    display_check.slideDown();
    $(this).html('&#xe801');
  }else{

    display_check.slideUp();
    $(this).html('&#xe800');
    something($(this));

  }
});
$(document).on("click",'.subjects',function(){
  console.log("subject box clicked!");
  $(document).find('.show_chart').removeClass('show_chart');
  $(this).addClass('show_chart');
  id = get_id($(this));
  // alert(id);
  show_chart(id);

}).on('click','.chapters',function(){
  console.log("chapter box clicked!");
  $(document).find('.show_chart').removeClass('show_chart');
  $(this).addClass('show_chart');
  id = get_id($(this));
  // alert(id);
  show_chart(id);

})

var simpleChapterHtml=function(Chapter,test_cnt,subject_cnt,chapter_cnt){
  var chapter_id = 't'+test_cnt+'s'+subject_cnt+'c'+chapter_cnt;
  var chapter_html='<li ';
  if(!Chapter.onExam){
    chapter_html += 'class="hidden_chapter"';
  }
  chapter_html += ' id="'+chapter_id+'"><div class="hyegun_box studies chapters ';
  chapter_html+='"><div class="label"><text>'+Chapter.name+'</text></div>\
  <div class="chapter_control"></div></div></li>';
  return chapter_html;
}


var editSubjectHtml=function(Subject,test_cnt,subject_cnt){
  var subject_id = 't'+test_cnt+'s'+subject_cnt;
  var subject_html='<li ';
  if(!Subject.onExam){
    subject_html += 'class="hidden_subject"';
  }
  subject_html += ' id="'+subject_id+'"><div class="hyegun_box studies subjects"><div class="label"><div class="icon">&#xe800</div><text>'+Subject.name+'</text></div>';
  subject_html +='<div class="subject_control"></div>';
  subject_html+='</div><ul></ul></li>';
  return subject_html;
}


var fullSubjectHtml=function(Subject,test_cnt,subject_cnt){
  var subject_id = 't'+test_cnt+'s'+subject_cnt;
  var subject_html='<li ';
  if(!Subject.onExam){
    subject_html += 'class="hidden_subject"';
  }
  subject_html += ' id="'+subject_id+'"><div class="hyegun_box studies subjects"><div class="label"><div class="icon">&#xe800</div><text>'+Subject.name+'</text></div>\
  </div><ul>';

  for(var i =0; i<Subject.chapters.length; i++){
    subject_html+=simpleChapterHtml(Subject.chapters[i], test_cnt,subject_cnt,i);
  }
  subject_html+='</ul></li>';
  return subject_html;
}


var fullTestHtml=function(Test,test_cnt){
  var test_html = '<li id="t'+test_cnt+'"><div class="hyegun_box studies tests"><div class="label"><div class="icon">&#xe800</div> <text>'+Test.name+'</text></div>\
  </div><ul>';
  for(var i =0; i<Test.subjects.length; i++){
  test_html+=fullSubjectHtml(Test.subjects[i],test_cnt,i);

  }
  test_html+='</ul></li>';
  return test_html;
}


//icon control
function icon_down(icon){
  icon.html('&#xe801');
}


function icon_up(icon){
  icon.html('&#xe800');
}


function icon_trigger(icon){
  if(icon.html()=='&#xe801'){
    icon.html('&#xe800');
  }
  else{
    icon.html('&#xe801');
  }
}

function something(father){

  if(isSubject(father)){
    var test_id = get_test_id(father);
    var subject_id = get_subject_id(father);
    console.log(subject_id);
    var Subject = current_user.tests[test_id].subjects[subject_id];
    if(is_empty_dom(father.closest('.subjects'))){
      father.closest('li').find('li:last-child').removeClass('hidden_add');
    }else{
      father.closest('li').find('li:last-child').addClass('hidden_add');
    }
  }else if(isTest(father)){
    console.log('it isays it is test');
    var test_id = get_test_id(father);
    var Test = current_user.tests[test_id];
    if(is_empty_dom(father.closest('.tests'))){
      father.closest('li').find('li:last-child').removeClass('hidden_add');
    }else{
      father.closest('li').find('li:last-child').addClass('hidden_add');
    }
  }
  else{
    console.log("error in something");
  }
}

function isTest(father){
  if(father.closest('.tests').length){
    return true;
  }else{
    $(document).on("click",'#new_subject',function(){
    return false;
    });
  }
}

function isSubject(father){
  if(father.closest('.subjects').length){
    return true;
  }else{
    return false;
  }
}
function get_id(father){
  var test_id = get_test_id(father);
  var subject_id = get_subject_id(father);
  var chapter_id = get_chapter_id(father);
  return {test:test_id, subject:subject_id, chapter:chapter_id};
}
function get_test_id(father){
  var list;
  if(isTest(father)){
    list = father.closest('.tests');
  }else if(isSubject(father)){
    list = father.closest('ul').prev();
  }else{
    list = father.closest('ul').parent().closest('ul').prev();
    console.log(list);
  }
  var index = $('.tests').index(list);
  var id = index;
  console.log(id);

  return id;
}

function get_subject_id(father){
  if(isSubject(father)){
    list = father.closest('.subjects');
  }else{
    list = father.closest('ul').prev();
    console.log(list);
  }
  var indexer = list.closest('ul').find('.subjects');
  var index = indexer.index(list);
  var id = index;
  return id;
}
function get_chapter_id(father){
  var list = father.closest('.chapters');
  var indexer = list.closest('ul').find('.chapters');
  var index = indexer.index(list);
  var id = index;
  return id;
}

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
    chart_default();
  }

}