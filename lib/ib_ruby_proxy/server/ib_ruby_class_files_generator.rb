module IbRubyProxy
  module Server
    # Source code generator that interacts with {IbRubyClassSourceGenerator} and writes the
    # actual files with the source for both Ruby classes representing IB classes and Ruby extensions
    # for those.
    class IbRubyClassFilesGenerator
      SKIPPED_CLASS_NAMES = ['Order'].freeze

      attr_reader :client_code_dir, :server_code_dir

      # @param [String] client_code_dir
      # @param [String] server_code_dir
      def initialize(client_code_dir:, server_code_dir:)
        @client_code_dir = client_code_dir
        @server_code_dir = server_code_dir

        import_java_classes
      end

      # Generate client files and server class extensions
      #
      # It will format the generated code with {https://github.com/ruby-formatter/rufo Rufo}.
      #
      # @see IbRubyClassSourceGenerator#ruby_class_source
      # @see IbRubyClassSourceGenerator#ib_class_extension_source
      def generate_all
        do_generate_all
        format_code
      end

      private

      def import_java_classes
        java_classes.each do |class_name|
          java_import "com.ib.client.#{class_name}"
        end
      end

      def java_classes
        @java_classes ||= IbRubyProxy.config['classes']
      end

      def do_generate_all
        java_classes.each do |class_name|
          next if SKIPPED_CLASS_NAMES.include?(class_name)

          generate_files class_name
        end
      end

      def generate_files(class_name)
        ib_class = Java::ComIbClient.const_get(class_name)
        generator = IbRubyClassSourceGenerator.new(ib_class,
                                                   namespace: 'IbRubyProxy::Client::Ib')

        file_name = "#{IbRubyProxy::Util::StringUtils.to_underscore(class_name)}.rb"
        generate_client_file(generator, file_name)
        generate_server_file(generator, file_name)
      end

      def generate_client_file(generator, file_name)
        target_file_path = File.join(client_code_dir, file_name)
        write_file(generator.ruby_class_source, target_file_path)
      end

      def generate_server_file(generator, file_name)
        target_file_path = File.join(server_code_dir, file_name)
        write_file(generator.ib_class_extension_source, target_file_path)
      end

      def write_file(content, target_file_path)
        puts "Generating file: #{target_file_path}..."
        File.open(target_file_path, 'w') { |file| file.write(content) }
      end

      def format_code
        [server_code_dir, client_code_dir].each do |dir|
          puts "Formatting #{dir}..."
          system "rufo #{dir}"
        end
      end
    end
  end
end
