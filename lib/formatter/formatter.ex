defmodule Formatter do
  defdelegate day_str(date), to: Formatter.Date, as: :week_day_string
  defdelegate month_str(date), to: Formatter.Date, as: :month_string
  defdelegate seconds_to_podcast_time(seconds), to: Formatter.Time
end
