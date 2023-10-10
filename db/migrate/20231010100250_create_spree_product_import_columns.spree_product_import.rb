# This migration comes from spree_product_import (originally 20230529071080)
class CreateSpreeProductImportColumns < SpreeExtension::Migration[7.0]
    def change
        create_table :spree_product_import_columns do |t|
            t.integer :product_import_id
            t.string :column_file
            t.string :column_system
            t.timestamps 
        end
    end
end