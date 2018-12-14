function buildHTML(json){
  var newList = document.createElement("li");
  newList.id = "timeline_content";

  // JSONのデータを適用した内容(html)を作りたい
  var content = document.getElementById("add_elem");
  clone_content = content.cloneNode(true);
  clone_content.id = "clone_add_elem"
  clone_content.removeAttribute("hidden");

  // 子要素のidを変更して要素を取得する
  tmp = clone_content.children;
  tmp[0].id = "clone_add_img";
  tmp[1].id = "clone_add_username";
  tmp[3].id = "clone_add_reply";
  tmp[4].id = "clone_add_like";
  tmp[5].id = "clone_add_destroy";

  var icon = tmp[0];
  var username = tmp[1];
  var reply = tmp[3];
  var like = tmp[4];
  var destroy = tmp[5];

  icon.src = json["image_url"];
  username.href = "/users/" + json["user_id"];
  username.insertAdjacentHTML('afterbegin', json["user_name"]);
  var text = "  :" + json["created_at"] + "<br>" + json["text"] + "<br>";
  username.insertAdjacentHTML('afterend', text);
  reply.href = "/users/" + json["user_id"] + "/tweets/" + json["id"] + "replies/new";
  like.href = "/users/"+ json["user_id"] + "/tweets/" + json["id"] + "/favs";
  destroy.href = "/users/" + json["user_id"] + "/tweets/" + json["id"];

  newList.appendChild(clone_content);
  // 挿入
  var ul = document.getElementById("timeline_ul");
  var currentList = document.getElementById("timeline_content");
  ul.insertBefore(newList,currentList);
}

function createTweet(){
  var xhr = new XMLHttpRequest();

  user_id = document.getElementById("current_user_id").textContent;
  xhr.open('POST','/users/' + user_id + "/tweets.json");
  console.log("POST open");

  input = document.getElementsByTagName("input");
  authenticity_token = input["authenticity_token"].value;
  text = document.getElementById("tweet_text").value;
  privacy_status = document.getElementById("tweet_privacy_status").value;
  // image1 = document.getElementById("tweet_image1").value;
  // image2 = document.getElementById("tweet_image2").value;
  // image3 = document.getElementById("tweet_image3").value;

  // send()の引数を作りたい
  formData = new FormData();
  formData.append("authenticity_token", authenticity_token);
  formData.append("tweet[text]", text);
  formData.append("tweet[privacy_status]", privacy_status);
  // formData.append("tweet[image1]", image1);
  // formData.append("tweet[image2]", image2);
  // formData.append("tweet[image3]", image3);

  xhr.send(formData);
  console.log("send success");

  xhr.onreadystatechange = function() {
    if(xhr.readyState === 4 && xhr.status === 200) {
      var json = JSON.parse(xhr.responseText);
      buildHTML(json);
    }
  };
}