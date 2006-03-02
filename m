From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Thu, 2 Mar 2006 02:58:43 +0100
Message-ID: <200603020258.44224.ak@suse.de>
References: <88056F38E9E48644A0F562A38C64FB600768EF58@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600768EF58@scsmsx403.amr.corp.intel.com>
Content-Disposition: inline
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, davej@redhat.com

On Thursday 02 March 2006 02:53, Pallipadi, Venkatesh wrote:

> Thanks for the detailed explanation. I understood most of the code. 
> Was only worried whether there is an extra get for CPU 1 in above case, 
> just before 0 gets linked to 1. Now, I am convinced that is 
> it not the case. 

Thanks for the review, Venki. Do you think the patches are suitable
for 2.6.16? 

-Andi
