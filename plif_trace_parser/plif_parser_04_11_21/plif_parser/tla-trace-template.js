document.write(`
   <template id="traceTemplate">
      <div class="divTable redTable">
      <div class="divTableHeading">
      <div class="divTableRow">
      <div class="divTableHead">Session</div>
      <div class="divTableHead">TLA+</div>
      <div class="divTableHead">PLSQL</div>
      </div>
      </div>
      <div id ="traceTabBody" class="divTableBody">
      </div>
      </div>
   </template>
   <template id = "traceRowTemplate">
      <div class="divTableRow">
         <div id="c1" class="divTableCell"></div>
         <div id="c2" class="divTableCell"></div>
         <div id="c3" class="divTableCell"></div>
      </div>
   </template>

   <template id="newStateTemplate">
      <div id="newStateTab" class="newStateTable-frame">
      <div class="divTable newStateTable">
      <div class="divTableHeading">
      <div class="divTableRow">
      <div class="divTableHead">To</div>
      <div class="divTableHead">From</div>
      </div>
      </div>
      <div id ="newStateTabBody" class="divTableBody">
      </div>
      </div>
   </template>
   <template id = "newStateRowTemplate">
      <div class="divTableRow">
         <div id="c1" class="divTableCell"></div>
         <div id="c2" class="divTableCell"></div>
      </div>
   </template>

   <template id = "lockStateTemplate">
      <div id="lockStateInfoDiv" class="lockState-stateInfoDiv">
         <div style="font-size: 16px; background: #A40808; font-weight: bold; color: #FFFFFF; margin-bottom: 5px;">LockState Info:</div>
         <div id = "openLocks" style="font-size: 14px; margin-bottom: .3cm"/> <b>Open Locks:</b></div>
         <div id = "ignoreFlag" style="font-size: 14px;"/> <b>Ignore Flag:</b></div>
      </div>
   </template>
   <template id="traceTemplate">
      <div class="divTable redTable">
      <div class="divTableHeading">
      <div class="divTableRow">
      <div class="divTableHead">Session</div>
      <div class="divTableHead">TLA+</div>
      <div class="divTableHead">PLSQL</div>
      </div>
      </div>
      <div id ="traceTabBody" class="divTableBody">
      </div>
      </div>
   </template>

   <template id="GraphTemplate">
      <div class="graphContainer" id="graphMainContainer">
      <button class="graphButton" id="graphFullScreenButton">
         text
      </button>
   </template>
`)
