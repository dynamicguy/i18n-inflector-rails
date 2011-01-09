# encoding: utf-8

require 'i18n-inflector'
require 'i18n-inflector-rails/version'
require 'i18n-inflector-rails/errors'
require 'i18n-inflector-rails/inflector'

if defined? Rails::Engine

  require 'i18n-inflector-rails/railtie'

else

  require 'action_controller' if not defined? ActionController::Base
  ActionController::Base.send(:extend,  I18n::Inflector::Rails::ClassMethods)
  ActionController::Base.send(:include, I18n::Inflector::Rails::InstanceMethods)
  ActionController::Base.send(:include, I18n::Inflector::Rails::InflectedTranslate)

end