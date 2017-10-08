#!/bin/bash

#初始化更新子模块, submodule是git里面的引用一个外部项目概念
git submodule update --init --quiet

#进入本项目
cd minlia-cloud
mc
mi
cd - 
mc
mi
