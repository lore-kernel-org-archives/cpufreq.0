From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Problem recognizing P4-M
Date: Thu, 5 May 2005 08:34:49 +0200
Message-ID: <20050505063449.GA19193@isilmar.linta.de>
References: <1114490818.6148.15.camel@petra>
	<20050504205854.GA6331@isilmar.linta.de>
	<1115265384.5332.2.camel@petra>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1115265384.5332.2.camel@petra>
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
To: Paul Swartz <z3p@twistedmatrix.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, May 04, 2005 at 11:56:24PM -0400, Paul Swartz wrote:
> On Wed, 2005-05-04 at 22:58 +0200, Dominik Brodowski wrote:
> > speedstep-ich is the only candidate for this CPU. However, it depends on an
> > Intel chipset being present in your notebook. What does lspci tell you?
> 
> lspci says:
> 
> 0000:00:11.0 Bridge: ALi Corporation M7101 Power Management Controller [PMU]

This one isn't supported by speedstep-ich, as it isn't an ICH-based
southbridge.

	Dominik
