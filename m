From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 15 Aug 2011 15:04:46 GMT
Message-ID: <201108151504.p7FF4ktP019983@demeter2.kernel.org>
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





--- Comment #55 from Thomas Renninger <trenn@suse.de>  2011-08-15 15:04=
:25 ---
You could use
tools/power/x86/turbostat.c
from the latest mainline kernel and replace two lines:
print_counters(cnt_delta);
with
dump_cnt(cnt_delta);
and compare with/without turboboost.
You could also use tools/power/cpupower/ with debug option compile in
(Makefile) and the cpupower -d monitor -m Mperf
but this won't be that nicely formatted.

You may be able to disable turboboost at runtime via a MSR read, mask o=
ut a bit
and write the value back.
According to chapter:
14.3.2.2 OS Control of Opportunistic Processor Performance Operation
of Intel=C2=AE 64 and IA-32 Architectures Software Developer=E2=80=99s =
Manual Volume 3A
the bit is bit 32 (starting from 0) of the IA32_PERF_CTL MSR (0199H) MS=
R
register.
You have to make sure msr driver is compiled in or as module (modprobe =
msr)
then you can use msr-tools:
rdmsr 0x199
will show you the 64 bit register.
If you boot with turboboost enabled you find bit 32 set otherwise unset=
=2E
If I haven't overseen something you can enable/disable turbo mode via:
IA32_PERF_CTL=3D`rdmsr 0x199`
# disable
wrmsr -a 0x199 $((~(1 << 32) & $IA32_PERF_CTL))
# enable
wrmsr -a 0x199 $(((1 << 32) | $IA32_PERF_CTL))
-a option only exists in latest msr-tools git version which can be foun=
d here:
git://git.kernel.org/pub/scm/utils/cpu/msr-tools/msr-tools.git

Something to play with..., hopefully you find out something pointing to=
 the
root cause...

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are on the CC list for the bug.