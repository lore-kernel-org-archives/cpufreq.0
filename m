From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 problem
Date: Sun, 14 Nov 2004 10:31:39 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84301539C23@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
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
To: =?iso-8859-2?Q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>, cpufreq@www.linux.org.uk

My guess would be that the BIOS provided data that the driver is
using is incorrect. The driver is attempting to increase the
voltage beyond where it would normally need to go, which would
imply that the rvo (ramp voltage offset) value is wrong. However,
this is a guess, I am far from certain. To help verify this,
you would need to build the driver for debug (edit the .c file
and add #define DEBUG before the include of the powernow-k8.h
file). Then it will spew tons more data which will be useful.

Alternatively, try enabling the ACPI processor support on your
machine, and see if that works. The driver can use different
sources of data, and the ACPI data may be correct.

Paul.=20

> -----Original Message-----
> From: cpufreq-bounces@www.linux.org.uk=20
> [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Michal Pytasz
> Sent: Sunday, November 14, 2004 5:14 AM
> To: cpufreq@www.linux.org.uk
> Subject: powernow-k8 problem
>=20
> Hello,
>=20
> I got this address form gentoo users forum, I have problem=20
> with mobile sempron=20
> 2800+ based laptop using k8n800 via chipset (Acer Aspire 1362).
> I have 2.6.9 kernel (problem occurs with gentoo patched=20
> sources as well as=20
> with plain sources from gentoo.org). I'm using gcc 3.4.2.
>=20
> On modprobe I get (in dmesg):
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.00.09b)
> powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
> powernow-k8: cpu_init done, current fid 0x8, vid 0x4
> powernow-k8: vid trans failed, vid 0x3, curr 0x4
> powernow-k8: transition frequency failed
> powernow-k8: vid trans failed, vid 0x3, curr 0x4
> powernow-k8: transition frequency failed curr
>=20
> Of course cpu frequency and voltage are not changed. I tried=20
> getting some more=20
> debug messages, I noticed, that fid is attempted to be=20
> properly set to 0x0=20
> (or 0x1 depending on cpu load, I tried to use powernowd for=20
> this purpose).
> IMHO vid should be set to 0x18 could it be impropperly read=20
> (as 0x3) from some=20
> table? How could I verify it ?=20
>=20
> Forum members in forums.gentoo.org suggested upgrading bios,=20
> but there is no=20
> newer version available  on acer website (Actualy there is=20
> absolutely no bios=20
> available on the website for this laptop, maybe it's not old enough).
>=20
> If I am writting to some list is it possible to subscribe to=20
> it (to see an=20
> answer)? I could not find any information on www.linux.org.uk
>=20
> I can provide supplementary information if requested. Is=20
> there a possibility=20
> to use different source of tables? I could not find any=20
> module parameters.=20
> Thanks in advance for all suggestions, especially if I am=20
> doing something=20
> worng getting it to work.=20
>=20
> Micha=B3
>=20
> P.S. Since mobile sempron has k8 powernow I tried setting cpu=20
> type to K7 as=20
> well as to K8, none was successful.
>=20
