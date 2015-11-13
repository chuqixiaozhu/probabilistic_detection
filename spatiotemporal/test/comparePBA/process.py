#! /usr/bin/python3
import datetime
import subprocess
import sys

# Do experiments many time
time = datetime.datetime.today()
time_fmt = '%Y%m%d-%H%M%S'
path = time.strftime(time_fmt)
# reuilt files are in 'path/'
result_file = path + '-result'
subprocess.call(['mkdir', path])
argvs = sys.argv
if len(argvs) <= 1:
    count = 2
else:
    count = int(argvs[1])
for i in range(count):
    #for fnode_num in range(10, 101, 10):
    for fnode_num in range(1, 11):
        subprocess.call(['ns', 'detect.tcl', str(fnode_num), result_file])

# Process the results
rf = open(result_file, 'r')
pd_file = open('f_num-pro_vs_pd', 'w')
pf_file = open('f_num-pro_vs_pf', 'w')
pd = dict()
pf = dict()
for line in rf:
    results = line.split()
    var = int(results[0])
    detec = float(results[1])
    fake = float(results[2])
    if var not in pd.keys():
        pd[var] = 0.0
        pf[var] = 0.0
    pd[var] += detec
    pf[var] += fake
vars = sorted(pd.keys())
for var in vars:
    #print('{0} {1} {2}'.format(var, pd[var]/count, pf[var]/count))
    pd_file.write('{0} {1}\n'.format(var, pd[var] / count))
    pf_file.write('{0} {1}\n'.format(var, pf[var] / count))
pd_file.close()
pf_file.close()
rf.close()
subprocess.call(['mv', result_file, path])
subprocess.call(['mv', pd_file.name, path])
subprocess.call(['mv', pf_file.name, path])
