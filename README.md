aws-opsworks-java
=================
Override of AWS OpsWorks built-in Java cookbook (opsworks_java/release-chef-11.10), adding support for Java 8 and Tomcat 8 on Ubuntu 14.04 LTS (Trusty).

Background
----------
AWS OpsWorks includes a Linux Java application template based on the OpenJDK and Tomcat. New instances can be created running Amazon Linux, Ubuntu, RHEL or a custom AMI. Ubuntu 14.04 is the latest supported version, which ships with Java 7 and Tomcat 7. Thus, this partial cookbook can be used to override the AWS built-in opsworks_java cookbook to add support for current versions of the OpenJDK and Tomcat.

Disclaimer
----------
This override relies on PPAs (packages not in backports either), so it's not considered production-ready. Use at your own peril.

Compatibility
-------------
Tested amd verified to work on Ubuntu 14.04.