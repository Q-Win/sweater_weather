class GifBuilderSerializer
  include FastJsonapi::ObjectSerializer
  set_id :json_id
  attributes :forecast_gif_json
end
