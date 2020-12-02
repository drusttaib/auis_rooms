function menu_hide(){
   var menu= document.getElementById("menu");
   var mini= document.getElementById("max_btn");
   menu.style.left = "-280px";
   mini.style.display="block";
}
function menu_show(){
    var menu= document.getElementById("menu");
    menu.style.left = "0px";
    var mini= document.getElementById("max_btn");
    mini.style.display="none";
 }
 function gps_to_point_y(lat){

   const main_y = 35.57263215;
   const y = (lat-main_y)*(-200000);
   return y;
 }
 function gps_to_point_x(long){

   const main_x = 45.35335422;
   const x= (long-main_x)*200000;
   return x;
 }
 function all(){
   let lat=35.57108125;//changeable
   let long = 45.35673011;//changeable
   
const main_y = 35.57263215;
var y = (lat-main_y)*(-200000);


const main_x = 45.35335422;
var x = (long-main_x)*200000;
console.log("x: "+x+"  y: "+y);
 }
function select(name) {

  var limbs = document.getElementsByClassName('classes'); 
   for (let item of limbs) {
    item.style.fill="rgb(28, 13, 117)";
   
    }
    var limbs2 = document.getElementsByClassName('other_rooms');
    for (let item of limbs2) {
        item.style.fill = "rgb(121,80,80)";

    }
    var parts = name.split('-');
    var building = parts[0];
    var floor = parts[1];
    if (floor == "b1") {
        show_floor(-1);
    } else if (floor == "g") {
        show_floor(0);
    }
    else if (floor == "f1") {
        show_floor(1);
    }
    else if (floor == "f2") {
        show_floor(2);
    }
   var room=document.getElementById(name);
    room.style.fill = "red";
    window.history.pushState({  }, "", "/map.aspx?id=" + name);
   
 }

function show_floor(floor) {
    try {
        document.getElementById("direction").remove();
    } catch{}
    
 let a_b1= document.getElementById('a_b1');
 let b_b1= document.getElementById('b_b1');
 let a_g= document.getElementById('a_g');
 let a_f1= document.getElementById('a_f1');
 let a_f2= document.getElementById('a_f2');
 let b_g= document.getElementById('b_g');
 let b_f1= document.getElementById('b_f1');
 let b_f2= document.getElementById('b_f2');

      a_b1.style.display="none";
      b_b1.style.display="none";
      a_g.style.display="none";
      a_f1.style.display="none";
      a_f2.style.display="none";
      b_g.style.display="none";
      b_f1.style.display="none";
      b_f2.style.display="none";
  switch(floor){
    case -1:
      a_b1.style.display="inline";
      b_b1.style.display="inline";
      break;
      case 0:
        a_g.style.display="inline";
      b_g.style.display="inline";
        break;
      case 1:
      b_f1.style.display="inline";
      a_f1.style.display="inline";
        break;
      case 2:
      b_f2.style.display="inline";
      a_f2.style.display="inline";
        break;
      default:
        
        a_g.style.display="inline";
      b_g.style.display="inline";
        break;
  }
 }

 function gps_locate(lat,long){
  let spot= document.getElementById('gps_location');
  let anime= document.getElementById('gps_animation');

  spot.style.display="none";
  anime.style.display="none";
  const main_y = 35.57263215;
  var y = (lat-main_y)*(-200000);

  const main_x = 45.35335422;
  var x = (long-main_x)*200000;
  if(x<800&&y<500){
  spot.style.cx=x;
  spot.style.cy=y;
  anime.style.cx=x;
  anime.style.cy=y;
  spot.style.display="inline";
  anime.style.display="inline";
  }
}

function search_to_btn() {
    var link = '/search_to_btn.ashx?word='.concat(document.getElementById("search_input").value);
    $.ajax({
        url: link,
        method: 'GET',
        contentType: false,
        processData: false,
        statusCode: {
        },
        success: function (text) {
            var jsn_posts = JSON.parse(text);
            document.getElementById("rooms").innerHTML = "";
            for (var i = 0; i < jsn_posts.room.length; i++) {
                var button = document.createElement("div");
                button.innerHTML = (jsn_posts.room[i].name + "<br/>" + jsn_posts.room[i].code).toUpperCase();
                
                button.setAttribute("onclick", "select('" + jsn_posts.room[i].code+"')");
                button.setAttribute("oncontextmenu", "right_click('" + jsn_posts.room[i].code +"')");
                button.setAttribute("class", "room_item");
                document.getElementById("rooms").appendChild(button);
            }
           
        },
        error: function () {
        },
        complete: function () {
        }

    });
}

//disabling right click
if (document.addEventListener) {
    document.addEventListener('contextmenu', function (e) {
        e.preventDefault();
    }, false);
} else {
    document.attachEvent('oncontextmenu', function () {
        window.event.returnValue = false;
    });
}
//getting mouse position
var mouseX;
var mouseY;
function getting_mouse(event) {
    window.mouseX = event.pageX;
    window.mouseY = event.pageY;  
}


function right_click(code) {
    if (document.contains(document.getElementById("small_menu"))) {
        document.getElementById("small_menu").remove();
    }
    var menu = document.createElement("div");
    
    var options = document.createElement("ul");
    var start = document.createElement("li");
    var end = document.createElement("li");
    var share = document.createElement("li");
    start.innerHTML = "Start Here";
    end.innerHTML = "Direct to Here";
    share.innerHTML = "Share";
    menu.setAttribute("id", "small_menu");
    menu.setAttribute("class", "small_menu");
    start.setAttribute("class", "small_menu_item");
    start.setAttribute("onclick", "mark_start('" + code +"');delete_right_click()");
    end.setAttribute("class", "small_menu_item");
    end.setAttribute("onclick", "mark_end('" + code + "');delete_right_click()");
    share.setAttribute("class", "small_menu_item");
    share.setAttribute("onclick", "share('" + code + "');delete_right_click()");
    menu.style.top = window.mouseY+"px";
    menu.style.left = window.mouseX + "px";
    options.appendChild(start);
    options.appendChild(end);
    options.appendChild(share);
    menu.appendChild(options);
    document.getElementById("body").appendChild(menu);
}
function mark_start(code) {
    document.getElementById("pos_start").value = code;
}
function mark_end(code) {
    document.getElementById("pos_end").value = code;
}
function delete_right_click(){
    if (document.contains(document.getElementById("small_menu"))) {
        document.getElementById("small_menu").remove();
    }
}
function share(code) {
    select(code);
    var copyText = document.createElement("input");
    copyText.setAttribute("value", window.location.href);
    copyText.setAttribute("id", "temp_input");
    document.body.appendChild(copyText);
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    document.execCommand("Copy");
    document.body.removeChild(copyText);
    alert("Link Copied");
}
function load() {
   
        var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("id")) {
        select(urlParams.get('id'));
            find_way('main_gate', urlParams.get('id'));
           
    }
}
