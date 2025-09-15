import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["extra"]

  toggle(event) {
    console.log("Checkbox mudou:", event.target.checked)
    if (event.target.checked) {
      this.extraTarget.classList.remove("d-none")
    } else {
      this.extraTarget.classList.add("d-none")
    }
  }
}
