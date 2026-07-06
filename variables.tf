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
    snapshot_directory_visible                           = optional(bool) # Default: true
    smb_non_browsable_enabled                            = optional(bool) # Default: false
    smb_continuous_availability_enabled                  = optional(bool)
    smb_access_based_enumeration_enabled                 = optional(bool) # Default: false
    smb3_protocol_encryption_enabled                     = optional(bool)
    protocols                                            = optional(set(string))
    kerberos_enabled                                     = optional(bool)
    large_volume_enabled                                 = optional(bool) # Default: false
    key_vault_private_endpoint_id                        = optional(string)
    throughput_in_mibps                                  = optional(number)
    encryption_key_source                                = optional(string)
    create_from_snapshot_resource_id                     = optional(string)
    azure_vmware_data_store_enabled                      = optional(bool) # Default: false
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
      policy_enabled   = optional(bool) # Default: true
    }))
    data_protection_replication = optional(object({
      endpoint_type             = optional(string) # Default: "dst"
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
        v.zone == null || (length(v.zone) > 0)
      )
    ])
    error_message = "must not be empty"
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
  # --- Unconfirmed validation candidates, derived from azurerm_netapp_volume's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: name
  #   source:    [from netAppValidate.VolumeName] !regexp.MustCompile(`^[a-zA-Z][-_\da-zA-Z]{0,63}$`).MatchString(value)
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: account_name
  #   source:    [from netAppValidate.AccountName] !regexp.MustCompile(`^[-_\da-zA-Z]{3,64}$`).MatchString(value)
  # path: pool_name
  #   source:    [from netAppValidate.PoolName] !regexp.MustCompile(`^[\da-zA-Z][-_\da-zA-Z]{2,63}$`).MatchString(value)
  # path: volume_path
  #   source:    [from netAppValidate.VolumePath] !regexp.MustCompile(`^[a-zA-Z][-\da-zA-Z]{0,79}$`).MatchString(value)
  # path: service_level
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: create_from_snapshot_resource_id
  #   source:    [from snapshots.ValidateSnapshotID] !ok
  # path: create_from_snapshot_resource_id
  #   source:    [from snapshots.ValidateSnapshotID] err != nil
  # path: accept_grow_capacity_pool_for_short_term_clone_split
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_features
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: protocols[*]
  #   condition: contains(["NFSv3", "NFSv4.1", "CIFS"], value)
  #   message:   must be one of: NFSv3, NFSv4.1, CIFS
  # path: security_style
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: throughput_in_mibps
  #   source:    validation.FloatAtLeast(...) - no translation rule yet, add one
  # path: export_policy_rule.rule_index
  #   condition: value >= 1 && value <= 5
  #   message:   must be between 1 and 5
  # path: export_policy_rule.allowed_clients[*]
  #   source:    [from validate.CIDR] re != nil && !re.MatchString(cidr)
  # path: export_policy_rule.protocol[*]
  #   condition: contains(["NFSv3", "NFSv4.1", "CIFS"], value)
  #   message:   must be one of: NFSv3, NFSv4.1, CIFS
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
  # path: data_protection_replication.remote_volume_location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: data_protection_replication.remote_volume_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: data_protection_replication.remote_volume_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: data_protection_snapshot_policy.snapshot_policy_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: data_protection_snapshot_policy.snapshot_policy_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: data_protection_backup_policy.backup_policy_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: data_protection_backup_policy.backup_policy_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: data_protection_backup_policy.backup_vault_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: data_protection_backup_policy.backup_vault_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: encryption_key_source
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: key_vault_private_endpoint_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: key_vault_private_endpoint_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: cool_access.retrieval_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: cool_access.tiering_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

