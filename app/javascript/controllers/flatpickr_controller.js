import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
    enableTime: true, altInput: true, altFormat: "F j, Y - H:i", dateFormat: "Y-m-d H:i",
    })
  }
}
