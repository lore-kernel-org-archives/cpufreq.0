From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Re: powernow-k8 problem
Date: Sun, 14 Nov 2004 18:19:21 +0000
Message-ID: <200411141819.21766.pytasz@lodz.home.pl>
References: <200411141859.32964.pytasz@lodz.home.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200411141859.32964.pytasz@lodz.home.pl>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: paul.devriendt@amd.com
Cc: cpufreq@www.linux.org.uk

Thank You very much for Your reply.
I have enabled debug, here is what I got:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8:    0 : fid 0x8, vid 0x6
powernow-k8:    1 : fid 0x0, vid 0x18
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8: cpu0, init lo 0x408, hi 0x1
powernow-k8: policy current frequency 1600000 kHz
powernow-k8: cpu_init done, current fid 0x8, vid 0x4
powernow-k8: targ: cpu 0, 1600000 kHz, min 800000, max 1600000, relation 1
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1600000 kHz, min 800000, max 1600000, relation 1
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed

About enabling ACPI processor support, did You mean doing it in BIOS? I can=
not=20
find such an option there (I have some strange phoenix bios with hardly any=
=20
options to set). Anyway, I have compiled ACPI processor into my kernel.

Thanks again for replay and thanks in advance for further suggestions,
Best regards,
Michal

> My guess would be that the BIOS provided data that the driver is
> using is incorrect. The driver is attempting to increase the
> voltage beyond where it would normally need to go, which would
> imply that the rvo (ramp voltage offset) value is wrong. However,
> this is a guess, I am far from certain. To help verify this,
> you would need to build the driver for debug (edit the .c file
> and add #define DEBUG before the include of the powernow-k8.h
> file). Then it will spew tons more data which will be useful.
>
> Alternatively, try enabling the ACPI processor support on your
> machine, and see if that works. The driver can use different
> sources of data, and the ACPI data may be correct.
>
> Paul.
>
> > -----Original Message-----
> > From: cpufreq-bounces@www.linux.org.uk
> > [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Michal Pytasz
> > Sent: Sunday, November 14, 2004 5:14 AM
> > To: cpufreq@www.linux.org.uk
> > Subject: powernow-k8 problem
> >
> > Hello,
> >
> > I got this address form gentoo users forum, I have problem
> > with mobile sempron
> > 2800+ based laptop using k8n800 via chipset (Acer Aspire 1362).
> > I have 2.6.9 kernel (problem occurs with gentoo patched
> > sources as well as
> > with plain sources from gentoo.org). I'm using gcc 3.4.2.
> >
> > On modprobe I get (in dmesg):
> > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors
> > (version 1.00.09b)
> > powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> > powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
> > powernow-k8: cpu_init done, current fid 0x8, vid 0x4
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed
> > powernow-k8: vid trans failed, vid 0x3, curr 0x4
> > powernow-k8: transition frequency failed curr
> >
> > Of course cpu frequency and voltage are not changed. I tried
> > getting some more
> > debug messages, I noticed, that fid is attempted to be
> > properly set to 0x0
> > (or 0x1 depending on cpu load, I tried to use powernowd for
> > this purpose).
> > IMHO vid should be set to 0x18 could it be impropperly read
> > (as 0x3) from some
> > table? How could I verify it ?
> >
> > Forum members in forums.gentoo.org suggested upgrading bios,
> > but there is no
> > newer version available  on acer website (Actualy there is
> > absolutely no bios
> > available on the website for this laptop, maybe it's not old enough).
> >
> > If I am writting to some list is it possible to subscribe to
> > it (to see an
> > answer)? I could not find any information on www.linux.org.uk
> >
> > I can provide supplementary information if requested. Is
> > there a possibility
> > to use different source of tables? I could not find any
> > module parameters.
> > Thanks in advance for all suggestions, especially if I am
> > doing something
> > worng getting it to work.
> >
> > Micha=B3
> >
> > P.S. Since mobile sempron has k8 powernow I tried setting cpu
> > type to K7 as
> > well as to K8, none was successful.
>
> -------------------------------------------------------
