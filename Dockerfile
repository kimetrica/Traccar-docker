FROM java:7

# get, unzip, remove in one RUN directive, to reduce image size / number of layers
ADD traccar-linux-64-3.4.zip /traccar-linux-64-3.4.zip
RUN unzip traccar-linux-64-3.4.zip \
&& rm traccar-linux-64-3.4.zip \
&& ./traccar.run \
&& rm traccar.run

ADD traccar.xml /opt/traccar/conf/traccar.xml

ENV POSTGRES_HOSTNAME postgres_traccar
ENV POSTGRES_USERNAME traccar
ENV POSTGRES_PASSWORD yaew3ziemeCie8eej4Oh

# default webinterface port
EXPOSE 8082
# all protocol ports taken from /opt/traccar/conf/traccar.xml 
EXPOSE 5001 5002 5003 5004 5005 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015 5016 5017 5018 5019 5020 5021 5022 5023 5024 5025 5026 5027 5028 5029 5030 5031 5032 5033 5034 5035 5036 5037 5038 5039 5040 5041 5042 5043 5044 5045 5046 5047 5048 5049 5050 5051 5052 5053 5054 5055 5056 5057 5058 5059 5060 5061 5062 5063 5064 5065 5066 5067 5068 5069 5070 5071 5072 5073 5074 5075 5076 5077 5078 5079 5080 5081 5082 5083 5084 5085 5086 5087 5088 5088 5089 5090 5091 5092 5093 5094 5095 5096 5097 5098 5099 5100

ADD set_rds_from_env_and_start_traccar.py /opt/traccar/conf/set_rds_from_env_and_start_traccar.py
RUN chmod 755 /opt/traccar/conf/set_rds_from_env_and_start_traccar.py

CMD /opt/traccar/conf/set_rds_from_env_and_start_traccar.py
