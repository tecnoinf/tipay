class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|

      t.string :title
      t.text :body
      t.datetime :fecha, :null => false, :default => (I18n.l (DateTime.now))
      
      t.timestamps
    end
  end
end
