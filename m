From: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Fri, 07 Jul 2006 21:25:37 +1000
Message-ID: <1152271537.5163.4.camel@idefix.homelinux.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751096AbWGGLZl@vger.kernel.org>
In-Reply-To: <44A80B20.1090702@goop.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

> There was a race in ondemand and conservative which made them lock up on 
> resume (possibly only on SMP systems though).  There's a patch for that 
> in current -mm, but I suspect there's another problem (still haven't had 
> any time to track it down).

OK, I tried the patch with 2.6.17 and it didn't work. My laptop failed
to resume on the first try, so it must be something else. Could someone
actually have a look at the changes in 2.6.12-rc5-git6 (which happen to
be cpufreq-related)? I spend months pinpointing the problem to that
version (it's takes several days to reproduce). I'd appreciate if
someone could at least have a look at what changed there and maybe fix
it.

Thanks,

	Jean-Marc
