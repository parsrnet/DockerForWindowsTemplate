# InstallAndRunDockerOnWindows
Short guide on how to install and run Docker, set up your first development environment, and connect to that environment using Docker in Windows.

## Step 1: Install Docker
Visit the following webpage to install Docker: https://www.docker.com/get-started
Download and install Docker. During installation, you should be prompted to update your WSL Kernel to the most recent version. Make sure you do this and restart your computer when prompted.

## Step 2: Create a .dockerfile
Create a dockerfile, an example of which can be found on this repository [here](https://github.com/parsrnet/InstallAndRunDockerOnWindows/blob/main/Dockerfile).

Make sure to include a FROM directive using an acceptable image to copy from such as CentOS, RHEL, or Ubuntu and the :latest suffix to get the latest version. Alternatively, you may use :\[version] to copy a specific version.

## Step 3: Run the "build" Command
Using command prompt, run `docker build -f \[dir to dockerfile] -t \[image name] .` or copy [this batch script](https://github.com/parsrnet/InstallAndRunDockerOnWindows/blob/main/build.bat) and run it in the same directory as the single Dockerfile.

### Make sure you've built your image correctly:
In order to make sure your image was successfully built, run the command `docker image ls`
You should see your image in the following list.

## Step 4: Create a Container from the Image
Run the following command to create a Docker Container of your image: `docker run -itd \[image name] bash` or copy and run [this batch script](https://github.com/parsrnet/InstallAndRunDockerOnWindows/blob/main/spinup.bat) after having run the build script.

## Step 5: Connect to your Container using Exec or Batch
Copy and run [this batch script](https://github.com/parsrnet/InstallAndRunDockerOnWindows/blob/main/attach.bat) to run your first created Docker Container or use `docker -ps` to get the container's unique ID and `docker exec -it \[Container ID] bash` to attach to the container in the terminal.
