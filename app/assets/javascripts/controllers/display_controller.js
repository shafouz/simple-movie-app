import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "media" ]

  connect() {
    console.log("its connected")
  }

  changeResults(event) {
    let media_type = event.target.getAttribute("data-media-type")
    this.toggleDisplay(media_type)
  }

  toggleDisplay(media_type) {
    if (media_type == "multi") {
      this.showAll()
    } else {
      this.hideAllExcept(media_type)
    }
  }

  showAll() {
    this.mediaTargets.forEach((e) => {
      e.classList.remove("hidden")
    })
  }

  hideAllExcept(media_type) {
    this.mediaTargets.forEach((e) => {
      if (e.classList[0] == media_type) {
        e.classList.remove("hidden")
      } else {
        e.classList.add("hidden")
      }
    })
  }
}
