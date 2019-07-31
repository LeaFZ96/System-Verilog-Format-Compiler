import argparse
import os

parser = argparse.ArgumentParser(description="Trancate .sv file")
parser.add_argument('-d', '--dir', default='../output/', help="Directory of output")
parser.add_argument('input', metavar='InputSV', help="Input file")

args = parser.parse_args()

if not os.path.exists(args.dir):
    os.makedirs(args.dir)

with open(args.input) as f:
    line = f.readline()
    start_flag = False
    while (line) :
        if line[0:6] == 'module':
            module_name = line.split()[1]
            module_name = module_name[:-1]

            fout = open(args.dir + module_name + '.sv', 'w')
            start_flag = True

        if start_flag:
            fout.write(line)

        if line[0:9] == 'endmodule':
            start_flag = False
            fout.close()

        line = f.readline()