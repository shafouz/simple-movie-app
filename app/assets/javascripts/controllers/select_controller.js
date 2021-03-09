import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "movie", "tv", "person" ]

  connect() {
  }

  toggleDisplay(event) {
    let target = event.target.classList

    if (target.contains("hidden")) {
      target.remove("hidden")
    } else {
      target.add("hidden")
    }
  }
}
