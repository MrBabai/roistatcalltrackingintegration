#!/bin/bash

apiKey=OurAPI
idProject=OurID


   # $CId - Call ID, $CDur - Call Duration, $CStat - Call Status
   CId=`echo $CId | tr -d '\r\n\"'`
   if [ "$CStat" == "ANSWERED" ];
   then
	CStat="ANSWER"
   elif [ "$CStat" == "NO ANSWER" ];
   then
	CStat="NOANSWER"
   else
	CStat=$CStat
   fi

   RESULT=`curl --request POST \
        --url 'https://cloud.roistat.com/api/v1/project/calltracking/call/update?key='$apiKey'&project='$idProject \
        --header 'content-type: application/json' \
        --data '{"id":'$CId',"comment":null,"duration":"'$CDur'","status":"'$CStat'"}'`
   echo $RESULT
