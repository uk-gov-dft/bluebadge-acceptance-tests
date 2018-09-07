#! /bin/bash

APPLICATIONS=( \
  LA,la-webapp \
  UM,usermanagement-service \
  BB,badgemanagement-service \
  AP,applications-service \
  AZ,authorisation-service \
  MG,message-service \
  RD,referencedata-service \
)

export APPLICATIONS

echo "*********** TODO: Excluding citizen-webapp until the acceptance tests are fixed.***********"
