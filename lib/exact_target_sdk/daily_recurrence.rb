module ExactTargetSDK
class DailyRecurrence < APIObject

  # Specifies the type of daily recurrence (either Interval or EveryWeekDay)
  property "DailyRecurrencePatternType"

  # Specifies the number of days on which to execute a daily recurrence.
  property "DayInterval"
end
end
