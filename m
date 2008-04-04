From: "Gaurav Dhiman" <dimanuec@gmail.com>
Subject: Unexpected behavior while using "Userspace" governor
Date: Fri, 4 Apr 2008 14:35:09 -0700
Message-ID: <5bd3c56f0804041435x29c422fdl26c9ed49c9612495@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk

Hello All,

I am running Linux 2.6.24 on my Intel Quad Core Xeon based machine
with cpufreq enabled. The scaling driver being used is acpi-cpufreq. I
want to perform some experiments with the CPU running statically at
different frequencies. To accomplish that I first of all stop
powernowd, switch the governor to userspace, and then scale the
frequency using scaling_setspeed in the /sys interface of cpufreq.

All this seems to change the frequency (as displayed by
cpuinfo_cur_freq), however when I run some workload, it sometimes
bumps up the frequency to the maximum (2.66GHz for my machine) in
between. It happens intermittently and I confirmed this by running a
background shell script, which collects statistics on the CPU
frequency, while the workload is running. This happens only when I run
some intensive workload. Normally it stays at the frequency that is
set using scaling_setspeed.

I am failing to understand why this should happen with a userspace
governor. I have done similar experiments on other machines, but have
never encountered such a problem. Is there some daemon (other than
powernowd), which is also accessing the cpufreq subsystem? If anyone
can point out what could be the potential reason, it would be really
helpful.

Thanks in advance,
-Gaurav
