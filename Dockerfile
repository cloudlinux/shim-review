FROM almalinux:8

COPY rpmmacros /root/.rpmmacros
COPY shim-unsigned-x64-15.8-1.el8.cloudlinux.1.src.rpm /
RUN rpm -ivh shim-unsigned-x64-15.8-1.el8.cloudlinux.1.src.rpm
RUN dnf install -y dnf-plugins-core rpm-build almalinux-release-devel
RUN dnf builddep -y --enablerepo=powertools --enablerepo=devel /builddir/build/SPECS/shim-unsigned-x64.spec
RUN sed -i 's/linux32 -B/linux32/g' /builddir/build/SPECS/shim-unsigned-x64.spec
RUN rpmbuild -bb /builddir/build/SPECS/shim-unsigned-x64.spec
COPY shimia32.efi /
COPY shimx64.efi /
RUN rpm2cpio /builddir/build/RPMS/x86_64/shim-unsigned-ia32-15.8-1.el8.cloudlinux.1.x86_64.rpm  | cpio -diu
RUN rpm2cpio /builddir/build/RPMS/x86_64/shim-unsigned-x64-15.8-1.el8.cloudlinux.1.x86_64.rpm | cpio -diu
RUN ls -l /*.efi ./usr/share/shim/15.8-1.el8.cloudlinux.1/*/shim*.efi

RUN hexdump -Cv ./usr/share/shim/15.8-1.el8.cloudlinux.1/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv ./usr/share/shim/15.8-1.el8.cloudlinux.1/ia32/shimia32.efi > built-ia32.hex
RUN hexdump -Cv /shimia32.efi > orig-ia32.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN objdump -h /usr/share/shim/15.8-1.el8.cloudlinux.1/x64/shimx64.efi
RUN objdump -h /usr/share/shim/15.8-1.el8.cloudlinux.1/ia32/shimia32.efi
RUN diff -u orig-ia32.hex built-ia32.hex
RUN diff -u orig-x64.hex built-x64.hex
RUN pesign -h -P -i /usr/share/shim/15.8-1.el8.cloudlinux.1/ia32/shimia32.efi
RUN pesign -h -P -i /shimia32.efi
RUN pesign -h -P -i /usr/share/shim/15.8-1.el8.cloudlinux.1/x64/shimx64.efi
RUN pesign -h -P -i /shimx64.efi
RUN sha256sum /usr/share/shim/15.8-1.el8.cloudlinux.1/x64/shimx64.efi /shimx64.efi /usr/share/shim/15.8-1.el8.cloudlinux.1/ia32/shimia32.efi /shimia32.efi
