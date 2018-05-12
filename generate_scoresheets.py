#!/usr/bin/env python
import os

GRADEBOOK_DIR='/tmp/gradebook'
FILE_DIR='/tmp/scoresheets'

class Generator:
	def __init__(self):
		pass
  	
	def main(self):
	
		self.get_names()
  	
		# Open the file for writing
		self.init_file()
		
		for cur_name in self.ubit_names:
			self.write_page(cur_name)
		self.close_file()
  	
  	
	def init_file(self):
		file_path = FILE_DIR + '/scoresheet.tex'
		self.f = open(file_path,'w')
  	
		# Write the opening latex stuff
		self.f.write('\documentclass[36pt]{article}\n')
		self.f.write('\usepackage{geometry}\n')
		self.f.write('\usepackage{graphicx}\n')
		self.f.write('\graphicspath{ {/tmp/scoresheets/} }\n')
		self.f.write(r'\begin{document}')
		self.f.write('\n\n')
		
	def close_file(self):
		self.f.write('\end{document}\n')
		self.f.close()
		
		
	def write_page(self,ubit_name):
		self.f.write('\Huge\n')
		self.f.write('\centerline{{ {0} }}\n'.format(ubit_name))
		self.f.write(r'\includegraphics[width=\textwidth]{ma5_grading.png}')
		self.f.write('\n\clearpage\n\n\n')
		
		
	def get_names(self):
		self.ubit_names = sorted(os.walk(GRADEBOOK_DIR).next()[1])
		print len(self.ubit_names)
  	
if __name__ == "__main__":
	gen = Generator()
	gen.main()
