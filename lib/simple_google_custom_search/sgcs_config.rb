class SimpleGoogleCustomSearch::SgcsConfig
  attr_reader :domain

  def initialize
    raise 'Please set constant variable SGCS_CONFIG' unless defined?(SGCS_CONFIG)
    config = SGCS_CONFIG.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    raise 'Please set constant variable SGCS_CONFIG[:domain]' if config[:domain].nil?
    
    @domain = config[:domain]
  end

  def get_config
    @config ||= {
      domain: @domain
    }
  end
end