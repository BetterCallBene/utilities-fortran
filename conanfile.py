from conans import ConanFile, CMake, tools
import os

class KrackenConan(ConanFile):
	name = "kracken"
	version = "1.0.5"
	license = "UNLICENSE"
	description = "command line options of Fortran programs using Unix-like syntax"
	settings = "os", "compiler", "build_type", "arch"
	generators = "cmake"

	exports_sources = ["*"]


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
		self.env_info.kracken_DIR = os.path.join(self.package_folder, 'setup')