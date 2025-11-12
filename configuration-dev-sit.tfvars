# ------- Common Variables values -------
project_id                     = "tuevhqiq-f9hc-eemh-065s-6lhn2z"
region                         = "us-central1"
location                       = "us-central1-a"
environment                    = "non-prod"
created_by                     = "subodh_kumar"
project_label                  = "rtc"
team                           = "rtc_wipro_devops" 
managed_by                     = "terraform" 

# ------- Artifact Registry Variables values -------
create_registry                = true

location_artifact              = "us-central1"
repository_name                = ["rtc-dev-sit-registry", "rtc-stg-rel-registry"]
repository_format              = "DOCKER"
repository_description         = "This is registry for rtc application"


# ------- GCP Bucket Variables values ------
create_bucket                  = false

bucket_name                    = "rtcterraformbucketdemo"
bucket_location                = "US"
bucket_storage_class           = "STANDARD"
aide_id                        = "aide_0073688"
service_tier                   = "p3"


# ------- GKE Autopilot Cluster Variables values ------
create_gke_cluster             = true

cluster_name                   = "rtc-dev-sit-autopilot"
cluster_region                 = "us-central1"
network                        = "projects/tuevhqiq-f9hc-eemh-065s-6lhn2z/global/networks/pcm-managed-vpc-rtc-gcp-np"
subnetwork                     = "projects/tuevhqiq-f9hc-eemh-065s-6lhn2z/regions/us-central1/subnetworks/pcm-managed-subnet-rtc-gcp-dev-sit"
secondary_range_name           = "gke-dev-sit-pods-range"
services_secondary_range_name  = "gke-dev-sit-services-range"
release_channel                = "REGULAR"
deletion_protection            = false  
gcp_public_cidrs_access_enabled = true          

master_authorized_networks = [
  {
    display_name = "Optum 1"
    cidr_block   = "168.183.0.0/16"
  },
  {
    display_name = "Optum 2"
    cidr_block   = "149.111.0.0/16"
  },
  {
    display_name = "Optum 3"
    cidr_block   = "128.35.0.0/16"
  },
  {
    display_name = "Optum 4"
    cidr_block   = "161.249.0.0/16"
  },
  {
    display_name = "Optum 5"
    cidr_block   = "198.203.174.0/23"
  },
  {
    display_name = "Optum 6"
    cidr_block   = "198.203.176.0/22"
  },
  {
    display_name = "Optum 7"
    cidr_block   = "198.203.180.0/23"
  },
  {
    display_name = "Plymouth"
    cidr_block   = "198.203.177.177/32"
  },
  {
    display_name = "Chaska"
    cidr_block   = "198.203.175.175/32"
  },
  {
    display_name = "Elk River"
    cidr_block   = "198.203.181.181/32"
  },
  {
    display_name = "Google Internal A"
    cidr_block   = "35.191.0.0/16"
  },
  {
    display_name = "Google Internal B"
    cidr_block   = "130.211.0.0/22"
  },
  {
    display_name = "ubuntu-uhg-1a"
    cidr_block   = "20.120.134.64/29"
  },
  {
    display_name = "ubuntu-uhg-1b"
    cidr_block   = "20.62.150.64/29"
  },
  {
    display_name = "ubuntu-uhg-2a"
    cidr_block   = "4.156.190.128/29"
  },
  {
    display_name = "ubuntu-uhg-2b"
    cidr_block   = "20.1.254.152/29"
  },
  {
    display_name = "ubuntu-uhg-3a"
    cidr_block   = "20.246.150.176/29"
  },
  {
    display_name = "ubuntu-uhg-3b"
    cidr_block   = "4.152.59.8/29"
  }
]

# ------- Namespace Variables -------
create_namespaces = false

namespace_names = [
  "rtc-elr-dev1",
  "rtc-elr-dev1",
  "rtc-elr-sit"
]

namespaces = [
  "rtc-gcp-dev1",
  "rtc-gcp-dev1",
  "rtc-gcp-sit"
]
