From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: speedstep-ich issue
Date: Mon, 2 Oct 2006 04:13:30 +0200
Message-ID: <20061002021330.GD19253@isilmar.linta.de>
References: <200609291111.48598.cusmai@gmail.com>
	<20060929174035.GE13444@inferi.kami.home>
	<200609292149.42603.cusmai@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200609292149.42603.cusmai@gmail.com>
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
To: Marco cusmai <cusmai@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Fri, Sep 29, 2006 at 09:49:42PM +0000, Marco cusmai wrote:
> cat scaling_available_frequencies : 1130500 731500
> cat scaling_min_freq : 731500
> cat scaling_max_freq : 731500

Yes, then it won't scale any more -- the CPU will only be set to a value
between scaling_min_freq and scaling_max_freq. Therefore, please check the
configuration file for cpufreqd (or any other cpufreq daemon you're
running).

Thanks,
	Dominik
