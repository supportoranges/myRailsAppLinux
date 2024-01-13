
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :determine_who
  add_flash_types :success, :warning, :danger, :info

  $horrible_global
  
  private

# basically  set a switch to know which way they navigate because when we get to the single
# individual forms and user presses back we may not want to show the contact list
# #we would need to show the company list if that is where they started.suppo
  def determine_who

    if user_signed_in? && false == request.referer.nil?

      puts("appcontroller sees referrer " +URI(request.referer).path)
      #series of tests of the referer now

      if URI(request.referer).path == "/users/sign_in"
        $horrible_global = true; #companies
      end
      if URI(request.referer).path == "/"
        $horrible_global = false; #contacts
      end
      if URI(request.referer).path == "/tasks/search"
        $horrible_global = true; #companies
      end
      var = $horrible_global ? "true" : "false"
      puts("after evaluating referrer ended up with horrible global is " + var)

    end
  end
end
