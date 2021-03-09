import { Controller } from "stimulus"
import { Turbo } from "turbo"

export default class extends Controller {
  static targets = [ "selectForm", "searchForm" ]

  connect() {
    console.log("connected")
  }

  showResults(event) {
    let classList = event.target.classList
    let media_type = classList[classList.length - 1]
    let query = this.searchFormTarget.query.value
    let selectForm = this.selectFormTarget

    selectForm.query.value = query
    selectForm.media_type.value = media_type
    selectForm.requestSubmit();
  }
}
