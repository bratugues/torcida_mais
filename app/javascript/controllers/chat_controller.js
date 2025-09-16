import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  static values = {
    messageUserId: Number
  }

  static targets = ["inner", "outer"]

  connect() {
    const currentUserId = parseInt(document.getElementById("current-user").dataset.id)
    if (this.messageUserIdValue == currentUserId) {
      this.outerTarget.classList.add("d-flex", "justify-content-end", "mb-2")
      this.innerTarget.classList.add("chat-bg-color", "px-4", "pb-0", "pt-3", "rounded-5")
    } else {
      this.outerTarget.classList.add("d-flex", "justify-content-start", "mb-5")
      this.innerTarget.classList.add("bg-secondary-subtle", "px-4", "pb-0", "pt-3", "rounded-5")
    }

    const messages = document.getElementById("messages")
    messages.scrollTop = messages.scrollHeight;

  }
}
