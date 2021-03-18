import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "filter" ]

  changeBg(event) {
    this.removeAllBgs()
    event.currentTarget.classList.add("bg-gray-200")
  }

  removeAllBgs(){
    this.filterTargets.forEach((e) => {
      e.classList.remove("bg-gray-200")
    })
  }
}
