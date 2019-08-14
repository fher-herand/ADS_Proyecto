var options = [];

function init(){
    if(sessionStorage.getItem('rol') != 1){
        //alert('Tu sesión ha caducado');
        //location.href = "login.html"
        document.getElementById("username").innerHTML = "Sin sesión";
    }else{
        document.getElementById("username").innerHTML = sessionStorage.getItem("usuario");
    }
    params = new URLSearchParams(location.search);
    loadTest(params.get("id"), params.get("title") || "Título Exámen");
}

function logout() {
    sessionStorage.clear();
    location.href = "login.html"
}

function loadTest(idTest, titleTest){
    let card1 = {
        id_pregunta:1,
        descripcion:"Pregunta 1",
    };
    let card2 = {
        id_pregunta:2,
        descripcion:"Pregunta 2",
    };
    let cards = new Array(card1, card2);

    let html = "";
    html += `<h2 align="center">${titleTest}</h2>`;
    cards.forEach(function (card) {
        html += `<div class="card-header bg-dark text-light">
                    ID: ${card.id_pregunta}
                </div>
                <div class="card-body">
                    <h5 class="card-title">${card.descripcion}</h5>
                    <p class="card-text">${getOptions(card.id_pregunta)}</p>
                </div>
                <br/>`;
    });
    html += `<a href="#" class="btn btn-warning" data-toggle="modal" data-target="#modalConfirm">Finalizar</a>`;
    html += `<div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    Seguro que quieres finalizar el exámen?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="finishTest(${idTest})">Sí</button>
                  </div>
                </div>
              </div>
            </div>`;

    document.getElementById("card").innerHTML = html;
}
function getOptions(idQuestion){
    let card1 = {
        id_respuesta:1,
        descripcion:"Respuesta 1",
    };
    let card2 = {
        id_respuesta:2,
        descripcion:"Respuesta 2",
    };
    let cards = new Array(card1, card2);

    let html = "";
    cards.forEach(function (card) {
        html += `<div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="${getIdCheckOption(card.id_respuesta, idQuestion)}" onclick="optionSelected(this, ${card.id_respuesta}, ${idQuestion})">
            <label class="custom-control-label" for="${getIdCheckOption(card.id_respuesta, idQuestion)}">${card.descripcion}</label>
        </div>`;
        options.push({
            idQuestion: idQuestion,
            idOption: card.id_respuesta,
            selected: false,
        });
    });

    return html;
}
function getIdCheckOption(idOption, idQuestion) {
    return "check"+idOption+"-q"+idQuestion;
}
function optionSelected(event, idOption, idQuestion){
    if(event.checked){
        options.find(function (item) {
            return item.idQuestion == idQuestion && item.idOption == idOption;
        }).selected = true;
    }else{
        options.find(function (item) {
            return item.idQuestion == idQuestion && item.idOption == idOption;
        }).selected = false;
    }
}