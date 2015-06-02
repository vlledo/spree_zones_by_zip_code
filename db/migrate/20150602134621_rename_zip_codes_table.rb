class RenameZipCodesTable < ActiveRecord::Migration
  def change
    rename_table :zip_codes_tables, :spree_zip_codes
  end
end
