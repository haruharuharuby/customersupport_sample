class AddColumnEstimations < ActiveRecord::Migration
  def change
    add_column :estimations, :fax, :string
  end
end
