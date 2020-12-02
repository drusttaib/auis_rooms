function drawLine(points){
    var points_xy = null;
    for (var i = 0; i < points.length; i++) {
        
        points_xy =points_xy+ points_values[points[i]][0]+","+points_values[points[i]][1]+" ";
    }
    try {
        var delete_el = document.getElementById("direction");
        delete_el.remove();
    } catch{ }
    var line= '<polyline id="direction" points="'+points_xy+'"></polyline>';
   document.getElementById("map").innerHTML = document.getElementById("map").innerHTML +line;
}
function delete_line() {
    try {
        var delete_el = document.getElementById("direction");
        delete_el.remove();
    } catch{ }
}
  var points_values = [
                       /*0  main gate*/ [20, 20],
                       /*1*/ [20, 140],
                       /*2*/ [570, 140],
                       /*3*/ [570, 275],
                       /*4*/ [473, 275],
                       /*5*/ [473, 260],
                       /*6*/ [440, 260],
                       /*7*/ [570, 295],
                       /*8*/ [670, 295],
                       /*9*/ [670,310],
                       /*10*/ [670, 278],
                       /*11_B_stairs*/ [655, 278],
                       /*12_library*/[670, 240],
                        /*13*/[710, 295],
                        /*14*/[710, 305],
                        /*15*/[670, 278],
                        /*16*/[670, 240],
                        /*17*/[670, 310],
                      ];
function solve(graph, s) {
    var solutions = {};
    solutions[s] = [];
    solutions[s].dist = 0;
    
    while(true) {
      var parent = null;
      var nearest = null;
      var dist = Infinity;
      
      //for each existing solution
      for(var n in solutions) {
        if(!solutions[n])
          continue
        var ndist = solutions[n].dist;
        var adj = graph[n];
        //for each of its adjacent nodes...
        for(var a in adj) {
          //without a solution already...
          if(solutions[a])
            continue;
          //choose nearest node with lowest *total* cost
          var d = adj[a] + ndist;
          if(d < dist) {
            //reference parent
            parent = solutions[n];
            nearest = a;
            dist = d;
          }
        }
      }
      
      //no more solutions
      if(dist === Infinity) {
          break;
      }
      
      //extend parent's solution path
      solutions[nearest] = parent.concat(nearest);
      //extend parent's cost
      solutions[nearest].dist = dist;
    }
    
    return solutions;
  }
  //create graph
  var graph = {};
  
  var layout = {
    '0': ['1'],
    '1': ['2','0'],
    '2': ['3','1'],
    '3': ['4','2','7'],
    '4': ['5','3'],
    '5': ['6','4'],
    '6': ['5'],
    '7': ['8','3'],
    '8': ['9','10','7','13'],
    '9': ['8'],
    '10': ['11','12','8'],
    '11': ['10'],
    '12': ['10'],
    '13': ['8', '14'],
    '14': ['13'],
    '15': ['11','16','17'],
    '16': ['15'],
    '17': ['15'],
  }
  for(var id in layout) {
    if(!graph[id])
      graph[id] = {};
    layout[id].forEach(function(aid) {
      graph[id][aid] = 1;
      if(!graph[aid])
        graph[aid] = {};
      graph[aid][id] = 1;
    });
  }
var rooms = {
    'main_gate': [0],
    'library': [12],

    'b-g-1': [9],
    'b-g-2': [9],
    'b-g-3': [9],
    'b-g-4': [9],
    'b-g-8': [9],
    'b-g-9': [9],
    'b-g-10': [9],
    'b-g-11': [9],
    'b-g-32': [12],

    'b-b1-11': [13],
    'b-b1-1': [14],
    'b-b1-10': [14],
    'b-b1-9': [14],
    'b-b1-3': [14],
    'b-b1-6': [14],
    'b-b1-8': [14],

    'b-f1-1': [17],
    'b-f1-2': [17],
    'b-f1-3': [17],
    'b-f1-4': [17],
    'b-f1-5': [17],
    'b-f1-6': [17],
    'b-f1-7': [17],
    'b-f1-11': [17],
    'b-f1-12': [17],
    'b-f1-13': [17],
    'b-f1-14': [17],
    'b-f1-15': [17],
    'b-f1-16': [17],
    'b-f1-31': [16],
    'b-f1-32': [16],
    'b-f1-33': [16],
    'b-f1-34': [16],
    'b-f1-35': [16],
    'b-f1-36': [16],
    'b-f1-38': [16],
    'b-f1-39': [16],
    'b-f1-40': [16],
    'b-f1-41': [16],
    'b-f1-42': [16],

    'b-f2-1': [17],
    'b-f2-2': [17],
    'b-f2-3': [17],
    'b-f2-4': [17],
    'b-f2-5': [17],
    'b-f2-6': [17],
    'b-f2-7': [17],
    'b-f2-11': [17],
    'b-f2-12': [17],
    'b-f2-13': [17],
    'b-f2-14': [17],
    'b-f2-15': [17],
    'b-f2-16': [17],
    'b-f2-17': [17],
    'b-f2-18': [17],
    'b-f2-31': [16],
    'b-f2-33': [16],
    'b-f2-35': [16],
    'b-f2-37': [16],
    'b-f2-39': [16],
    'b-f2-41': [16],

    'a-g-4': [6],
    'a-g-5': [6],
    'a-b1-1': [6],
    'a-b1-2': [6],
    'a-b1-3': [6],
    'a-b1-4': [6],
    'a-b1-8': [6],
    'a-b1-9': [6],
    'a-b1-10': [6],
    'a-b1-11': [6],
    'a-b1-12': [6],
    'a-b1-13': [6],
}
function find_way(start_name, end_name) {
    if (start_name.startsWith("b-b1") || start_name.startsWith("a-b1")) {
            show_floor(-1);
    } else if (start_name.startsWith("b-g") || start_name.startsWith("a-g")) {
        show_floor(0);
    }
    else if (start_name.startsWith("b-f1")) {
        show_floor(1);
    }
    else if (start_name.startsWith("b-f2")) {
        show_floor(2);
    }
  //start_name is a name must be coverted to number 0,1,2...
  var start=rooms[start_name];
  var end=rooms[end_name];
  var solutions = solve(graph, start);
  //display solutions
  for(var s in solutions) {
    if(!solutions[s]) continue;
    if(s==end){
        var my_points = [start];
        var new_array = [].concat(start, solutions[s]);;
        drawLine(new_array);
    }
    console.log(" -> " + s + ": [" + solutions[s].join(", ") + "]   (dist:" + solutions[s].dist + ")");
  }
}


 