From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Panic booting livecd dual opteron powernow
Date: Mon, 13 Sep 2004 21:46:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040913194642.GA17985@dominikbrodowski.de>
References: <84EA05E2CA77634C82730353CBE3A843AA1A32@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843AA1A32@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark.langsdorf@amd.com
Cc: cpufreq@www.linux.org.uk, mickreed@freeshell.org

On Mon, Sep 13, 2004 at 08:06:55AM -0500, mark.langsdorf@amd.com wrote:
> 
> That's not supposed to happen.  The driver should fail to load.
> 
> It looks like what is happening is the call to powernowk8_init
> is succeeding, but the call to powernowk8_init_cpu fails.
> Then, when powernowk8_verify is called, it tries to dereference
> the global data structure, which is NULL.

I can't see why powernow_k8_verify is being called.

	ret = cpufreq_driver->init(policy);
	if (ret)
		goto err_out;

which means there is no call to verify. 

cpufreq_set_policy --> __cpufreq_set_policy -> ->verify() can't be run,
as cpufreq_cpu_get() will not succeed (kobejct is not registered yet).
cpufreq_update_policy -> __cpufreq_set_policy -> ->verify() will fail
because of the same reason.

Therefore, I suspect this vendor-modified kernel has some specific bug in
it, and see no need for the generic patch.

	Dominik
