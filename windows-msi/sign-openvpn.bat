@echo off

rem This script digitally signs openvpn-build outputs.
rem
rem Note: The OpenVPN files are expected to be built using generic build system
rem with the following command lines:
rem
rem $ IMAGEROOT=`pwd`/image-win32 CHOST=i686-w64-mingw32 CBUILD=i686-pc-cygwin ./build
rem $ IMAGEROOT=`pwd`/image-win64 CHOST=x86_64-w64-mingw32 CBUILD=i686-pc-cygwin ./build
rem
rem Set `%ManifestCertificateThumbprint%` to SHA-1 thumbprint of your code signing
rem certificate. This thumbprint is used only to locate the certificate in user
rem certificate store. The signing and timestamping will use SHA-256 hashes.
rem
rem Set `%ManifestTimestampRFC3161Url%` to URL of your code signing cerificate provider's
rem RFC3161-compliant web service.
rem
rem Run this script before packaging.

signtool.exe sign ^
    /sha1 "%ManifestCertificateThumbprint%" /fd sha256 ^
    /tr "%ManifestTimestampRFC3161Url%" /td sha256 ^
    ..\generic\image-win32\openvpn\bin\libcrypto-1_1.dll ^
    ..\generic\image-win32\openvpn\bin\liblzo2-2.dll ^
    ..\generic\image-win32\openvpn\bin\libopenvpnmsica.dll ^
    ..\generic\image-win32\openvpn\bin\libpkcs11-helper-1.dll ^
    ..\generic\image-win32\openvpn\bin\libssl-1_1.dll ^
    ..\generic\image-win32\openvpn\bin\openssl.exe ^
    ..\generic\image-win32\openvpn\bin\openvpn.exe ^
    ..\generic\image-win32\openvpn\bin\openvpn-gui.exe ^
    ..\generic\image-win32\openvpn\bin\openvpnserv.exe ^
    ..\generic\image-win32\openvpn\bin\tapctl.exe ^
    ..\generic\image-win64\openvpn\bin\libcrypto-1_1-x64.dll ^
    ..\generic\image-win64\openvpn\bin\liblzo2-2.dll ^
    ..\generic\image-win64\openvpn\bin\libopenvpnmsica.dll ^
    ..\generic\image-win64\openvpn\bin\libpkcs11-helper-1.dll ^
    ..\generic\image-win64\openvpn\bin\libssl-1_1-x64.dll ^
    ..\generic\image-win64\openvpn\bin\openssl.exe ^
    ..\generic\image-win64\openvpn\bin\openvpn.exe ^
    ..\generic\image-win64\openvpn\bin\openvpn-gui.exe ^
    ..\generic\image-win64\openvpn\bin\openvpnserv.exe ^
    ..\generic\image-win64\openvpn\bin\tapctl.exe
