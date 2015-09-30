class FullCalendarEvent 
    include ActiveModel::Model
   
   attr_accessor :title, 
    :start, 
    :end,
    :id,
    :className,
    :color,
    :backgroundColor,
    :borderColor,
    :textColor
   
end