class CreateZipCodesTable < ActiveRecord::Migration
  def change
    create_table :zip_codes_tables do |t|
      t.string :value
    end
  end
end
