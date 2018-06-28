from conans import ConanFile, CMake, tools
import os

class UtilitiesFortranConan(ConanFile):
	name = "utilitiesfortran"
	version = "0.0.2"
	license = "UNLICENSE"
	description = "command line options of Fortran programs using Unix-like syntax"
	settings = "os", "compiler", "build_type", "arch"
	generators = "cmake"

	scm = {
		 "type": "git",
		 "url": "auto",
		 "revision": "auto"
	}


	def build(self):
		cmake = CMake(self)
		cmake.configure()
		cmake.build()
		cmake.install()
		cmake.test()
		# Explicit way:
		# self.run('cmake %s/hello %s'
		#          % (self.source_folder, cmake.command_line))
		# self.run("cmake --build . %s" % cmake.build_config)

	def package_info(self):
		self.env_info.utilitiesfortran_DIR = os.path.join(self.package_folder, 'setup')