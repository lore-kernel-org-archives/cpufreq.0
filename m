From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Wed, 8 Sep 2004 23:31:40 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040908213140.GA7842@dominikbrodowski.de>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<loom.20040908T215751-536@post.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <loom.20040908T215751-536@post.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Tomanek <stefan@pico.ruhr.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 08, 2004 at 07:59:30PM +0000, Stefan Tomanek wrote:
> Michael Clark <mclark <at> metaparadigm.com> writes:
> 
> > I personally need this patch as I don't use ACPI so can't use the
> > experimental ACPI freq/voltage tables support as ACPI doesn't work well
> > enough for me on my Thinkpad T42.
> 
> This patch is great, ACPI only reports two frequencies on my Travelmate 292
> (Dothan 1.5), 600 and 1500 Mhz. With this patch I can use all available
> frequencies. Will it be integrated into the official speedstep-centrino module?

No. There is no way to determine which of four possible frequencies is the
valid one for a given Pentium M Dothan processor.

	Dominik
