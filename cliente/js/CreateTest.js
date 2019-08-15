var questions = [];
    var options = [];
    function logout() {
        sessionStorage.clear();
        location.href = "../pages/login.html"
    }
    function init(){
        if(sessionStorage.getItem('rol')!=1){
            //alert('Tu sesión ha caducado');
            //location.href = "../html/login.html"
            document.getElementById("username").innerHTML = "Sin sesión";
        }else{
            document.getElementById("username").innerHTML = sessionStorage.getItem("usuario");
        }
    }
    function addQuestion() {
        let html = `<div class="card-header bg-dark text-light" align="center">
                        Pregunta ${questions.length+1}
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="form-group row">
                                <label for="${getIdInputQuestion(questions.length)}" class="col-sm-2 col-form-label">Descripción</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="${getIdInputQuestion(questions.length)}" placeholder="Descripción del exámen" required>
                                </div>
                            </div>
                        </form>
                        <br>
                        <h5>Respuestas</h5>
                        <div id="optionList${questions.length}">
                            <!-- Opciones -->
                        </div>
                        <br>
                        <div>
                            <a class="btn btn-primary" onclick="addOption(${questions.length})">Agregar respuesta</a>
                        </div>
                    </div>
                    <br/>`;

        questions.push({
            i: questions.length,
            desc: "",
            options: [],
        });

        $('#card').append(html);
    }
    function addOption(iQuestion) {
        question = questions[iQuestion];
        let html = `<form>
                        <div class="form-row">
                            <div class="col-auto">
                                <div class="custom-control custom-switch my-2 mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="${getIdSwitchOption(question.options.length, iQuestion)}" onclick="optionSelected(this, ${question.options.length}, ${iQuestion})">
                                    <label class="custom-control-label" for="${getIdSwitchOption(question.options.length, iQuestion)}"></label>
                                </div>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Descripción de respuesta" id="${getIdInputOption(question.options.length, iQuestion)}">
                            </div>
                        </div>
                    </form>`;

        questions[iQuestion].options.push({
            i: question.options.length,
            iQuestion: iQuestion,
            desc: "",
            isAnswer:false,
        });
//        document.getElementById("optionList"+iQuestion)
        $('#optionList'+iQuestion).append(html);
    }
    function getIdSwitchOption(iOption, iQuestion){
        return "switch"+iOption+"-q"+iQuestion;
    }
    function getIdInputOption(iOption, iQuestion){
        return "input"+iOption+"-q"+iQuestion;
    }
    function optionSelected(event, iOption, iQuestion){
        if(event.checked){
            questions[iQuestion].options[iOption].isAnswer = true;
        }else{
            questions[iQuestion].options[iOption].isAnswer = false;
        }
    }

    function getIdInputQuestion(iQuestion) {
        return "input-q"+iQuestion;
    }

    function createTest(){
        let id = document.getElementById("inputID").value;
        let pubDate = document.getElementById("inputPubDate").value;
        let startTime = document.getElementById("inputStartTime").value;
        let finishTime = document.getElementById("inputFinishTime").value;

        //Agregar las descripciones a las opciones y preguntas
        for(let iQuestion=0; iQuestion<questions.length; iQuestion++){
            questions[iQuestion].desc = document.getElementById(getIdInputQuestion(iQuestion)).value;
            for(let iOption=0; iOption<questions[iQuestion].options.length; iOption++){
                questions[iQuestion].options[iOption].desc = document.getElementById(getIdInputOption(iOption, iQuestion)).value;
            }
        }

        //Se leen los campos de las opciones y preguntas
        let msg = "";
        for(let iQuestion=0; iQuestion<questions.length; iQuestion++){
            let question = questions[iQuestion];
            msg += "-Q"+question.i+":"+question.desc+"\n";
            for(let iOption=0; iOption<question.options.length; iOption++){
                let option = question.options[iOption];
                msg += "    -O"+option.i+":"+option.desc+"->"+option.isAnswer+"\n";
            }
        }

        alert(msg);
    }