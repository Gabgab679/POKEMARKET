import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-state"
export default class extends Controller {
  connect() {
    const button = document.getElementById("filter-button");
    const container = document.getElementById("filter-container");
    const input = document.querySelectorAll("input");

    button.onclick = function (e) {
      e.stopPropagation();
      if (container.classList.contains("filters--active")) {
        container.classList.remove("filters--active");
      } else {
        container.classList.add("filters--active");
      }
    };

    container.onclick = function (e) {
      e.stopPropagation();
    };

    window.onclick = function () {
      container.classList.remove("filters--active");
    };

    console.log(input);

    for (var i = 0; i < input.length; i++) {
      const currentInput = input[i];

      currentInput.onclick = function () {
        let isChecked = false;
        for (var j = 0; j < input.length; j++) {
          if (input[j].checked) {
            isChecked = true;
            break;
          }
        }

        if (isChecked) {
          button.classList.add("button--highlight");
        } else {
          button.classList.remove("button--highlight");
        }
      };
    }
  }
}
