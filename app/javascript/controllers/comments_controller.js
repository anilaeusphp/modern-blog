import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {

  initialize(){
    console.log("Comments Controller initialized");
  }
  connect() {
    console.log("CommentsController Stimulus is mounted");
  }

  toggleForm(e){
    e.preventDefault();
    e.stopPropagation();
    const form = document.getElementById(e.params['form']);
    const comment = document.getElementById(e.params['body']);
    const edit = document.getElementById(e.params['edit']);
    form.classList.toggle('d-none');
    comment.classList.toggle('d-none');
    
    this.toggleEditButton(edit);
    }

    toggleEditButton(edit){
      if(edit.innerText == "Edit"){
        edit.innerText = "Cancel";
        this.toggleEditButtonClass(edit);
      }else{
        edit.innerText = "Edit";
        this.toggleEditButtonClass(edit);
      }
    }

    toggleEditButtonClass(edit){
      edit.classList.toggle("btn-secondary");
      edit.classList.toggle("btn-warning");
    }
}
