From: Mark Lord <lkml@rtr.ca>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 05 Dec 2005 10:59:00 -0500
Message-ID: <439463C4.7040905@rtr.ca>
References: <20051202181927.GD9766@wotan.suse.de> <20051202104320.A5234@unix-os.sc.intel.com> <20051204164335.GB32492@isilmar.linta.de> <20051204183239.GE14247@wotan.suse.de> <1133725767.19768.12.camel@mindpipe> <20051205011611.GA12664@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932448AbVLEP7F@vger.kernel.org>
In-Reply-To: <20051205011611.GA12664@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: Lee Revell <rlrevell@joe-job.com>, Andi Kleen <ak@suse.de>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andrew Morton <akpm@osdl.org>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

 >I can't think of a single valid reason why a program would want
 >to know the MHz rating of a CPU.

Humans like to know what their machines are doing.

Simple as that:  it's for the end-users, and the place they look
for it is always /proc/cpuinfo (since that works on every platform
and on kernels prior to the 2.[56].* series.

Not useful as an accurate number for any programming algorithms,
but it is used to satisfy human curiosity.  A lot.

--ml
