# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CalculatorPostRussiaExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/calculator_post_russia"

  # Please use calculator_post_russia/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
    [
      CalculatorPost
    ].each(&:register)
  end
end
