From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: Re: [linux-pm] [PATCH 0/2] RFC: CPU frequency max as PM QoS param
Date: Wed, 07 Mar 2012 20:08:23 +0200
Message-ID: <871up4xp0o.fsf@amiettinen-lnx.nvidia.com>
References: <87d39fk2n3.fsf@ti.com> <20120228005630.GA15348@envy17>
	<87ty2b5mdo.fsf@amiettinen-lnx.nvidia.com>
	<201203042346.54468.rjw@sisk.pl>
	<87399lvrxj.fsf@amiettinen-lnx.nvidia.com>
	<20120306143729.GB29474@redhat.com>
	<8762egyky7.fsf@amiettinen-lnx.nvidia.com>
	<20120307165957.GA23690@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120307165957.GA23690@redhat.com> (Dave Jones's message of
	"Wed, 7 Mar 2012 11:59:57 -0500")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, markgross@thegnar.org, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, cpufreq List <cpufreq@vger.kernel.org>, j-pihet <j-pihet@ti.com>, pavel@ucw.cz, Linux PM list <linux-pm@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

Dave Jones <davej@redhat.com> writes:
> I think exposing absolute frequencies to applications is a mistake.
> (And one that the core cpufreq made a long time ago). How is an application
> to decide what to set it to without knowledge of the hardware it's
> running on ?

Abstracting the CPU frequency was briefly discussed
previously. Computing performance is affected by many factors, not just
CPU frequency. My view is that the actual frequency values for a given
use case are likely to be very system specific (CPU, memory etc). The
values would probably come from a tuning excercise and would be
configurable parameters of applications.

> I much prefer the idea that was mentioned a few weeks ago during the
> discussion with Peter Zijlstra about cpufreq being more connected to
> the scheduler, and essentially having per-process governors.
>
> Each process gets a /proc/self/power-policy
> This can be 'performance' 'power-save' or 'ondemand'
>  - A global sysfs knob sets the default new processes get.
>  - Processes can adjust it themselves if desired.
>  - There's no need for a system-wide governor any more.
>
> There are some open questions about how this could work.
>
> - A list of rules for desired behaviour when performing state changes
>   when switching between tasks with different policies is needed.
>
> - We don't want to be doing power transitions every context switch,
>   or switching overhead will be brutal.
>   So some kind of lazy state changing may be necessary.
>
> - For 'ondemand', when would the scheduler decide to ramp up/down
>   the speed ?
>
> 	Dave

I think better power/perf requests from applications to kernel are
indeed sorely needed. However, if we are going to construct application
oriented power/performance requests, I think something else than
performance/powersave/ondemand might be more appropriate. For a fixed
hardware platform, an application might well be tuned to know very well
the minimum and maximum levels of CPU frequency that it needs in certain
situation in order to meet the required responsiveness and/or consume
minimum amount of energy. I think performance vs power-save is
unnecessarily coarse setting.

The big problem I see with application oriented metrics is that there
are so many of them. I'd rather keep this kind of complexity outside the
kernel. To me it feels easier to start from the hardware knobs that we
can control, since - in the end - those are the knobs that the kernel
needs to control. And we need consolidation of requests from multiple
applications, but to me exposing hardware oriented parameters towards
the user space is not a problem as such.

	--Antti
