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
    form.classList.toggle('d-none');
    comment.classList.toggle('d-none');
    
    }
}
