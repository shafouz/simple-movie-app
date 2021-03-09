import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "multi", "movie", "tv", "person" ]

  connect() {
  }

  toggleStuff() {
    this.allTargets.forEach((e) => {
      e.classList.add("hidden")
    })
  }
}
