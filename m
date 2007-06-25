From: "Phil Endecott" <phil_fvnqz_endecott@chezphil.org>
Subject: Re: Power measurements
Date: Mon, 25 Jun 2007 10:10:51 +0100
Message-ID: <1182762651706@dmwebmail.belize.chezphil.org>
References: <467F633B.3000909@interia.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <467F633B.3000909@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cpufreq@lists.linux.org.uk

Rafa=C2=B3 Bilski wrote:
>>> % dmesg | grep eps=20
>>=20
>> Thanks, yes, I found this after I posted my last message.  Apparently it
>> should use 860 mV at 1.2 GHz and 844 mV at 400 MHz.
>>=20
> Most C7-Eden CPU's have same voltage on=20
> high and low frequency. Looks like Your's has different voltages. If=20
> You don't see 844mV at 400MHz then probably VID pins aren't connected=20
> to VRM on motherboard.
> Mode	MHz		Voltage (mV)	Power (W)
> P0	1200		860		7
> P1	400		844		3

May I ask where these numbers come from?

>> My aim is to make this machine as
>> power-efficient as possible, which I've achieved mainly by working on
>> the PSU (the first one I had was < 40% efficient, now I'm up to about
>> 70%), and by using a solid-state disk.  It's getting increasingly
>> difficult to find things to improve!
> Newer PSU's should have 80%-85% efficiency. But 70% isn't that bad.

Don't believe that until you've measured it.
The numbers that they advertise are always in the best conditions,=20
which is normally maximum load.  If you operate it in different=20
conditions the performance will be worse.  For example, the power=20
supply that is giving me 70% efficiency advertises itself as having=20
>80% efficiciency.

> You should probably poke some registers in northbridge. I don't=20
> know much about newer VIA chipsets, but older (CLE266) had many bits=20
> which could improve power savings - dynamic clock stop to different=20
> chipset components, ACPI C3 can put memory to sleep and so on.=20
> Unfortunatly these bits are disabled by default and are never touched=20
> by BIOS.

Is there any documentation available for any of this?
Hmmm, I really should learn something about ACPI.

> Btw. Can You benchmark Your's C7 for me? I would like to compare it to=20
> my P4-M which is eating much more power. I'm not sure how much exacly=20
> because I had to change FSB frequency, but something about 25W.
> Maybe "nbench"?

Here is nbench for my Jetway J7F2 with VIA C7 @ 1.2G with the=20
'ondemand' governor:

BYTEmark* Native Mode Benchmark ver. 2 (10/95)
Index-split by Andrew D. Balsa (11/97)
Linux/Unix* port by Uwe F. Mayer (12/96,11/97)

TEST                : Iterations/sec.  : Old Index   : New Index
                     :                  : Pentium 90* : AMD K6/233*
--------------------:------------------:-------------:------------
NUMERIC SORT        :          354.96  :       9.10  :       2.99
STRING SORT         :          39.736  :      17.76  :       2.75
BITFIELD            :      1.1172e+08  :      19.16  :       4.00
FP EMULATION        :          46.664  :      22.39  :       5.17
FOURIER             :          2729.8  :       3.10  :       1.74
ASSIGNMENT          :          8.4321  :      32.09  :       8.32
IDEA                :          1042.5  :      15.94  :       4.73
HUFFMAN             :           525.7  :      14.58  :       4.66
NEURAL NET          :          4.7302  :       7.60  :       3.20
LU DECOMPOSITION    :           298.8  :      15.48  :      11.18
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3DORIGINAL BYTEMARK RESULTS=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
INTEGER INDEX       : 17.572
FLOATING-POINT INDEX: 7.148
Baseline (MSDOS*)   : Pentium* 90, 256 KB L2-cache, Watcom* compiler 10.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3DLINUX DATA BELOW=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CPU                 : CentaurHauls VIA Esther processor 1200MHz 1200MHz
L2 Cache            : 128 KB
OS                  : Linux 2.6.21-1-686
C compiler          : gcc version 4.1.3 20070601 (prerelease) (Debian 4.1.2=
-12)
libc                : libc-2.5.so
MEMORY INDEX        : 4.507
INTEGER INDEX       : 4.295
FLOATING-POINT INDEX: 3.964
Baseline (LINUX)    : AMD K6/233*, 512 KB L2-cache, gcc 2.7.2.3, libc-5.4.38
* Trademarks are property of their respective holder.

The results for 'performance' are

INTEGER INDEX       : 17.530
FLOATING-POINT INDEX: 7.157

i.e. essentially the same.  For 'powersave' (400 MHz) the results are:

INTEGER INDEX       : 5.828
FLOATING-POINT INDEX: 2.379

which is almost exactly 1/3 of the speed.

For comparison a 1 GHz C3 gives:

INTEGER INDEX       : 13.785
FLOATING-POINT INDEX: 5.219

Comparing the C3 and the C7, the C7 gives 14.61 integer-index per GHz=20
and the C3 gives 13.79 integer-index per GHz, so the C7 is 6% faster=20
per GHz.  For floating point it's 14% faster per GHz.  (I think my C3=20
probably has slower RAM, but I'm not sure about that.)


How does this compare with your Intel chip?


Regards,

Phil.
