######################################
# INSTALL OPENCV ON UBUNTU OR DEBIAN #
######################################

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# 2. Check gcc version
# check if gcc is 4.9
gcc -v

# if not, then remove gcc version
sudo apt-get remove gcc g++

# install gcc 4.9/g++ 4.9
sudo apt-get install gcc-4.9 g++-4.9

# might have to be gcc 4.8
sudo apt-get install gcc-4.8 g++-4.8

# link to gcc/g++
sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++
sudo ln -s /usr/bin/gcc-4.9 /usr/bin/gcc

# check version
g++ –v
gcc –v

# 3. INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen


# 4. INSTALL THE LIBRARY (YOU CAN CHANGE '3.3.1' FOR THE LAST STABLE VERSION)

sudo apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/3.3.1.zip
unzip 3.3.1.zip
rm 3.3.1.zip
mv opencv-3.3.1 OpenCV
cd OpenCV
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D BUILD_EXAMPLES=ON -DCMAKE_C_COMPILER=gcc-4.9 -DCMAKE_CXX_COMPILER=g++-4.9  -D WITH_OPENGL=ON ..
make -j4
sudo make install
sudo ldconfig
