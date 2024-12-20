// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require dropzone
import "@hotwired/turbo-rails"
import "popper"
import "bootstrap"
import "controllers"

import "trix"
import "@rails/actiontext"

window.alert = (message) => {
    const modal = document.querySelector('#turbo-alert-modal');
    modal.querySelector('.modal-body').innerText = message;
    const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
    bootstrapModal.show();
};
// window.confirm is also possible but only takes "message" as argument
Turbo.setConfirmMethod((message, _element, submitter) => {
    const modal = document.querySelector('#turbo-confirm-modal');
    const modalTitle = modal.querySelector('.modal-title');
    const modalBody = modal.querySelector('.modal-body');
    const confirmButton = modal.querySelector('#confirm-button');
    modalTitle.innerText = submitter.dataset.turboConfirmTitle || modalTitle.dataset.defaultText;
    modalBody.innerText = message;
    const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
    bootstrapModal.show();
    return new Promise((resolve) => {
        const confirm = () => {
            resolve(true);
            bootstrapModal.hide();
        };
        confirmButton.addEventListener('click', confirm, { once: true });
        modal.addEventListener('hide.bs.modal', () => {
            resolve(false);
            confirmButton.removeEventListener('click', confirm);
        }, { once: true });
    });
});

function initializePopovers() {
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
}
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

document.addEventListener("DOMContentLoaded", initializePopovers)
document.addEventListener("turbo:frame-load", initializePopovers)
