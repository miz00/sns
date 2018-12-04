function buildHTML(){
  var　content = document.createElement("timeline_content");
  document.body.appendChiled(content);
}

function createTweet(){
  var xhr = new XMLHttpRequest();

  xhr.open('POST','http:///users/:user_id/tweets');
  xhr.send();

  xhr.onreadystatechange = function() {
    if(xhr.readyState === 4 && xhr.status === 200) {
      buildHTML();
    }
  };
}
