# This migration comes from spree_product_import (originally 20240327164127)
class RenameTableProductImportsToImports < ActiveRecord::Migration[7.1]
  def change
    rename_table :spree_product_imports, :spree_imports
  end
end
