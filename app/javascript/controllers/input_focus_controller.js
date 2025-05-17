import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"]

  connect() {
    // Focus the first empty field when controller connects
    const emptyField = this.fieldTargets.find(field => !field.value)
    if (emptyField) emptyField.focus()
  }

  // Handle all keydown events
  handleKey(event) {
    const currentField = event.target
    const index = this.fieldTargets.indexOf(currentField)
    
    // Handle regular character input
    if (event.key.length === 1) {
      // Auto-capitalize the input (prevent default and manually insert uppercase)
      event.preventDefault()
      
      // Insert uppercase character
      currentField.value = event.key.toUpperCase()
      
      // Move to next field
      if (index < this.fieldTargets.length - 1) {
        setTimeout(() => this.fieldTargets[index + 1].focus(), 0)
      }
    }
    
    // Handle backspace
    else if (event.key === "Backspace") {
      // If current field has content, let native backspace happen
      // If current field is empty and we're not on the first field, move back
      if (!currentField.value && index > 0) {
        this.fieldTargets[index - 1].focus()
      }
    }
  }
}
