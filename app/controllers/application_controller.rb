class ApplicationController < ActionController::Base
include SessionsHelper
include GossipsHelper
include LikesHelper
include UsersHelper
add_flash_types :success
end