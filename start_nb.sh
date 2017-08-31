#!/bin/bash
#setup pathes
SPARK_HOME=/home/megaspoon/Documents/spark/spark-2.0.1-bin-hadoop2.6/
BigDL_HOME=/home/megaspoon/Documents/work/dist-spark-2.0.0-scala-2.11.8-linux64-0.2.0-20170630.193916-53-dist
PYTHON_API_ZIP_PATH=${BigDL_HOME}/lib/bigdl-0.2.0-SNAPSHOT-python-api.zip
export PYTHONPATH=${PYTHON_API_ZIP_PATH}:$PYTHONPATH
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=./ --ip=* --no-browser"
export DEEPSPEECH_API=/home/megaspoon/Documents/work/analytics-zoo/pipeline/deepspeech2/target/deepspeech2-0.1-SNAPSHOT-jar-with-dependencies.jar

${SPARK_HOME}/bin/pyspark \
  --master local[4] \
  --driver-memory 4g \
  --properties-file ${BigDL_HOME}/conf/spark-bigdl.conf \
  --py-files ${DEEPSPEECH_API} \
  --jars ${DEEPSPEECH_API}\
  --conf spark.driver.extraClassPath=${DEEPSPEECH_API}  \
  --conf spark.executor.extraClassPath=${DEEPSPEECH_API}

