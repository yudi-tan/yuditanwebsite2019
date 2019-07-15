if  [[ $1 = "-b" ]]; then
   docker build -t yuditan/personalsite2019 .
elif  [[ $1 = "-r" ]]; then
   docker run --name personalsite2019 -p 8080:8080 -d yuditan/personalsite2019
elif [[ $1 = "-k" ]]; then
    docker stop personalsite2019
    docker rm personalsite2019

#always tag then gcr to deploy to google cloud registry.
# https://medium.com/martinomburajr/building-a-go-web-app-from-scratch-to-deploying-on-google-cloud-part-6-deploying-our-go-app-on-cb2fe6f68ed2
elif [[ $1 = "-tag" ]]; then
    docker tag yuditan/personalsite2019:latest gcr.io/personalsite2019-246804/frontend:latest
elif [[ $1 = "-gcr" ]]; then
    gcloud docker -- push gcr.io/personalsite2019-246804/frontend:latest
else
    echo "Please use -b to build, -r flag to run, -k flag to kill container."
fi