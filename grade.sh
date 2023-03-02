CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf file.txt
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then 
    echo 'File Found'
else
    echo 'File not found! Try to make sure your file is named correctly and in the
 right folder'
 exit
 fi

cp ListExamples.java ..
cd ..

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [[ $? == 0 ]]
then echo 'compile success'
else
echo 'compile failed, make sure your code can compile!'
exit 1
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > file.txt

var="$(grep "There was" file.txt)"



if [[ $var == "" ]]
then echo '100%'
else echo $var "0%"
fi



