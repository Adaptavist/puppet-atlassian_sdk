define atlassian_sdk::download_and_extract($installdir, $baseurl, $user, $group, $version = $title) {
    $dirname = "atlassian-plugin-sdk-${version}"
    $filename = "${dirname}.tar.gz"
    $target = "${installdir}/${filename}"
    exec { "Download ${filename}":
        command => "curl -s -L ${baseurl}/${version}/${filename} -o ${target}",
        creates => $target,
        require => [File[$installdir], Package['curl']]
    }
    ->
    exec { "Extract ${target}":
        command => "tar zxf ${target} -C ${installdir}",
        creates => "${installdir}/${dirname}"
    }
    ->
    file { "${installdir}/${dirname}":
        ensure  => 'directory',
        recurse => true,
        owner   => $user,
        group   => $group
    }
}
