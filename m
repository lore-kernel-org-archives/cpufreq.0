From: Thomas Renninger <trenn@suse.de>
Subject: Re: Fehler bei cpufreq-info
Date: Fri, 05 Apr 2013 17:04:57 +0200
Message-ID: <105017244.Qn4cnEXAW8@skinner.arch.suse.de>
References: <51558EDC.2040503@gmx.de> <2017362.3fkGx2zPkK@skinner.arch.suse.de> <20130405143109.GA1451@noon.brq.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart6153270.4jfOSf5R4r"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130405143109.GA1451@noon.brq.redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Petr =?utf-8?B?xaBhYmF0YQ==?= <contyk@redhat.com>
Cc: Rainer Maier <RaMaier@gmx.de>, cpufreq@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart6153270.4jfOSf5R4r
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, April 05, 2013 04:31:09 PM Petr =C5=A0abata wrote:
> On Fri, Apr 05, 2013 at 04:01:20PM +0200, Thomas Renninger wrote:
> > On Wednesday, April 03, 2013 09:53:04 AM Petr =C5=A0abata wrote:
> > > On Tue, Apr 02, 2013 at 11:29:23PM +0200, Rainer Maier wrote:
> > > > Hi Thomas,
> > > > thanks for your info.
> > > > I removed cpufrequtils, but when I tried to install cpupower by=

> > > > aptitude
> > > > it didn't know the package. I searched for it, but couldn't fin=
d one.
> > > > Would you perhaps know which packet to install ?
> > > >=20
> > > > Thanks
> > > > Rainer
> > >=20
> > > The cpupower utilities are part of the kernel tree now and
> > > included in the kernel-tools package on Fedora.  I suppose it
> > > will be something similar in your distribution.
> >=20
> > Sigh.
> > I guess you have a separate perf package at least?
>=20
> Yes, but technically it's a kernel subpackage.
Sure, but I doubt it makes sense to put every tool in there.
For bigger ones like perf, and IMO also cpupower it makes
sense to package them separately.
=20
> > It would be great if cpupower gets packaged separately for two
> > reasons:
> >=20
> > 1) cpuidle and cpufreq are used by a lot archs nowadays:
> >     ppc, arm, afaik S390 at least they tried,...
> >     I expect the kernel-tools package will only compile on X86?
>=20
> They used to be a separate package before the code moved
> to kernel.  I see the package is build for ppc[64] but not
> on s390[x].
Yep, I double checked: cpupower builds on ppc here too.

> I have no information on arm[64] at the moment
> but if there are issues, I'll let you know :)
>=20
> > 2) To avoid confusion like above, so that this tool can easily
> >=20
> >     be found by people searching for it.
>=20
> This is handled by package manager.  Besides the list of of
> binaries the tools package should also act as a replacement
> for former cpufrequtils and cpupowerutils packages.

It would really be great if this gets packaged separately.
Find attached my .spec file.
If someone looks at this, he can freely take over whatever he wants.
...
> I'll forward this to kernel owners in Fedora.

Thanks,

   Thomas
--nextPart6153270.4jfOSf5R4r
Content-Disposition: attachment; filename="cpupower.spec"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-rpm-spec; charset="UTF-8"; name="cpupower.spec"

#
# spec file for package cpupower
#
# Copyright (c) 2013 SUSE LINUX Products GmbH, Nuernberg, Germany.
# Author: Thomas Renninger <trenn@suse.de>
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#



Name:           cpupower
Url:            http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html
# Use this as version when things are in mainline kernel
%define version %(rpm -q --qf '%{VERSION}' kernel-source)
Version:        3.8
Release:        0
Summary:        Tools to determine and set CPU Power related Settings
License:        GPL-2.0
Group:          System/Base
Source:         %{name}-%{version}.tar.bz2
Source1:        cpupower_export_tarball_from_git.sh
Patch1:         cpupower-haswell_support.patch
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildRequires:  gettext-tools
BuildRequires:  pciutils
BuildRequires:  pciutils-devel
Obsoletes:      cpufrequtils < %version
Provides:       cpufrequtils = %version

%description
This tool is to make access to the Linux kernel's processor power subsystems
like CPU frequency switching (cpufreq) or CPU sleep states (cpuidle) for users
and userspace tools easier.

%package -n libcpupower0
Summary:        Obsolete processor frequency related C-library
Group:          System/Base

%description -n libcpupower0
Contains libcpupower and soon possibly other CPU power related
C libraries.

%package devel
Summary:        Include files and C-libraries
Group:          Development/Languages/C and C++
Requires:       libcpupower0 = %{version}

%description devel
Include files and C-libraries for C/C++ development

%package bench
Summary:        CPU frequency micro benchmark
Group:          System/Benchmark
Obsoletes:      cpufrequtils-bench < %version
Provides:       cpufrequtils-bench = %version

%description bench
Helps to test the condition of a given kernel cpufreq
governor (e.g. ondemand, userspace, conservative) and the cpufreq HW driver
(e.g. powernow-k8, acpi-cpufreq, ...).
For that purpose, it compares the performance governor to a configured
powersave module.

%prep
%setup -q
%patch1 -p1

%build
# This package failed when testing with -Wl,-as-needed being default.
# So we disable it here, if you want to retest, just delete this comment and the line below.
export SUSE_ASNEEDED=0
CONF="PACKAGE_BUGREPORT=http://bugs.opensuse.org mandir=%_mandir libdir=%_libdir CPUFRQ_BENCH=true STRIP=true VERSION=%{version}"
export CFLAGS="$RPM_OPT_FLAGS"
make $CONF %{?_smp_mflags}

%install
export SUSE_ASNEEDED=0
CONF="PACKAGE_BUGREPORT=http://bugs.opensuse.org mandir=%_mandir libdir=%_libdir CPUFRQ_BENCH=true DESTDIR=$RPM_BUILD_ROOT sbindir=/usr/sbin docdir=%{_docdir}/%{name} confdir=/etc VERSION=%{version}"
make install DESTDIR=$RPM_BUILD_ROOT $CONF
# copy to examples doc dir to avoid complains from the build
# system about an executable in the doc dir.
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}/examples
mv $RPM_BUILD_ROOT/%{_docdir}/%{name}/cpufreq-bench_script.sh $RPM_BUILD_ROOT/%{_docdir}/%{name}/examples
%find_lang %{name}

%post -n libcpupower0 -p /sbin/ldconfig

%postun -n libcpupower0 -p /sbin/ldconfig

%files -f %{name}.lang
%defattr (-,root,root)
%{_mandir}/man1/cpupower*
/usr/bin/cpupower

%files bench
%defattr (-,root,root)
%config /etc/cpufreq-bench.conf
/usr/sbin/cpufreq-bench
/usr/bin/cpufreq-bench_plot.sh
%dir %{_docdir}/%{name}
%dir %{_docdir}/%{name}/examples
%{_docdir}/%{name}/examples/cpufreq-bench_script.sh
%{_docdir}/%{name}/README-BENCH

%files -n libcpupower0
%defattr(-,root,root)
%{_libdir}/libcpupower*.so.*

%files devel
%defattr(-,root,root)
/usr/include/cpufreq.h
%{_libdir}/libcpu*.so

%changelog

--nextPart6153270.4jfOSf5R4r--

