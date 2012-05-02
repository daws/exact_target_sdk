module ExactTargetSDK
class ScheduleDefinition < APIObject

  # Specifies type of recurrence, such as daily or hourly.
  property "RecurrenceType"

  # Defines how a recurrence type ends.
  property "RecurrenceRangeType"

  # Specifies start time of schedule definition
  property "StartDateTime"

  # Specifies number of times to run a schedule definition.
  property "Occurrences"

  # Interval of recurrence type.
  property "Recurrence"

end
end
