<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="auis_rooms.map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AUIS ROOMS</title>
<script src="/directions.js"></script>
<script src="/function.js"></script>
<link rel="stylesheet" href="/style.css"/>
     <script src="/jquery/jquery.js" type="text/javascript"></script>
    <script src="/jquery/jquery-ui.js" type="text/javascript"></script>
    <link href="/jquery/jquery-ui.css" rel="stylesheet" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <script>
    var zoom_value=1;
    var rotate_value=0;
    
    function zoom(value){

        var svg= document.getElementById("map");
        svg.style.transformOrigin = "center";
       var current_size = svg.style.transform;
       zoom_value +=value;
       svg.style.transform= "scale("+zoom_value+") rotate("+rotate_value+"deg)";
    }
function rotate(value){
    var svg= document.getElementById("map");
    rotate_value +=value;
svg.style.transform = "scale("+zoom_value+") rotate("+rotate_value+"deg)";
        }
    </script>
</head>
<body id="body" onload="load()" onmousemove="getting_mouse(event)">
    <form id="form1" runat="server">
        <div id="max_btn" onclick="menu_show()" class=""><i class="fas fa-angle-double-right"></i></div>
<div id="menu" class="menu" onclick="delete_right_click()">
  <center>
  <div id="mini_btn" onclick="menu_hide()" class=""><i class="fas fa-angle-double-left"></i></div>
  <br class="clear">
     
    <input id="search_input" runat="server" type="text" oninput="search_to_btn()" placeholder="ex: B-G-1 ITE303" value=""/>
    <div id="rooms">
        <div class="room_item" oncontextmenu="right_click('main_gate')" onclick="select('main_gate')">Main Gate</div>
      <div class="room_item" oncontextmenu="right_click('a-g-5')" onclick="select('a-g-5')"><br />A-G-5</div>
      <div class="room_item" oncontextmenu="right_click('b-g-32')" onclick="select('b-g-32')"><br />Library</div>
    </div>
<div class="direction_div" >
    <h3 class="direction_text">From Here</h3>
  <input id="pos_start" type="text" placeholder="From Here" value="main_gate" readonly/>
    <h3 class="direction_text">To Here</h3>
  <input id="pos_end" type="text" placeholder="To Here" readonly/>
  <br class="clear"/>
  <div class="direction_btn" onclick="find_way(document.getElementById('pos_start').value,document.getElementById('pos_end').value)">Draw Direction</div>
    <div class="clear_btn" onclick="delete_line()">Clear Direction</div>
</div>
</center>
</div>
<div id="map_cont" class="map_container" onclick="delete_right_click()">
    <center>
     
    <div id="map_outer">
        <div id="map_inner">
         
            <svg id ="map" class="map_svg">
              <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
                  <stop offset="0%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="5%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="10%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="15%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="20%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="25%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="30%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="35%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="40%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="45%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="50%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="55%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="60%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="65%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="70%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="75%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="80%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="85%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="90%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="95%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="100%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                </linearGradient>
              </defs>
              <defs>
                <linearGradient id="grad2" x1="0%" y1="0%" x2="0%" y2="100%">
                  <stop offset="0%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="5%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="10%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="15%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="20%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="25%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="30%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="35%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="40%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="45%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="50%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="55%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="60%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="65%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="70%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="75%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="80%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="85%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="90%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                  <stop offset="95%" style="stop-color:gray;stop-opacity:1" />
                  <stop offset="100%" style="stop-color:rgb(70,70,70);stop-opacity:1" />
                </linearGradient>
              </defs>
                <path id="main_gate" onclick="select(this.id)" oncontextmenu="right_click(this.id)" class="other_rooms"  d="M2 2 L2 20 L40 20 L40 2 Z"></path>
                <text class="big_names_text" x="45" y="20">Main Gate</text>

              <path class="road" d="M5 20 L5 150 L700 150 L700 130 L35 130 L35 20 Z"></path>
              <path class="road" d="M35 115 L35 95 L700 95 L700 115  Z"></path>
              <path class="road" d="M700 95 L700 115 A50 50 0 0 0 700 130 L700 150 A50 30 0 0 0 700 95 Z"></path>
              <path class="side_walks" d="M510 152 L510 270 L400 270 L400 280 L560 280 L560 400 L580 400 L580 300 L650 300 L650 290 L580 290 L580 270 L680 270 L640 270 L640 152 Z"></path>
                <!--building B-->
                
                <text class="big_names_text"  y="210" x="670">Building B</text>
                <text class="big_names_text" y="200" x="360">Building A</text>

                
                <g id="b_g" style="">
                  <path id="b-g_backgroud" class="building"d="M629 229 L690 229 L690 275 L725 275 L725 318 L665 318 L665 300 L645 300 L645 290 L665 290 L665 251 L629 251 Z"></path>
                  <path class="walls" d="M680 279 L680 301 L724 301 L724 279 z"></path>
                  <path name="main_stairs" fill="url(#grad1)" d="M665 270 L665 285 L650 285 L650 270 Z"></path>
                  <path name="down_stairs" fill="url(#grad1)" d="M700 280 L700 300 L680 300 L680 280 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-32" name="library" class="other_rooms" d="M670 230 L670 250 L630 250 L630 230 Z"></path>

                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-11" class="classes" d="M674.6 308.7 L674.6 302.7 L685 302.7 L685 308.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-10" class="classes" d="M686 308.7 L686 302.7 L696 302.7 L696 308.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-9" class="classes" d="M697 308.7 L697 302.7 L707 302.7 L707 308.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-8" class="classes" d="M708 308.7 L708 302.7 L718 302.7 L718 308.7 Z"></path>

                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-1" class="classes" d="M676 316.7 L676 310.7 L686 310.7 L686 316.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-2" class="classes" d="M687 316.7 L687 310.7 L697 310.7 L697 316.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-3" class="classes" d="M698 316.7 L698 310.7 L708 310.7 L708 316.7 Z"></path>
                  <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-g-4" class="classes" d="M709 316.7 L709 310.7 L719 310.7 L719 316.7 Z"></path>

                  <text class="big_names_text" y="255" x="700">B-G</text>
                  <text class="normal_names_text"  y="296.7" x="615">Entrance</text>
                  <text class="normal_names_text"  y="240.9" x="640">library</text>
                  <text class="small_names_text"  y="307" x="675">11</text>
                  <text class="small_names_text"  y="307" x="686.5">10</text>
                  <text class="small_names_text"  y="307" x="698">9</text>
                  <text class="small_names_text"  y="307" x="709">8</text>
                  <text class="small_names_text"  y="315" x="677">1</text>
                  <text class="small_names_text"  y="315" x="688">2</text>
                  <text class="small_names_text"  y="315" x="699">3</text>
                  <text class="small_names_text"  y="315" x="710">4</text>
              </g>
              <g id="b_b1"style="display:none;">
                <path id="b-b1_backgroud" class="building" d="M665 229 L690 229 L690 267 L725 267 L725 301 L742 301 L742 318 L665 318 L665 300 L645 300 L645 290 L665 290 L665 251 Z"></path>
                <path class="walls" d="M680 276 L680 301 L700 301 L700 317 L719 317 L719 301 L724 301 L724 276 z"></path>
                <path name="main_stairs" fill="url(#grad1)" d="M665 270 L665 285 L650 285 L650 270 Z"></path>
                <path name="down_stairs" fill="url(#grad1)" d="M700 280 L700 300 L680 300 L680 280 Z"></path>

                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-1" class="classes" d="M674.6 308.7 L674.6 302.7 L685 302.7 L685 308.7 Z"></path>
                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-3" class="classes" d="M720 316.7 L720 310.7 L730 310.7 L730 316.7 Z"></path>
                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-6" class="classes" d="M731 308.7 L731 302.7 L741 302.7 L741 308.7 Z"></path>
                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-8" class="classes" d="M720 308.7 L720 302.7 L730 302.7 L730 308.7 Z"></path>

                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-9" class="classes" d="M686 308.7 L686 302.7 L696 302.7 L696 308.7 Z"></path>
                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-10" class="classes" d="M686 316.7 L686 310.7 L696 310.7 L696 316.7 Z"></path>
                <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-b1-11" class="classes" d="M696 268 L696 276 L706 276 L706 268 Z"></path>

              
                <text class="big_names_text" y="255" x="700">B-B1</text>
                <text class="small_names_text"  y="272" x="696">11</text>
                <text class="small_names_text"  y="315" x="721">3</text>
                <text class="small_names_text"  y="307" x="731">6</text>
                <text class="small_names_text"  y="307" x="721">8</text>
                <text class="small_names_text"  y="307" x="687">9</text>
                <text class="small_names_text"  y="307" x="675">1</text>
                <text class="small_names_text"  y="315" x="687">10</text>
            </g>
            <g id="b_f1" style="display:none;">
               <path  id="b-f1_backgroud" class="building" d="M619 229 L680 229 L680 275 L680 270 L690 270 L690 290 L680 290 L680 300 L725 300 L725 318 L665 318 L665 300   L665 290 L665 251 L619 251 Z"></path>
              
              <path name="main_stairs" fill="url(#grad1)" d="M665 270 L665 285 L650 285 L650 270 Z"></path>

               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-36" class="classes" d="M620 239 L620 230 L626 230 L626 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-35" class="classes" d="M627 239 L627 230 L633 230 L633 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-34" class="classes" d="M634 239 L634 230 L640 230 L640 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-33" class="classes" d="M641 239 L641 230 L647 230 L647 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-32" class="classes" d="M648 239 L648 230 L654 230 L654 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-31" class="classes" d="M655 239 L655 230 L661 230 L661 239 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-38" class="classes" d="M655 250 L655 241 L661 241 L661 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-39" class="classes" d="M648 250 L648 241 L654 241 L654 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-40" class="classes" d="M641 250 L641 241 L647 241 L647 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-41" class="classes" d="M634 250 L634 241 L640 241 L640 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-42" class="classes" d="M627 250 L627 241 L633 241 L633 250 Z"></path>

               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-16" class="classes" d="M674.6 308.7 L674.6 302.7 L685 302.7 L685 308.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-15" class="classes" d="M686 308.7 L686 302.7 L692 302.7 L692 308.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-14" class="classes" d="M693 308.7 L693 302.7 L699 302.7 L699 308.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-13" class="classes" d="M700 308.7 L700 302.7 L706 302.7 L706 308.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-12" class="classes" d="M707 308.7 L707 302.7 L713 302.7 L713 308.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-11" class="classes" d="M714 308.7 L714 302.7 L724 302.7 L724 308.7 Z"></path>

               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-1" class="classes" d="M676 316.7 L676 310.7 L686 310.7 L686 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-2" class="classes" d="M687 316.7 L687 310.7 L692 310.7 L692 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-3" class="classes" d="M693 316.7 L693 310.7 L699 310.7 L699 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-4" class="classes" d="M700 316.7 L700 310.7 L706 310.7 L706 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-5" class="classes" d="M707 316.7 L707 310.7 L713 310.7 L713 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-6" class="classes" d="M714 316.7 L714 310.7 L720 310.7 L720 316.7 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f1-7" class="classes" d="M721 316.7 L721 310.7 L724 310.7 L724 316.7 Z"></path>
              
              
              <text class="big_names_text" y="255" x="700">B-F1</text>
              <text class="small_names_text" y="315" x="680">1</text>
              <text class="small_names_text" y="315" x="688">2</text>
              <text class="small_names_text" y="315" x="695">3</text>
              <text class="small_names_text" y="315" x="702">4</text>
              <text class="small_names_text" y="315" x="708">5</text>
              <text class="small_names_text" y="315" x="715">6</text>
              <text class="small_names_text" y="315" x="721">7</text>
              <text class="small_names_text" y="307" x="715">11</text>
              <text class="small_names_text" y="307" x="708">12</text>
              <text class="small_names_text" y="307" x="701">13</text>
              <text class="small_names_text" y="307" x="693">14</text>
              <text class="small_names_text" y="307" x="687">15</text>
              <text class="small_names_text" y="307" x="677">16</text>
              <text class="small_names_text" y="235" x="656">31</text>
              <text class="small_names_text" y="235" x="650">32</text>
              <text class="small_names_text" y="235" x="643">33</text>
              <text class="small_names_text" y="235" x="635">34</text>
              <text class="small_names_text" y="235" x="628">35</text>
              <text class="small_names_text" y="235" x="621">36</text>
              <text class="small_names_text" y="245" x="628">38</text>
              <text class="small_names_text" y="245" x="635">39</text>
              <text class="small_names_text" y="245" x="643">40</text>
              <text class="small_names_text" y="245" x="650">41</text>
              <text class="small_names_text" y="245" x="656">42</text>
          </g>
          <g id="b_f2" style="display: none;">
             <path id="b-f2_backgroud" class="building" d="M619 229 L680 229 L680 275 L680 270 L690 270 L690 290 L680 290 L680 300 L730 300 L730 318 L665 318 L665 300   L665 290 L665 251 L619 251 Z"></path>
            
            <path name="main_stairs" fill="url(#grad1)" d="M665 270 L665 285 L650 285 L650 270 Z"></path>

             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-41" class="classes" d="M653 250 L653 241 L663 241 L663 250 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-39" class="classes" d="M620 250 L620 241 L630 241 L630 250 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-37" class="classes" d="M620 239 L620 230 L630 230 L630 239 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-35" class="classes" d="M631 239 L631 230 L641 230 L641 239 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-33" class="classes" d="M642 239 L642 230 L652 230 L652 239 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-31" class="classes" d="M653 239 L653 230 L663 230 L663 239 Z"></path>

             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-18" class="other_rooms" d="M674 308.7 L674 302.7 L680 302.7 L680 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-17" class="other_rooms" d="M681 308.7 L681 302.7 L687 302.7 L687 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-16" class="other_rooms" d="M688 308.7 L688 302.7 L694 302.7 L694 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-15" class="other_rooms" d="M695 308.7 L695 302.7 L701 302.7 L701 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-14" class="other_rooms" d="M702 308.7 L702 302.7 L708 302.7 L708 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-13" class="other_rooms" d="M709 308.7 L709 302.7 L715 302.7 L715 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-12" class="other_rooms" d="M716 308.7 L716 302.7 L722 302.7 L722 308.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-11" class="other_rooms" d="M723 308.7 L723 302.7 L729 302.7 L729 308.7 Z"></path>

             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-2" class="other_rooms" d="M680 316.7 L680 310.7 L687 310.7 L687 316.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-3" class="other_rooms" d="M688 316.7 L688 310.7 L695 310.7 L695 316.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-4" class="other_rooms" d="M696 316.7 L696 310.7 L703 310.7 L703 316.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-5" class="other_rooms" d="M704 316.7 L704 310.7 L711 310.7 L711 316.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-6" class="other_rooms" d="M712 316.7 L712 310.7 L719 310.7 L719 316.7 Z"></path>
             <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="b-f2-7" class="other_rooms" d="M720 316.7 L720 310.7 L727 310.7 L727 316.7 Z"></path>
            
            <text class="big_names_text" y="255" x="700">B-F2</text>
            <text class="small_names_text" y="315" x="683">2</text>
            <text class="small_names_text" y="315" x="690">3</text>
            <text class="small_names_text" y="315" x="698">4</text>
            <text class="small_names_text" y="315" x="707">5</text>
            <text class="small_names_text" y="315" x="715">6</text>
            <text class="small_names_text" y="315" x="721">7</text>
            <text class="small_names_text" y="307" x="724">11</text>
            <text class="small_names_text" y="307" x="718">12</text>
            <text class="small_names_text" y="307" x="710">13</text>
            <text class="small_names_text" y="307" x="703">14</text>
            <text class="small_names_text" y="307" x="696">15</text>
            <text class="small_names_text" y="307" x="690">16</text>
            <text class="small_names_text" y="307" x="683">17</text>
            <text class="small_names_text" y="307" x="677">18</text>
            <text class="small_names_text" y="235" x="656">31</text>
            <text class="small_names_text" y="235" x="645">33</text>
            <text class="small_names_text" y="235" x="635">35</text>
            <text class="small_names_text" y="235" x="623">37</text>
            <text class="small_names_text" y="247" x="623">39</text>
            <text class="small_names_text" y="247" x="656">41</text>
        </g>
              <g id="a_g" style="">
                 <path \ id="a-g_backgroud" class="building" d="M400 230 L400 266 L540 266 L540 220 A50 50 0 0 0 460 210 L440 230"></path>
                
                <path class="walls" d="M470 253 L510 253 L510 199 A50 50 0 0 0 470 205"></path>
                <path class="walls" d="M410 230 L410 245 L439 245 L439 230"></path>
                <path name="a_out_stairs" fill="url(#grad2)" d="M465 265 L465 275 L480 275 L480 265 Z"></path>
                <path name="a_down_stairs" fill="url(#grad2)" d="M480 240 L480 255 L495 255 L495 240 Z"></path>

                 <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-g-5" class="classes" d="M428 255 L428 265 L438 265 L438 255 Z"></path>
                 <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-g-4" class="classes" d="M417 255 L417 265 L427 265 L427 255 Z"></path>
                
                <text class="big_names_text" y="250" x="350">A-G</text>
                <text class="normal_names_text" y="200" x="530">Entrance</text>
                <text class="normal_names_text" y="280" x="460">Entrance</text>
                <text class="small_names_text" y="260" x="429">5</text>
                <text class="small_names_text" y="260" x="418">4</text>
            </g>
            <g id="a_b1" style="display: none;">
               <path  id="a-b1_backgroud" class="building" d="M400 230 L400 266 L540 266 L540 220 A50 50 0 0 0 460 210 L440 230"></path>
              
              <path class="walls" d="M450 253 L510 253 L510 199 A50 50 0 0 0 450 231 L430 231 L430 240 L450 240"></path>
              <path class="building" d="M475 230 L475 245 L490 245 L490 230"></path>

               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-1" class="classes" d="M429 250 L429 257 L436 257 L436 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-2" class="classes" d="M421 250 L421 257 L428 257 L428 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-3" class="classes" d="M413 250 L413 257 L420 257 L420 250 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-4" class="classes" d="M405 250 L405 257 L412 257 L412 250 Z"></path>

               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-8" class="classes" d="M401 260 L401 265 L406 265 L406 260 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-9" class="classes" d="M407 260 L407 265 L412 265 L412 260 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-10" class="classes" d="M413 260 L413 265 L418 265 L418 260 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-11" class="classes" d="M419 260 L419 265 L424 265 L424 260 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-12" class="classes" d="M425 260 L425 265 L430 265 L430 260 Z"></path>
               <path onclick="select(this.id)" oncontextmenu="right_click(this.id)" id="a-b1-13" class="classes" d="M431 260 L431 265 L436 265 L436 260 Z"></path>

              <text class="big_names_text" y="250" x="350">A-B1</text>
              <text class="normal_names_text" y="220" x="460">Caffetteria</text>
              <text class="normal_names_text" y="270" x="470">Entrance</text>

              <text class="small_names_text" y="253" x="431">1</text>
              <text class="small_names_text" y="253" x="423">2</text>
              <text class="small_names_text" y="253" x="415">3</text>
              <text class="small_names_text" y="253" x="407">4</text>

              <text class="small_names_text" y="264" x="403">8</text>
              <text class="small_names_text" y="264" x="408">9</text>
              <text class="small_names_text" y="264" x="414">10</text>
              <text class="small_names_text" y="264" x="420">11</text>
              <text class="small_names_text" y="264" x="426">12</text>
              <text class="small_names_text" y="264" x="432">13</text>
          </g >
          <g id="a_f1" style="display: none;">
            <path id="a-f1_backgroud" class="building" d="M400 230 L400 266 L540 266 L540 220 A50 50 0 0 0 460 210 L440 230"></path>
            
        </g >
        <g id="a_f2" style="display: none;">
          <path id="a-f2_backgroud" class="building" d="M400 230 L400 266 L540 266 L540 220 A50 50 0 0 0 460 210 L440 230"></path>
          
      </g >
                <g stroke="yellow" stroke-width="1" fill="rgb(70,70,70)" style="display:none;">
                  <circle id="main_gate" cy="2" cx="2" r="1" />
                  <circle id="B_gate" cy="296.7" cx="640.6" r="1" />
                  <circle id="B_stairs" cy="271.7" cx="660.8" r="1" />
                  <circle id="A_gate" cy="206" cx="533" r="1" />
                  <circle id="middle_road" cy="270.4" cx="569.7" r="1" />
                  <circle  id="b-g-32" cy="240.9" cx="679.9" r="1" />
                  <circle  id="b-g-11" cy="308.7" cx="674.6" r="1" />
                  <circle  id="b-g-10" cy="310.1" cx="677" r="1" />
                  <circle  id="b-g-8" cy="309.5" cx="712.5" r="1" />
                  <circle  id="b-g-9" cy="308" cx="710.9" r="1" />
                  <circle  id="b-g-1" cy="310" cx="675.1" r="1" />

                  <circle  id="b-b1-11" cy="267.9" cx="667.2" r="1" />
                  <circle  id="b-b1-1" cy="260.8" cx="696.3" r="1" />
                  <circle  id="b-b1-9" cy="261.3" cx="696.4" r="1" />
                  <circle  id="b-b1-10" cy="261.1" cx="696.7" r="1" />
                  <circle  id="b-b1-3" cy="264.7" cx="694.7" r="1" />
                  <circle  id="b-b1-6" cy="262.5" cx="694.4" r="1" />
                  <circle  id="b-b1-8" cy="264.1" cx="694.3" r="1" />

                  <circle  id="b-f1-42" cy="310" cx="675.1" r="1" />

                  <circle  id="a-g-5" cy="259.4" cx="431.8" r="1" />
                  <circle  id="a-g-4" cy="259.4" cx="420" r="1" />

                  <circle  id="a-b1-1" cy="258.2" cx="405.2" r="1" />
                  <circle  id="a-b1-2" cy="258.1" cx="406.8" r="1" />
                  <circle  id="a-b1-3" cy="256.6" cx="412" r="1" />
                  <circle  id="a-b1-4" cy="257.3" cx="410.2" r="1" />
                </g>
                <g stroke="red" stroke-width="1" style="display: none;" fill="rgb(70,70,70)" > 
                  <circle id="0_main_gate" cy="20" cx="20" r="1"></circle>
                  <circle id="1" cy="140" cx="20" r="1"></circle>
                  <circle id="2" cy="140" cx="570" r="1"></circle>
                  <circle id="3" cy="275" cx="570" r="1"></circle>
                  <!-- builing A -->
                  <circle id="4" cy="275" cx="473" r="1"></circle>
                  <circle id="5" cy="260" cx="473" r="1"></circle>
                  <circle id="6" cy="260" cx="440" r="1"></circle>
                <!-- builing B -->
                  <circle id="7" cy="295" cx="570" r="1"></circle>
                  <circle id="8" cy="295" cx="670" r="1"></circle>
                  <circle id="9" cy="310" cx="670" r="1"></circle>
                  <circle id="10" cy="278" cx="670" r="1"></circle>
                  <circle id="11_stairs" cy="278" cx="655" r="1"></circle>
                  <circle id="12_library" cy="240" cx="670" r="1"></circle>

                 
                </g>
                <polyline style="display:none;" id="direction" points="20,20 20,140 540,140 540,200"></polyline>  
                <circle id="gps_location" style="display:none;" cy="100" cx="100" r="3" ></circle>
                <circle id="gps_animation" style="display:none;" cy="100" cx="100" r="1"></circle>
             </svg>
        </div>
    </div>
    </center>
    <div  class="map_btn fas" style="right:295px; bottom:5px;"onclick="show_floor(-1)">B1</div>
 <div  class="map_btn fas" style="right:370px; bottom:5px;" onclick="show_floor(0)">G</div>
 <div  class="map_btn fas" style="right:445px; bottom:5px;" onclick="show_floor(1)">F1</div>
 <div  class="map_btn fas" style="right:520px; bottom:5px;" onclick="show_floor(2)">F2</div>

 <div id="zoom_in" class="map_btn fas" style="right:5px; bottom:70px;"onclick="zoom(0.2)">&#xf00e;</div>
 <div id="zoom_out" class="map_btn fas" style="right:5px; bottom:5px;" onclick="zoom(-0.2)">&#xf010;</div>
 <div id="rotate_R" class="map_btn fas" style="right:80px; bottom:5px;" onclick="rotate(90)">&#xf01e;</div>
 <div id="rotate_L" class="map_btn fas" style="right:145px; bottom:5px;" onclick="rotate(-90)">&#xf0e2;</div>
 <div id="gps" class="map_btn fas" style="right:5px; bottom:145px;" onclick="getLocation()">&#xf3c5;</div>
 <div id="find" class="map_btn fas" style="display:none; right:5px; bottom:220px;" onclick="ff()">&#xf3c5;</div>
 <div id="loading_icon" class="fas">&#xf110;</div>
 </div>
    </form>
    <script>
dragElement(document.getElementById("map_inner"));
function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById("map")) {
    document.getElementById("map").onmousedown = dragMouseDown;
  } else {
    elmnt.onmousedown = dragMouseDown();
  }
  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

//gps
var lati = 0;
var long = 0;

function getLocation() {
  if (navigator.geolocation) {
    document.getElementById("loading_icon").style.display = "inline";
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    document.getElementById("loading_icon").style.display = "none";
      alert("GPS is not supported by this browser.")
  }
}
function showPosition(position) {
    
  var lati = position.coords.latitude;
  var long = position.coords.longitude;
  document.getElementById("loading_icon").style.display = "none";
  gps_locate(lati,long);
  
}
 </script>
</body>

</html>
