module ExternalStorage
  class Engine < ::Rails::Engine
    # isolate_namespace ExternalStorage

    config.autoload_paths += %W(
      #{config.root}/app/helpers
      #{config.root}/app/presenters
      #{config.root}/lib/external_storage
    )
  end
end
