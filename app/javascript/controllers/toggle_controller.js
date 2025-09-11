import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "panel"]

  connect() { this.update() }
  switch()  { this.update() }

  update() {
    const checked = this.checkboxTarget.checked
    this.panelTargets.forEach(panel => {
      panel.classList.toggle("d-none", !checked)
    })
  }
}
