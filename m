From: =?iso-8859-2?q?Micha=B3_Pytasz?= <mpytasz@pai.net.pl>
Subject: Re: [PATCH] dual-core powernow-k8
Date: Tue, 3 May 2005 09:48:41 +0200
Message-ID: <200505030948.41565.mpytasz@pai.net.pl>
References: <84EA05E2CA77634C82730353CBE3A84301CFBFBC@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ZzydC4LTcyjWYMs"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFBFBC@SAUSEXMB1.amd.com>
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
To: cpufreq@lists.linux.org.uk

--Boundary-00=_ZzydC4LTcyjWYMs
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

On Tuesday 03 of May 2005 02:11, you wrote:
> Do you have your kernel compiled for uniprocessor or SMP
> operation?  I can't reproduce the issue on my laptop (HP3000z)
> in uniprocessor mode.

It is compiled for uniprocesor, I'm attaching my kernel config. I've notice=
d=20
one more thing. When I'm using userspace (instead of ondemand) govenor and=
=20
powernowd the frequency gets changed, however I also get in dmesg (with one=
=20
new message):

powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ph2 null fid transition 0xa
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ph2 null fid transition 0xa
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ph2 null fid transition 0xa <- This is new...

as if not all transition attempts were successful.
I don't know if it is important at the moment, but I have stability issues=
=20
with the old driver. (Well I even changed memory recently thinking it was=20
causing problems, had one Hynix 512/PC3200 module, have Kingston 1G Dual=20
channel set). I guess it was happening on frequency transition from low to=
=20
high, but I'm unable to provide log since the behaviour is not fully=20
repeatable, sometimes it works stable, sometimes it hangs or reboots on log=
in=20
with no logged information.

So far I have not attached mainboard infomation, I haven't thought it could=
 be =20
important, it's MSI K8T Neo2 (MS6702E).

Michal

>
> -Mark Langsdorf
> AMD, Inc.
>
> > -----Original Message-----
> > From: cpufreq-bounces@lists.linux.org.uk
> > [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Michal Pytasz
> > Sent: Monday, May 02, 2005 4:49 PM
> > To: cpufreq@lists.linux.org.uk
> > Subject: Re: [PATCH] dual-core powernow-k8
> >
> >
> > Hi,
> >
> > I know it's quite silly to reply to own posts, however I
> > wanted to add more
> > information to what is written below:
> >
> > One change to 1000MHz was successful, than frequency (on
> > demand) changed to
> > 2000, after that no changes are possible.
> >
> > Michal
> >
> > On Monday 02 of May 2005 23:16, Micha=B3 Pytasz wrote:
> > > Hi,
> > >
> > > On Monday 02 of May 2005 21:23, Langsdorf, Mark wrote:
> > > > With the release of the dual-core AMD Opterons last week,
> >
> > it's high
> >
> > > > time that cpufreq supported them.  The attached patch applies
> > > > cleanly to 2.6.12-rc3 and updates powernow-k8 to support
> >
> > the latest
> >
> > > > Athlon 64 and Opteron processors.
> > > >
> > > > Update the driver to version 1.40.0 and provide support
> > > > for dual-core processors.
> > > >
> > > > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
> > > >
> > > > -Mark Langsdorf
> > > > AMD, Inc.
> > >
> > > I just tried applying patch against 2.6.11.8, well it builds fine,
> > > however when I try to use it (Athlon64 3200+ s939) I get:
> > >
> > > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors
> >
> > (version 1.40.0)
> >
> > > powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> > > powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
> > > powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
> > > Losing some ticks... checking if CPU frequency changed.
> >
> > cpu_init done,
> >
> > > current fid 0xc, vid 0x6
> > >
> > > which looks quite fine, but after ondemand govenor is started:
> > >
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > > powernow-k8: transition frequency failed
> > > powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> > > powernow-k8: transition frequency failed
> > >
> > > and so on.
> > >
> > > Here is my cpuinfo (when I see above):
> > >
> > > # cat /proc/cpuinfo
> > > processor       : 0
> > > vendor_id       : AuthenticAMD
> > > cpu family      : 15
> > > model           : 31
> > > model name      : AMD Athlon(tm) 64 Processor 3200+
> > > stepping        : 0
> > > cpu MHz         : 2000.108
> > > cache size      : 512 KB
> > > fpu             : yes
> > > fpu_exception   : yes
> > > cpuid level     : 1
> > > wp              : yes
> > > flags           : fpu vme de pse tsc msr pae mce cx8 apic
> >
> > sep mtrr pge mca
> >
> > > cmov pat pse36 clflush mmx fxsr sse sse2 pni syscall nx mmxext
> > > fxsr_opt lm 3dnowext 3dnow
> > > bogomips        : 3915.77
> > > TLB size        : 1024 4K pages
> > > clflush size    : 64
> > > cache_alignment : 64
> > > address sizes   : 40 bits physical, 48 bits virtual
> > > power management: ts fid vid ttp
> > >
> > > built with gcc:
> > > # gcc --version
> > > gcc (GCC) 3.4.3-20050110 (Gentoo Linux 3.4.3.20050110-r2,
> > > ssp-3.4.3.20050110-0, pie-8.7.7)
> > >
> > > system is running in native x86_64 mode.
> > >
> > > Michal
> > >
> > > _______________________________________________
> > > Cpufreq mailing list
> > > Cpufreq@lists.linux.org.uk
> > > http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@lists.linux.org.uk
> > http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_ZzydC4LTcyjWYMs
Content-Type: application/x-zip; charset="iso-8859-2";
	name="2611_gentoo_5th.zip"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="2611_gentoo_5th.zip"

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

--Boundary-00=_ZzydC4LTcyjWYMs
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_ZzydC4LTcyjWYMs--

