# Add Calendar Reminder (macOS)
Outcome: create a local Apple Calendar event for a reminder.

Inputs to confirm:
- Calendar name (must match an existing calendar)
- Title
- Date
- Start time
- Duration (minutes)
- Timezone (defaults to system)

Steps:
- (Optional) List calendars via AppleScript if name is unknown.
- Use AppleScript to create the event in the chosen calendar.
- Record the reminder in `tasks/tasks.md` and `tasks/inbox.md`.
