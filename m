From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Suspend to RAM regression tracked down
Date: Sun, 02 Jul 2006 11:06:24 -0700
Message-ID: <44A80B20.1090702@goop.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964848AbWGBSGQ@vger.kernel.org>
In-Reply-To: <1151837268.5358.10.camel@idefix.homelinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

Jean-Marc Valin wrote:
> A while ago, I reported a suspend to RAM regression (fail to resume). I
> have since then tracked down the regression to the changes between
> 2.6.12-rc5-git5 and 2.6.12-rc5-git6. On my laptop, I have only been able
> to reproduce the problem with the ondemand cpufreq governor, but I've
> head of another user with the same (Dell D600) laptop having problem
> with the userspace governor as well. All the details are actually
> http://bugzilla.kernel.org/show_bug.cgi?id=6166 but it seems like it's
> being ignored. It's currently assigned to the ACPI category, but maybe
> it belongs to cpufreq? Anyone can help here?
>   

There was a race in ondemand and conservative which made them lock up on 
resume (possibly only on SMP systems though).  There's a patch for that 
in current -mm, but I suspect there's another problem (still haven't had 
any time to track it down).

The workaround is to switch to one of the performance/powersave/user 
governors just before suspend, and restore the governor on resume.

    J
