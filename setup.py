#!/usr/bin/env python

import setuptools

setuptools.setup(
    name='spade',
    version='0.1',
    description='Sparse autotuner for Deep learning workloads.',
    author='Kulin Seth',
    maintainer='Kulin Seth',
    maintainer_email='kulinseth@gmail.com',
    install_requires=[
        'numpy',
        'scipy',
        # We don't depend on `tensorflow` or `tensorflow-gpu` here, since one or the other is sufficient.
    ],
    packages=['spade'],
    package_data={ 'spade': ['spade_ops.so'] },
    url='https://github.com/kulinseth/spmv',
    license='MIT')

