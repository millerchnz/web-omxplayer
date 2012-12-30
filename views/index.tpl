<center>
<div class="controls display">
<div class="name">{{ current or 'Not playing' }}</div>
<div class="time">00:00:00 / 00:00:00</div>
</div>
<div class="controls" style="width:241px">
<div class="back" onclick="player('back')">&nbsp;</div>
<div class="pause" onclick="player('pause')">&nbsp;</div>
<div class="quit" onclick="player('quit')">&nbsp;</div>
<div class="forward" onclick="player('ahead')">&nbsp;</div>
</center>
<div class="files collapsed" style="background-image:none;">
<div class="folder_name">Media</div>
</div>
<script type="text/javascript">

String.prototype.toHHMMSS = function () {
    sec_numb    = parseInt(this);
    var hours   = Math.floor(sec_numb / 3600);
    var minutes = Math.floor((sec_numb - (hours * 3600)) / 60);
    var seconds = sec_numb - (hours * 3600) - (minutes * 60);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = hours+':'+minutes+':'+seconds;
    return time;
}

function check_files(node) {
  $($($(node).parent()).children()[1]).children('.file').each(function(i,e){
    hidden = $(e).children('input')[0];
    set_info(hidden);
  });
}

function set_info(hidden) {
    $.ajax({url:'/info.ajax', data:{'file':hidden.value}, success:function(data) {
      console.log(hidden.value+' - '+data);
      if(data==='00:00:00') {
        //$($(hidden).parent()).addClass('not_video');
      } else {
        $($(hidden).parent()).removeClass('not_video');
        $($(hidden).parent()).addClass('video');
        $($(hidden).parent()).append('<div class="file_info">'+data+'</div>');
      }
    }});
}

function get_folder(path,node) {
  if($(node).hasClass('collapsed')) {
    $.ajax({url:'/files.ajax', data:{'dr':path}, success:function(data) {
      $(node).after(data);
      $(node).removeClass('collapsed');
      $(node).addClass('expanded');
      //setTimeout(function(){check_files(node);},200);
    }});
  } else {
    $($(node).parent().children()[1]).remove()
    $(node).removeClass('expanded');
    $(node).addClass('collapsed');
  }
}

function play(file) {
  if($('.name').text().toLowerCase()!='not playing') {
    if(!confirm('There is already a video playing. Do you want to stop it and play "'+unescape(file)+'" instead?')) {
      return;
    } else {
      player('quit');
    }
  }

  $('.name').html('<img src="/img/loading.gif">');
  $.ajax({url:'/player.ajax', data:{'c':'play','file':file}, success:function(data) {
    $('.name').html(data);
  }});
}

function player(command) {
  if(command!='position') {
    $('.name').html('<img src="/img/loading.gif">');
  }
  $.ajax({url:'/player.ajax', data:{'c':command}, success:function(data) {
    $('.display').html(data);
  }});
}

setInterval(function(){player('position');},5000);

get_folder('',$('.files').get(0));

</script>
%rebase layout title='Player'
