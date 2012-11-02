From: Michal Zatloukal <myxal.mxl@gmail.com>
Subject: Fwd: Nice processes prevent frequency increases - possible scheduler
 regression (known good in 2.6.35)
Date: Fri, 2 Nov 2012 21:09:10 +0100
Message-ID: <CAKKZj2Av0TN9MbYk=-2ZB_jxDnUCWfrN5tJNZ7azgSHyOrMzvg@mail.gmail.com>
References: <CAKKZj2Do+ViFbdmeA9y4qZ4Dd_CrW_wmVWc0_CB4BAAwO6SfJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=ipo7EpSS8BaeuVLVj1y7gVN6BT8JrccE8gqJwzuwq8Y=;
        b=fgyCmQZVsCIw1kthS1BjEQ07Gg9sX6qDNg+OOg3xj7uSTl4hgXx8fpxSkGVOvhtZmf
         AK+z59SO8rysz5G3CRp7vtg0YFWe+0CktCysRH1uLQGbT4myAg7RM65lgZ4Xo1p7JvFC
         ZuAdgFbMsNYlVHXj/BRDWXwMbVx7kfRPd3XGepYIlFR1rOcSavUT2SE241tOWf/hv0y7
         dG+ylIcNiTUp3RJ8Ex+1eN4fe15lLZzelrOMS2yXZl21uO8IykptaSzfUr5J4hf2Rg5Z
         iXpMRuT+WJ1ZU1snVR+R5wPvqBUTuKIf+DROeShJpKPgyuNzbx68VwaiJUD4qv/vBA7x
         Me1g==
In-Reply-To: <CAKKZj2Do+ViFbdmeA9y4qZ4Dd_CrW_wmVWc0_CB4BAAwO6SfJg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

Hello.
Note 1: I'm not subscribed, please Cc me into replies.
Note 2: I haven't kept up-to-date with the latest kernels in quite
some time so I've only noticed this when I switched my machine from
Kubuntu 10.10 (kernel 2.6.35) to 12.10 (kernel 3.5) last week (both
amd64 arch). I've done some trials to determine what's happening and
think I've got it. It may be a corner case, I'm not sure.
So here's the situation:
- dual-core laptop running BOINC projects (nice-19, single-thread
process on each core, very little IO) without restriction (the
processes are not terminated until they finish themselves or the boinc
daemon is stopped).
- to make the fan noise levels bearable with such a load, I set the
on-demand governor's ignore_nice_load parameter to YES. This makes the
CPU run at 800 MHz when it's only running the BOINC projects and
nothing demanding for the user (nice=0).
On the old kernel, playing an HD video with BOINC running in the
background is not a problem - the CPU immediately kicks into 2.5 GHz
and the video plays smoothly. User tasks which take all the CPU they
can get (compressing files, starting Chromium with ~70 tabs), take all
the CPU they can get, making ondemad governor switch the CPU to full
speed and BOINC projects are starved.
On the new kernel, the nice processes are never starved - even when
starting a tab-laden chromium session, the processes for BOINC keep
about 20% CPU each (that is normalized to all CPUs, ie 40% nice load
on each core). The problem is, the governor now seems to consider the
non-nice task unable to saturate the CPU, and the cores' frequencies
are hovering between 1.0 and 1.8 GHz. The scheduler keeps scheduling
the nice tasks, and the non-nice tasks are progressing much slower,
caused by the lower CPU speed as well as less processing time
allocated to them. HD video stutters often, and Chromium takes at
least 2-3 times longer to fully load.

Questions:
Q1: Is the usage of ignore_nice_load=Y obscure? Ubuntu defaults to
"N", not sure about other distros.
Q2. Is this considered a bug? If so, I'll try to devise a test case
that doesn't require a 30-minute setup and an account on BOINC
projects. Any hints on what I should look out for when I want to
emulate the load of BOINC projects with readily-available tools,
regarding the scheduler? Cgroup, tty, session, thread count?

MZ
