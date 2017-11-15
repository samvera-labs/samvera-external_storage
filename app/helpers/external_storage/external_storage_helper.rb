module ExternalStorage
  module ExternalStorageHelper
    def media_display_partial(file_set)
      if file_set.external_file?
        'hyrax/file_sets/media_display/external_file'
      else
        super
      end
    end
  end
end
