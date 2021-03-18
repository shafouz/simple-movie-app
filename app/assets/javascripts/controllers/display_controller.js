import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "media", "filter" ]

  changeBg(event) {
    this.removeAllBgs()
    event.currentTarget.classList.add("bg-gray-200")
  }

  changeResults(event) {
    let target = event.currentTarget
    let media_type = target.getAttribute("data-media-type")
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

  removeAllBgs(){
    this.filterTargets.forEach((e) => {
      e.classList.remove("bg-gray-200")
    })
  }
}
