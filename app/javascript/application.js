// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// require bootstrap-timepicker

import "@hotwired/turbo-rails"
import "controllers"

import jquery from "jquery"



window.jQuery = jquery
window.$ = jquery

import flatpickr from "flatpickr"

$(function() {
    $(".calender").each((i, el) => { 
        flatpickr(el,{
            // inline: true,
            minDate: new Date(),
            maxDate: new Date().fp_incr(7),
            dateFormate: "m/d/y",
            "disable": [
        function(date) {
            // return true to disable
            return (date.getDay() === 0 || date.getDay() === 6);

        }
    ],
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    }
        })
    })
}
)


  $(function() {
    $(".timepicker").each((i,el) =>{
      flatpickr(el,{
      enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
  })})
  });