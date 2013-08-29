From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 02/10] cpufreq: OMAP: Add SMP support for OMAP4+
Date: Thu, 29 Aug 2013 19:09:43 +0530
Message-ID: <CAKohpokqz0cQNS12hZS-YOCd8KSOtCy9_TbGdqFzCYz8NyeamQ@mail.gmail.com>
References: <1316725648-26710-1-git-send-email-khilman@ti.com>
	<1316725648-26710-3-git-send-email-khilman@ti.com>
	<CAOh2x=k11EivJoy5-PMXnE5JGDc=DcJKhae7qoh6tNc4L63VnA@mail.gmail.com>
	<521F4E88.1000709@ti.com>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <521F4E88.1000709@ti.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Kevin Hilman <khilman@linaro.org>, Russell King <linux@arm.linux.org.uk>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Dave Jones <davej@redhat.com>, Nishanth Menon <nm@ti.com>, linux-omap@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rajendra Nayak <rnayak@ti.com>

On 29 August 2013 19:07, Santosh Shilimkar <santosh.shilimkar@ti.com> wrote:
> On Thursday 29 August 2013 06:02 AM, Viresh Kumar wrote:

>> cpumask_setall(policy->cpus);
>>
> Thats should work I guess. Infact I changed this i downstream kernel
> a while back but forgot to send a patch. Just see if for some reason
> above can break UP machine since this driver is used on UP machines
> as well. Other than that, it should be fine

Atleast I can't see why it will break on UP machines as that should set
masks to individual CPUs then...

Okay I will fix that in my longest patchset ever... 230+ patches already :)
