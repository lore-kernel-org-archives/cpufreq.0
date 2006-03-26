From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] kernel crash in powernow-k8 after lost ticks detected
Date: Sun, 26 Mar 2006 10:25:00 +0200
Message-ID: <20060326082500.GE8572@dominikbrodowski.de>
References: <441EB1990200007800013DB9@emea1-mh.id2.novell.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <441EB1990200007800013DB9@emea1-mh.id2.novell.com>
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
Content-Transfer-Encoding: 7bit
To: Jan Beulich <jbeulich@novell.com>
Cc: Pavel Machek <pavel@suse.de>, cpufreq@lists.linux.org.uk, mark.langsdorf@amd.com, davej@redhat.com

Hi,

On Mon, Mar 20, 2006 at 02:43:52PM +0100, Jan Beulich wrote:
> Since powernowk8_cpu_init() gets called only for one of the two cores (the
> other one is in the same policy set and hence cpufreq_add_dev() prevents the
> call), calling other functions, namely powernowk8_get(), one CPUs that haven't
> been initialized will yield a NULL from the respective powernow_data[] slot. In
> the specific case, the problem occured after the system detected some lost
> ticks and called cpufreq_get() for all CPUs.
> While I can imagine more sophisticated fixes for this (it namely seems
> questionable whether calling the init routines not on all CPUs, or, if that's
> necessary, whether not properly setting up the data pointers for all affected
> CPUs in powernow-k8 is okay), below simple change seems to address the
> problem (the other hunk is to make a message more meaningful).

cpufreq_driver->get() can get called for _any_ CPU -- that's the semantics
of that funciton, which I would not want to be changed. Therefore I prefer
the patch by Andi which fixes powernow-k8.c and which is in Linus' git tree
by now.

Thanks,
	Dominik
