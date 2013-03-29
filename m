From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 29 Mar 2013 19:44:33 +0530
Message-ID: <CAKohpomjG2ZTVy_BZMW0Ah_JxbUEvw-pDPzMpqggyW_08p_v+w@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
	<CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
	<CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
	<20130324044927.6a2b1588@ws>
	<CAKohpokknnU7jn0UuNsoRoho5MSmzT-Ub3sVwR030uJqMjSH7g@mail.gmail.com>
	<CAKohpomsrafpNii9zqAjqe5kqEGOEdP5mDpSSjTswrY1YNfhBw@mail.gmail.com>
	<20130325041541.4574f51a@ws>
	<CAKohpo=DY6kmUVjpuHimMdYp1ubRfbNYfTjAB=mDPEkSzqumRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=DY6kmUVjpuHimMdYp1ubRfbNYfTjAB=mDPEkSzqumRg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: bugzilla-daemon@bugzilla.kernel.org, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Borislav Petkov <bp@alien8.de>, Thomas Renninger <trenn@suse.de>, Andre Przywara <andre.przywara@linaro.org>, djwong@us.ibm.com, Duncan <1i5t5.duncan@cox.net>

On 25 March 2013 16:53, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> There is no other user of relatead_cpus earlier in cpufreq core and that's why
> i wonder why it was added earlier.
>
> But a grep of relatead_cpus for 3.8 showed some interesting users in:
> tools/power/cpupower/
>
> I will try to check what they are doing with it, but for the kernel it
> was almost unused.

I checked tools and they aren't doing anything tricky with it. Just reading
groups of cpus from sysfs.

Now i believe even tools should be patched a bit to give correct meanings
of affected or related cpus. Let me try it.
