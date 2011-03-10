From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 12:47:32 GMT
Message-ID: <201103101247.p2AClWjI018986@demeter2.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #19 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-10 12:47:32 ---
So with my 2.6.32 compiled without TSC (CONFIG_X86_TSC undefined) but with
ACPI_PROCESSOR=m and running without the "processor.max_cstate=1" command line
parameter, here are the results :

-----------------------------------------------------------------------------

$  ls  /proc/acpi/processor/*/power
/proc/acpi/processor/CPU0/power

$ cat /proc/acpi/processor/*/power
active state:            C0
max_cstate:              C8
maximum allowed latency: 2000000000 usec
states:
    C1:                  type[C1] promotion[--] demotion[--] latency[000]
usage[00002176] duration[00000000000000000000]
    C2:                  type[C2] promotion[--] demotion[--] latency[090]
usage[00020235] duration[00000000001322893600]

-----------------------------------------------------------------------------

$ for x in `ls /sys/devices/system/cpu/cpu*/cpuidle/state*/*` ; do echo $x ;
cat $x ; done

/sys/devices/system/cpu/cpu0/cpuidle/state0/desc
CPUIDLE CORE POLL IDLE
/sys/devices/system/cpu/cpu0/cpuidle/state0/latency
0
/sys/devices/system/cpu/cpu0/cpuidle/state0/name
C0
/sys/devices/system/cpu/cpu0/cpuidle/state0/power
4294967295
/sys/devices/system/cpu/cpu0/cpuidle/state0/time
0
/sys/devices/system/cpu/cpu0/cpuidle/state0/usage
0
/sys/devices/system/cpu/cpu0/cpuidle/state1/desc
<null>
/sys/devices/system/cpu/cpu0/cpuidle/state1/latency
0
/sys/devices/system/cpu/cpu0/cpuidle/state1/name
C1
/sys/devices/system/cpu/cpu0/cpuidle/state1/power
0
/sys/devices/system/cpu/cpu0/cpuidle/state1/time
1704275
/sys/devices/system/cpu/cpu0/cpuidle/state1/usage
2178
/sys/devices/system/cpu/cpu0/cpuidle/state2/desc
<null>
/sys/devices/system/cpu/cpu0/cpuidle/state2/latency
90
/sys/devices/system/cpu/cpu0/cpuidle/state2/name
C2
/sys/devices/system/cpu/cpu0/cpuidle/state2/power
0
/sys/devices/system/cpu/cpu0/cpuidle/state2/time
416769058
/sys/devices/system/cpu/cpu0/cpuidle/state2/usage
22022

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
