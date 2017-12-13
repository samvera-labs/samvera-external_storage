module ExternalStorage
  class Service
    def self.client_class
      StorageProxyAPI::Client
    end

    def self.current
      return @client if @client

      config = ExternalStorage::Config.config
      self.current=(config['host']) if config['enabled']
    end

    def self.current=(host)
      @client = client_class.new(base_url: host)
    end
  end
end
