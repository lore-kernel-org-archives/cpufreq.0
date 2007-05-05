From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 20:23:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705052022460.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
	<200705042320.41278.dj@david-web.co.uk>
	<Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
	<463C18C4.7030304@interia.pl>
	<Pine.LNX.4.61.0705051114130.18504@yvahk01.tjqt.qr>
	<463C9070.7020007@interia.pl>
	<Pine.LNX.4.61.0705051932210.18504@yvahk01.tjqt.qr>
	<463CC735.9080709@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <463CC735.9080709@interia.pl>
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
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: David Johnson <dj@david-web.co.uk>, Wander Winkelhorst <w.winkelhorst@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 5 2007 20:04, Rafa=C5=82 Bilski wrote:
>
>> I just wonder why x86info says I have a C5XL while `modprobe longhaul`
>> says it is a C5P.
>I have changed names to names which VIA is using.=20
>>=20
>> cn:/dev/shm # ./x86info -v -v
>You need to be root and use -a option. I'm interested in:

x86info v1.20.  Dave Jones 2001-2006
Feedback to <davej@redhat.com>.

Found 1 CPU
MP Table:
#	APIC ID	Version	State		Family	Model	Step	Flags

--------------------------------------------------------------------------
eax in: 0x00000000, eax =3D 00000001 ebx =3D 746e6543 ecx =3D 736c7561 edx =
=3D 48727561
eax in: 0x00000001, eax =3D 00000698 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 0381b13f

eax in: 0x80000000, eax =3D 80000006 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000001, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000002, eax =3D 20414956 ebx =3D 6568654e ecx =3D 6861696d edx =
=3D 00000000
eax in: 0x80000003, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000004, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000005, eax =3D 00000000 ebx =3D 08800880 ecx =3D 40040120 edx =
=3D 40040120
eax in: 0x80000006, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00408120 edx =
=3D 00000000

eax in: 0xc0000000, eax =3D c0000001 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0xc0000001, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 000000dd

Family: 6 Model: 9 Stepping: 8
CPU Model : VIA C3 (Nehemiah) [C5XL]
Feature flags:
 fpu vme de pse tsc msr cx8 mtrr pge cmov pat mmx fxsr sse
Extended feature flags:
 [0] RNGp RNGe [4] ACEp ACEe
Cache info
 L1 Instruction cache: 64KB, 4-way associative, 1 lines per tag, line size=
=3D32 bytes.
 L1 Data cache: 64KB 4-way associative, 1 lines per tag, line size=3D32 byt=
es.
 L2 (on CPU) cache: 64KB 8-way associative, 1 lines per tag, line size=3D32=
 bytes.
TLB info
 Instruction TLB: 8-way associative. 128 entries.
 Data TLB: 8-way associative. 128 entries.
FCR: MSR: 0x00001107=3D0x9e3f1ad2 : 10011110 00111111 00011010 11010010
Power management: Powersaver
MSR: 0x0000110a=3D0x07ff0004000080f0 : 00000111 11111111 00000000 00000100
           00000000 00000000 10000000 11110000

 RevisionID: 0 : Initial revision (Software clock multiplier only, no SoftV=
ID)
 Software clock multiplier is disabled

750MHz processor (estimate).



>> And the BIOS announces it as a "Via Eden ESP 6000" (as does the manufact=
urer).
>
>Great. I think that I saw datasheet somewhere.

Oops, that should read *ESP 7000*. And s/manufacturer/vendor/.
The box is an Atiosys BA-4000 (www.atiosys.com) pretty much your
standard x86-in-a-tiny-box.


Jan
--=20
