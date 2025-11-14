# TODO.md

## Additional Implementation

- use ansible_become_password, fill from 1Password if required
- create light theme'd Terminal.app profile
- install printers
  - /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/AirPrint.ppd
  - lpadmin -E -p HP_DesignJet_T210_24_in -D "HP DesignJet T210 24-in" -E -m everywhere  -v "dnssd://HP%20DesignJet%20T210%2024-in%20%5B383843%5D._ipp._tcp.local./?uuid=2a361723-8134-5cfa-b4db-bf0ac3187cb1"
  - lpinfo -v
  - ippfind
  - /System/Library/Printers/Libraries/ipp2ppd
  - https://aporlebeke.wordpress.com/2019/10/30/configuring-printers-programmatically-for-airprint/
  - https://aporlebeke.wordpress.com/2021/05/26/configuring-printers-programmatically-for-airprint-part-2-now-with-icons/

### Resurrect formerly working items


### License Parallels Desktop

    prlsrvctl install-license -k <your_license_key> 
