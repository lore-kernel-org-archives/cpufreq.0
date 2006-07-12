From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change pstate at same time
Date: Wed, 12 Jul 2006 16:54:54 +0200
Message-ID: <200607121654.54152.ak@suse.de>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com> <1152622554.4489.32.camel@lapdog.site> <1152713168.14450.18.camel@lapdog.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751029AbWGLOy7@vger.kernel.org>
In-Reply-To: <1152713168.14450.18.camel@lapdog.site>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: discuss@x86-64.org
Cc: Joachim Deguara <joachim.deguara@amd.com>, Mark Langsdorf <mark.langsdorf@amd.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Wednesday 12 July 2006 16:06, Joachim Deguara wrote:
> On Tue, 2006-07-11 at 14:55 +0200, Joachim Deguara wrote:
> > Here are some initial findings. 
> 
> Here are the further findings after letting the machine toggle between
> 1GHz and 2.2Ghz every two seconds for roughly 24 hours.  Unfortunately
> there is an oops after bringing CPU2 online and CPU3 will not come
> online.  

Perhaps Mark/Jacob can take a look at the oops.

> Still the differences in TSC are not bad: 

Think: any difference you get for 24h will be 10x when the system runs 10 times longer
and 365 times when the system runs for a year (and there are Linux systems
who run much longer than a year) 

Also even small non monotonies between CPUs in gettimeofday can cause big trouble.

-Andi
