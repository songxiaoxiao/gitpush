#######
# @author winter
# @version 2018/5/16
######
#!/bin/bash

#根目录

path=`pwd`;
echo "请输入commit 注释！";
if [ -n "$1" ]; then
        echo "包含第一个参数";
        echo "commit注释为：$1";
 
cd $path;
j=0;
for i in `ls -1`
do
    git_lab_name[j]=$i
    j=`expr $j + 1`
done
#echo ${folder_list[*]}
       un_git_lab_name=( 'framework' 'vendor' 'git.sh' 'gitpush.sh' );

        for var in  ${git_lab_name[*]} 
        do
        	if  [[ "${un_git_lab_name[@]}" =~ $var ]]
		 then
				cd $path;		
		else
             		echo $var;
                	cd  $var;
             		git checkout develop 
                	git ci -am "$1" && git push;
                	cd $path;
                
            	fi

        done

else
    echo "没有包含第一参数";exit;
fi
