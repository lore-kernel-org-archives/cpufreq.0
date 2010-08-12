From: Andi Kleen <andi@firstfloor.org>
Subject: Re: proposed sysfs semantic change.
Date: Thu, 12 Aug 2010 18:44:57 +0200
Message-ID: <20100812164457.GB7058@basil.fritz.box>
References: <20100811215443.GA28343@redhat.com>
 <871va3eql1.fsf@basil.nowhere.org>
 <20100812164154.GA7428@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100812164154.GA7428@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Andi Kleen <andi@firstfloor.org>, cpufreq@vger.kernel.org

On Thu, Aug 12, 2010 at 12:41:54PM -0400, Dave Jones wrote:
> On Thu, Aug 12, 2010 at 06:35:54PM +0200, Andi Kleen wrote:
>  > Dave Jones <davej@redhat.com> writes:
>  > 
>  > > Users with dual/quad core systems can currently set individual cores to
>  > > have different governors (and drivers!), which doesn't really make a lot
>  > > of sense.
>  > 
>  > Why not? Imagine a system that is partitioned using cpusets or cgroups
>  > for different sockets and the partitions runs different workloads.
>  > 
>  > I could well imagine using different governours (= policies) 
>  > for those different sockets.
> 
> Different sockets is fine. I'm talking about different cores within the same socket.

If you have per core p-states that makes sense too.
Even without it could in principle make sense.

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only.
