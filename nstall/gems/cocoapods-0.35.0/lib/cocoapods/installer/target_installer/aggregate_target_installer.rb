module Pod
  class Installer
    # Creates the targets which aggregate the Pods libraries in the Pods
    # project and the relative support files.
    #
    class AggregateTargetInstaller < TargetInstaller
      # Creates the target in the Pods project and the relative support files.
      #
      # @return [void]
      #
      def install!
        UI.message "- Installing target `#{target.name}` #{target.platform}" do
          add_target
          create_support_files_dir
          create_suport_files_group
          create_xcconfig_file
          create_target_environment_header
          create_bridge_support_file
          create_copy_resources_script
          create_acknowledgements
          create_dummy_source
        end
      end

      #-----------------------------------------------------------------------#

      private

      # Creates the group that holds the references to the support files
      # generated by this installer.
      #
      # @return [void]
      #
      def create_suport_files_group
        parent = project.support_files_group
        name = target.name
        dir = target.support_files_dir
        @support_files_group = parent.new_group(name, dir)
      end

      # Generates the contents of the xcconfig file and saves it to disk.
      #
      # @return [void]
      #
      def create_xcconfig_file
        native_target.build_configurations.each do |configuration|
          path = target.xcconfig_path(configuration.name)
          gen = Generator::XCConfig::AggregateXCConfig.new(target, configuration.name)
          gen.save_as(path)
          target.xcconfigs[configuration.name] = gen.xcconfig
          xcconfig_file_ref = add_file_to_support_group(path)
          configuration.base_configuration_reference = xcconfig_file_ref
        end
      end

      # Generates a header which allows to inspect at compile time the installed
      # pods and the installed specifications of a pod.
      #
      def create_target_environment_header
        path = target.target_environment_header_path
        generator = Generator::TargetEnvironmentHeader.new(target.specs_by_build_configuration)
        generator.save_as(path)
        add_file_to_support_group(path)
      end

      # Generates the bridge support metadata if requested by the {Podfile}.
      #
      # @note   The bridge support metadata is added to the resources of the
      #         target because it is needed for environments interpreted at
      #         runtime.
      #
      # @return [void]
      #
      def create_bridge_support_file
        if target_definition.podfile.generate_bridge_support?
          path = target.bridge_support_path
          headers = native_target.headers_build_phase.files.map { |bf| sandbox.root + bf.file_ref.path }
          generator = Generator::BridgeSupport.new(headers)
          generator.save_as(path)
          add_file_to_support_group(path)
          @bridge_support_file = path.relative_path_from(sandbox.root)
        end
      end

      # Creates a script that copies the resources to the bundle of the client
      # target.
      #
      # @note   The bridge support file needs to be created before the prefix
      #         header, otherwise it will not be added to the resources script.
      #
      # @return [void]
      #
      def create_copy_resources_script
        path = target.copy_resources_script_path
        file_accessors = target.pod_targets.map(&:file_accessors).flatten
        resource_paths = file_accessors.map { |accessor| accessor.resources.flatten.map { |res| res.relative_path_from(project.path.dirname) } }.flatten
        resource_bundles = file_accessors.map { |accessor| accessor.resource_bundles.keys.map { |name| "${BUILT_PRODUCTS_DIR}/#{name}.bundle" } }.flatten
        resources = []
        resources.concat(resource_paths)
        resources.concat(resource_bundles)
        resources << bridge_support_file if bridge_support_file
        generator = Generator::CopyResourcesScript.new(resources, target.platform)
        generator.save_as(path)
        add_file_to_support_group(path)
      end

      # Generates the acknowledgement files (markdown and plist) for the target.
      #
      # @return [void]
      #
      def create_acknowledgements
        basepath = target.acknowledgements_basepath
        Generator::Acknowledgements.generators.each do |generator_class|
          path = generator_class.path_from_basepath(basepath)
          file_accessors = target.pod_targets.map(&:file_accessors).flatten
          generator = generator_class.new(file_accessors)
          generator.save_as(path)
          add_file_to_support_group(path)
        end
      end

      # @return [Pathname] the path of the bridge support file relative to the
      #         sandbox.
      #
      # @return [Nil] if no bridge support file was generated.
      #
      attr_reader :bridge_support_file

      #-----------------------------------------------------------------------#
    end
  end
end
