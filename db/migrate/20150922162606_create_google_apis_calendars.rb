class CreateGoogleApisCalendars < ActiveRecord::Migration
  def change
    create_table :google_apis_calendars do |t|

      t.timestamps null: false
    end
  end
end
