function kill_appium {
for i in `ps -ef | egrep  'node' | grep -v $$ | awk '{print $2}'`
do
     echo "killing process $i"
     kill -9 $i
done
echo "waiting to kill appium ."
sleep 1
}

function start_appium {
   if test "$appium_source" != ""
   then
	    cd $appium_source_dir
	    node . &
  else
    echo "starting appium"
	    appium > appium_logs.txt &
   fi
}

kill_appium
start_appium
