From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] speedstep-smi: enable interrupts when waiting
Date: Thu, 15 May 2014 10:15:53 +0530
Message-ID: <CAKohpo=h8cNbb2VbWzpDUPQDMK8QAs_sV=-SQyOaJWWFw4qKvA@mail.gmail.com>
References: <alpine.LRH.2.02.1405141012040.11670@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1405141012040.11670@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

On 14 May 2014 19:54, Mikulas Patocka <mpatocka@redhat.com> wrote:
> Hi Viresh
>
> Some times ago, I sent these two cpufreq patches to fix frequency
> transition problem on speedstep-smi, but you didn't put them to the
> upstream kernel. I am resending the patches. If you would like a different
> solution to this problem, please explain it.

Probably these are just missed by Rafael. The patches are fine but the
above paragraph you wrote would get into kernel logs and must have
been placed below the three dash lines: "---"

> On Dell Latitude C600 laptop with Pentium 3 850MHz processor, the
> speedstep-smi driver sometimes loads and sometimes doesn't load with
> "change to state X failed" message.
>
> The hardware sometimes refuses to change frequency and in this case, we
> need to retry later. I found out that we need to enable interrupts while
> waiting for retry. When we enable interrupts, the hardware blockage that
> prevents frequency transition resolves and the transition is possible.
> With disabled interrupts, the blockage doesn't resolve (no matter how long
> do we wait). The exact reasons for this hardware behavior are unknown.
>
> This patch enables interrupts in the function speedstep_set_state that can
> be called with disabled interrupts. However, this function is called with
> disabled interrupts only from speedstep_get_freqs, so it shouldn't cause
> any problem.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com
> Cc: stable@vger.kernel.org
>
> ---

Here. And this will be skipped by tools (git, etc) while applying the patch.

>  drivers/cpufreq/speedstep-lib.c |    3 +++
>  drivers/cpufreq/speedstep-smi.c |   12 ++++++++++++
>  2 files changed, 15 insertions(+)

For both the patches:
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
