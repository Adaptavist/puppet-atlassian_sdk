# Installs Atlassian SDK from Atlassian Maven repository
class atlassian_sdk(
    $installdir = '/opt',
    $user       = 'hosting',
    $group      = 'hosting',
    $versions   = undef
){

    validate_array($versions)

    $baseurl = 'https://maven.atlassian.com/content/groups/public/com/atlassian/amps/atlassian-plugin-sdk'

    if ! defined( File[$installdir] ) {
        file { $installdir:
            ensure => 'directory',
            owner  => $user,
            group  => $group,
            mode   => '0755'
        }
    }

    atlassian_sdk::download_and_extract { $versions:
        installdir => $installdir,
        baseurl    => $baseurl,
        user       => $user,
        group      => $group
    }
}
