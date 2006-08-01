From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 1/2] ondemand: updated tune for hardware coordination
Date: Tue, 01 Aug 2006 21:39:24 +0400
Message-ID: <44CF91CC.3070003@linux.intel.com>
References: <44CE4B10.6080506@linux.intel.com>
	<20060731223750.GG31513@redhat.com>
	<44CF0C4E.9020603@linux.intel.com>
	<20060801164315.GA9083@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060801164315.GA9083@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave Jones wrote:
> On Tue, Aug 01, 2006 at 12:09:50PM +0400, Alexey Starikovskiy wrote:
>  > Dave Jones wrote:
>  > > On Mon, Jul 31, 2006 at 10:25:20PM +0400, Alexey Starikovskiy wrote:
>  > >  > 
>  > >  > cpufreq_ondemand.c |   13 ++++++++-----
>  > >  > 1 file changed, 8 insertions(+), 5 deletions(-)
>  > >  > 
>  > >  > Try to make dbs_check_cpu() call on all CPUs at the same jiffy.
>  > >  > This will help when multiple cores share P-states via Hardware Coordination.
>  > >  > 
>  > >  > Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
>  > >  > Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>
>  > > 
>  > > Still doesn't apply..
>  > > 
>  > > error: patch failed: drivers/cpufreq/cpufreq_ondemand.c:303
>  > > error: drivers/cpufreq/cpufreq_ondemand.c: patch does not apply
>  > It requires Arjan's patch to cpufreq, sitting in Linus tree for 3 days already.
> 
> This was after I'd rebased the cpufreq.git tree to Linus' latest yesterday.
> 
> 		Dave
> 
Just checked once again. Version I've sent yesterday cleanly applies to your
just updated cpufreq.git tree.
