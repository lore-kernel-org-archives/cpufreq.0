From: Andi Kleen <andi@firstfloor.org>
Subject: Re: proposed sysfs semantic change.
Date: Thu, 12 Aug 2010 18:35:54 +0200
Message-ID: <871va3eql1.fsf@basil.nowhere.org>
References: <20100811215443.GA28343@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20100811215443.GA28343@redhat.com> (Dave Jones's message of
	"Wed, 11 Aug 2010 17:54:43 -0400")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

Dave Jones <davej@redhat.com> writes:

> Users with dual/quad core systems can currently set individual cores to
> have different governors (and drivers!), which doesn't really make a lot
> of sense.

Why not? Imagine a system that is partitioned using cpusets or cgroups
for different sockets and the partitions runs different workloads.

I could well imagine using different governours (= policies) 
for those different sockets.

Different drivers probably doesn't make much sense though.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
