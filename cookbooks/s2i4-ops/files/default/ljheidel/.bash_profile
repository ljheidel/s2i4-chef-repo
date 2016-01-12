PATH=$PATH:~/bin
export PATH

for i in ~/.bash_includes/*; do
        source $i
done
