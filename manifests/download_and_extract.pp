define atlassian_sdk::download_and_extract($version = $title, $installdir, $baseurl, $user, $group) {
    $dirname = "atlassian-plugin-sdk-${version}"
    $filename = "${dirname}.tar.gz"
    $target = "${installdir}/${filename}"
    exec { "Download ${filename}":
        command => "wget -q ${baseurl}/${version}/${filename} -O ${target}",
        creates => $target,
        require => File[$installdir]
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
