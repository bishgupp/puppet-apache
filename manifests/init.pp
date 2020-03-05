# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache  (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  String $service_name,
  Enum["running","stopped"] $service_ensure,
  Boolean $service_enable,
) {
  contain apache::install
  contain apache::config
  contain apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
