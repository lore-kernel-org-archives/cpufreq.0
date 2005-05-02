From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] dual-core powernow-k8
Date: Mon, 2 May 2005 17:02:14 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFBFB8@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Pytasz <mpytasz@pai.net.pl>, cpufreq@lists.linux.org.uk

Thanks for the additional information.

I didn't change anything in that part of the code, so I'm not sure what
the issue is.  But I'll investigate it and get back to you.

-Mark Langsdorf
AMD, Inc.

> I know it's quite silly to reply to own posts, however I=20
> wanted to add more information to what is written below:
>=20
> One change to 1000MHz was successful, than frequency (on=20
> demand) changed to=20
> 2000, after that no changes are possible.
>=20
> Michal
>=20
> On Monday 02 of May 2005 23:16, Micha=B3 Pytasz wrote:
> > Hi,
> >
> > On Monday 02 of May 2005 21:23, Langsdorf, Mark wrote:
> > > With the release of the dual-core AMD Opterons last week,=20
> it's high=20
> > > time that cpufreq supported them.  The attached patch applies=20
> > > cleanly to 2.6.12-rc3 and updates powernow-k8 to support=20
> the latest=20
> > > Athlon 64 and Opteron processors.
> > >
> > > Update the driver to version 1.40.0 and provide support
> > > for dual-core processors.
> > >
> > > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
> > >
> > > -Mark Langsdorf
> > > AMD, Inc.
> >
> > I just tried applying patch against 2.6.11.8, well it builds fine,=20
> > however when I try to use it (Athlon64 3200+ s939) I get:
> >
> > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.40.0)
> > powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> > powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
> > powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
> > Losing some ticks... checking if CPU frequency changed.=20
> cpu_init done,=20
> > current fid 0xc, vid 0x6
> >
> > which looks quite fine, but after ondemand govenor is started:
> >
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > powernow-k8: transition frequency failed
> >
> > and so on.
> >
> > Here is my cpuinfo (when I see above):
> >
> > # cat /proc/cpuinfo
> > processor       : 0
> > vendor_id       : AuthenticAMD
> > cpu family      : 15
> > model           : 31
> > model name      : AMD Athlon(tm) 64 Processor 3200+
> > stepping        : 0
> > cpu MHz         : 2000.108
> > cache size      : 512 KB
> > fpu             : yes
> > fpu_exception   : yes
> > cpuid level     : 1
> > wp              : yes
> > flags           : fpu vme de pse tsc msr pae mce cx8 apic=20
> sep mtrr pge mca
> > cmov pat pse36 clflush mmx fxsr sse sse2 pni syscall nx mmxext=20
> > fxsr_opt lm 3dnowext 3dnow
> > bogomips        : 3915.77
> > TLB size        : 1024 4K pages
> > clflush size    : 64
> > cache_alignment : 64
> > address sizes   : 40 bits physical, 48 bits virtual
> > power management: ts fid vid ttp
> >
> > built with gcc:
> > # gcc --version
> > gcc (GCC) 3.4.3-20050110 (Gentoo Linux 3.4.3.20050110-r2,=20
> > ssp-3.4.3.20050110-0, pie-8.7.7)
> >
> > system is running in native x86_64 mode.
> >
> > Michal
> >
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@lists.linux.org.uk=20
> > http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk=20
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20
>=20
