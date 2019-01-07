class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :set_id
  attributes :time, :summary, :url
end
