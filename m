From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Fri, 28 Jun 2013 09:14:48 +0530
Message-ID: <CAKohponp7JbQeeC7D=X7+DBcWtUr2NhRKz7spxKA=+K8SAY+Og@mail.gmail.com>
References: <51C08370.4050906@gmx.de>
	<1778593.ufLkNuJuaY@vostro.rjw.lan>
	<51CB34A2.7090404@gmx.de>
	<1475885.FjB577tJj8@vostro.rjw.lan>
	<CAKohpokbQS8Bb5D2B_UaN-eyVnAbQYKDKh5pm_QzEDMoABwcOw@mail.gmail.com>
	<51CC7DB2.3020502@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <51CC7DB2.3020502@gmx.de>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On 27 June 2013 23:30, Toralf F=F6rster <toralf.foerster@gmx.de> wrote:
> Yep, but 14 commits to bisect and about 20-30 min for each - will see=
,
> when I find a time slot.

Hmm..

> Just FWIW thie following is now a good indicator for the issue - that=
's
> the picture after wakeup, where I'd expect always 800 MHz:
>
> $ sudo cat /sys/devices/system/cpu/cpu?/cpufreq/cpuinfo_cur_freq
> 800000
> 2601000
> 2601000
> 2601000

Can you give dumps of complete cpufreq directories for all cpus before
and after s2r. That may give us some hint about the problem.
