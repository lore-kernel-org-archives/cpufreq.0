From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 17:45:29 +0530
Message-ID: <CAKohpokjzbYTrxF=kO-XSQwNowheHjuJbzzuvHwk9yOQ=7-izg@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<20130319074953.C200811FB80@bugzilla.kernel.org>
	<CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
	<3039053.c3U9fYsQRn@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <3039053.c3U9fYsQRn@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Borislav Petkov <bp@alien8.de>, Thomas Renninger <trenn@suse.de>

On 22 March 2013 17:47, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> OK, so what exactly do you need to now?

s/now/know ??

We just need to set policy->cpus with all cpus (online or offline) that
share clock line with cpu for which init() is called.

cpufreq core with then set all those cpus onto related cpus and will
keep only online cpus in policy->cpus..

Sorry if i haven't answered it well :(
