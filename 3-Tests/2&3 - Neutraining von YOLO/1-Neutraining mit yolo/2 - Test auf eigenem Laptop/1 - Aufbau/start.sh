git clone https://github.com/AlexeyAB/darknet
cd darknet
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/GPU=0/GPU=1/' Makefile
sed -i 's/CUDNN=0/CUDNN=1/' Makefile

/usr/local/cuda/bin/nvcc --version

make

curl https://dax-cdn.cdn.appdomain.cloud/dax-publaynet/1.0.0/labels.tar.gz --output "labels.tar.gz"
tar labels.tar.gz
rm labels.tar.gz

curl https://dax-cdn.cdn.appdomain.cloud/dax-publaynet/1.0.0/val.tar.gz --output "val.tar.gz"
tar ("val.tar.gz")
rm val.tar.gz

cp cfg/yolov3.cfg cfg/yolov3_Data.cfg

mkdir ../backup

wget http://pjreddie.com/media/files/darknet53.conv.74


# Transformieren der TrainingsDaten
mkdir data/train
python Transform.py

# Training
./darknet detector train data/obj.data cfg/yolov3_custom.cfg darknet53.conv.74 -dont_show


# Test
curl https://dax-cdn.cdn.appdomain.cloud/dax-publaynet/1.0.0/examples.tar.gz --output "examples.tar.gz"
tar ("examples.tar.gz")
rm examples.tar.gz

cd cfg
sed -i 's/batch=64/batch=1/' yolov3_custom.cfg
sed -i 's/subdivisions=16/subdivisions=1/' yolov3_custom.cfg
cd ..

./darknet detector test data/obj.data cfg/yolov3_custom.cfg ../backup/yolov3_custom_last.weights examples/PMC3576793_00004.jpg -thresh 0.3

