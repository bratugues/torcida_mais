import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {

  static targets = [ "match" ]

  apply(event) {
    const selectedDate = event.target.value;

    if (!selectedDate) {
      this.matchTargets.forEach(match => {
        match.style.display = 'block';
      });
      return;
    }

    this.matchTargets.forEach(match => {
      const matchDate = match.dataset.date;

      if (selectedDate === matchDate) {
        match.style.display = 'block';
      } else {
        match.style.display = 'none';
      }
  });
  }
}
