From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Fix memory leak in cpufreq_stats.c
Date: Fri, 29 Apr 2011 15:25:56 -0400
Message-ID: <20110429192555.GA8842@redhat.com>
References: <465E946FB313F242A955E3365C8D13A50B6403A7@ushqwmb10>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <465E946FB313F242A955E3365C8D13A50B6403A7@ushqwmb10>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steven Finney (Palm GBU)" <Steven.Finney@palm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Tue, Apr 26, 2011 at 02:39:15PM -0700, Steven Finney (Palm GBU) wrote:
 > My first post here; hopefully I've done everything right.
 > 
 > Running kmemleak on a hotplug SMP system with CONFIG_CPU_FREQ_STAT=y
 > shows a cpufreq_stats related leak everytime a cpu is taken down 
 > (which may occur frequently on some devices).  Here is a proposed 
 > patch which fixes the problem. Tested on ARM 2.6.35, applies cleanly to
 > Linus' tree.

I can't apply this, because your mail client sent it in a form
that isn't plaintext. Git doesn't eat base64, or winmail.dat.

	Dave
