# surveillance
This script configures ubuntu box(apt) to read and store video traffic from sources that broadcast it in __rstp__ format.
By default configured 2 cameras but more cameras can be added as needed. See `record.sh` file for more details.
The apache server will be auto started and all recorded videos will be available through web interface(browser), to view them open http://the_box_hostname_or_ip_address/.
To get ip address of a box do `ifconfig`.
Steps to get started
1. Install ansible: `sudo apt-get install ansible`
2. Copy surv_config_sample.yml to surv_config.yml and make necessary config changes to this file
3. Configure `surveillance.yaml` : the only thing is needed to specify path to directory where the surv_config is.
4. run commands from install_docker_containers.sh
5. Run ansible playbook `ansible-playbook -i "localhost," -c local --ask-become-pass ./surveillance.yaml`


In case there is a need to real-time convert rtsp->mjpeg, see preconfigured ffserver.conf as sample configuration on how to do it. It configured to convert 6 different streams. Update configuration to satisfy your needs. 