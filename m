From: "nate" <cpufreq@linuxpowered.net>
Subject: CPU throttling & power conservation expectations
Date: Tue, 27 Mar 2007 13:35:15 -0700 (PDT)
Message-ID: <33887.72.165.61.226.1175027715.squirrel@webmail.linuxpowered.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I've been on this list for about a week and have only seen
1 email from a human, wonder if anyone else is out there.

Anyways I had a quick question on using cpufreq to reduce
power usage by clocking the CPUs down.

I tested it out on a selection of about a half dozen
HP DL320G4s running Pentium D 3Ghz, which appear to be
the '925' model.

kernels were primarily 2.6.17-1.2142_FC4smp. I used the
p4-clockmod and cpufreq_powersave modules. cpufreq-info
reported that the cpus were successfully clocked down to
the ~300-400mhz range(forgot exactly what speed).

I expected at least some reduction in power usage, but
to my suprise my intelligent power strips did not report
even 0.1 amps(@110V) worth of power savings.

I did the same on a selection of HP DL360G4p systems
with Xeon 3.0-3.6Ghz, with similar results, no measurable
drop in power utilization, despite cpufreq saying that
the cpus were clocked down.

I was just wondering if this mirrors other people's
experiences or if something is broken.

I do notice of course that power usage goes up if I run
high loads on the systems. I was just expecting that
clocking a cpu from 3+Ghz down to sub 500mhz would show
some measurable amount of power savings, and if not then
there doesn't seem to be a lot of point in supporting
these CPUs.

We intend to migrate to a newer distribution soon and I can
try again on that kernel, but these systems are fairly
old as-is(especially the DL360G4s).

thanks!

nate
