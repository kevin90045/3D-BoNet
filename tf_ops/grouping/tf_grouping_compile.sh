#/bin/bash
/usr/local/cuda/bin/nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# py3.5.2 + TF1.13.1
g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /home/chen/.local/lib/python3.5/site-packages/tensorflow/include -I /usr/local/cuda/include -I /home/chen/.local/lib/python3.5/site-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda/lib64/ -L/home/chen/.local/lib/python3.5/site-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0
