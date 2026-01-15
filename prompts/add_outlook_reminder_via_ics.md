# Add Outlook Reminder (via .ics)
Outcome: create an Outlook reminder by generating an .ics file and opening it in Outlook.

Inputs to confirm:
- Title
- Date
- Start time
- Duration (minutes)
- Reminder (minutes before)
- Timezone (or system default)

Steps:
- Create .ics under `sessions/<session_id>/exports/` with the event details and VALARM.
- Open the .ics explicitly with Outlook:
  `open -a "Microsoft Outlook" /path/to/file.ics`
- If Outlook asks for a calendar, choose the correct one.
- Record the reminder in `tasks/tasks.md` and `tasks/inbox.md`.
