# Project Notes

## TODOs

- [ ] Put project into GitHub?
- [X] Study and understand model parameters => set accordingly 
- [X] New version of the prompts returning structured data
- [X] Format prompts with XML
- [ ] Prompts for appointment negotiation

## AI competent in appointment negotiations?

### Language and date/time competence
- Understand a wide variety of date and time formats ("half past eight", "eight thirty") 
- Handle relative date/time expressions ("tomorrow", "next Tuesday", "in two weeks", "an hour later")
- Handle "fuzzy" time references ("in the morning", "at lunchtime")
- Correctly handle German short forms of the date (like "dritter vierter" for 3rd April)
- OPTIONAL: Be aware of bank holidays (regional differences?)
- OPTIONAL: Understand time zones and handle conversions


### Negotiations based on a list of available time slots
- Suggest nearby slots (“You said 2 PM tomorrow, would 1 PM also work for you?”)
- Communicate constraints (“On Wednesday, we only have free slots in the afternoon.”)
- Handle preferences and constraints:
  - Constraints like "I can only come early in the morning before work." or "any day except Thursday"
  - Preferences like "preferably in the morning" or "between one and five in the afternoon"
- Recognize urgency ("as soon as possible")

### Guardrails
- Recognize questions outside the topic of appointment negotiations
- Make sure it only suggests dates from the list of available slots





