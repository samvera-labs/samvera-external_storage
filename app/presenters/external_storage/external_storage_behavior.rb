require 'external_storage/config'

module ExternalStorage
  module ExternalStorageBehavior
    extend ActiveSupport::Concern

    def external_file?
      !external_file_uri.blank?
    end

    def external_file_uri_file_path
      external_file_uri.path.split('/')[-1]
    end

    def external_file_status
      @external_file_status ||= external_file_service.status(service: external_file_uri_service, external_uri: external_file_uri_file_path)
    end

    def external_file_stage
      external_file_service.stage(service: external_file_uri_service, external_uri: external_file_uri_file_path)
    end

    def external_file_service_up?
      external_file_status.up?
    end

    def external_file_staged?
      return false unless external_file?
      external_file_status.staged?
    end

    def external_file_staging?
      return false unless external_file?
      external_file_status.staging?
    end

    def external_file_download_link
      return nil unless external_file? && external_file_staged?
      external_file_status.staged_location
    end

    private

    def external_file_uri
      solr_document.mime_type&.match(%r{^message/external-body; access-type=URL; URL="(.*)"$}) do |m|
        URI.parse(m[1])
      end
    end

    def external_file_uri_service
      'sda' # FIXME remove when proxy backend is updated
      # external_file_uri.path.split('/')[1]
    end

    def external_file_service
      @external_file_service ||= ::StorageProxyAPI::Client.new(base_url: external_file_service_config)
    end

    def external_file_service_config
      ExternalStorage::Config.config.host
    end
  end
end
