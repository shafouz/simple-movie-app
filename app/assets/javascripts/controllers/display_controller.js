import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "multi", "movie", "tv", "person" ]

  connect() {
  }

  toggleMulti() {
    let target = this.multiTarget

    if (target.contains("hidden")) {
      target.remove("hidden")
    } else {
      target.add("hidden")
    }
  }

  toggleMovie() {
    let target = this.movieTarget

    if (target.contains("hidden")) {
      target.remove("hidden")
    } else {
      target.add("hidden")
    }
  }

  toggleTv() {
    let target = this.tvTarget

    if (target.contains("hidden")) {
      target.remove("hidden")
    } else {
      target.add("hidden")
    }
  }

  togglePerson() {
    let target = this.personTarget

    if (target.contains("hidden")) {
      target.remove("hidden")
    } else {
      target.add("hidden")
    }
  }
}
