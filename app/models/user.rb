class User
  include Mongoid::Document
  
  field :user_id
  embeds_many :events
  embeds_many :apis
end
