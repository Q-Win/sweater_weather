class ForecastDataSerializer
  include FastJsonapi::ObjectSerializer
  set_id :json_id
  attributes :currently, :hourly, :daily
end
