From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8243] New: Problem with Throttling and CPU power state
Date: Wed, 21 Mar 2007 00:59:17 -0700
Message-ID: <200703210759.l2L7xHSw009676@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8243

           Summary: Problem with Throttling and CPU power state
    Kernel Version: 2.6.20.3
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: akolisek@linuxx.hyperlinx.cz


Most recent kernel where this bug did *NOT* occur:2.6.20.3
Distribution: Slackware Linux 11 (current)
Hardware Environment: Lenovo 3000 C100 (Pentium M 1.7GHz Dothan)

Problem Description:

Hi,
 i have some problems with CPU Throttling and power states of my CPU.

I get this report...CPU rest

cat /proc/acpi/processor/CPU0/power

active state:            C4
max_cstate:              C8
bus master activity:     00000000
maximum allowed latency: 2000 usec
states:
    C1:                  type[C1] promotion[C2] demotion[--] latency[001]
usage[00000010] duration[00000000000000000000]
    C2:                  type[C2] promotion[C3] demotion[C1] latency[001]
usage[00502851] duration[00000000000275479975]
    C3:                  type[C3] promotion[C4] demotion[C2] latency[085]
usage[00000431] duration[00000000000001178354]
   *C4:                  type[C3] promotion[--] demotion[C3] latency[185]
usage[00053417] duration[00000000000142463775]

It should be ok...but...

when i start...for example...kernel compilation...state of my busy CPU is this:

active state:            C2
max_cstate:              C8
bus master activity:     80000001
maximum allowed latency: 2000 usec
states:
    C1:                  type[C1] promotion[C2] demotion[--] latency[001]
usage[00000010] duration[00000000000000000000]
   *C2:                  type[C2] promotion[C3] demotion[C1] latency[001]
usage[00576754] duration[00000000000315228566]
    C3:                  type[C3] promotion[C4] demotion[C2] latency[085]
usage[00004034] duration[00000000000009452622]
    C4:                  type[C3] promotion[--] demotion[C3] latency[185]
usage[00099626] duration[00000000000262585789]

My question is this:

Why my CPU is not in C1 state, when works on 100%? And where is C0 state?

I have problems with Throttling function too. 

my command: echo -n 4 > /proc/acpi/processor/CPU0/throttling 

state T4 is activated, but only a few seconds and then it goes back to T0. Is
this ok?
I heard, that Throttling is active only in C0 state.

my CPU power management:
CPU Frequency scaling
ondemand gowernor
ACPI Processor P-State driver
Intel Enhanced SpeedStep

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
