# DockerData
A package to control Docker Volumes over a swarm of RPI´s
Welcome to this corner of the world.
Please note that i am not anadvanced linux or docker user but im slowly advancing.

The idea of this project has started from bare need to somehow manage data between my physical storage an each container instance within my swarm.

# build on Raspbian for Raspberry but i see no issue in applying it to other systems as well
Requirements:
  Docker
  jq    an Json parser
# The central storage device (NAS)
I currently own an Synology DS218 it provides me with an stable platform for data avalilablity.
Now one of the issues i came across is that I can't manage what UID & GID is created within the nas
so every file created is automatally given a user and a group.
I then tried to map my DockerData shared folder with Volumes.
But each container build run with different user and group id´s so i get a lot of Read/Write issues.
If only i had som kind of mapping between my pysical data and my docker data
Maybe Rsync could do the trick. - To be continued.


# Docker services
Many services require different kind of data access types
here are listed my identified requirements.

# Access Types

  # Type1
System data as part of the original image. (No need to go further here if anything is relevant inside a container then it should apply to another Type.

  # Type2
Base data layer
An Docker service provided volume that on creating gets a base set of files and folders from the central storage device. 
Then chmod and chown modded so that the container service has the required rights to continue to modify that data if required.
of cause as long as the volume exists we want that data to be as the service left it.

  # Type 3-x 
To be implemented


# Pull ( for the furture )
A nice feature would be to manage when volumes should be synced to and from the central storage device.
Maybe the Node.labels.pullservice = true could be used to constraint what volumes should get updated
for this to work the service running the push serice must 
 A) Have read access to the Central storage device as a mount.
 B) Know what Access type each volume is
 C) know what to do with chmod and chown
  
  
# Push ( for the furture )
A nice feature would be to manage when volumes should be backed up to the central storage device.
Maybe the Node.labels.pushservice = true could be used to constraint what specific container should be backed up.
For this to work the service running the push service must: 
 A) Have write access to the Central storage device as a mount.
 B) Know what Access type each volume is
 C) know what to do with chmod and chown


Data directory understanding from one node host file system point of view:

$DockerDataHome="path/to/github/root"
$Storage=$DockerDataHome+"/Storages"
 # put in sub folders here for different storages
$Volumes=$DockerDataHome+"/Volumes"
# put in sub folders for each Volume
$tasks=$DockerDataHome+"/Tasks"


