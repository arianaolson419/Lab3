# Runs a verilog testbench using a given memory file
# Inputs:
#   name of verilog testbench to run
#   name of memory file to use

# NOTE: must be run in top-level git repo

ver () {
  cd $(dirname $1)
  inp=${1%.v}
  fname="$(basename $inp)"
  iverilog -o "$fname.out" $(basename $1) && "./$fname.out"
  # Go back (also suppress the output text that would normally be displayed)
  cd - > /dev/null
}


cat $2 > mem.dat
ver $1
rm mem.dat
