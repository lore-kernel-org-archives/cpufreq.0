From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 19:38:15 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705051932210.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
 <200705042320.41278.dj@david-web.co.uk> <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
 <463C18C4.7030304@interia.pl> <Pine.LNX.4.61.0705051114130.18504@yvahk01.tjqt.qr>
 <463C9070.7020007@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934126AbXEERkU@vger.kernel.org>
In-Reply-To: <463C9070.7020007@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: David Johnson <dj@david-web.co.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org


On May 5 2007 16:10, Rafa=C5=82 Bilski wrote:
>
>>> Can You send output of x86info program and output of=20
>>=20
>> Where do I find this?
>
>http://www.codemonkey.org.uk/projects/x86info/
>It needs msr device support in kernel.

I just wonder why x86info says I have a C5XL while `modprobe longhaul`
says it is a C5P.


cn:/dev/shm # ./x86info -v -v
x86info v1.20.  Dave Jones 2001-2006
=46eedback to <davej@redhat.com>.

=46ound 1 CPU
-----------------------------------------------------------------------=
---
=46amily: 6 Model: 9 Stepping: 8
CPU Model : VIA C3 (Nehemiah) [C5XL]
=46eature flags:
        Onboard FPU
        Virtual Mode Extensions
        Debugging Extensions
        Page Size Extensions
        Time Stamp Counter
        Model-Specific Registers
        CMPXCHG8 instruction
        Memory Type Range Registers
        Page Global Enable
        CMOV instruction
        Page Attribute Table
        MMX support
        FXSAVE and FXRESTORE instructions
        SSE support

Extended feature flags:
 [0] RNGp RNGe [4] ACEp ACEe
Cache info
 L1 Instruction cache: 64KB, 4-way associative, 1 lines per tag, line s=
ize=3D32
bytes.
 L1 Data cache: 64KB 4-way associative, 1 lines per tag, line size=3D32=
 bytes.
 L2 (on CPU) cache: 64KB 8-way associative, 1 lines per tag, line size=3D=
32
bytes.
TLB info
 Instruction TLB: 8-way associative. 128 entries.
 Data TLB: 8-way associative. 128 entries.

(Without -v it's:)
=46eature flags:
 fpu vme de pse tsc msr cx8 mtrr pge cmov pat mmx fxsr sse


cn:/dev/shm # cat /proc/cpuinfo=20
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 9
model name      : VIA Nehemiah
stepping        : 8
cpu MHz         : 731.000
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr cx8 mtrr pge cmov pat mmx fxsr=
 sse up
rng rng_en ace ace_en
bogomips        : 1468.17
clflush size    : 32


And the BIOS announces it as a "Via Eden ESP 6000" (as does the manufac=
turer).



Jan
--=20
