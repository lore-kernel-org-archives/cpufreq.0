From: Wes Felter <wesley@felter.org>
Subject: Re: CPU throttling & power conservation expectations
Date: Wed, 28 Mar 2007 11:27:53 -0500
Message-ID: <eue52c$rrd$1@sea.gmane.org>
References: <33887.72.165.61.226.1175027715.squirrel@webmail.linuxpowered.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

nate wrote:

> kernels were primarily 2.6.17-1.2142_FC4smp. I used the
> p4-clockmod and cpufreq_powersave modules. cpufreq-info
> reported that the cpus were successfully clocked down to
> the ~300-400mhz range(forgot exactly what speed).
> 
> I expected at least some reduction in power usage, but
> to my suprise my intelligent power strips did not report
> even 0.1 amps(@110V) worth of power savings.

This is not too surprising; the p4-clockmod driver is mostly useless. 
When the processor is idle, most of it is clock gated (effectively 0 
MHz) anyway, so reducing the frequency makes no difference. Under high 
load p4-clockmod should reduce power a little.

Wes Felter - wesley@felter.org
