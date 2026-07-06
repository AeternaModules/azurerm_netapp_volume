output "netapp_volumes" {
  description = "All netapp_volume resources"
  value       = azurerm_netapp_volume.netapp_volumes
}
output "netapp_volumes_accept_grow_capacity_pool_for_short_term_clone_split" {
  description = "List of accept_grow_capacity_pool_for_short_term_clone_split values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.accept_grow_capacity_pool_for_short_term_clone_split]
}
output "netapp_volumes_account_name" {
  description = "List of account_name values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.account_name]
}
output "netapp_volumes_azure_vmware_data_store_enabled" {
  description = "List of azure_vmware_data_store_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.azure_vmware_data_store_enabled]
}
output "netapp_volumes_cool_access" {
  description = "List of cool_access values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.cool_access]
}
output "netapp_volumes_create_from_snapshot_resource_id" {
  description = "List of create_from_snapshot_resource_id values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.create_from_snapshot_resource_id]
}
output "netapp_volumes_data_protection_advanced_ransomware" {
  description = "List of data_protection_advanced_ransomware values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.data_protection_advanced_ransomware]
}
output "netapp_volumes_data_protection_backup_policy" {
  description = "List of data_protection_backup_policy values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.data_protection_backup_policy]
}
output "netapp_volumes_data_protection_replication" {
  description = "List of data_protection_replication values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.data_protection_replication]
}
output "netapp_volumes_data_protection_snapshot_policy" {
  description = "List of data_protection_snapshot_policy values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.data_protection_snapshot_policy]
}
output "netapp_volumes_encryption_key_source" {
  description = "List of encryption_key_source values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.encryption_key_source]
}
output "netapp_volumes_export_policy_rule" {
  description = "List of export_policy_rule values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.export_policy_rule]
}
output "netapp_volumes_kerberos_enabled" {
  description = "List of kerberos_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.kerberos_enabled]
}
output "netapp_volumes_key_vault_private_endpoint_id" {
  description = "List of key_vault_private_endpoint_id values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.key_vault_private_endpoint_id]
}
output "netapp_volumes_large_volume_enabled" {
  description = "List of large_volume_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.large_volume_enabled]
}
output "netapp_volumes_location" {
  description = "List of location values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.location]
}
output "netapp_volumes_mount_ip_addresses" {
  description = "List of mount_ip_addresses values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.mount_ip_addresses]
}
output "netapp_volumes_name" {
  description = "List of name values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.name]
}
output "netapp_volumes_network_features" {
  description = "List of network_features values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.network_features]
}
output "netapp_volumes_pool_name" {
  description = "List of pool_name values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.pool_name]
}
output "netapp_volumes_protocols" {
  description = "List of protocols values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.protocols]
}
output "netapp_volumes_resource_group_name" {
  description = "List of resource_group_name values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.resource_group_name]
}
output "netapp_volumes_security_style" {
  description = "List of security_style values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.security_style]
}
output "netapp_volumes_service_level" {
  description = "List of service_level values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.service_level]
}
output "netapp_volumes_smb3_protocol_encryption_enabled" {
  description = "List of smb3_protocol_encryption_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.smb3_protocol_encryption_enabled]
}
output "netapp_volumes_smb_access_based_enumeration_enabled" {
  description = "List of smb_access_based_enumeration_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.smb_access_based_enumeration_enabled]
}
output "netapp_volumes_smb_continuous_availability_enabled" {
  description = "List of smb_continuous_availability_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.smb_continuous_availability_enabled]
}
output "netapp_volumes_smb_non_browsable_enabled" {
  description = "List of smb_non_browsable_enabled values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.smb_non_browsable_enabled]
}
output "netapp_volumes_snapshot_directory_visible" {
  description = "List of snapshot_directory_visible values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.snapshot_directory_visible]
}
output "netapp_volumes_storage_quota_in_gb" {
  description = "List of storage_quota_in_gb values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.storage_quota_in_gb]
}
output "netapp_volumes_subnet_id" {
  description = "List of subnet_id values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.subnet_id]
}
output "netapp_volumes_tags" {
  description = "List of tags values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.tags]
}
output "netapp_volumes_throughput_in_mibps" {
  description = "List of throughput_in_mibps values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.throughput_in_mibps]
}
output "netapp_volumes_volume_path" {
  description = "List of volume_path values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.volume_path]
}
output "netapp_volumes_zone" {
  description = "List of zone values across all netapp_volumes"
  value       = [for k, v in azurerm_netapp_volume.netapp_volumes : v.zone]
}

