From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29522] New: Unable to use any kind of frequency scaling
Date: Sun, 20 Feb 2011 07:51:39 GMT
Message-ID: <bug-29522-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29522

           Summary: Unable to use any kind of frequency scaling
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.38-rc5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: rbrito@ime.usp.br
        Regression: No


Hi.

I have a Pentium D 805 with a Gigabyte motherboard that is only able to=
 reduce
its speed with p4-clockmod and with the userspace governor (with the he=
lp of
the powernowd daemon controlling it), not with the ondemand/conservativ=
e (since
these modules say---correctly---that the latency is too high for them).

Since I see that p4-clockmod is frowned upon, I would like to get this =
fixed.

Is there anything that I could help with so that this could get fixed?


Thanks,

Rog=C3=A9rio Brito.


P.S.: Right now, I am compiling a new kernel (from Linus git tree, up-t=
o-date)
with the following change, just to see its behaviour:

--- a/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
@@ -244,7 +244,7 @@ static int cpufreq_p4_cpu_init(struct cpufreq_polic=
y
*policy)

        /* the transition latency is set to be 1 higher than the maximu=
m
         * transition latency of the ondemand governor */
-       policy->cpuinfo.transition_latency =3D 10000001;
+       policy->cpuinfo.transition_latency =3D 100000;
        policy->cur =3D stock_freq;

        return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_tabl=
e[0]);

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.