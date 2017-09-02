
alert("hi");
console.log("levels.js");


$(document).ready(function(){
  for( var i=0; i<current_user.tests.length;i++){
    // alert("load1");

    $('#nav').append(fullTestHtml(current_user.tests[i],i));
  }
});


var simpleChapterHtml=function(Chapter,test_cnt,subject_cnt,chapter_cnt){
  var chapter_id = 't'+test_cnt+'s'+subject_cnt+'c'+chapter_cnt;
  var chapter_html='<li ';
  if(!Chapter.onExam){
    chapter_html += 'class="hidden_chapter"';
  }
  chapter_html += ' id="'+chapter_id+'"><div class="hyegun_box studies chapters ';
  if(Chapter.onStudy){
    chapter_html +='selected_for_test';
  }
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
$(document).ready(function(){
  alert("ready!");
})
$(document).on("click",'.icon',function(){
  alert('icon clicked');
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
alert("yup");
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
