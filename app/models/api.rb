class Api
  include Mongoid::Document
  field :name # API名
  field :url # APIのURL
  embedded_in :user, :inverse_of => :apis
end
