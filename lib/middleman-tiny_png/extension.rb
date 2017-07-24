# Require core library
require 'middleman-core'
require 'tinify'
require 'find'

# Extension namespace
module Middleman
  module TinyPNG
    class Extension < ::Middleman::Extension
      option :api_key, "", 'API Key For TinyPNG'


      def initialize(app, options_hash={}, &block)
        super
      end

      def after_build(builder)
        Tinify.key = options.api_key

        image_dir = File.join(app.config[:build_dir], app.config[:images_dir])
        image_file_paths = []

        Find.find(image_dir) do |path|
          image_file_paths << path if (path =~ /.*\.png$/) || (path =~ /.*\.jpg$/)
        end

        image_file_paths.each do |file|
          source = Tinify.from_file(file)
          source.to_file(file)
        end
      end

    end
  end
end

