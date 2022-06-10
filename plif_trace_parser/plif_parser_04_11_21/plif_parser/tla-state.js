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

  genHtmlTitle(html, policy) {
    const container = document.createElement("div");
    container.setAttribute('class', 'graphTitleContaner');

    const nameHeader = document.createElement("div");
    nameHeader.innerHTML = html;
    nameHeader.setAttribute('class', 'graphTitleName');
    
    const policyC = document.createElement("div");
    policyC.setAttribute('class', 'graphTitlePolicy');

    let c = 0;
    let strings_num = 0
    let total_len = 0
    for(const pol of policy){
      if(pol == undefined)
        continue
      strings_num = pol.split("br").length;
      total_len += strings_num*20;
      const onePolC = document.createElement("div");
      onePolC.innerHTML = pol;
      onePolC.setAttribute('class', `graphTitlePolicyInner${c%2}`);
      onePolC.style.height = `${20*strings_num}px`;
      policyC.appendChild(onePolC);
      c+=1;
    }
    policyC.style.height =  `${total_len}px`
    container.height = `${total_len + 20}px`
    container.appendChild(nameHeader);
    container.appendChild(policyC);
    return container;
  }


  UpdatePolicy(id, name, policy){
    console.log("updatePolicy")
    this.dots[id]["policy"].push(policy)
    console.log( this.dots[id]["policy"])
    this.dots[id]["dot"]["title"] = this.genHtmlTitle(`<b>${name}</b>`,  this.dots[id]["policy"]);
    console.log(this.dots[id]["dot"]["title"])
  }

  //generate_policy_rep(policy){
  //  let c = 0;
  //  let res = ""
  //  for(const a of policy){
  //    res = `<div class=graphTitlePolicyInner${c%2}>${}`
  //  }
  //}

  //Add new node to the session
  AddNode(id, name, policy){
    let a =  this.#checkNameAffiliation(name);
    let [graph_name, type] = this.#generateNodename(name);
    const [coords, res] = this.#generatePosition(a);
    this.dots[id] = {
      layer: [this.layer],
      affil: a,
      type: type, 
      policy: [policy],
      dot: {
        label: `<b>${graph_name}</b>`,
        group: this.sessionName + "_" + a,
        x: coords[0]*node_spacing + (group_spacing +nodes_number*node_spacing)*a,
        y: coords[1]*node_spacing + this.posY + coords[0]*nodes_adjustment,
        title: this.genHtmlTitle(`<b>${name}</b>`, [policy]),
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
    for( const [key, value] of Object.entries(this.dots) ){
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
    this.layersNum = -1;
    this.tableEdges = [];
    this.tableNodes = [];
    this.layers2Nodes = []
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

  paintEdges(to_id) {
    for(edge of this.edges){
      if(edge.to == to_id){
        edge.color = {
          color: GColors.general.hightlightColor
        }
      }
    }
  }

  GetPolicyFromVPol(name, VPol){
    console.log("GetPolicyFromVPol")
    console.log(name)
    console.log(VPol[name])
    return VPol[name]["policy"]
  }

  getPolicyFromSessionM(sessionName, nodeName, sessions, NodeSessionId, offset){
    console.log("Get policy from session")
    let fp, policy = undefined;
    console.log(nodeName)
    console.log(sessions)
    console.log(offset)
    console.log(NodeSessionId)
    try{
      fp = sessions[NodeSessionId].get(sessionName)["StateRegs"][0]["fp"]
      console.log([...sessions[NodeSessionId].get(sessionName)["SessionM"]])
      policy = [...sessions[NodeSessionId].get(sessionName)["SessionM"][offset + fp -1]]
      console.log()
    } catch(e){
      policy = undefined
    }
    console.log(policy)
    return policy
  }

  parsePolicy2(policy){
    if(!policy)
      return undefined
    let ToShow = "";
    for(const pol of policy){
      let ToName = pol[0];
      let t_expire = [...pol[1][0]['t_expire']][0];
      let guest = [...pol[1][1]['guest']][0];
      let manager = [...pol[1][1]['manager']][0];
      let organizer = [...pol[1][1]['organizer']][0];
      let reviewer = [...pol[1][1]['reviewer']][0];
      ToShow += `${ToName}:`;
      if(t_expire != 'NONE')
        ToShow += `</br>t_expire(${t_expire})`;
      if(guest != 'NONE')
        ToShow += `</br>guest(${guest})`;
      if(manager != 'NONE')
        ToShow += `</br>manager(${manager})`;
      if(organizer != 'NONE')
        ToShow += `</br>organizer(${organizer})`;
      if(reviewer != 'NONE')
        ToShow += `</br>reviewer(${reviewer})`;
      ToShow += "</br>"
    }
    console.log("TSHOW");
    console.log(ToShow);
    return ToShow.slice(0,-5);
  }
  parsePolicy(node, from_node = false){
    console.log("Parse Policy")
    console.log(node)
    let unsetted = undefined
    if(from_node)
      unsetted = [...node[0]['policy']][0];
    else
      unsetted = [...node['policy']][0];
    return this.parsePolicy2([unsetted])
  }

  //Add new layer of transitions to graph
  processLayer(sessionName, data, TraceSessions, VPol){
    this.layersNum += 1;
    this.tableEdges = [];
    this.tableNodes = [];
    let processedNodes = []
    const persReg = new RegExp('^col_[\\w\\d_]+');
    
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

    //Paint all nodes in gray
    for(const i of Object.keys(this.sessions)){
      this.sessions[i].PaintInGrey();
    }

    let num = 0;
    //process from\to fields
    for(let i=0; i < data["from"].length; i++){
      let fromNodes = [], inNodes = [];
      for(const v of data["from"][i]){
        if(!this.nodeNames.includes( v["name"]?.slice(1, -1) )){
          let tmp_pol = undefined
          if(persReg.test(v["name"]?.slice(1, -1))){
            console.log('tested')
            console.log(v["name"]?.slice(1, -1))
            tmp_pol = this.GetPolicyFromVPol(v["name"]?.slice(1, -1), VPol);
          } else {
            tmp_pol = data["from"][i];
          }
          let policy = this.parsePolicy(data["from"][i], true)
          if(this.sessions[sessionName].AddNode(++this.id, v["name"]?.slice(1, -1), policy )){
            this.#pushSessions(sessionName);
          }
          //this.layers2Nodes.push({id:this.id, layer: this.layersNum})
          this.nodeNames.push(v["name"]?.slice(1, -1));
          fromNodes.push(this.id);
        } else {
          fromNodes.push(this.#getNodeId(v["name"]?.slice(1, -1)))
        }
        processedNodes.push(v["name"]?.slice(1, -1));
      }
      if(!(this.nodeNames.includes(data["to"][i]["name"]?.slice(1, -1)))){
        let EndPol = undefined//this.getPolicyFromSessionM(sessionName, data["to"][i]["name"], TraceSessions, this.layersNum, data["to"][i]["offs"]);
        if(persReg.test(data["to"][i]["name"]?.slice(1, -1))){
          console.log('tested')
          console.log(data["to"][i]["name"]?.slice(1, -1))
          EndPol = this.GetPolicyFromVPol(data["to"][i]["name"]?.slice(1, -1), VPol);
        } else {
          EndPol = this.getPolicyFromSessionM(sessionName, data["to"][i]["name"], TraceSessions, this.layersNum, data["to"][i]["offs"]);
        }
        let policy = this.parsePolicy2(EndPol)
        if(this.sessions[sessionName].AddNode(++this.id,  data["to"][i]["name"]?.slice(1, -1), policy) ){
          this.#pushSessions(sessionName);
        }
        this.layers2Nodes.push({id:this.id, layer: [this.layersNum]})
        this.nodeNames.push( data["to"][i]["name"]?.slice(1, -1));
        inNodes.push(this.id);
        processedNodes.push(data["to"][i]["name"]?.slice(1, -1));
      } else {
          //let EndPol = this.getPolicyFromSessionM(sessionName, data["to"][i]["name"], TraceSessions, this.layersNum, data["to"][i]["offs"]);
          let EndPol = undefined//this.getPolicyFromSessionM(sessionName, data["to"][i]["name"], TraceSessions, this.layersNum, data["to"][i]["offs"]);
          if(persReg.test(v["name"]?.slice(1, -1))){
            EndPol = this.GetPolicyFromVPol(v["name"]?.slice(1, -1), VPol);
          } else {
            EndPol = this.getPolicyFromSessionM(sessionName, data["to"][i]["name"], TraceSessions, this.layersNum, data["to"][i]["offs"]);
          }
          let policy = this.parsePolicy2(EndPol)
          let id_l = this.#getNodeId( data["to"][i]["name"]?.slice(1, -1))
          let f = false;
          for(const a of this.layers2Nodes){
            if(id_l == a["id"]){
              a["layer"].push(this.layersNum)
              f = true;
            }
          }
          if(!f){
            this.layers2Nodes.push({ id: id_l, layer: [this.layersNum] })
          }
          if( !processedNodes.includes(data["to"][i]["name"]?.slice(1, -1)) ){
            console.log("UPDATE CALL")
            console.log(data["to"][i]["name"]?.slice(1, -1))
            console.log(processedNodes)
            this.sessions[sessionName].UpdatePolicy(id_l, data["to"][i]["name"]?.slice(1, -1), policy);
            processedNodes.push(data["to"][i]["name"]?.slice(1, -1))
          }
            
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
      // Update vertival lines
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

      // Update horizontal lines
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
            x: nodes_number*node_spacing*2 + group_spacing,
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
    row.querySelector("#c0").id = "layer" 
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
  let n = 0
  let a = content.querySelector("#layer");
  while(a != null){
    a.id = "layer_" + n.toString();
    n+= 1
    a = content.querySelector("#layer");
  }
  layer_num += 1;
}

var layer_num = 0

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


var toggleble = true
var selected_nodes = []
var selectable_nodes = []
var mousedown_flag = false
//function canBeSelected
//.."#A40808 #c95555
//"rgba(136, 136, 136, 0.5)"


var onNodeSelect = ( values, id, selected, hovering) => {
  delete_flag = false;
  if ( selected && FixTraceMode && selected_nodes.includes(Number(id)) && !mousedown_flag){
    toDelete = true
    for(edge of graphInst.Edges){ 
      if( Number(edge.to) == Number(id) && selected_nodes.includes(Number(edge.from)))
        toDelete = false
    }
    selected_nodes = selected_nodes.filter(function(value, index, arr){
      return value != Number(id) || !toDelete
    })
    delete_flag = true
  }
  if ( (selected && FixTraceMode && ( selectable_nodes.includes(Number(id)) || selected_nodes.length == 0) || delete_flag )&& !mousedown_flag){
    // Add new node to tree
    mousedown_flag = true  
    if(!delete_flag)
      selected_nodes.push(Number(id))
    selectable_nodes = []
    for(edge of graphInst.Edges){     
      if( selected_nodes.includes(edge.to) && selected_nodes.includes(edge.from) ){
        edge.color = {
          color: "#A40808"
        }
        edge.width = 4;
      } else if( selected_nodes.includes(edge.to) ) {
        edge.color = {
          color: "#824e4e"
        }
        edge.width = 1;
        if( !selected_nodes.includes(edge.from) )
          selectable_nodes.push(edge.from)
      } else {
        edge.color= {
          color: "rgba(136, 136, 136, 0.5)"
        };
        edge.width = 1;
      }
    }
  
    edges.update(graphInst.Edges);

  } else if(selected && toggleble && !FixTraceMode) {
    values.color = {
      color: "#A40808"
    }
    for(edge of graphInst.Edges){
      if(edge.to == id){
        edge.color = {
          color: "#A40808"
        }
      } else {
        edge.color= {
          color: "rgba(136, 136, 136, 0.5)"
        }
      }
    }
    toggleble = false
    edges.update(graphInst.Edges);
  }
  if(hovering){
    let trace = document.getElementById('trace').children[0].children[1]
    for(row of trace.children){
      row.style.border = "1px solid #AAAAAA"
    }
    for(n of graphInst.layers2Nodes){
      if(n['id'] == Number(id)){
        for(id_l of n["layer"]){
          let b = 'layer_' + n["id"].toString()
          let row = trace.children[id_l].style.border = "3px solid #0d29a3"
        }
      }
    }
  }

  mousedown_flag = true
}

var onNodeDeselect = (e) => {
  if(!FixTraceMode){
    selected_nodes = []
    selectable_nodes = []
  }
  if(toggleble || FixTraceMode)
    return true
  for(edge of graphInst.Edges){
      edge.color = {
        color: "#888888"
      }
  }
  toggleble = true
  edges.update(graphInst.Edges);
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
    chosen: false
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
    shape: 'circle',
    chosen: {
      node: onNodeSelect
    }
  },
  physics: false,
  interaction: {
    dragNodes: true,
    hover: true, 
  }
};

var Gwindow = undefined;
var FixTraceMode = false;

function createGraphWindow(){
  if(Gwindow == undefined || Gwindow.closed){
    Gwindow = window.open('about: blank', "Flow Graph", "toolbar=no, scrollbars=no, status=no");
    Gwindow.document.body.innerHTML = `<div id="NewWindowId">aAAAAAAAa</div>`;
    drawGraphInNewWindow();
  }
}

function toggleFixTraceMode(){
  FixTraceMode = !FixTraceMode;
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

  let temp = newDiv.querySelector("#graphMainContainer");
  new vis.Network(temp, GraphData, options);
}

var graphInst = undefined;
var network = undefined;
var nodes = undefined;
var edges = undefined;
var AllSessions = [];

function drawGraph(content, stateStr){
  console.log("Draw Graph//////////////////////////////////////////////////")
  let template = document.getElementById("GraphTemplate");
  let result = template.content.cloneNode(true);

  let graphCont = result.querySelector("#graphMainContainer");
  graphCont.addEventListener('mouseup', e => {
    mousedown_flag = false
  })
  let graphButton = result.querySelector("#graphFullScreenButton");
  graphButton.innerHTML = "full screen";
  graphButton.onclick = createGraphWindow;

  let FixButton = result.querySelector("#fixTraceFullScreen");
  FixButton.innerHTML = "Fix trace";
  FixButton.onclick = toggleFixTraceMode;

  let str = new String(stateStr);
  let vars = parseVars(str);
  let trace = vars.get("Trace");
  let session = vars.get("Sessions");
  let VPol = vars.get("VPol");
  console.log(vars);
  console.log(trace);
  
  if(trace.length > AllSessions.length)
    AllSessions.push(session)
  console.log(AllSessions)

  //let sessionM = vars.get("SessionM");
  graphInst =  new GraphClass();

  if(trace.length > 0){
    for(const t of trace){
      graphInst.processLayer(t[0], t[3], AllSessions, VPol);
    }
  }
  nodes = new vis.DataSet(graphInst.Nodes);  
  edges = new vis.DataSet(graphInst.Edges); 

  let data = {
    nodes: nodes,
    edges: edges
  };

  content.innerHTML = "";
  content.appendChild(graphCont);
  let temp = content.querySelector("#graphMainContainer");
  GraphData = data;
  network = new vis.Network(temp, data, options);
  network.on('click', onNodeDeselect)
  temp.appendChild(graphButton);
  temp.appendChild(FixButton);
  if(Gwindow != undefined){
    drawGraphInNewWindow();
  }
}

