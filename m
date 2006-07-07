From: Dave Jones <davej@redhat.com>
Subject: Re: Suspend to RAM regression tracked down
Date: Fri, 7 Jul 2006 12:21:52 -0400
Message-ID: <20060707162152.GB3223@redhat.com>
References: <1151837268.5358.10.camel@idefix.homelinux.org> <44A80B20.1090702@goop.org> <1152271537.5163.4.camel@idefix.homelinux.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932189AbWGGQWO@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1152271537.5163.4.camel@idefix.homelinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

On Fri, Jul 07, 2006 at 09:25:37PM +1000, Jean-Marc Valin wrote:
 > > There was a race in ondemand and conservative which made them lock up on 
 > > resume (possibly only on SMP systems though).  There's a patch for that 
 > > in current -mm, but I suspect there's another problem (still haven't had 
 > > any time to track it down).
 > 
 > OK, I tried the patch with 2.6.17 and it didn't work. My laptop failed
 > to resume on the first try, so it must be something else. Could someone
 > actually have a look at the changes in 2.6.12-rc5-git6 (which happen to
 > be cpufreq-related)? I spend months pinpointing the problem to that
 > version (it's takes several days to reproduce). I'd appreciate if
 > someone could at least have a look at what changed there and maybe fix
 > it.

Can you show /proc/cpuinfo for the affected system ?
If it's 15/3/4 or 15/4/1, that would explain why this kernel,
as this was when support for those models got introduced to
speedstep-centrino.

If it's not that, there is a pretty large delta in the ondemand
governor in this update, but I don't see anything blindlingly
obvious from looking over it.

		Dave

-- 
http://www.codemonkey.org.uk
