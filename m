From: Dave Jones <davej@redhat.com>
Subject: Re: cpu frequency governor regression (?)
Date: Wed, 12 Dec 2007 12:30:01 -0500
Message-ID: <20071212173001.GA18973@redhat.com>
References: <1197399165.2214.15.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1197399165.2214.15.camel@johannes.berg>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linuxppc-dev list <linuxppc-dev@ozlabs.org>, linux-pm <linux-pm@lists.linux-foundation.org>, cpufreq <cpufreq@lists.linux.org.uk>

On Tue, Dec 11, 2007 at 07:52:45PM +0100, Johannes Berg wrote:
 > Hi,
 > 
 > No idea who to bother with this and maybe it's just a
 > misconfiguration... Apologies if my guesses are totally wrong.
 > 
 > I'm currently on 2.6.24-rc3 (+wireless-2.6#everything) but couldn't find
 > any patches between that and 2.6.24-rc5 that seemed relevant.
 > 
 > On my quad powermac, I'm seeing the cpufreq governor changed by a
 > hibernation cycle. My default governor is "userspace", which is driven
 > by powernowd (because the latency is too high "ondemand" doesn't like my
 > machine) but after a hibernation cycle I'm having the governor set to
 > "performance".

bizarre. It should default back to whatever CONFIG_CPU_FREQ_DEFAULT_* option
was set.  (Arguably a bug in itself, as we don't track & restore them
on resume, so if you changed from the default after booting: splat)

Why you're getting the performance governor is puzzling though.
Can you enable CONFIG_CPU_FREQ_DEBUG=y, and boot with cpufreq.debug=7
and send the log from a transition across hibernate?

Also, does /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 
have performance in *all* the cpus?

	Dave

-- 
http://www.codemonkey.org.uk
