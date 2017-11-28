module ExternalStorage
  module ExternalFileSetBehavior
    extend ActiveSupport::Concern

    def stage
      presenter.external_file_stage
      redirect_to main_app.url_for(presenter.solr_document), notice: "Stage request for #{presenter.external_file_uri_filename} has been sent"
    end
  end
end
