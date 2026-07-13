variable "netapp_volumes" {
  description = <<EOT
Map of netapp_volumes, attributes below
Required:
    - account_name
    - location
    - name
    - pool_name
    - resource_group_name
    - service_level
    - storage_quota_in_gb
    - subnet_id
    - volume_path
Optional:
    - accept_grow_capacity_pool_for_short_term_clone_split
    - azure_vmware_data_store_enabled
    - create_from_snapshot_resource_id
    - encryption_key_source
    - kerberos_enabled
    - key_vault_private_endpoint_id
    - large_volume_enabled
    - network_features
    - protocols
    - security_style
    - smb3_protocol_encryption_enabled
    - smb_access_based_enumeration_enabled
    - smb_continuous_availability_enabled
    - smb_non_browsable_enabled
    - snapshot_directory_visible
    - tags
    - throughput_in_mibps
    - zone
    - cool_access (block):
        - coolness_period_in_days (required)
        - retrieval_policy (required)
        - tiering_policy (required)
    - data_protection_advanced_ransomware (block):
        - protection_enabled (required)
    - data_protection_backup_policy (block):
        - backup_policy_id (required)
        - backup_vault_id (required)
        - policy_enabled (optional)
    - data_protection_replication (block):
        - endpoint_type (optional)
        - remote_volume_location (required)
        - remote_volume_resource_id (required)
        - replication_frequency (required)
    - data_protection_snapshot_policy (block):
        - snapshot_policy_id (required)
    - export_policy_rule (block):
        - allowed_clients (required)
        - kerberos_5_read_only_enabled (optional)
        - kerberos_5_read_write_enabled (optional)
        - kerberos_5i_read_only_enabled (optional)
        - kerberos_5i_read_write_enabled (optional)
        - kerberos_5p_read_only_enabled (optional)
        - kerberos_5p_read_write_enabled (optional)
        - protocol (optional)
        - protocols_enabled (optional)
        - root_access_enabled (optional)
        - rule_index (required)
        - unix_read_only (optional)
        - unix_read_write (optional)
EOT

  type = map(object({
    account_name                                         = string
    subnet_id                                            = string
    storage_quota_in_gb                                  = number
    service_level                                        = string
    volume_path                                          = string
    pool_name                                            = string
    name                                                 = string
    location                                             = string
    resource_group_name                                  = string
    security_style                                       = optional(string)
    tags                                                 = optional(map(string))
    snapshot_directory_visible                           = optional(bool)
    smb_non_browsable_enabled                            = optional(bool)
    smb_continuous_availability_enabled                  = optional(bool)
    smb_access_based_enumeration_enabled                 = optional(bool)
    smb3_protocol_encryption_enabled                     = optional(bool)
    protocols                                            = optional(set(string))
    kerberos_enabled                                     = optional(bool)
    large_volume_enabled                                 = optional(bool)
    key_vault_private_endpoint_id                        = optional(string)
    throughput_in_mibps                                  = optional(number)
    encryption_key_source                                = optional(string)
    create_from_snapshot_resource_id                     = optional(string)
    azure_vmware_data_store_enabled                      = optional(bool)
    accept_grow_capacity_pool_for_short_term_clone_split = optional(string)
    network_features                                     = optional(string)
    zone                                                 = optional(string)
    cool_access = optional(object({
      coolness_period_in_days = number
      retrieval_policy        = string
      tiering_policy          = string
    }))
    data_protection_advanced_ransomware = optional(object({
      protection_enabled = bool
    }))
    data_protection_backup_policy = optional(object({
      backup_policy_id = string
      backup_vault_id  = string
      policy_enabled   = optional(bool)
    }))
    data_protection_replication = optional(object({
      endpoint_type             = optional(string)
      remote_volume_location    = string
      remote_volume_resource_id = string
      replication_frequency     = string
    }))
    data_protection_snapshot_policy = optional(object({
      snapshot_policy_id = string
    }))
    export_policy_rule = optional(list(object({
      allowed_clients                = set(string)
      kerberos_5_read_only_enabled   = optional(bool)
      kerberos_5_read_write_enabled  = optional(bool)
      kerberos_5i_read_only_enabled  = optional(bool)
      kerberos_5i_read_write_enabled = optional(bool)
      kerberos_5p_read_only_enabled  = optional(bool)
      kerberos_5p_read_write_enabled = optional(bool)
      protocol                       = optional(list(string))
      protocols_enabled              = optional(list(string))
      root_access_enabled            = optional(bool)
      rule_index                     = number
      unix_read_only                 = optional(bool)
      unix_read_write                = optional(bool)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.export_policy_rule == null || (length(v.export_policy_rule) <= 5)
      )
    ])
    error_message = "Each export_policy_rule list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.zone == null || (length(v.zone) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.protocols == null || (alltrue([for x in v.protocols : contains(["NFSv3", "NFSv4.1", "CIFS"], x)]))
      )
    ])
    error_message = "must be one of: NFSv3, NFSv4.1, CIFS"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.storage_quota_in_gb >= 50 && v.storage_quota_in_gb <= 1048576
      )
    ])
    error_message = "must be between 50 and 1048576"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.throughput_in_mibps == null || (v.throughput_in_mibps >= 1.0)
      )
    ])
    error_message = "must be at least 1.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.export_policy_rule == null || alltrue([for item in v.export_policy_rule : (item.rule_index >= 1 && item.rule_index <= 5)])
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.export_policy_rule == null || alltrue([for item in v.export_policy_rule : (item.protocol == null || (alltrue([for x in item.protocol : contains(["NFSv3", "NFSv4.1", "CIFS"], x)])))])
      )
    ])
    error_message = "must be one of: NFSv3, NFSv4.1, CIFS"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.data_protection_replication == null || (v.data_protection_replication.endpoint_type == null || (contains(["dst"], v.data_protection_replication.endpoint_type)))
      )
    ])
    error_message = "must be one of: dst"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.data_protection_replication == null || (contains(["10minutes", "daily", "hourly"], v.data_protection_replication.replication_frequency))
      )
    ])
    error_message = "must be one of: 10minutes, daily, hourly"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_volumes : (
        v.cool_access == null || (v.cool_access.coolness_period_in_days >= 2 && v.cool_access.coolness_period_in_days <= 183)
      )
    ])
    error_message = "must be between 2 and 183"
  }
  # Note: 32 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

