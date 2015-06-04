Deface::Override.new(
  virtual_path: 'spree/admin/shared/_configuration_menu',
  name: 'add_zip_codes_tab',
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
  text: '<%= configurations_sidebar_menu_item Spree.t(:zip_codes), admin_zip_codes_path %>',
  disabled: false)