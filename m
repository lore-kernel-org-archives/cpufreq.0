From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Driver to export CPUfreq statistic
Date: Mon, 22 Nov 2004 17:22:31 +0100
Message-ID: <20041122162230.GA8971@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB6003662062@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6003662062@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

On Sun, Nov 21, 2004 at 03:15:33PM -0800, Pallipadi, Venkatesh wrote:
> I feel this should not be depending on CPU_FREQ debug. Then we can have
> some utility in cpufreq-utils which can display 'top' like output.

Sounds fair to me. Dave?

Oh, and who does volunteer for that 'top'-like utility?

> The only reason why we thought of keeping STAT_DETAILS as config is, it
> doesn't strictly follow to /sys output format, with a huge array output.

Agreed.

Thanks,
	Dominik
