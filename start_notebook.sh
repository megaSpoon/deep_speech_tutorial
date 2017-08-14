#!/bin/bash

#setup pathes
SPARK_HOME=/home/megaspoon/Documents/spark/spark-2.0.1-bin-hadoop2.6/
BigDL_HOME=/home/megaspoon/Documents/work/dist-spark-2.0.0-scala-2.11.8-linux64-0.2.0-20170630.193916-53-dist
PYTHON_API_ZIP_PATH=${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-python-api.zip
export PYTHONPATH=${PYTHON_API_ZIP_PATH}:$PYTHONPATH
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=./ --ip=* --no-browser"

${SPARK_HOME}/bin/pyspark \
  --master local[4] \
  --driver-memory 4g \
  --properties-file ${BigDL_HOME}/conf/spark-bigdl.conf \
  --py-files ${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar  \
  --jars ${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar  \
  --conf spark.driver.extraClassPath=${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar  \
  --conf spark.executor.extraClassPath=${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar 
