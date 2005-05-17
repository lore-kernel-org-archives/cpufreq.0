From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH 1/2] export cpu_core_map
Date: Tue, 17 May 2005 05:28:54 +0200
Message-ID: <20050517032854.GB9699@wotan.suse.de>
References: <84EA05E2CA77634C82730353CBE3A84301CFC019@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFC019@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk, ak@suse.de

On Mon, May 16, 2005 at 12:26:19PM -0500, Langsdorf, Mark wrote:
> Export the cpu_core_map structure for use in other
> parts of the kernel.  Needed for the dual-core
> PowerNow! driver.

Thanks.

-Andi

> 
> Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
> 
> -Mark Langsdorf
> AMD, Inc.
