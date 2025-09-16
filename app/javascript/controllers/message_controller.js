import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"]

  connect() {

  }

  keydown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      event.preventDefault();
      this.formTarget.requestSubmit();
    }
  }
}
