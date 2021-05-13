class PagesController < ApplicationController

  skip_authorization_check

  # TO DO: Delete if not necessary.

  def home
    @current_nav_identifier = :home
  end

end
