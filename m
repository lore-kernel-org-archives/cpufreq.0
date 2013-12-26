From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: try to resume policies which failed on last resume
Date: Thu, 26 Dec 2013 08:17:48 +0530
Message-ID: <CAKohponHBaGG1e5e+Wmg6rqMB-nbRx1e=F+u5AoaNb=mxfQL6A@mail.gmail.com>
References: <f9d7b0d5424e4443597d2ed39bec3fedd2b10d1e.1387848958.git.viresh.kumar@linaro.org>
	<5562479.pVWRuDL0y6@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <5562479.pVWRuDL0y6@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: =?ISO-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 26 December 2013 06:35, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Subject: cpufreq: Clean up after a failing light-weight initializatio=
n
>
> If cpufreq_policy_restore() returns NULL during system resume,
> __cpufreq_add_dev() should just fall back to the full initialization
> instead of returning an error, because that may actually make things
> work.  Moreover, it should not leave stale fallback data behind after
> it has failed to restore a previously existing policy.
>
> This change is based on Viresh Kumar's work.
>
> Reported-by: Bj=F8rn Mork <bjorn@mork.no>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
