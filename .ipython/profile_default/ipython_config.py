c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2',
                                    'import numpy as np',
                                    'import pickle',
                                    'from pylab import *']
c.StoreMagics.autorestore = True
