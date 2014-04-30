From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: powernow-k8: Fix checkpatch warnings
Date: Wed, 30 Apr 2014 09:34:03 +0530
Message-ID: <CAKohponkTeEqdgqJ6+caQcKd5yoMNhFvkZib1UueqNBCmO=pmA@mail.gmail.com>
References: <5356DB92.1060600@semaphore.gr>
	<2606012.9SjvfKiI5Z@vostro.rjw.lan>
	<5357C5E0.1070207@semaphore.gr>
	<4780344.RfsAca3Qz3@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <4780344.RfsAca3Qz3@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stratos Karafotis <stratosk@semaphore.gr>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 30 April 2014 04:09, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> It should be cleaned up generally, so if you have the time and you're willing
> to do such things, please do them.
>
> That said things like lines in excess of 80 characters may stay as they are.

I have tried this sort of stuff earlier, but there is one issue that stands
up again and again. When you update neighboring lines of lines
crossing 80 columns, we do get warnings for lines which aren't actually
updated by us (from checkpatch.pl). So, probably we need to fix
checkpatch then..
