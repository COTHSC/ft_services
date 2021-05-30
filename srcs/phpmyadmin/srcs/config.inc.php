<?php
    /**
     * phpMyAdmin sample configuration, you can use it as base for
     * manual configuration. For easier setup you can use setup/
     *
     * All directives are explained in documentation in the doc/ folder
     * or at <https://docs.phpmyadmin.net/>.
     *
    * @package PhpMyAdmin
     */

    /**
     * This is needed for cookie based authentication to encrypt password in
     * cookie. Needs to be 32 chars long.
     */
    $cfg['blowfish_secret'] = '01234567890123456789012345678912';

    /**
     * Servers configuration
     */
    $i = 0;

    /**
     * First server
     */
    $i++;

    $cfg['Servers'][$i]['auth_type'] = 'cookie';

    $cfg['Servers'][$i]['host'] = 'mysql-service.default.svc.cluster.local'; /*$_ENV["PMA_HOST"];*/
    $cfg['Servers'][$i]['port'] = $_ENV["PMA_PORT"];
    $cfg['Servers'][$i]['user'] = $_ENV["PMA_USER"];
    $cfg['Servers'][$i]['password'] = $_ENV["MYSQL_ROOT_PASSWORD"];
    $cfg['Servers'][$i]['compress'] = 'false';
    $cfg['Servers'][$i]['AllowNoPassword'] = 'true';

    /**
     * Directories for saving/loading files from server
     */
    $cfg['UploadDir'] = '';
    $cfg['SaveDir'] = '';
    $cfg['PmaAbsoluteUri'] = '/phpmyadmin/';
