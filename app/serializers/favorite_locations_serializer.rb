class FavoriteLocationsSerializer
  include FastJsonapi::ObjectSerializer
  set_id :json_id
  attributes :favorites_forecats
end
