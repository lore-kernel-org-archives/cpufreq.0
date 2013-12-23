From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH Resend] cpufreq: remove sysfs files for CPU which failed to come back after resume
Date: Mon, 23 Dec 2013 06:55:56 +0100
Message-ID: <871u14i00j.fsf@nemi.mork.no>
References: <610b63b7594e5cd364c498f60e69b9e174db9257.1387554926.git.viresh.kumar@linaro.org>
	<1651441.C2UQleWVoy@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1651441.C2UQleWVoy@vostro.rjw.lan> (Rafael J. Wysocki's message
	of "Sun, 22 Dec 2013 02:00:40 +0100")
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

"Rafael J. Wysocki" <rjw@rjwysocki.net> writes:

> Bjorn, can you please check if the pm-cpufreq branch of the linux-pm.=
git tree
> fixes the problem that you have reported=20

I can confirm that it fixes the major regression.  With this branch, th=
e
cpufreq directory is completely removed after a cancelled userspace
hibernate (with the acpi-cpufreq problem causing failure).  So it is
possible to restore cpufreq by manually offlining and onlining non-boot
cores.  No more leftover sysfs attributes.

But there is still a minor regression compared to the old (v3.11)
behaviour: Previously the cpufreq functionality would be automatically
restored by any completed hibernate or suspend cycle, since it would
effectively do the CPU offline/online. This automatix fixup won't happe=
n
with the current pm-cpufreq branch.  User intervention is now required
to fix up cpufreq. Which is expected, due to the special handling of
cpufreq suspend.

So there is still a small, small regression here, making me believe tha=
t
my "fix" is better until the cpufreq suspend is properly fixed.  But
it's certainly not a major problem to me either way.  Your call.

> without causing any new breakage to happen?

I'm not going to guarantee that :-)  But I haven't noticed anything
obvious during the 15 minutes I've been testing this branch so far.



Bj=C3=B8rn
