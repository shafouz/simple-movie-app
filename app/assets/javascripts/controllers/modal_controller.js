import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "content" ]

  close() {
    this.element.remove()
  }

  escClose(event) {
    if (event.key === 'Escape') this.close()
  }

  blurClose(event) {
    if (event.target === this.modalTarget) this.close()
  }
}
