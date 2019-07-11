import flatpickr from 'flatpickr'
import 'flatpickr/dist/themes/airbnb.css'

flatpickr(".datepicker", {
  altinput: true,
  minDate: "today",
  dateFormat: "Y-m-d"
});
