:: Created by Joshua Willis, adapted for Windows from existing code by Manoj Joshi ::
@ECHO OFF

:: Build the image from the dockerfile ::
SET dockerfile=Dockerfile
SET imageName=dockerdev
SET contextPath=.

docker build -f %dockerfile% -t %imageName% %contextPath% || ECHO An error occurred which interupted the build operation. See above for details && PAUSE

:: Spin up a new container ::

:: Create docker container using docker run command and set contents to variable %container%, which we will then use to attach to container process.
FOR /f "USEBACKQ" %%a IN (`docker run -itd %imageName% bash`) DO SET container=%%a
ECHO Attempting to connect to container id = %container%

:: Attach to new container ::
START CMD /c docker exec -it %container% bash