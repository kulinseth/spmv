import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys

L1 = 32 * 1024
L2 = 256 * 1024
L3 = 12*1024*1024
MM = 16*1024*1024*1024
out_dir = '../../results/scatter_plots/'

df = pd.read_csv(sys.argv[1], index_col = 'name')
df_xlarge = pd.DataFrame()
df_large = pd.DataFrame()
df_medium = pd.DataFrame()
df_small = pd.DataFrame()

for index, row in df.iterrows():
  if (int(row['N']) * 8) < MM and (int(row['N']) * 8) >= L3 :
    df_xlarge = df_xlarge.append(row)
  if (int(row['N']) * 8) < L3 and (int(row['N']) * 8) >= L2 :
    df_large = df_large.append(row)
  if (int(row['N']) * 8) < L2 and (int(row['N']) * 8) >= L1 :
    df_medium = df_medium.append(row)
  if (int(row['N']) * 8) < L1 :
    df_small = df_small.append(row)



plt.xlabel('Density')
plt.ylabel('Performance')
plt.xscale('log')
plt.scatter(df_small['density'], df_small['mflops'])
plt.title('small')
plt.savefig(out_dir+'small_density_scatter_plot.png')

plt.clf()

plt.xlabel('Density')
plt.ylabel('Performance')
plt.xscale('log')
plt.scatter(df_xlarge['density'], df_xlarge['mflops'])
plt.title('xlarge')
plt.savefig(out_dir+'xlarge_density_scatter_plot.png')

plt.clf()

plt.xlabel('Density')
plt.ylabel('Performance')
plt.xscale('log')
plt.scatter(df_large['density'], df_large['mflops'])
plt.title('large')
plt.savefig(out_dir+'large_density_scatter_plot.png')

plt.clf()

plt.xlabel('Density')
plt.ylabel('Performance')
plt.xscale('log')
plt.scatter(df_medium['density'], df_medium['mflops'])
plt.title('medium')
plt.savefig(out_dir+'medium_density_scatter_plot.png')

