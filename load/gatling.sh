#!/bin/bash
GATLING_VERSION=2.1.7


#curl -sf -o gatling-${GATLING_VERSION}.zip \
#  -L https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip
#ls
#unzip gatling-${GATLING_VERSION}.zip
export GATLING_HOME=~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}

rm -rf ~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
rm -rf ~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/conf
cp -rf user-files/ ~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
cp -rf config/ ~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/config

sh ~/tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/bin/gatling.sh -sf load/user-files/simulations/ -s SampleLoadTest -rf load/results/
