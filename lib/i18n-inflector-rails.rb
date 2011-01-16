# encoding: utf-8

require 'i18n-inflector'
require 'i18n-inflector-rails/version'
require 'i18n-inflector-rails/errors'
require 'i18n-inflector-rails/inflector'
require 'i18n-inflector-rails/additional_options'

I18n::Inflector::InflectionOptions.send(:include, I18n::Inflector::Rails::AdditionalOptions)

if defined? Rails::Engine

  require 'i18n-inflector-rails/railtie'

else

  require 'action_controller' if not defined? ActionController::Base
  require 'action_view'       if not defined? ActionView::Base

  ActionController::Base.send(:extend,  I18n::Inflector::Rails::ClassMethods)
  ActionController::Base.send(:include, I18n::Inflector::Rails::InstanceMethods)
  ActionController::Base.send(:include, I18n::Inflector::Rails::InflectedTranslate)

  if ActionController::Base.respond_to?(:helper_method)
    ActionController::Base.helper_method :translate
  end

end
