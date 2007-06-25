From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Power measurements
Date: Mon, 25 Jun 2007 19:55:23 +0200
Message-ID: <4680018B.9010902@interia.pl>
References: <467F633B.3000909@interia.pl>
	<1182762651706@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1182762651706@dmwebmail.belize.chezphil.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-9"
To: Phil Endecott <phil_fvnqz_endecott@chezphil.org>
Cc: cpufreq@lists.linux.org.uk

>>>> % dmesg | grep eps=20
>>>
>>> Thanks, yes, I found this after I posted my last message.  Apparently it
>>> should use 860 mV at 1.2 GHz and 844 mV at 400 MHz.
>>>
>> Most C7-Eden CPU's have same voltage on high and low frequency. Looks
>> like Your's has different voltages. If You don't see 844mV at 400MHz
>> then probably VID pins aren't connected to VRM on motherboard.
>> Mode    MHz        Voltage (mV)    Power (W)
>> P0    1200        860        7
>> P1    400        844        3
>=20
> May I ask where these numbers come from?
ACPI tables.
> [...]
>> You should probably poke some registers in northbridge. I don't know
>> much about newer VIA chipsets, but older (CLE266) had many bits which
>> could improve power savings - dynamic clock stop to different chipset
>> components, ACPI C3 can put memory to sleep and so on. Unfortunatly
>> these bits are disabled by default and are never touched by BIOS.
>=20
> Is there any documentation available for any of this?
No. All datasheets are NDA protected. However You can find in Google=20
datasheets for older chips.
> Hmmm, I really should learn something about ACPI.
Well, ACPI C3 isn't available anyway due to VIA's policy. Check=20
"/proc/acpi/processor/CPU0/power" file for supported C states. There is=20
almost no difference in power consumption between ACPI C1 and C2.
>> [...]
>=20
> Here is nbench for my Jetway J7F2 with VIA C7 @ 1.2G with the 'ondemand'
> governor:
Asrock P4S61 with P4-M @ 1,2GHz (12x100MHz) @ 1,3V. Without cpufreq.
Note that P4-M is starting in "battery optimized mode" which means x12=20
multiplier. I'm not able to change multiplier to x17 nor enable "Hyper=20
Threading" because Asrock says: "sorry, this motherboard isn't=20
supporting P4-M". All I can do is to change FSB to 133MHz and have=20
1,6GHz (12x133MHz).
> BYTEmark* Native Mode Benchmark ver. 2 (10/95)
> Index-split by Andrew D. Balsa (11/97)
> Linux/Unix* port by Uwe F. Mayer (12/96,11/97)
>=20
> TEST                : Iterations/sec.  : Old Index   : New Index
>                     :                  : Pentium 90* : AMD K6/233*
> --------------------:------------------:-------------:------------
> NUMERIC SORT        :          354.96  :       9.10  :       2.99
NUMERIC SORT        :          425.52  :      10.91  :       3.58
> STRING SORT         :          39.736  :      17.76  :       2.75
STRING SORT         :          25.959  :      11.60  :       1.80
> BITFIELD            :      1.1172e+08  :      19.16  :       4.00
BITFIELD            :      1.4342e+08  :      24.60  :       5.14
> FP EMULATION        :          46.664  :      22.39  :       5.17
FP EMULATION        :          42.897  :      20.58  :       4.75
> FOURIER             :          2729.8  :       3.10  :       1.74
FOURIER             :          6879.9  :       7.82  :       4.39
> ASSIGNMENT          :          8.4321  :      32.09  :       8.32
ASSIGNMENT          :          11.601  :      44.14  :      11.45
> IDEA                :          1042.5  :      15.94  :       4.73
IDEA                :          1214.2  :      18.57  :       5.51
> HUFFMAN             :           525.7  :      14.58  :       4.66
HUFFMAN             :          465.84  :      12.92  :       4.13
> NEURAL NET          :          4.7302  :       7.60  :       3.20
NEURAL NET          :          10.503  :      16.87  :       7.10
> LU DECOMPOSITION    :           298.8  :      15.48  :      11.18
LU DECOMPOSITION    :           459.6  :      23.81  :      17.19
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3DORIGINAL BYTEMARK
> RESULTS=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> INTEGER INDEX       : 17.572
> FLOATING-POINT INDEX: 7.148
> Baseline (MSDOS*)   : Pentium* 90, 256 KB L2-cache, Watcom* compiler 10.0
INTEGER INDEX       : 18.267
FLOATING-POINT INDEX: 14.648
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3DLINUX DATA
> BELOW=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> CPU                 : CentaurHauls VIA Esther processor 1200MHz 1200MHz
> L2 Cache            : 128 KB
> OS                  : Linux 2.6.21-1-686
> C compiler          : gcc version 4.1.3 20070601 (prerelease) (Debian
> 4.1.2-12)
> libc                : libc-2.5.so
> MEMORY INDEX        : 4.507
> INTEGER INDEX       : 4.295
> FLOATING-POINT INDEX: 3.964
> Baseline (LINUX)    : AMD K6/233*, 512 KB L2-cache, gcc 2.7.2.3,
> libc-5.4.38
> * Trademarks are property of their respective holder.
CPU                 : GenuineIntel Mobile Intel(R) Pentium(R) 4 - M CPU 1.7=
0GHz 1203MHz
L2 Cache            : 512 KB
OS                  : Linux 2.6.22-rc4
C compiler          : 4.1.2
libc                :
MEMORY INDEX        : 4.727
INTEGER INDEX       : 4.436
FLOATING-POINT INDEX: 8.124
>=20
> [...]
>=20
> How does this compare with your Intel chip?
Intel seems to have some weak points. Sometimes it is faster. But at 1,2GHz=
=20
it needs *26,5W* and *10,7W* in ACPI C1. At 1,7GHz it needs *38,9W*. IMHO=20
VIA wins this round. I wish that C7-M for Socket478 would exists...
>=20
> Regards,
>=20
> Phil.
Regards
Rafa=B3


----------------------------------------------------------------------
Ile masz w domu niepotrzebnych rzeczy?
Wymien sie z sasiadami >> http://link.interia.pl/f1a93
