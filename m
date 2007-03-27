From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: CPU throttling & power conservation expectations
Date: Tue, 27 Mar 2007 15:54:30 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDFD96798@SAUSEXMB1.amd.com>
References: <33887.72.165.61.226.1175027715.squirrel@webmail.linuxpowered.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <33887.72.165.61.226.1175027715.squirrel@webmail.linuxpowered.net>
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
To: nate <cpufreq@linuxpowered.net>, cpufreq@lists.linux.org.uk

> kernels were primarily 2.6.17-1.2142_FC4smp. I used the
> p4-clockmod and cpufreq_powersave modules. cpufreq-info
> reported that the cpus were successfully clocked down to
> the ~300-400mhz range(forgot exactly what speed).

p4-clockmod throttles the clock frequency but doesn't
adjust the processor voltage.  You should be using the
speedstep-centrino or acpi drivers.
=20
> I expected at least some reduction in power usage, but
> to my suprise my intelligent power strips did not report
> even 0.1 amps(@110V) worth of power savings.

Shouldn't power utilization be measured in watts, not
amps?  My electrical engineering classes were a long
time ago.

I've observed a dual-processor Opteron system pulling=20
150 watts from the wall at full frequency and voltage,
and then dropping to 75 watts at a lower pstate.  We
did this as a demo at Linux World Expo in 2004.

Also see Paul Devriendt's paper on the same:
http://www.linuxsymposium.org/proceedings/LinuxSymposium2004_V1.pdf

-Mark Langsdorf
Operating System Research Center
AMD, Inc.
