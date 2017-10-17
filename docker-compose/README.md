A simple setup to spin up a single broker kafka instance for development. The docker compose file exposes the necessary
ports on the host and can be accessed at any interface of the dev machine on the corresponding ports. Includes a
docker compose file that can be used for plugging this into a CI pipeline. Run integration-tests.sh and proceed with
the build depending on the output provided by the script. 
