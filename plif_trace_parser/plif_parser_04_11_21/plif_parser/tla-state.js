/*
Helpers:
  function prettyPrint(stateStr)
    Receives the StateStr and returns a pretty printed html version of the state
    Can be used to print the state in a similar way as the tlc-trace prints it

  function parseVars(stateStr)
    Parse the vars in the stateStr and returns a map of them
    Functions are parsed into js Map
    Sequences are parsed into js Array
    Sets are parsed into js Set
    Records are parsed into js objects
*/

// Chunk size when reading a file
chunk_sz = 500*_1MB;

// Spacing between nodes
node_spacing = 100;

// Number of nodes in one line
nodes_number = 2;

// Spacing between groups
group_spacing = 100;

//adjustment of node placement on y axis
nodes_adjustment = 0;

//length of node name 
name_len = 4


// Representing variables created in one borders of one session
class Session{
  static #eId = 0;
  static #pId = 0;
  static #cId = 0;
  static #vId = 0;
  static #aId = 0;
  static #uId = 0;

  constructor(name, posY, id){
    this.sessionName = name;
    this.posY = posY;
    this.dots = {};
    this.height = 2;
    this.curCoords = [[0,2], [0,2], [0,2]];
    this.constReg = new RegExp('^c\\d+');
    this.persReg = new RegExp('^col_\\w+');
    this.dots[id] = {
        affil: 5,
        type: 5,  
        dot: {
          label: `<b>${name}</b>`,
          x: 0, 
          y: this.posY,
          borderWidth: 2,
          color: {
            border: "#000000",
            background: "#000000"
          }
        }
    };
  }

  static resetId(){
    Session.#eId = 0;
    Session.#pId = 0;
    Session.#cId = 0;
    Session.#vId = 0;
    Session.#aId = 0;
    Session.#uId = 0;
  }

  #generateNodename(PolicyName){
    const errReg = new RegExp('^p_\\w\\w_e_[\\w\\d_]+');
    const persReg = new RegExp('^col_[\\w\\d_]+');
    const constReg = new RegExp('^c\\d+');
    const arrReg = new RegExp('^(\\w*_){2,5}arr_');
    let GNodeName = '';
    let type = 0;

    if (errReg.test(PolicyName)) {
      GNodeName = 'e' + Session.#eId++;
      type = 0;
    } else if(persReg.test(PolicyName)) {
      GNodeName = 'p' + Session.#pId++;
      type = 1;
    } else if(constReg.test(PolicyName)) {
      GNodeName = 'c' + Session.#cId++;
      type = 2;
    } else if(arrReg.test(PolicyName)) {
      GNodeName = 'a' + Session.#aId++;
      type = 3;
    } else if (PolicyName === undefined) {
      GNodeName = 'u' + Session.#uId++;
      type = 6;
    } else {
      GNodeName = 'v' + Session.#vId++;
      type = 4;
    } 
    GNodeName = GNodeName?.length < name_len ? GNodeName + " ".repeat(name_len - GNodeName?.length) : GNodeName;
    return [GNodeName, type];
  }

  #checkNameAffiliation(name){
    if(this.constReg.test(name)){
      return 0;
    }
    if(this.persReg.test(name)){
      return 2;
    }
    return 1;
  } 

  #generatePosition(affil){
    let f = false;
    if(this.curCoords[affil][0] == 0 && this.curCoords[affil][1] == this.height){
      this.height += 1;
      f = true;
    }
    let res = this.curCoords[affil].slice();
    this.curCoords[affil][0] = (this.curCoords[affil][0] + 1)%nodes_number;
    if(this.curCoords[affil][0] == 0)
      this.curCoords[affil][1] += 1;
    return [res, f];
  }

  //Paint active nodes in this session
  PaintNodes(ids){
    let dotKeys = Object.keys(this.dots);
    for(const i of ids){
      if(dotKeys.includes(i.toString())){
        let color = GColors.nodes.const.color;
        switch(this.dots[i].affil){
          case 1:
            color = GColors.nodes.local.color;
            break;
          case 2:
            color = GColors.nodes.pers.color;
            break;
        }
        if (this.dots[i].type == 3) {
          this.dots[i].dot.color.border = GColors.general.arrayBorderColor;
        } else if (this.dots[i].type == 6) {
          this.dots[i].dot.color.border = GColors.general.hightlightColor;
        } else {
          this.dots[i].dot.color.border = color
        }
        if (this.dots[i].type == 6)
          this.dots[i].dot.color.background = GColors.general.hightlightColor;
        else if (this.dots[i].affil != 5)
          this.dots[i].dot.color.background = color;
      }
    }
  }
  
  //Make all nodes inactive
  PaintInGrey(){
    for(const [i, j] of Object.entries(this.dots)){
      if(j.type == 6)
        j.dot.color.background = GColors.general.hightlightColor;
      else if(j.affil != 5)
        j.dot.color.background = GColors.general.inactiveColor;
      if(j.type == 3)
        j.dot.color.border = GColors.general.inactiveArrayColor;
      else if (j.type == 6)
        j.dot.color.border = GColors.general.hightlightColor;
      else
        j.dot.color.border = GColors.general.inactiveColor;
    }
  }

  //Add new node to the session
  AddNode(id, name){
    let a =  this.#checkNameAffiliation(name);
    let [graph_name, type] = this.#generateNodename(name);
    const [coords, res] = this.#generatePosition(a);
    this.dots[id] = {
      affil: a,
      type: type,
      //occurrences: [layer],  
      dot: {
        label: `<b>${graph_name}</b>`,
        group: this.sessionName + "_" + a,
        x: coords[0]*node_spacing + (group_spacing +nodes_number*node_spacing)*a,
        y: coords[1]*node_spacing + this.posY + coords[0]*nodes_adjustment,
        title: name,
        borderWidth: 2,
        color: {
          border: "#000000",
          background: "#000000"
        }
      }
    }
    return res;
  }

  //move all nodes in this session
  ShiftSessionPosition(shift){
    this.posY += shift;
    for(const key of Object.keys(this.dots)){
      this.dots[key].dot.y += shift;
    }
  }

  //Get current nodes layout
  get layout(){
    let res = [];
    for(const [key, value] of Object.entries(this.dots)){
      res.push(Object.assign({id: key}, value["dot"]));
    }
    return res;
  }
}

class GraphClass{
  constructor(){
    Session.resetId();
    this.sessions = {};
    this.nodeNames = [];
    this.id = 0;
    this.edges = [];
    this.layersNum = 0;
    this.tableEdges = [];
    this.tableNodes = [];
  }

  #getNodeId(name){
    for(let i=0; i<this.nodeNames.length; i++){
      if(this.nodeNames[i] == name)
        return i+1;
    }
    return undefined
  }

  #pushSessions(sessionName){
    let f = false;
    for(let i=0; i<this.sessions.length; i++){
      if(f){
        this.sessions[i].ShiftSessionPosition(node_spacing);
      }else{
        if(this.sessions.sessionName == sessionName)
          f = true;
      }
    }
  }

  //Add new layer of transitions to graph
  processLayer(sessionName, data){
    this.layersNum += 1;
    this.tableEdges = [];
    this.tableNodes = [];
    
    //Check if this Session already exist, otherwise add new one
    let keys = Object.keys(this.sessions);
    if(!(keys.includes(sessionName))) {
      let lastSession = this.sessions[keys[keys.length - 1]];
      if(lastSession == undefined){
        this.sessions[sessionName] = new Session(sessionName,  0, ++this.id);
        this.nodeNames.push("session_" + sessionName);
      }
      else{
        this.sessions[sessionName] = new Session(sessionName,  lastSession.posY + lastSession.height*node_spacing + group_spacing, ++this.id);
        this.nodeNames.push("session_" + sessionName);
      }
    }

    //Paint all nodes grey
    for(const i of Object.keys(this.sessions)){
      this.sessions[i].PaintInGrey();
    }

    //process from\to fields
    for(let i=0; i<data["from"].length; i++){
      let fromNodes = [], inNodes = [];
      for(const v of data["from"][i]){
        if(!this.nodeNames.includes( v["name"]?.slice(1, -1) )){
          if(this.sessions[sessionName].AddNode(++this.id, v["name"]?.slice(1, -1)))
            this.#pushSessions(sessionName);
          this.nodeNames.push(v["name"]?.slice(1, -1));
          fromNodes.push(this.id);
        } else {
          fromNodes.push(this.#getNodeId(v["name"]?.slice(1, -1)))
        }
      }
      if(!(this.nodeNames.includes(data["to"][i]["name"]?.slice(1, -1)))){
        if(this.sessions[sessionName].AddNode(++this.id,  data["to"][i]["name"]?.slice(1, -1)))
          this.#pushSessions(sessionName);
        this.nodeNames.push( data["to"][i]["name"]?.slice(1, -1));
        inNodes.push(this.id);
      } else {
        inNodes.push(this.#getNodeId( data["to"][i]["name"]?.slice(1, -1)))
      }    

      //Adding new edjes that was added at the previouse step
      for(const i of fromNodes){
        for(const j of inNodes){
          this.edges.push({
            from: i,
            to: j,
            smooth: {type: 'curvedCW', roundness: (Math.random()*(-0.1) - 0.1)}
          });
        }
      }
      
      //Painting nodes that was used in current iteration
      let nodesIds = Array.from( new Set(fromNodes.concat(inNodes)) );
      for(const i of Object.keys(this.sessions)){
        this.sessions[i].PaintNodes(nodesIds);
      }
    }
    

    //Update table frame
    keys = Object.keys(this.sessions);
    let lastSession = this.sessions[keys[keys.length-1]];
    let adj = 0;
    if(lastSession != undefined){
      for(; adj<4; adj++){
        this.tableNodes.push(
          {
            id: this.id + adj + 1,
            label: "",
            x: ( (adj&1) + 1)*node_spacing*(nodes_number) + group_spacing*( (adj&1) + 1.0/2) - node_spacing/2,
            y: (adj&2) != 0 ? lastSession.height*node_spacing + lastSession.posY : 0,
            shape: 'dot',
            size: 0,
            borderWidth: 0,
          }
        )
      }
      for(let i = 1; i <= 2; i++){
        this.tableEdges.push(
          {
            from: this.id + i,
            to: this.id + i + 2,
            hidden: false,
            arrows: {
              to: {
                enabled: false
              }
            },
            width: 2,
            chosen: false,
            color:{
              color: GColors.frame.color,
            }
          }
        )
      }

      for(const key of keys){
        this.tableNodes.push(
          {
            id: this.id + ++adj,
            label: "",
            x: -node_spacing,
            y: this.sessions[key].posY + this.sessions[key].height*node_spacing,
            shape: 'dot',
            size: 0,
            borderWidth: 0,
          },
          {
            id: this.id + ++adj,
            label: "",
            x: nodes_number*node_spacing*3 + group_spacing*2,
            y: this.sessions[key].posY + this.sessions[key].height*node_spacing,
            shape: 'dot',
            size: 0,
            borderWidth: 0,
            color:{
              background:  GColors.frame.color
            }
          }
        )
        this.tableEdges.push(
          {
            from: this.id + adj,
            to: this.id + adj - 1,
            hidden: false,
            arrows: {
              to: {
                enabled: false
              }
            },
            width: 2,
            chosen: false,
            color:{
              color:  GColors.frame.color,
            }
          }
        )
      }
    }
  }

  get Edges(){
    let res = this.edges.concat(this.tableEdges);
    return res;
  }

  get Nodes(){
    let res = [];
    for(const k of Object.keys(this.sessions)){
      res = res.concat(this.sessions[k].layout);
    }
    res = res.concat(this.tableNodes);
    return res;
  }
}

// Return the identifier label to use in the next state buttons
function stateIdentifier(child_i, stateStr){
  return "Child " + child_i;
}

// Draw the state
function drawState(content, stateStr){
  let template = document.getElementById("mainTemplate");
  let result = template.content.cloneNode(true);

  statePrettyPrint = result.querySelector("#prettyPrint");
  statePrettyPrint.innerHTML = prettyPrint(stateStr);

  content.innerHTML = "";
  content.appendChild(result);
}

function drawTrace(content, stateStr){
  let str = new String(stateStr);
  let vars = parseVars(str);
  let template = document.getElementById("traceTemplate");
  let result = template.content.cloneNode(true);

  traceTab = result.querySelector("#traceTabBody");
  let row_template = document.getElementById("traceRowTemplate");

  for(x of vars.get("Trace")){

    let row = row_template.content.cloneNode(true);
    let c1 = row.querySelector("#c1");
    let c2 = row.querySelector("#c2");
    let c3 = row.querySelector("#c3");

    c1.innerHTML = x[0].replaceAll("\"", "");;
    c2.innerHTML = x[1].replaceAll("\"", "");
    c3.innerHTML = x[2].replaceAll("\"", "");

    traceTab.appendChild(row);
  }

  content.innerHTML = "";
  content.appendChild(result);
}

function drawNew2OldState(content, stateStr){
  let str = new String(stateStr);
  //str = str.replaceAll("\"", "");

  let vars = parseVars(str);
  let template = document.getElementById("newStateTemplate");
  let result1 = template.content.cloneNode(true);

  newStateTab = result1.querySelector("#newStateTabBody");
  let row_template = document.getElementById("newStateRowTemplate");
  let n2o = vars.get("New2Old");
  if (n2o.length){
    let i = 0;
    for(x of n2o[0]){

        let row = row_template.content.cloneNode(true);
        let c1 = row.querySelector("#c1");
        let c2 = row.querySelector("#c2");
        let pol1 = "";
        let pol2 = "";

        for (const p of x) {
            if (pol1=="") {
                pol1 = p[0]+": ";
                }
            else {
                pol1 = pol1 + "<br>" + p[0]+": ";
                }

                for (const key in p[1][0]) {
                   if (!p[1][0][key].has("NONE") || p[1][0][key].size==0){
                   pol1 = pol1 + key + "(" + Array.from(p[1][0][key]).join() +"), " ;
                     }
                 }

                for (const key in p[1][1]) {
                   if (!p[1][1][key].has("NONE")){
                   pol1 = pol1 + key + "(" + Array.from(p[1][1][key]).join() +"), " ;
                     }
                 }

        }

                for (const p of n2o[1][i]) {
                    if (pol2==""){
                        pol2 = p[0]+": ";
                    }

                    else {
                        pol2 = pol2 + "<br>" + p[0]+": ";
                    }

                        for (const key in p[1][0]) {
                           if (!p[1][0][key].has("NONE") || p[1][0][key].size==0){
                           pol2 = pol2 + key + "(" + Array.from(p[1][0][key]).join() +"), " ;
                             }
                         }

                        for (const key in p[1][1]) {
                           if (!p[1][1][key].has("NONE")){
                           pol2 = pol2 + key + "(" + Array.from(p[1][1][key]).join() +"), " ;
                             }
                         }

                }

        if (pol1=="") {
            pol1 = "max";
        }

        c1.innerHTML = pol1.replace(/,\s*$/, "");
        c2.innerHTML = pol2.replace(/,\s*$/, "");
        newStateTab.appendChild(row);
        i++;
  }
  }

  let lockStateTemplate = document.getElementById("lockStateTemplate");
  let result2 = lockStateTemplate.content.cloneNode(true);

  let lockStateInfoDiv = result2.querySelector("#lockStateInfoDiv");
  let oLocks = lockStateInfoDiv.querySelector("#openLocks");
  let ignoreFlag = lockStateInfoDiv.querySelector("#ignoreFlag");

  if (!vars.get("Trace").length==0){
    let curSession = vars.get("Trace")[vars.get("Trace").length - 1][0];
    let curState = vars.get("SLocks").get(curSession);
    let locks = "";
    for (const key in curState) {
        if (!curState[key].size==0){
            locks = locks + key + "(" + Array.from(curState[key]).join() +"), " ;
        }
    }

    oLocks.innerHTML = oLocks.innerHTML + " " + locks.replace(/,\s*$/, "");
    ignoreFlag.innerHTML = ignoreFlag.innerHTML + " " + vars.get("Ignore");
  }





  content.innerHTML = "";
  content.appendChild(result1);
  content.appendChild(result2);
}

var GraphData;
var options = {
  edges:{
    arrows: 'to',
    color:{
      color: GColors.edges.color,
      hover: GColors.edges.color,
      highlight: GColors.general.hightlightColor
    },
  },
  nodes: {
    color:{
      highlight: GColors.general.hightlightColor
    },
    font:{
      multi: "html",
      bold: "16px serif #eeeeee",
      strokeWidth: 1,
      strokeColor: "#000000"
    },
    shape: 'circle'
  },
  physics: false,
  interaction: {
    dragNodes: true, 
  }
};

var Gwindow = undefined;

function createGraphWindow(){
  if(Gwindow == undefined || Gwindow.closed){
    Gwindow = window.open('about: blank', "Flow Graph", "toolbar=no, scrollbars=no, status=no");
    Gwindow.document.body.innerHTML = `<div id="NewWindowId">aAAAAAAAa</div>`;
    drawGraphInNewWindow();
  }
}


function drawGraphInNewWindow(){
  if(Gwindow != undefined && Gwindow.closed){
    Gwindow = undefined;
    return;
  }
  let newDiv = Gwindow.document.body.querySelector("#NewWindowId");

  let template = document.getElementById("GraphTemplate");
  let result = template.content.cloneNode(true);
  let graphCont = result.querySelector("#graphMainContainer");

  newDiv.innerHTML = "";
  newDiv.appendChild(graphCont);

  console.log(GraphData);
  let temp = newDiv.querySelector("#graphMainContainer");
  new vis.Network(temp, GraphData, options);
}


function drawGraph(content, stateStr){
  let template = document.getElementById("GraphTemplate");
  let result = template.content.cloneNode(true);

  let graphCont = result.querySelector("#graphMainContainer");
  let graphButton = result.querySelector("#graphFullScreenButton");
  graphButton.innerHTML = "full screen";
  graphButton.onclick = createGraphWindow;


  let str = new String(stateStr);
  let vars = parseVars(str);
  let trace = vars.get("Trace");
  let graphInst =  new GraphClass();

  if(trace.length > 0){
    for(const t of trace){
      graphInst.processLayer(t[0], t[3]);
    }
  }
  let nodes = new vis.DataSet(graphInst.Nodes);  
  let edges = new vis.DataSet(graphInst.Edges); 

  let data = {
    nodes: nodes,
    edges: edges
  };

  content.innerHTML = "";
  content.appendChild(graphCont);
  let temp = content.querySelector("#graphMainContainer");
  GraphData = data;
  var network = new vis.Network(temp, data, options);
  temp.appendChild(graphButton);
  if(Gwindow != undefined){
    drawGraphInNewWindow();
  }
}
