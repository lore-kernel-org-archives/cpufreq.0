From: Jean-Marc Valin <jean-marc.valin@usherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Mon, 03 Jul 2006 16:31:47 +1000
Message-ID: <1151908307.8325.3.camel@localhost>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org> <1151880764.5358.32.camel@idefix.homelinux.org>
	 <44A8B2FC.6080806@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750720AbWGCGbw@vger.kernel.org>
In-Reply-To: <44A8B2FC.6080806@goop.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Linux Kernel <linux-kernel@vger.kernel.org>, venkatesh.pallipadi@intel.com

On Sun, 2006-07-02 at 23:02 -0700, Jeremy Fitzhardinge wrote: 
> Jean-Marc Valin wrote:
> > Any link to the patch and the thread about the problem (if any)? Also,
> > was the race introduced in 2.6.12-rc5-git6? If not, it's a completely
> > different problem because my machine worked fine with 2.6.12-rc5-git5.
> >   
> 
> It's in the thread on the cpufreq list titled "ondemand vs suspend"; 
> Venkatesh Pallipadi posted the patch.

Just read the thread and it's not clear to me whether it's the same
problem. Venkatesh, does the thread describe the same as this bug:
http://bugzilla.kernel.org/show_bug.cgi?id=6166
which appeared in 2.6.12-rc5-git6 or is it a separate problem?

	Jean-Marc
