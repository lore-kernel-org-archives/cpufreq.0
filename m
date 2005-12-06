From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Tue, 6 Dec 2005 11:10:15 +0100
Message-ID: <20051206101015.GA18450@isilmar.linta.de>
References: <88056F38E9E48644A0F562A38C64FB60067F424F@scsmsx403.amr.corp.intel.com>
	<20051204164620.GA8422@isilmar.linta.de>
	<20051205110012.GA12747@poupinou.org>
	<20051206060149.GA4722@isilmar.linta.de>
	<20051206100324.GA14886@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051206100324.GA14886@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: CPUFreq@lists.linux.org.uk, davej@redhat.com

Hi,

On Tue, Dec 06, 2005 at 11:03:24AM +0100, Bruno Ducrot wrote:
> Well, there is the cpufreq-nvidia2 driver.  I'm pretty sure that one does not
> fit there.  I don't know what are exactly the benefits so far.

It modifies the FSB, so it scales the CPU frequency => CPUFREQ_SCALING

	Dominik
