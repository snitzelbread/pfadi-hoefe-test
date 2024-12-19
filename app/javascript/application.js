// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require dropzone
import "@hotwired/turbo-rails"
import "popper"
import "bootstrap"
import "controllers"

import "trix"
import "@rails/actiontext"

function initializePopovers() {
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
}
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

document.addEventListener("DOMContentLoaded", initializePopovers)
document.addEventListener("turbo:frame-load", initializePopovers)
