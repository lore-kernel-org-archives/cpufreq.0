From: Pavel Machek <pavel@suse.cz>
Subject: Re: [PATCH] 3/3 A dynamic cpufreq governor
Date: Tue, 28 Oct 2003 10:27:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031028092720.GB1167@elf.ucw.cz>
References: <88056F38E9E48644A0F562A38C64FB6007796D@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6007796D@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: akpm@osdl.org, Linus Torvalds <torvalds@osdl.org>, cpufreq@www.linux.org.uk, Pavel Machek <pavel@ucw.cz>, "Nakajima,
	Jun" <jun.nakajima@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

Hi!

> ondemand3.patch - Adding sysfs interface for cpufreq_ondemand 
> tunables and making sysfs access by cpufreq governors safe against 
> removal of the underlying module (from Dominik). 
> 
> diffstat ondemand3.patch
>  cpufreq.c          |   24 ++++++++++++
>  cpufreq_ondemand.c |  102
> +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)

Is something word-wrapping your mails?

...

> +/* cpufreq_ondemand Governor Tunables */
> +#define show_one(file_name, object)
> \
> +static ssize_t show_##file_name
> \
> +(struct cpufreq_policy *unused, char *buf)
> \
> +{
> \
> +	return sprintf(buf, "%u\n", dbs_tuners_ins.object);
> \
> +}
> +show_one(sampling_rate, sampling_rate);
> +show_one(up_threshold, up_threshold);
> +show_one(down_threshold, down_threshold);

?
								Pavel

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
