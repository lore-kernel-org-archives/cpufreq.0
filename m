From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq: Fix issue found by coverity in
	drivers/cpufreq/cpufreq_stats.c
Date: Thu, 27 Oct 2005 19:04:04 -0400
Message-ID: <20051027230404.GA6818@redhat.com>
References: <20051027223702.GC20378@random.pao.digeo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051027223702.GC20378@random.pao.digeo.com>
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
Content-Transfer-Encoding: 7bit
To: "Jayachandran C." <jchandra@digeo.com>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Thu, Oct 27, 2005 at 03:37:02PM -0700, Jayachandran C. wrote:
 > This fixes an issue found in drivers/cpufreq/cpufreq_stats.c by Coverity. Please
 > review as I'm not sure if -EINVAL is the correct value to return at this point.

Yep, EINVAL is fine. I checked this into the cpufreq-git tree
(though I did it by hand as it's changed there recently
 -- working against the -mm tree would save you this hassle in future btw).

Thanks

		Dave
