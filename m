From: Ari Pollak <ajp@aripollak.com>
Subject: Re: powernow-k8 patch
Date: Thu, 19 Aug 2004 14:25:18 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <cg2rab$gte$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84310F325@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84310F325@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Does that happen to fix the bug I reported earlier in powernow-k8?

mark.langsdorf@amd.com wrote:
> AMD recently errata'd the definition of the PSB/PST
> for recent Athlon 64 and Opteron parts.  The errata
> allows for a second, identical PST for those parts.
> The current powernow-k8 driver will not work in 
> PST/PSB mode on those parts because it requires 
> there be 1 and only 1 PST.
> 
> This patch adjusts the powernow-k8 driver to 
> work with that errata.
> 
> Mark Langsdorf
> Advanced Micro Devices        mark.langsdorf@amd.com
> 5204 E. Ben White Blvd        Phone: 512.602.3756
> Austin, TX 78704
