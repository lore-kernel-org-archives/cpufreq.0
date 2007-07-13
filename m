From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Allow ondemand and conservative cpufreq governors to
	be used as default
Date: Fri, 13 Jul 2007 01:32:05 -0400
Message-ID: <20070713053205.GC28641@redhat.com>
References: <1183038223.4249.182.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1183038223.4249.182.camel@queen.suse.de>
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
Content-Type: text/plain; charset="utf-8"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Thu, Jun 28, 2007 at 03:43:43PM +0200, Thomas Renninger wrote:
 > Hi Venkatesh,
 > 
 > do you give me your ack/signed off for this one?
 > 
 > Runtime tested to load ondemand and to fallback to performance
 > governor (by faking the transition latency of the driver) on x86_64.

I couldn't even get this to build with defconfig, which doesn't inspire confidence..

defconfig x86-64 creates..

CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set

and the build fails thus ..

drivers/cpufreq/cpufreq.c: In function ‘__cpufreq_governor’:
drivers/cpufreq/cpufreq.c:1495: error: expected ‘)’ before ‘;’ token
drivers/cpufreq/cpufreq.c:1495: warning: format ‘%s’ expects type ‘char
*’, but argument 3 has type ‘struct cpufreq_governor *’

line 1495 is ..

1488         if (policy->governor->max_transition_latency &&
1489             policy->cpuinfo.transition_latency >
1490             policy->governor->max_transition_latency) {
1491                 printk(KERN_WARNING "%s governor failed, too long"
1492                        " transition latency of HW, fallback"
1493                        " to %s governor\n",
1494                        policy->governor->name,
1495                        CPUFREQ_PERFORMANCE_GOVERNOR->name);
1496                 policy->governor = CPUFREQ_PERFORMANCE_GOVERNOR;
1497         }

CPUFREQ_PERFORMANCE_GOVERNOR is defined as ..

#define CPUFREQ_PERFORMANCE_GOVERNOR    &cpufreq_gov_performance;

which clearly isn't going to work.  Changing it to ..

#define CPUFREQ_PERFORMANCE_GOVERNOR    (&cpufreq_gov_performance)

gets it building again.
Looks like the conservative define a few lines down might have the same issue.

I'm going to drop this for now and turn in for the night, but if you can
get me an updated patch against cpufreq-git that's been tested in a few
more configurations, I'll see if I can get it with the next batch that
goes to Linus sometime soon before the merge window closes.

Thanks,

	Dave

-- 
http://www.codemonkey.org.uk
