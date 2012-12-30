<div class="folders">
%for f in file_list:
%if not f[0].startswith('.'):
<div class="file not_video" onclick="return play('{{dr+"/"+f[0]}}')">{{f[1]}}<input type="hidden" name="file_location" value="{{dr+'/'+f[0]}}"/></div>
%end
%end
%for d in dir_list:
%if not d[0].startswith('.'):
<div class="folder"><div class="folder_name collapsed" onclick="return get_folder('{{dr+'/'+d[0]}}',this)">{{d[1]}}</div></div>
%end
%end
</div>
