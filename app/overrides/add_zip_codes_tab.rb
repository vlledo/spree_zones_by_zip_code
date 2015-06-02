Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: 'add_zip_codes_tab',
  insert_top: '[data-hook="admin_configurations_sidebar_menu"]',
  text: '<li><%= link_to t("zip_codes"), admin_zip_codes_path %></li>'
)