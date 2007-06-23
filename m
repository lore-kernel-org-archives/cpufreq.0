From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpufreq_set_policy removed
Date: Sat, 23 Jun 2007 19:32:39 +0200
Message-ID: <1182619959.4976.28.camel@queen.suse.de>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
	<20070606231342.GA16771@redhat.com>
	<1181929526.3436.8.camel@kp-core.localdomain>
	<1182255270.28514.620.camel@queen.suse.de>
	<1182374431.8149.30.camel@localhost>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1182374431.8149.30.camel@localhost>
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
To: Myron Stowe <myron.stowe@hp.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq <cpufreq@lists.linux.org.uk>

On Wed, 2007-06-20 at 15:20 -0600, Myron Stowe wrote:
> Thomas, Dave:
> 
> Do either of you have a problem with the existence of
> cpufreq_set_policy() or was it only removed because there were no
> remaining callers in the tree and it had bugs?
Both.

In cpufreq_set_policy:

	/* this one invokes verify and data->max could get lowered
           because of temperature or BIOS limitations
	*/
        ret = __cpufreq_set_policy(data, policy);
        data->user_policy.min = data->min;
        data->user_policy.max = data->max;
        /* here user_policy.max is getting overridden with a possible
	limited value. But it is used in update_policy to restore the
	unlimited values again */
        data->user_policy.policy = data->policy;
        data->user_policy.governor = data->governor;

I think in update_policy:
policy->cpuinfo.min_freq
policy->cpuinfo.max_freq
should get used anyway...

If really needed it could get exported again, but just use
cpu_get/cpu_put, set/unset a lock and invoke __cpufreq_set_policy in
between?

> 
> The reason why I ask is that I have been working on a module that
> changes cpufreq governors and I don't see any other way for a module to
> be able to change governors without this interface.
But governor changing is userspace job?
IMO this is not the best argument, why do you need switching governors
inside the kernel?

   Thomas
