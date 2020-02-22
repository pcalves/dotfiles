#!/bin/bash

/Applications/qutebrowser.app/Contents/MacOS/qutebrowser --backend webengine \
  --qt-flag enable-gpu-rasterization \
  --qt-flag enable-native-gpu-memory-buffers \
  --qt-flag num-raster-threads=4
