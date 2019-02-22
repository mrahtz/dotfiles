import argparse

import easy_tf_log
import numpy as np
from numpy import genfromtxt

parser = argparse.ArgumentParser()
parser.add_argument('progress_txt')
parser.add_argument('output_dir')
args = parser.parse_args()

logger = easy_tf_log.Logger()
logger.set_log_dir(args.output_dir)

data = genfromtxt(args.progress_txt, delimiter='\t', names=True)
names = data.dtype.names
data = np.array([list(x) for x in data])
for n, name in enumerate(names):
    for x in data[:, n]:
        logger.logkv(name, x)
