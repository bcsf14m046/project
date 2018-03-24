class AddDummyToStdlist < ActiveRecord::Migration[5.1]
  def change
    add_column :stdlists, :dummy, :string, :default => 'haider'
  end
end
