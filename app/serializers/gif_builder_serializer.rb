class GifBuilderSerializer
  include FastJsonapi::ObjectSerializer
  set_id :json_id
  attributes
end
