import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  static values = {
    messageUserId: Number
  }

  static targets = ["inner", "outer"]

  connect() {
    console.log("Conectado")
    const currentUserId = parseInt(document.getElementById("current-user").dataset.id)
    console.log(this.messageUserIdValue)
    console.log(currentUserId)
    if (this.messageUserIdValue == currentUserId) {
      this.outerTarget.classList.add("d-flex", "justify-content-end", "mb-2")
      this.innerTarget.classList.add("bg-danger-subtle", "px-3", "pb-0", "pt-3", "rounded-pill")
    } else {
      this.outerTarget.classList.add("d-flex", "justify-content-start", "mb-5")
      this.innerTarget.classList.add("bg-secondary-subtle", "px-3", "pb-0", "pt-3", "rounded-pill")
    }

  }
}
