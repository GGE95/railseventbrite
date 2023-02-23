class ApplicationController < ActionController::Base
  include ActionController::Flash

  add_flash_types :alerte

end
