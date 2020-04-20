#-------------------------------------------------------------------------------------------------------------
#  Module : Test_connect_debug_sketchup                                                                      -
#  File name : hello.rb - Last modified : 20/04/2020 15:09                                                   -
#                                                                                                            -
#  PB-BZH Concept (c) 2020 - The software written by Patrick Bourges                                         -
#  All rights reserved.                                                                                      -
#  Published 20/4/2020                                                                                       -
#-------------------------------------------------------------------------------------------------------------

if defined?(Sketchup)
	require 'sketchup.rb'
	require 'Extensiontensions.rb'
elsif defined?(Layout)
	require 'layout.rb'
end

module PB_BZH_Concept

	# Plugin information
	PLUGIN_ID      = 'hello'.freeze
	PLUGIN_NAME    = 'Hello World'.freeze
	PLUGIN_VERSION = '2020.1.0'.freeze

	# Resource paths
	FILE_NAME_SPACE = File.basename(__FILE__, '.*')
	PATH_ROOT       = File.dirname(__FILE__).freeze
	PATH            = File.join(PATH_ROOT, FILENAMESPACE).freeze

	module Extension

		# Extension
		loader = File.join(PATH, 'hello-test.rb')
		if defined?(Sketchup)
			unless file_loaded?(__FILE__)
				Extension             = SketchupExtension.new(PLUGIN_NAME, loader)
				Extension.description =
					'Connection test for debug SketchUp plugin outside of SketchUp\'s repertory'\
					'from Rubymine working directory'.freeze
				Extension.version     = PLUGIN_VERSION
				Extension.copyright   = 'PB-BZH Concept © 2020'.freeze
				Extension.creator     = 'PB-BZH Concept'.freeze
				Sketchup.register_extension(Extension, true)
				file_loaded(__FILE__)
			end
		else
			# LayOut doesn't have an SketchupExtensions class so the extension is loaded
			# directly. This should be updated if LayOut add a similar mechanism.
			require loader
		end
	end #module extension

end # module TestUp
