import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

// Ensure it's applied to the correct input field
document.addEventListener('turbolinks:load', function() {
  const dateInput = document.querySelector('input[name="appointment[appointment_date]"]');
  const unavailableDates = dateInput ? JSON.parse(dateInput.dataset.unavailableDates || "[]") : [];

  if (dateInput) {
    flatpickr(dateInput, {
      enableTime: false,  // Disable time if not needed in the date picker
      dateFormat: "Y-m-d",
      minDate: "today",   // Disable past dates
      disable: unavailableDates  // Disable unavailable dates
    });
  }
});
