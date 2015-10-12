class Event
  include Mongoid::Document
  field :name # イベント名
  field :date, :type => Date
  field :memo # メモ
  embedded_in :user, :inverse_of => :events
end
