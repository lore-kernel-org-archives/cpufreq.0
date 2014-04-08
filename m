From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: remove sysfs link when a cpu != policy->cpu, is removed
Date: Tue, 8 Apr 2014 09:52:43 +0530
Message-ID: <CAKohpom_Lk+YdeKvEh-rbX-rsARZO3tHxzMD8PDQ6kycaA+D9A@mail.gmail.com>
References: <324f43fc664f51eec355b08b6c2d4cedd2140b4c.1392628861.git.viresh.kumar@linaro.org>
	<1848612.IZFZXgfmHj@vostro.rjw.lan>
	<5b6a0eb5-59d7-43ca-9adc-35c7acd58424@VA3EHSMHS022.ehs.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <5b6a0eb5-59d7-43ca-9adc-35c7acd58424@VA3EHSMHS022.ehs.local>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@nvidia.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>

On 7 April 2014 22:45, S=F6ren Brinkmann <soren.brinkmann@xilinx.com> w=
rote:
> I see this on 3.13 too (in our vendor tree, but I think mainline woul=
d
> show the behavior as well). It probably worth to add it into the 3.13
> stable kernel.

Thanks.. Patch sent for stable tree.
