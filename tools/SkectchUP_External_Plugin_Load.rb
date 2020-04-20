#-------------------------------------------------------------------------------------------------------------
#  Module : Plugins                                                                                          -
#  File name : SkectchUP_External_Plugin_Load.rb - Last modified : 20/04/2020 02:29                                -
#                                                                                                            -
#  Copyright (c) 2020 - The PB-BZH Concept software written by Patrick Bourges                               -
#  All rights reserved.                                                                                      -
#  Published 20/4/2020                                                                                       -
#-------------------------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------------
# This adds the source directory path to project_name SketchUp directory and load start file of project -
# -------------------------------------------------------------------------------------------------
module PB_BZH_Concept
	module LOAD_EXTERNAL_PLUGIN
		plugins_working_directory = 'G:/Espace_de_Travail/Sketchup'.freeze
		project_name              = 'Test_connect_debug_sketchup'.freeze
		src                       = 'Src'.freeze
		SOURCE                    = File.join(plugins_working_directory, project_name, src).freeze

		SKETCHUP_CONSOLE.show

		$LOAD_PATH << SOURCE
		Dir.glob("#{SOURCE}/*.{rb, rbs, rbe}") do |file|
			file = File.basename(file)
			require file
		end
	end
end
