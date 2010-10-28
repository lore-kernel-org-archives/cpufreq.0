From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 28 Oct 2010 15:12:18 GMT
Message-ID: <201010281512.o9SFCIVa007628@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D19702





--- Comment #27 from Thomas Renninger <trenn@suse.de>  2010-10-28 15:12=
:08 ---
I expect acpi-cpufreq is fundamentally broken in respect to HW_ALL
coordination.
The only aspect acpi-cpufreq or cpufreq subsystem takes into account in=
 HW_ALL
case is to make sure that the same governor is running on all dependent=
 CPUs in
case CONFIG_HOTPLUG_CPU is set in .config.
Otherwise the dependent CPUs are only shown as "related" in sysfs, that=
's all.

The only thing which makes me wonder is: Why has this not come up earli=
er...

=46rom ACPI spec it's impossible to guess how OS should deal with HW_AL=
L.
Googling about it leads to this bug :) and one interesting discussion:
http://www.mail-archive.com/linux-acpi@vger.kernel.org/msg11682.html
-> adding Len and Rui into CC.
But from there it's also not 100% clear.

While SW_ALL is very clear, I could imagine the difference between HW_A=
LL and
SW_ANY is that the (MSR/HW) status registers may/may not get updated. O=
r that
HW may or may not transition the other core(s) into the same state and =
SW has
to re-evaluate (what would be rather stupid and SW_ALL algorithm should=
 apply
then).

Hmm, I found:
14.2 P-STATE HARDWARE COORDINATION
in
Intel=C2=AE 64 and IA-32 Architectures Software Developer=E2=80=99s Man=
ual
Volume 3A: System Programming Guide, Part 1

But the code in there is so poor.
Essentially it tells us to use aperf/mperf for switching decisions.
The part that aperf/mperf should get reset to 0, should vanish from thi=
s
document, it's possible to write an algorithm which can handle register
overflows, setting them back to zero is wrong.

And this comment there:
// This example does not cover the additional logic or algorithms
// necessary to coordinate multiple logical processors to a target P-st=
ate.
makes me wonder whether we also miss this additional logic in
acpi-cpufreq/ondemand.

The ondemand governor must know about the dependency and look at the
utilization of all dependent cores when doing decisions which is not th=
e case.
I expect Heinz and Peter get "half way correct" switching at about 52
up_threshold because they have two "related" cores.
Vyncere you have 4 dependent cores, if your core(s) are switched up wit=
h an
up_threshold of 25 I expect you see the same bug.

My patches or say workaround may help for Heinz's BIOS, it may not for =
others.
Also this must get fixed properly. For this some input from Intel peopl=
e would
be great how HW_ALL must get handled or better how it's done on Windows=
=2E

You could try to find out how your HW behave by not loading any cpufreq=
 driver,
get the msr-tools package and set the frequency on single cores manuall=
y and
then read out status MSR whether the dependent cores switched as well (=
question
is whether the status is true then, may be CPU specific and may have no=
thing to
do how the OS must implement HW_ALL algorithm).
The MSRs are:
#define MSR_IA32_PERF_STATUS 0x00000198    =20
#define MSR_IA32_PERF_CTL    0x00000199
You have to be careful that only 16 bits (0-15, cmp. with chapter 14.3.=
2.2 in
above mentioned document) are used when you write to PERF_CTL, you have=
 to read
out and keep the others and write them back as well.

Long story short (Provided my whole research for comments whether I hav=
e a
thinko):
HW_ALL is about taking aperf/mperf into account. We do not rely on BIOS=
, but
determine that already by reading out cpuid aperf/mperf capabilities of=
 the CPU
directly. Still the governor must consider all dependent cores which is
currently not the case and which is a major bug.
Question still is whether all cores (like SW_ALL) or only one core (lik=
e
SW_ANY) is enough to switch. SW_ALL should work for sure -> will provid=
e a
patch.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are on the CC list for the bug.