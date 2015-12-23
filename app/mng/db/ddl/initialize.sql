CREATE ROLE developer LOGIN PASSWORD 'developerPwd';
CREATE DATABASE hermes_development OWNER=developer;
CREATE DATABASE hermes_test OWNER=developer;
CREATE DATABASE hermes_production OWNER=developer;
