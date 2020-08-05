FROM mcr.microsoft.com/dotnet/core/sdk:2.1
# Set Gauge API timeout to 60s for big project need more time to do dotnet restore.
ARG GAUGE_TIMEOUT=60000

# Install Gauge 1.0.8
RUN apt-get update && apt-get install -q -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
RUN echo deb https://dl.bintray.com/gauge/gauge-deb stable main | tee -a /etc/apt/sources.list
RUN apt-get update && apt-get install gauge=1.0.8

# Install customized gauge dotnet plugin for Linux
COPY gauge-dotnet-2.1.4.zip .
RUN gauge install dotnet -f ./gauge-dotnet-2.1.4.zip

# Install gauge plugins
RUN gauge install html-report && \
    gauge install screenshot && \
    gauge config runner_connection_timeout ${GAUGE_TIMEOUT}

# Set environment variables for Gauge, and Credential Provider of Nuget
ENV PATH=$HOME/.gauge:$PATH