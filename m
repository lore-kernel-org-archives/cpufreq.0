From: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Mon, 03 Jul 2006 08:52:44 +1000
Message-ID: <1151880764.5358.32.camel@idefix.homelinux.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751016AbWGBWw5@vger.kernel.org>
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

Any link to the patch and the thread about the problem (if any)? Also,
was the race introduced in 2.6.12-rc5-git6? If not, it's a completely
different problem because my machine worked fine with 2.6.12-rc5-git5.

	Jean-Marc
