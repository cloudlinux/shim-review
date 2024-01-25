*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
Cloud Linux Software, Inc.

*******************************************************************************
### What product or service is this for?
*******************************************************************************
CloudLinux OS 8

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
We're a well known vendor with more than 4000 clients and more than 200,000 product installations

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
CloudLinux OS 8 provides kernel with own patches

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Andrew Lukoshko
- Position: Software Architect
- Email address: alukoshko@cloudlinux.com
- PGP key fingerprint: 135E B273 0F8A 5B9C D0AC 38B0 0ED6 B51B CD0F AADF
- PGP key: https://raw.githubusercontent.com/cloudlinux/shim-review/master/alukoshko.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Leonid Kanter
- Position: IT Director
- Email address: lkanter@cloudlinux.com
- PGP key fingerprint: A07D AA47 48B2 C445 6A44 9B38 4002 9607 9AE5 954F
- PGP key: https://raw.githubusercontent.com/cloudlinux/shim-review/master/lkanter.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
This is the unmodified shim-15.8 release.

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
https://github.com/rhboot/shim/tree/15.8  
Source rpm is: https://github.com/cloudlinux/shim-review/blob/master/shim-unsigned-x64-15.8-1.el8.cloudlinux.1.src.rpm  
CloudLinux 8 is based on AlmaLinux 8 so repos for build deps etc are here: http://repo.almalinux.org/almalinux/8/

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
None.

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
This is a "RHEL-like" implementation.

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
Yes.

*******************************************************************************
### If these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
NTFS module affected by CVE-2023-4692 and CVE-2023-4693 is not included into signed GRUB2 binary.  
So GRUB2 SBAT generation is 3 but it's not vulnerable.

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
Old shims hashes are provided to Microsoft.  
Old GRUB2 builds are disallowed to boot because they have generation < 3 in SBAT.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
All mentioned upstream commits are applied.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
Yes. Kernel is slignty modified to allow using CloudLinux's own LVE kernel module.  
Lightweight Virtual Environment (LVE) technology allows hosts to set up individual resource limits necessary for hosting.


*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
Yes.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
2 certificates enrolled in vendor_db:  
- Current CloudLinux EV cert (clsecureboot001.cer)
- New CloudLinux self-signed CA cert (clsecurebootca2.cer)

No allow-listed hashes in vendor_db.

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We don't use vendor_dbx in this build.  
Old GRUB2 builds are disallowed to boot because they have generation < 3 in SBAT.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
This is built on a AlmaLinux OS 8.9.  
The Dockerfile in this repository can be used to launch an identical buildroot.

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
root.log and build.log in this repo.

*******************************************************************************
### What changes were made since your SHIM was last signed?
*******************************************************************************
Update shim from 15.6 to 15.8 and include new certificate.

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
```
643009b06fd4e7494f4555e6488eb9728b216a40e8d8eefa0feea65f0be3b9c0  shimia32.efi
47135ec9676de5abfe0a596c89fd992247a9ab16f700c26e8a14aee213f17423  shimx64.efi
```
*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
They're stored in an FIPS 140-2 certified HSM tokens provided by Certification Authorities.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
One of included certs is EV, second if self-signed.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 (e.g. from Fedora or Debian), please
preserve the SBAT entry from those distributions and only append your own.
More information on how SBAT works can be found [here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
```
shim:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.cloudlinux,4,CloudLinux,shim,15.8,security@cloudlinux.com

grub2:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.02,https//www.gnu.org/software/grub/
grub.rh,2,Red Hat,grub2,2.02-150.el8,mailto:secalert@redhat.com
grub.cloudlinux,2,CloudLinux,grub2,2.02-150.el8.cloudlinux,mailto:security@cloudlinux.com

fwupd:
sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.3,https://github.com/fwupd/fwupd
fwupd-efi.rhel,1,CloudLinux,fwupd,1.7.8,mail:secalert@redhat.com
fwupd-efi.cloudlinux,1,CloudLinux,fwupd,1.7.8,mail:security@cloudlinux.com
```

*******************************************************************************
### Which modules are built into your signed GRUB2 image?
*******************************************************************************
```
all_video boot blscfg btrfs cat configfile cryptodisk echo ext2 fat font
gcry_rijndael gcry_rsa gcry_serpent gcry_sha256 gcry_twofish gcry_whirlpool
gfxmenu gfxterm gzio halt hfsplus http increment iso9660 jpeg loadenv loopback
linux lvm luks mdraid09 mdraid1x minicmd net normal part_apple part_msdos
part_gpt password_pbkdf2 png reboot regexp search search_fs_uuid search_fs_file
search_label serial sleep syslinuxcfg test tftp video xfs efi_netfs efifwsetup
efinet lsefi lsefimmap connectefi backtrace chain usb usbserial_common
usbserial_pl2303 usbserial_ftdi usbserial_usbdebug keylayouts at_keyboard
```

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or other)?
*******************************************************************************
RHEL 8 downstream, `2.02-150.el8.cloudlinux`  
https://repo.cloudlinux.com/cloudlinux/8/cloudlinux-x86_64-server-8/Source/Packages/grub2-2.02-150.el8.cloudlinux.src.rpm

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
It also launches fwupd.

*******************************************************************************
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
grub2 verifies signatures on booted kernels via shim.  
fwupd does not include code to launch other binaries, it can only load UEFI updates.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
grub2 verifies signatures on booted kernels via shim.  
fwupd does not include code to launch other binaries, it can only load UEFI updates.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************
No.
*******************************************************************************

### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
It's RHEL8 kernel based on 4.18.0, plus a full compliment of patches for Secure Boot and relevant bug fixes.

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
Current CloudLinux EV cert expires Mar 25, 2024, so сould you please prioritize this review?  
Thanks.

Previous reviews:  
shim-15.4: https://github.com/rhboot/shim-review/issues/152  
shim-15.6 (security contacts verification done here): https://github.com/rhboot/shim-review/issues/251  
