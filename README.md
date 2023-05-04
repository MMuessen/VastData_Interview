
# Matt Muessen Vast Data Interview

## Hello, and thank you for taking the time to interview me today!

![VastLogo](https://github.com/MMuessen/VastData_Interview/blob/main/deepLearning.png?raw=true)

## You can view a copy of my resume [HERE](https://github.com/MMuessen/VastData_Interview/blob/main/MattMuessenResumeApril2023.pdf)

# Example Work

### Example 1
**Host based traffic Generation Script - Powershell**

***The Problem*** - Needed traffic to create a heart beat or realism to a cyber exercise training environment.  Previously the only solution was running network based traffic from recorded PCAP files across the network but the source and destination of these were not real endpoints in the environment so it was easier for red and blue teams to filter out.

***The Solution*** - I wrote a simple powershell script which was called on startup from a vbscript to perform at random typical enduser functions directly on each endpoint in the environment to create true client based traffic which would look real across the wire and on the endpoint.

***The Code*** - The code would at random browse websites and create unique doc files of different sizes with unique names in two different folders on the endpoints.  This created unique HTTP and HTTPS traffic as well as created documents on endpoints which would make it harder for blue teams to find malicious artifacts.  

[Here is the Code](https://github.com/MMuessen/VastData_Interview/blob/main/traffic.ps1)

### Example 2
**PowerCLI Tool for mass deployment and configuration of large scale VMware environments - Powershell & Bash**

***The Problem*** - Needed a way to be able to make mass changes and configurations to hundreds and thousands of vms including changes in the guest OS almost instantly.

***The Solution*** - wrote a simple PowerCLI tool which would allow me to build an array of VMs to target by selecting different strings within a vmware folder and adding them to one large array until user input is complete.  The tool then had a doWork function which I could use to either make changes to the vmware infrastructure (such as changing a NIC) or I could even execute scripts in the guest OS to make configurations to the clients.  I could use nested powershell scripts for windows and bash scripts for linux.

***The Code*** - The code was written in powershell (PowerCLI) and used nested Powershell scripts for windows guest os configurations and changes and nested bash scripts for linux guest os configurations.  

[Here is the Code](https://github.com/MMuessen/VastData_Interview/blob/main/PowerCLI_VMArrayLoop_Tool.ps1)

### Example 3
**Tanium Sensor to show all deduplicated unique connections to a server - Python**

***The Problem*** - Sales person sold a solution to the customer which the product didnt quite do.  The previous sensor was basically a TCP dump but the customer was sold they could get actionable data to prepare for an on prem to cloud migration.  This was handing them a haystack of data which wasnt helpful.

***The Solution*** - I took the old sensor and rewrote it adding deduplication, as well as filtered out any local traffic, and excluded ports such as the ones we used for tanium.  I also added an inbound and outbound parameter which allowed me to greatly reduce the string count on our platform for that sensor.

***The Code*** - I cannot publish the code but I will show the before and the after results of the output.  Here are examples of the sensor results in my lab.

### Example 4
**Tanium Sensor to show all installed applications by date with Date Normalization - VBScript**

***The Problem*** - My customer asked if we could track software installs for each piece of software in their environment by day.  We had a sensor which would display installed application dates but those dates were in many different formats because they came from the registry based on however the software displayed them.  Because they were all in different formats, you couldnt do any sorting, filtering, or calculating based on those fields.

***The Solution*** - In order to solve this I rewrote the sensor to first normalize the date.  I then wrote a second sensor which would only display todays install results based on that normalized field.  I was able to not only provide them an exportable list at any moment of what had been installed on any day, but was able to turn this sensor into a report to show daily installs over time.

***The Code*** - I cannot publish the code but I will show the before and the after results of the output.  Here are examples of the sensor results in my lab.


