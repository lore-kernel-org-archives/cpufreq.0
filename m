From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Dual-core support for Opteron Processors
Date: Mon, 7 Feb 2005 23:03:46 +0100
Message-ID: <20050207220346.GA25122@isilmar.linta.de>
References: <84EA05E2CA77634C82730353CBE3A84301CFBC66@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFBC66@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Mon, Feb 07, 2005 at 03:44:40PM -0600, Langsdorf, Mark wrote:
> I tried to send this in a few days ago, but I don't think
> it made it.

It didn't make it.

+       pol->cpus = cpu_sharedcore_map[data->cpu];

I'm sorry but I can't find cpu_sharedcore_map in linus' latest.

	Dominik

PS: list address is cpufreq@lists.linux.org.uk
