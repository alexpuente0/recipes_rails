class ChangeDataTypeForMeasurementUnit < ActiveRecord::Migration[7.0]
 change_table :foods do |table|
    table.change :measurement_unit, :string
  end
end
