class ApplicationController < ActionController::Base
include SessionsHelper
include GossipsHelper
include LikesHelper
add_flash_types :success
end

