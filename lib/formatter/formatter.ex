defmodule Formatter do
  defdelegate day_str(date), to: Formatter.Date, as: :week_day_string
  defdelegate month_str(date), to: Formatter.Date, as: :month_string
end
