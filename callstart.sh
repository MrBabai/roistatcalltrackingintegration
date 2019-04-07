apiKey=OurAPI
idProject=OurID

crDateTime=`date +%Y-%m-%dT%H:%M:%S+0000 --utc`

   JSONResponse=`curl --request POST \
                --url 'https://cloud.roistat.com/api/v1/project/phone-call?key='$apiKey'&project='$idProject \
                --header 'content-type: application/json' \
                --data '{"callee":"'$arg1'","caller":"'$arg2'","date":"'$crDateTime'","duration":null,"marker":null,"order_id":null,"save_to_crm":"0","status":null,"visit_id":null,"comment":null,"answer_duration":null}'`

   # Result
   CId=`echo $JSONResponse | jq '.phoneCall.id' | tr -d \"`
   echo $CId

