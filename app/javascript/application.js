import flatpickr from "flatpickr";
// import "flatpickr/dist/flatpickr.min.css"; // Import Flatpickr CSS

import jquery from "jquery";
window.jQuery = jquery;
window.$ = jquery;

document.addEventListener("DOMContentLoaded", function() {
  const availableDates = JSON.parse(document.querySelector('#available-dates-calendar').dataset.availableDates);
  const calendarInput = document.querySelector("#available-dates-calendar");

  if (calendarInput) {
    flatpickr(calendarInput, {
      inline: true,
      dateFormat: "Y-m-d",
      enable: availableDates,  
      onChange: function(selectedDates, dateStr) {
        document.querySelector("#selected_date").value = dateStr;  // Set hidden field with the selected date
      }
    });
  }
});
