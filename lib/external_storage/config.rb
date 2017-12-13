module ExternalStorage
  class Config
    attr_reader :external_uri_host, :enabled, :host

    def initialize
      config = YAML.load(ERB.new(IO.read(File.join(Rails.root, 'config', 'external_storage.yml'))).result)[Rails.env]
      @external_uri_host = config['external_uri_host']
      @enabled = config['enabled']
      @host = config['host']
    end

    def self.config
      @current ||= self.new
    end

  end
end
