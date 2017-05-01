class AddColumnOrganizationNameToEstimations < ActiveRecord::Migration
  def change
    add_column :estimations, :organization_name, :string
  end
end
