class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_i18n_locale_from_params

  protected
  def check_login
    unless session[:user]
      redirect_to login_path
    end
  end

  def set_i18n_locale_from_params
    locale = params[:locale]
    
    if locale
      if I18n.available_locales.include?(locale.to_sym)
        I18n.locale = locale
      else
        flash.now[:notice] = "#{locale} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { :locale => I18n.locale }
  end
end
