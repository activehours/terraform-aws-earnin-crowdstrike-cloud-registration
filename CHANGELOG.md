# Changelog

## 0.0.2 (EarnIn fork)

- Add `sensor_management_secret_replica_regions` (root) / `secret_replica_regions`
  (sensor-management submodule) list variables, default `[]` (upstream behavior).
  When set, the FalconAPICredentials secret is created with cross-region read
  replicas. Needed to satisfy EarnIn's DR guardrail (an SCP denies CreateSecret
  for single-region secrets); set to `["us-east-2"]` in the security config.


## 0.0.1 (EarnIn fork)

Forked from CrowdStrike/terraform-aws-cloud-registration v0.7.8 (SCRTY-2600).

- Add `manage_sensor_management_secret_value` (root) / `manage_secret_value`
  (sensor-management submodule) bool variables, default `true` (upstream
  behavior). When set to `false`, the module creates only the empty
  `/CrowdStrike/CSPM/SensorManagement/FalconAPICredentials` secret container and
  does NOT create `aws_secretsmanager_secret_version` — the value is populated
  manually. This keeps the Falcon client secret out of Terraform state, which
  EarnIn's hard-mandatory TFE Sentinel policy requires.

